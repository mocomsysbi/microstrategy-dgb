package com.mocomsys.web.api.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.microstrategy.web.objects.WebIServerSession;
import com.microstrategy.webapi.EnumDSSXMLObjectTypes;
import com.mocomsys.microstrategy.sdk.util.MstrFolderBrowseUtil;

@Controller
@RequestMapping(value="/folder")
public class FolderTreeController {
	private static final Logger logger = LoggerFactory.getLogger(FolderTreeController.class);

	/**
	 * 폴더 리스트 호출
	 * @param request
	 * @param respone
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getFolderList.do")
	public ModelAndView getFolderList(HttpServletRequest request, HttpServletResponse respone) throws Exception {
		
		String folderId = request.getParameter("folderId");
		WebIServerSession iSession = (WebIServerSession)request.getSession().getAttribute("mstrISession");
		ModelAndView mav = new ModelAndView(new MappingJacksonJsonView());
		System.out.println("iSession  =" + iSession);
		
		if(iSession == null) {
			logger.debug("MSTR 세션이 없습니다.");
			mav.addObject("mstrISessionCheck", false);
			return new ModelAndView("error_session");
		} else {
			mav.addObject("mstrISessionCheck", true);
		}
		
		List<Map<String, Object>> list = MstrFolderBrowseUtil.getFolderTree(
				iSession, 
				folderId, 
				1, 
				Arrays.asList(EnumDSSXMLObjectTypes.DssXmlTypeFolder
							, EnumDSSXMLObjectTypes.DssXmlTypeReportDefinition
							, EnumDSSXMLObjectTypes.DssXmlTypeDocumentDefinition
							, EnumDSSXMLObjectTypes.DssXmlTypeShortcut
				)
		);
		
		//System.out.println("폴더 데이터  =" + list);
		mav.addObject("childTreeData", list);
		
	    return mav;
	}

}
