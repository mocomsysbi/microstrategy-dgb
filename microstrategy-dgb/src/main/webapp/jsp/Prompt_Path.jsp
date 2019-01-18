<%
 /****
  * Prompt_Path.jsp
  * This file includes the content of the Path section for pages that display prompts editing pages.
  * This consist on a go Home link, the Back and Forward buttons, the Parent Up button (that uses the back button action)
  * and the name of the current project the user is logged in to.
  *
  * Copyright 2008 MicroStrategy Incorporated. All rights reserved.
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<div class="mstrPathContainer">
<web:displayGuiComponent name="prompt_path" isContainer="false"/>
<%@include file='/jsp/Logo.jsp' %>
</div>