<%
  /****
  * Desktop_Content.jsp
  * This file displays a sample custom start page
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ page import="java.util.Map"
%><%@ page import="java.util.List"
%><%@ page import="java.util.Arrays"
%><%@ page import="java.io.StringWriter"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%@ page import="com.microstrategy.web.objects.WebIServerSession"
%><%@ page import="com.microstrategy.webapi.EnumDSSXMLObjectTypes"
%><%@ page import="org.codehaus.jackson.map.ObjectMapper"
%><%@ page import="com.mocomsys.microstrategy.sdk.util.MstrFolderBrowseUtil"%>
<%
	
	PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");
	//System.out.println("=>" + mstrPage);
	WebIServerSession isession = mstrPage.getWebIServerSession();
	//System.out.println("=>" + isession);
	
	List<Map<String, Object>> list = MstrFolderBrowseUtil.getFolderTree(
			isession, 
			"D3C7D461F69C4610AA6BAA5EF51F4125", 
			4, 
			Arrays.asList(EnumDSSXMLObjectTypes.DssXmlTypeFolder, EnumDSSXMLObjectTypes.DssXmlTypeReportDefinition, EnumDSSXMLObjectTypes.DssXmlTypeDocumentDefinition)
	);
	
	StringWriter writer = new StringWriter();
	ObjectMapper mapper = new ObjectMapper();
	mapper.writeValue(writer, list);
	
	//System.out.println(writer.toString());
	
%><%-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> --%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/mstr/fsm.css?v=">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/mstr/mstr.css?v=">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/mstr/mstrColorThemeRed.css?v=">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/javascript/mojo/css/core.css?v=">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/javascript/mojo/css/cge.css?v=">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/javascript/mojo/css/folder.css?v=">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/mstr/pageFolder.css?v=">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/mstr/chrome.css?v=">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/mstr/mstrDB.css?v=">
<style type="text/css">
	html, body { height:100%; min-height:100%; margin:0px; overflow:hidden;}
	#leftToolbar, .mstrVerticalDocks .tdDockLeft { width:200px; }
	.mstrMenuTab.toggler .icon-toggle { background:none; }
	.mstrTreeBox li, .mstrTreeBox li.open { list-style-image:none; }
	#mstrWebContents { height:calc(100% - 142px); overflow:hidden; }
	.mojoPath { display: none; }
	#tree_ftb_FolderTreeView .mstrIcon-lv-f.report, #tree_ftb_FolderTreeView li.open .mstrIcon-lv-f.report { background-position:0 -250px !important; }
	#tree_ftb_FolderTreeView .mstrIcon-lv-f.report, #tree_ftb_FolderTreeView li.open .mstrIcon-lv-f.document { background-position:0 -208px !important; }
	#tree_ftb_FolderTreeView .mstrIcon-lv-f.report, #tree_ftb_FolderTreeView li.open .mstrIcon-lv-f.dashboard { background-position:0 -171px !important; }
</style>
<script src="${pageContext.request.contextPath}/_custom/javascript/jquery/jquery-1.11.0.js" type="text/javascript"></script>
<%-- <script src="${pageContext.request.contextPath}/plugins/AddingCustomPageDefaultStartPage/jsp/test-data.js" type="text/javascript"></script> --%>
<script type="text/javascript">

var defaultTreeDataJson = <%= writer.toString() %>;
var mstrServerInfo = {};
// var json = test;

/*
 * 화면 로딩시 사이즈 설정
 */
function Init() {
	var iframeSize = $(window).height() - $('#mstrWeb_path').height();
	$('#mstrIframe').height(iframeSize);
	$('#menuTree').height($(window).height() - $('#mstrWeb_path').height() - 75);
	
	mstrServerInfo.server = "<%= isession.getServerName() %>";
	mstrServerInfo.project = "<%= isession.getProjectName() %>";
	
	//resize Event
	$( window ).resize(function() {
		iframeSize = $(window).height() - $('#mstrWeb_path').height();
		$('#menuTree').height($(window).height() - $('#mstrWeb_path').height() - 75);
		$('#mstrIframe').height(iframeSize);
	});
}


