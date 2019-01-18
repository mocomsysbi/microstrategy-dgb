<%
/*
 * GUIComponent_Path.jsp
 * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
 */
%><%@ page errorPage="Error_Path.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<%-- Render the path links and info about the location of the object being transformed.--%>
<div class="mstrPathContainer">
<web:displayGuiComponent name="pathBean"/>
<%@include file='/jsp/Logo.jsp' %>
</div>