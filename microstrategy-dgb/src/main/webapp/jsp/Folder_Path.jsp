<%
    /*
     * Folder_Path.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Path.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Render the folder toolbar--%>

<%-- Render the path to the current folder. --%>
<div class="mstrPathContainer">
<web:displayGuiComponent name="pathBean"/>
<%@include file='/jsp/Logo.jsp' %>
</div>