function getSibling(me, parent, parChildAttrName) {
    var sibling;
    var childAttrName = (parChildAttrName ? parChildAttrName : "child");
    
    for (var i = 0; parent && parent[childAttrName] && i < parent[childAttrName].length; i++) {
        if (parent[childAttrName][i] == me) {
            // 마지막 노드 이전일 경우만 sibling이 존재함
            if (i < parent[childAttrName].length - 1) { sibling = parent[childAttrName][i + 1]; }
            break;
        }   
    }
    
    return sibling;
}


function navigateDepthFirst(data, handler, parChildAttrName) {
    var childAttrName = (parChildAttrName ? parChildAttrName : "child");
    var done = [];
    var stack = [];
    var ref = data;
    
    while (ref) {
        if ($.inArray(ref, done) == -1) { handler(ref, stack); }
        
        if ($.inArray(ref, done) == -1 && ref[childAttrName] && ref[childAttrName].length > 0) {
            stack.push(ref);
            done.push(ref);
            ref = ref[childAttrName][0];
        } else {
            var parent = stack[stack.length - 1];
            var sibling = getSibling(ref, parent);
            
            if (sibling) {
                ref = sibling;
            } else {
                ref = stack.pop();
            }
        }
    }
}


/*
 * 트리 메뉴 클릭 이벤트
 */
function reportLinkClick(e) {
	var $target = $(e.currentTarget);
	var oid = $target.attr("oid");
	var tp = $target.attr("tp");
	var subType = $target.attr("subType");
	var isvi = $target.attr("isvi");
	
	var tmpPath = $target.attr("path");
	var splitPath = tmpPath.split('/');
	
	var path = '';
	for(var i=0; i<splitPath.length; i++) {
		if(i >= 3) {
			path += splitPath[i] + '/';
		}
	}
	
	path += $target.text();
	path = path.replace( /[/]/g, " > ");
	
	//console.log("=>" + oid + "," + tp + "," + isvi);
	
	var mstrServer = '&Server=' + mstrServerInfo.server;
	var mstrProject = '&Project=' + mstrServerInfo.project;
	var mstrUrlInfo = mstrServer + mstrProject;
	
	if (tp == "8") {
		//폴더
		//getFolderTreeList(oid);
		
		var $elem = $("ul[parentid='" + oid + "']");
		if ($elem.is(":visible")) {
			$elem.hide();
		} else {
			$elem.show();
		}
		
	} else if(tp == "3") {
		//리포트
		var $elem = $("ul[parentid='" + oid + "']");
		var viewMode = '1';
		
		if(subType == '768') {
			//그리드 모드
			viewMode = '1';
		} else if(subType == '769') {
			//그래프 모드
			viewMode = '2';
		} else if(subType == '774') {
			//그리드 + 그래프 모드
			viewMode = '3';
		}
		
		var reportUrl = 'mstrWeb?evt=4001&src=mstrWeb.4001&visMode=0&reportViewMode='+ viewMode +'&reportID='+ oid +'&Port=0&share=1' + mstrUrlInfo;
		var sectionUrl = '&hiddenSections=path,docktop,dockLeft';
		var resultUrl = reportUrl + sectionUrl;
		
		$('.mstrPathLast').text(path);
		$('#mstrIframe').prop('src', resultUrl);
	} else if(tp == "55") {
		//다큐먼트, 대시보드
		var $elem = $("ul[parentid='" + oid + "']");
		var sectionUrl = '&hiddenSections=header,footer,path,docktop,dockLeft';
		var resultUrl = '';
		
		if(isvi == 'true') {
			//대시보드
			var dashBoardUrl = 'mstrWeb?evt=3140&src=mstrWeb.3140&documentID='+ oid +'&Port=0&share=1' + mstrUrlInfo;
			resultUrl = dashBoardUrl;
		} else {
			//다큐먼트
			var documentUrl = 'mstrWeb?evt=2048001&src=mstrWeb.2048001&visMode=0&documentID='+ oid +'&Port=0&share=1' + mstrUrlInfo;
			resultUrl = documentUrl + sectionUrl;
		}
		
		$('.mstrPathLast').text(path);
		$('#mstrIframe').prop('src', resultUrl);
	}
}

