<%
 /****
  * Generic_Path.jsp
  * This file includes the content of the Path section.
  * This consist on a go Home link, the Back and Forward buttons, the Folder Up button
  * and the name of the current project the user is logged in to.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<div id="mstrRecentsGenPopup">
    <div class="mstrMenuContent" ty="content">
        <web:shortcutOptions type="recents" shortcutClass="mstrMenuItem" shortcutSelectedClass="mstrMenuItem">
            <web:shortcutElement />
        </web:shortcutOptions>

    </div>
</div>
<%-- Display the path section --%>
<web:ifFeature name="showHeaderBar" type="systemPreference" value="0">
    <web:then>
        <table cellpadding="0" cellspacing="0" border="0">
            <colgroup>
                <col />
                <web:ifConnectionValue><web:then>
                <web:ifBeanValue property="getName" value="search"> <web:else>
                <web:ifFeature name="object-search"> <web:then>
                <col class="mstrPathSearchCol" />
                </web:then></web:ifFeature>
                </web:else></web:ifBeanValue></web:then></web:ifConnectionValue>
                <web:ifFeature name="is-cloud-unified">
                	<web:then>
                		<col class="mstrFeedback" />
               		</web:then>
                </web:ifFeature>
                <col class="mstrPathHelpCol" />
            </colgroup>
            <tr>
                <td class="mstrPathTDLeft"><%-- Display the path section --%>
                    <div class="mstrPathContainer">
                        <web:ifFeature name="!mobile-server">
                            <web:then>
                                <web:displayGuiComponent name="pathBean" />
                            </web:then>
                            <web:else>
                                <div class="mstrPathText"><span class="mstrPathLast"><web:descriptor
                                    key="mstrWeb.1142" desc="About" /></span></div>
                            </web:else>
                        </web:ifFeature>
                        <%@include file='/jsp/Logo.jsp' %>
                    </div>
                </td>
                <web:ifConnectionValue>
                    <web:then>
                        <web:ifBeanValue property="getName" value="search">
                            <web:else>
                                <web:ifFeature name="object-search"> <web:then>
                                    <td>
                                        <web:ifBeanValue property="getXMLStatus" value="2">
                                            <web:else>
                                                <web:ifFeature name="dhtml">
                                                    <web:then>
                                                        <%-- Search Box section --%>
                                                        <jsp:include page='/jsp/SearchSuggest_Content.jsp' flush="true" />  
                                                    </web:then>
                                                </web:ifFeature>
                                            </web:else>
                                        </web:ifBeanValue>
                                    </td>
                                </web:then></web:ifFeature>       
                            </web:else>
                        </web:ifBeanValue>
                    </web:then>
                </web:ifConnectionValue>
                
                <web:ifFeature name="is-cloud-unified">
                	<web:then>
                		<jsp:include page='../html/CloudUnifiedFeedback.html' flush="true" />
               		</web:then>
                </web:ifFeature>
                <td>
                	<web:ifFeature name="dhtml">
	                    <web:then>
	                    	<div id="mstrPathAccount" style="cursor:pointer;" >
		                    	<span class="mstrPathLast mstrAccountName" title="<web:connectionValue property="userName"/>"><web:connectionValue property="userName"/></span>
		                    	<div id='mstrAccountMenu' class='mstrAccountMenu path' > </div>
		                	</div>
	                    </web:then>
	                    <web:else>
		                	<%-- Render a hyperlink to the Online Help. --%> 
		                    <span class="mstrHelpShortcut"><web:resource type="helpUser" /></span>
	                	</web:else>
                	</web:ifFeature>
                </td>
            </tr>
        </table>
    </web:then>
    <web:else>
        <div class="mstrPathContainer">
            <web:ifFeature name="!mobile-server">
                <web:then>
                    <web:displayGuiComponent name="pathBean" />    
                </web:then>
                <web:else>   
                    <div class="mstrPathText">
                        <span class="mstrPathLast"><web:descriptor key="mstrWeb.1142" desc="About"/></span>
                    </div>
                </web:else>
            </web:ifFeature>
            <%@include file='/jsp/Logo.jsp' %>
        </div>
    </web:else>
</web:ifFeature>
      