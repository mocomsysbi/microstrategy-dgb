<%
    /*
     * Title_Only_Path.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>
<%@ page errorPage="Error_Header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<web:ifFeature name="showHeaderBar" type="systemPreference" value="0">
    <web:then>
        <table cellpadding="0" cellspacing="0" border="0">
            <colgroup>
                <col />
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
			            <div class="mstrPathText">
			                <span class="mstrPathLast"><web:beanValue property="title" encode="true"/></span>
			            </div>
			        	<div class="mstrSpacer">
			            </div>
			            <div id="mstrStarburst" _isstatic="true">
			                <div id="mstrLogo" class="mstrLogo path"> </div>
			                <div id="mstrLogoSmall" class="mstrLogoSmall path" title=""> </div>
			            </div>
			        </div>
			
			        <%--when logo shows, pathbar must show too to make room enough for logo--%>
			        <style type="text/css">
			            .path.mstrLogo {display: none;}
			            .mstrLogoSmall {display: none;}
			            .path.mstrLogoSmall {display: block;}
			            .mstrPathContainer {padding-left: 60px;}
			            .mstrHeader {padding-left: 70px;}
			            #mstrStarburst {top:1px;}
			        </style>
                </td>
                <web:ifFeature name="is-cloud-unified">
	                <web:then>
	                	<jsp:include page='../html/CloudUnifiedFeedback.html' flush="true" />
                	</web:then>
                </web:ifFeature>
                <td>
                <%-- Render a hyperlink to the Online Help. --%> 
                <span class="mstrHelpShortcut"><web:resource type="helpUser" /></span>
                </td>
            </tr>
        </table>    
    </web:then>
    <web:else>
        <div class="mstrPathContainer">
            <div class="mstrPathText">
                <span class="mstrPathLast"><web:beanValue property="title" encode="true"/></span>
            </div>
        	<div class="mstrSpacer">
            </div>
            <div id="mstrStarburst" _isstatic="true">
                <div id="mstrLogo" class="mstrLogo path"> </div>
                <div id="mstrLogoSmall" class="mstrLogoSmall path" title=""> </div>
            </div>
        </div>

        <%--when logo shows, pathbar must show too to make room enough for logo--%>
        <style type="text/css">
            .path.mstrLogo {display: none;}
            .mstrLogoSmall {display: none;}
            .path.mstrLogoSmall {display: block;}
            .mstrPathContainer {padding-left: 40px;}
            .mstrHeader {padding-left: 70px;}
            #mstrStarburst {top:1px;}
        </style>
    </web:else>
</web:ifFeature>