/*
 * 폴더 구조 가져오기(서버 통신)
 */
function getFolderTreeList(oid) {
	var $target = $("a[oid='" + oid + "']");
	var $elem = $("ul[parentid='" + oid + "']");
	var serverCheck = $target.attr("serverCheck");
	
	if(serverCheck == 'true') {
		//가져율 필요 없음
		
		if ($elem.is(":visible")) {
			$elem.hide();
		} else {
			$elem.show();
		}
		
	} else {
		//트리 데이터 호출
		
		var treeLodingHtml = '';
		treeLodingHtml += '<div nowrap=""><li class="open">';
		treeLodingHtml += '<span class="itemContainer"><img src="${pageContext.request.contextPath}/_custom/img/lodingImg.gif" alt="Loading..." /><span><span></span></span>';
		treeLodingHtml += '<a><span>폴더 가져오는중</span></a>';
		treeLodingHtml += '</span>';
		treeLodingHtml += '</li></div>';
		
		$elem.html(treeLodingHtml);
		
		if ($elem.is(":visible")) {
			$elem.hide();
		} else {
			$elem.show();
		}
		
		$.ajax({
		      url: "${pageContext.request.contextPath}/folder/getFolderList.do"
		    , type: "post"
		    , dataType: "json"
		    , data: {
		    	 folderId : oid
		    }
		    , success: function(rtnData) {
		    	
		    	$elem.html('');
		    	$("a[oid='" + oid + "']").attr('serverCheck', 'true');
		        createTreeData(oid, rtnData.childTreeData);
		        
		        /*
		        $elem.hide();
				if ($elem.is(":visible")) {
					$elem.hide();
				} else {
					$elem.show();
				}
				*/
		    }
		    , error: function (jqXHR, exception) {
		    	var msg = '';
		    	
		        if (jqXHR.status === 0) {
		            msg = 'Not connect.\n Verify Network.';
		        } else if (jqXHR.status == 404) {
		            msg = 'Requested page not found. [404]';
		        } else if (jqXHR.status == 500) {
		            msg = '세션정보가 없습니다\n다시 로그인해주세요\nInternal Server Error [500].';
		        } else if (exception === 'parsererror') {
		            msg = '세션정보를 확인하세요\n다시 로그인해주세요\nRequested JSON parse failed.';
		        } else if (exception === 'timeout') {
		            msg = 'Time out error.';
		        } else if (exception === 'abort') {
		            msg = 'Ajax request aborted.';
		        } else {
		            msg = 'Uncaught Error.\n' + jqXHR.responseText;
		        }
		        
		        alert(msg);
		        //location.href('${pageContext.request.contextPath}/servlet/mstrWeb');
		    }
		    
		});
	}
}

/*
 * 트리 구조 만들기
 */
