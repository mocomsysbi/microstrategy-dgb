package com.mocomsys.microstrategy.sdk.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.microstrategy.web.objects.SimpleList;
import com.microstrategy.web.objects.WebDisplayUnit;
import com.microstrategy.web.objects.WebDisplayUnitEntry;
import com.microstrategy.web.objects.WebDisplayUnits;
import com.microstrategy.web.objects.WebFolder;
import com.microstrategy.web.objects.WebIServerSession;
import com.microstrategy.web.objects.WebObjectInfo;
import com.microstrategy.web.objects.WebObjectSource;
import com.microstrategy.web.objects.WebObjectsException;
import com.microstrategy.web.objects.WebShortcut;
import com.microstrategy.web.objects.WebViewMediaSettings;
import com.microstrategy.webapi.EnumDSSXMLObjectFlags;
import com.microstrategy.webapi.EnumDSSXMLObjectTypes;

public class MstrFolderBrowseUtil {
	private static final Logger logger = LoggerFactory.getLogger(MstrFolderBrowseUtil.class);

	private MstrFolderBrowseUtil() {}
	
		private static class StackedUnits {
			private final Enumeration<WebDisplayUnit> elements;
			private final List<Map<String, Object>> list;
			
			public StackedUnits(Enumeration<WebDisplayUnit> elements, List<Map<String, Object>> list) {
				this.elements = elements;
				this.list = list;
			}
			
			public Enumeration<WebDisplayUnit> getElements() { return elements; }
			public List<Map<String, Object>> getList() { return list; }
		}
	
		@SuppressWarnings("unchecked")
		private static String getPath(WebDisplayUnit unit) {
			SimpleList simpleList = ((WebObjectInfo)unit).getAncestors();
	
			StringBuilder path = new StringBuilder();
			Enumeration<WebFolder> e = simpleList.elements();
			while (e.hasMoreElements()) {
				WebFolder f = e.nextElement();
				path.append(StringUtils.isEmpty(path.toString()) ? "" : "/").append(f.getDisplayName());
			}
			return path.toString();
		}
		
		private static class DisplayNameComparator implements Comparator<Object> {
			public int compare(Object o1, Object o2) {
				String s1 = "";
				String s2 = "";
				
				if (o1 instanceof WebDisplayUnitEntry && o2 instanceof WebDisplayUnitEntry) {
					s1 = ((WebDisplayUnitEntry)o1).getValue().getDisplayName();
					s2 = ((WebDisplayUnitEntry)o2).getValue().getDisplayName();	
				}
				return s1.compareTo(s2);
			}
		}
	
	/**
	 * 지정폴더의 하위 객체 검색
	 * @param session
	 * @param rootId
	 * @param depth
	 * @return List<Map<String, String|Integer|..|List<...> 의 tree구조
	 * @throws WebObjectsException
	 * @throws IllegalArgumentException
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	public static List<Map<String, Object>> getFolderTree(WebIServerSession session, String rootId, int depth, List<Integer> objectTypes) throws WebObjectsException, IllegalArgumentException, JsonGenerationException, JsonMappingException, IOException {
		
		WebObjectSource source = session.getFactory().getObjectSource();
		source.setFlags(source.getFlags() | EnumDSSXMLObjectFlags.DssXmlObjectComments);
		WebObjectInfo info = source.getObject(rootId, EnumDSSXMLObjectTypes.DssXmlTypeFolder, true);
		WebFolder folder = (WebFolder)info;
		folder.populate();
		WebDisplayUnits childUnits = folder.getChildUnits();
		
		List<Map<String, Object>> tree = new ArrayList<Map<String, Object>>();
		if (childUnits == null) { return tree; }
		childUnits.sort(new DisplayNameComparator());
		
		int currentDepth = 1;
		List<Map<String, Object>> currentList = tree;
		Enumeration<WebDisplayUnit> currentElements = childUnits.elements();
		
		LinkedList<StackedUnits> stack = new LinkedList<StackedUnits>();
		while (true) {
			if (!currentElements.hasMoreElements()) {
				while (!stack.isEmpty()) {
					StackedUnits units = stack.pop();
					currentElements = units.getElements();
					currentList = units.getList();
					currentDepth--;
					if (currentElements.hasMoreElements()) { break; }
				}
			}

			if (stack.isEmpty() && !currentElements.hasMoreElements()) { break; }

			WebDisplayUnit currentUnit = currentElements.nextElement();
			
			// 처리레벨이 정해져 있다면, 해당 레벨의 폴더는 표시하지 않고, 다음 sibling을 처리한다. 
			if (currentDepth > depth && depth != -1) { continue; }
			
			if (objectTypes != null && !objectTypes.contains(currentUnit.getDisplayUnitType())) { continue; }
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("name", currentUnit.getDisplayName());
			map.put("path", getPath(currentUnit));
			
			if (currentUnit.getDisplayUnitType() == EnumDSSXMLObjectTypes.DssXmlTypeShortcut || currentUnit.isObjectInfo()) {
				WebObjectInfo objectInfo = null;
				if (currentUnit.getDisplayUnitType() == EnumDSSXMLObjectTypes.DssXmlTypeShortcut) {
					WebShortcut shortcut = (WebShortcut)source.getObject(currentUnit.getID(), EnumDSSXMLObjectTypes.DssXmlTypeShortcut, true);
					objectInfo = shortcut.getTarget();
				} else {
					objectInfo = (WebObjectInfo)currentUnit;
				}
				map.put("id", objectInfo.getID());
				map.put("type", objectInfo.getType());
				map.put("subType", objectInfo.getSubType());
				WebViewMediaSettings settings = objectInfo.getViewMediaSettings();
				
				// 도큐먼트와 VI는 getType()으로 구분할 수 없어, getDefaultMode()를 이용하여 VI, 됴큐먼트를 구분
				//map.put("isVI", (EnumDSSXMLViewMedia.DSSXmlViewMediaHTML5Dashboard & settings.getDefaultMode()) == EnumDSSXMLViewMedia.DssXmlViewMediaExportHTML);
				map.put("isVI", settings.getDefaultMode() == 8192);
			} else {
				map.put("id", currentUnit.getID());
				map.put("type", currentUnit.getDisplayUnitType());
			}
			// logger.debug(map.get("path") + " ==> " + map);
			currentList.add(map);
			
			if (currentUnit.getDisplayUnitType() == EnumDSSXMLObjectTypes.DssXmlTypeFolder) {
				stack.push(new StackedUnits(currentElements, currentList));
				((WebFolder)currentUnit).populate();
				childUnits = currentUnit.getChildUnits();
				childUnits.sort(new DisplayNameComparator());
				currentElements = childUnits.elements();
				
				List<Map<String, Object>> childList = new ArrayList<Map<String, Object>>();
				map.put("child", childList);
				currentList = childList;
				currentDepth++;
			}
		}
		
		return tree;
	}	
	
}