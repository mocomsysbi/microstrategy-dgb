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
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%--
 Display a hyperlink to the project page using the "Home" icon.
 Also, display a hyperlink to the project page using the "Return to" icon.
--%>
<div class="mstrPathContainer">
<div class="mstrPathIcons">
	<web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHome">
	    <span class="mstrIcon-tb" id="tbHome" <web:descriptor attribute="title" key="mstrWeb.1" desc="Home" />></span>
	</web:urlEvent>
	<span class="mstrIcon-tb disabled" id="tbReturn"></span>
</div>
<div class="mstrPathText">
	<span class="mstrPathFirst">
	    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenDefaultDesktop">
	        <web:connectionValue property="serverName"/>
	    </web:urlEvent>
	</span>
	<span class="mstrPathDelim">&gt;</span>
	<span class="mstrPathLast"><web:beanValue property="title"/></span>
</div>
</div>