function createTreeData(rootData, childTreeData) {
	navigateDepthFirst(
			{id:rootData, child:childTreeData},
			function(ref, stack) {
				var $parent = undefined;
				var styleIcon = '';
				
				if(ref.type == 55 && ref.isVI) {
					styleIcon = 'dashboard';
				} else if(ref.type == 55 && !ref.isVI) {
					styleIcon = 'document';
				} else if(ref.type == 3) {
					styleIcon = 'report';
				}
				
				if (stack.length > 0) {
					var parent = stack[stack.length - 1];
					if (parent.id == "root") {
						var $parent = $("ul.firstLevel");
						// console.log("root", ref);
						var $node = undefined;
						if (ref.type == 8) {
							$node = $(
								"<div nowrap=''><li class='open'>" + 
									"<span class='itemContainer'><span class='iconContainer mstrIcon-lv mstrIcon-lv-f shared'><span></span></span>" + 
										"<a title='" + ref.name + "' oid='" + ref.id + "' tp='" + ref.type + "' subType='" + ref.subType + "' isvi='" + ref.isVI + "' path='" + ref.path + "'><span>" + ref.name + "</span></a>" + 
									"</span>" + 
								"</li></div>"
							);
						} else 
						if (ref.type == 55 || ref.type == 3) {
							$node = $(
								"<div nowrap=''><li class='open'>" + 
									"<span class='itemContainer'><span class='iconContainer mstrIcon-lv mstrIcon-lv-f "+ styleIcon +"'><span></span></span>" + 
										"<a title='" + ref.name + "' oid='" + ref.id + "' tp='" + ref.type + "' subType='" + ref.subType + "' isvi='" + ref.isVI + "' path='" + ref.path + "'><span>" + ref.name + "</span></a>" + 
									"</span>" + 
								"</li></div>"
							);
						}
						$node.find("a").click(reportLinkClick);
						$parent.append($node);
						if (ref.type == 8) {
							$parent.append("<ul style='display:none;' parentid='" + ref.id + "'></ul>");
						}
					} else {
						var $parent = $("ul[parentid='" + parent.id + "']");
						var $node = undefined;
						if (ref.type == 8) {
							$node = $(
								"<div nowrap=''><li class='open'>" + 
									"<span class='itemContainer'><span class='iconContainer mstrIcon-lv mstrIcon-lv-f shared'><span></span></span>" + 
										"<a title='" + ref.name + "' oid='" + ref.id + "' tp='" + ref.type + "' subType='" + ref.subType + "' isvi='" + ref.isVI + "' path='" + ref.path + "'><span>" + ref.name + "</span></a>" + 
									"</span>" + 
								"</li></div>"
							);
						} else 
						if (ref.type == 55 || ref.type == 3) {
							$node = $(
								"<div nowrap=''><li class='open'>" + 
									"<span class='itemContainer'><span class='iconContainer mstrIcon-lv mstrIcon-lv-f "+ styleIcon +"'><span></span></span>" + 
										"<a title='" + ref.name + "' oid='" + ref.id + "' tp='" + ref.type + "' subType='" + ref.subType + "' isvi='" + ref.isVI + "' path='" + ref.path + "'><span>" + ref.name + "</span></a>" + 
									"</span>" + 
								"</li></div>"
							);
						}
						$node.find("a").click(reportLinkClick);
						$parent.append($node);
						if (ref.type == 8) {
							$parent.append("<ul style='display:none;' parentid='" + ref.id + "'></ul>");
						}
					}
				}
			}
		);
}

$(function() {
	//화면 조정
	Init();
	
	//기본 트리구조 만들기
	createTreeData('root', defaultTreeDataJson);
});
</script>
<body class="mstrWeb  Red mstrDHTML mstr-page-welcome mstr-chrome mstrDB mojo-theme-light">
<table width="100%" cellspacing="0" cellpadding="0" class="mstrToolbarWrapper" style="left: 0px;">
<tbody><tr><td>

<div class="mstrPath" id="mstrWeb_path" name="mstrWeb_path" iframe="true">
	<table cellpadding="0" cellspacing="0" border="0">
    	<colgroup>
            <col>
            <col class="mstrPathSearchCol">
            <col class="mstrPathHelpCol">
        </colgroup>
        <tbody><tr>
            <td class="mstrPathTDLeft">
            	<div class="mstrPathContainer">
					<div id="pathBean_FolderBrowsingPathStyle" dg="0" rsz="0" iframe="true" style="display: inline;" or="2" scriptclass="mstrPathImpl" name="pathBean_FolderBrowsingPathStyle" class="mstrTransform" ors="3">
						<div class="mstrPathText pinned" selectable="true" style="max-width: 986px;">
							<div class="mstrPathTextCurrent" style="max-width: 675px;"><span class="mstrPathLast">대시보드 분석</span></div>
						</div>
						<div class="mstrSpacer"></div>
					</div>
					<a href="mstrWeb?evt=3010&amp;src=mstrWeb.3010" id="mstrStarburst" onclick="submitLinkAsFormWithoutState(this);return false;" title="" class="mstrLink" _href="http://localhost:8080/MicroStrategy.10.9/servlet/mstrWeb?evt=3010&amp;src=mstrWeb.3010">
					    <div id="mstrLogo" class="mstrLogo path" title=""> </div>
					</a>
                </div>
            </td>
        </tr></tbody>
    </table>
