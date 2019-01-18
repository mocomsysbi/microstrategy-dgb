<%
    /*
     * Create_Path.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Path.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Render the folder toolbar--%>
<web:ifBeanValue bean="folderTb">
    <web:then>
		<web:displayBean bean="folderTb" />
    </web:then>
</web:ifBeanValue>
<%-- Render the path to the current folder. --%>
<div class="mstrPathContainer">
<web:displayBean bean="pathBean" styleName="FolderBrowsingPathStyle"/>
<%@include file='/jsp/Logo.jsp' %>
</div>