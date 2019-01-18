<%
 /****
  * Admin_Path.jsp
  * This file includes the content of the Path section for pages such as Desktop and Summary.
  * This consist on a go Home link, the Return-to link (to go to Home as well)
  * and the name of the current project the user is logged in to.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<%--
 Display a hyperlink to the project page using the "Home" icon.
 Also, display a hyperlink to the project page using the "Return to" icon.
--%>
<table cellpadding="0" cellspacing="0" border="0">
    <tr><td>
		<div class="mstrPathContainer">
		<div class="mstrPathIcons">
		    <web:ifFeature name="showHomeBtnInNavBar" type="preference" value="1"><web:then>		
    		    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenDefaultDesktop">
    		        <span class="mstrIcon-tb" id="tbHome" <web:descriptor attribute="title" key="mstrWeb.1" desc="Home" />></span>
    		    </web:urlEvent>
		    </web:then></web:ifFeature>
		    <web:ifFeature name="showFolderUpBtnInNavBar" type="preference" value="1"><web:then>
		    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenDefaultDesktop">
		        <span class="mstrIcon-tb" id="tbReturn" <web:descriptor replaceValue="$com.microstrategy.web.app.taglibs.ConnectionValueTagHelper:setProperty.serverName$" attribute="title" key="mstrWeb.3341" desc="Return To" />></span>
		    </web:urlEvent>
	          </web:then></web:ifFeature>
		</div>
		<div class="mstrPathText">
		        <span>
		            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenDefaultDesktop">
		                <web:connectionValue property="serverName"/>
		            </web:urlEvent>
		        </span>
		        <span class="mstrPathDelim">&gt;</span>
		        <span class="mstrPathLast"><web:beanValue property="title"/></span>
		</div>
		
		<%-- <web:displayGuiComponent name="userMgr_toolbar" /> 
		<div class="mstrSpacer"></div>
		--%>
		
		<%@include file='/jsp/serverAdmin/Server_Logo.jsp' %>
		</div>
	</td>
    <td nowrap="1"><jsp:include page='<%=mstrPage.getTemplateInfo().getSection("path_options")%>' flush="true" /></td>
    </tr>
</table>