</div>
</td></tr>
</tbody></table>
<div style="padding-top:42px; height: calc(100% - 42px);">
<div id="mstrWebContents" style="height:100%; padding-bottom: 0px;">
<table id="mstrWebContentTable" class="mstrVerticalDocks" cellspacing="0" cellpadding="0" style="height:100%;">
<tbody><tr>
<td class="tdDockLeft" id="td_mstrWeb_dockLeft" style="height:100%;">
	<div class="mstrDockLeft" id="mstrWeb_dockLeft" name="mstrWeb_dockLeft" iframe="true" style="height:100%;">
		<div id="leftToolbar" scriptclass="mstrLeftPaneImpl" rsz="2" style="height:100%;">
		  	<div class="mstrMenuTabs" id="menuTabs" scriptclass="mstrMenuTabsImpl" style="height:100%;">
		    	<div id="menuToggler" class="mstrMenuTab toggler" ty="btn"><div class="icon-toggle">&nbsp;</div></div>
		        <div id="mscld-create" class="mstrmojo-CreateButton mscld-create analysis" title="기본 페이지로 이동" onclick="location.href='mstrWeb?pg=desktop'">
	        		<span class="mstrMenuItemcreate"><span id="mscld-create-menu" class="mscld-create-menu">기본 페이지</span></span>
		        </div>
		    	<div id="menuTree" class="mstrMenuSection" style="height:calc(100% - 75px);">
		      		<div class="mstrMenuContent" style="height:100%;">
		                <div id="ftb_FolderTreeView" style="display:block; width:100%;" name="ftb_FolderTreeView" class="mstrTransform">
		                 	<div id="tree_ftb_FolderTreeView" style="width:200px;" name="tree_ftb_FolderTreeView" class="mstrTreeBox">
		                 		<ul style="display: block" class="firstLevel">
		                 			<%-- <div nowrap="">
		                 				<li class="open">
		                 					<span class="itemContainer">
		                 						<span class="iconContainer mstrIcon-lv mstrIcon-lv-f shared"><span></span></span>
		                 						<a title="공유 리포트"><span>공유 리포트</span></a>
		                 					</span>
		                 				</li>
		                 			</div>
									<ul style="display: block;">
										<div nowrap="">
											<li>
												<span class="itemContainer">
													<span class="iconContainer mstrIcon-lv mstrIcon-lv-f"><span></span></span>
													<a title="MicroStrategy 플랫폼 기능"><span>MicroStrategy 플랫폼 기능 우리나라 대한민국</span></a>
												</span>
											</li>
										</div>
										<div nowrap="">
											<li class="open">
												<span class="itemContainer">
													<span class="iconContainer mstrIcon-lv mstrIcon-lv-f"><span></span></span>
													<a title="주제 영역"><span>주제 영역</span></a>
												</span>
											</li>
										</div>
										<ul style="display: block">
											<div nowrap="">
												<li>
													<span class="itemContainer">
														<span class="iconContainer mstrIcon-lv mstrIcon-lv-f"><span></span></span>
														<a title="고객 분석"><span>고객 분석</span></a>
													</span>
												</li>
											</div>
											<div nowrap="">	
												<li>
													<span class="itemContainer">
														<span class="iconContainer mstrIcon-lv mstrIcon-lv-f"><span></span></span>
														<a title="공급업체 분석" class="marked"><span>공급업체 분석</span></a>
													</span>
												</li>
											</div>
											<div nowrap="">
												<li>
													<span class="itemContainer">
														<span class="iconContainer mstrIcon-lv mstrIcon-lv-f"><span></span></span>
														<a title="기업 실적 관리"><span>기업 실적 관리</span></a>
													</span>
												</li>
											</div>
											<div nowrap="">
												<li>
													<span class="itemContainer">
														<span class="iconContainer mstrIcon-lv mstrIcon-lv-f"><span></span></span>
														<a title="인사 분석"><span>인사 분석</span></a>
													</span>
												</li>
											</div>
										</ul>
									</ul>
									--%>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</td>
<td class="mstrDockCenter">
	<div class="mstrContent" id="mstrWeb_content" name="mstrWeb_content" iframe="true">
		<iframe id="mstrIframe" style="width: 100%; border: 0"></iframe>
	</div>
</td>
</tr>
</tbody></table>
</div>
</div>

</body>
</html>
