<%
/*
 * Subscriptions_Path.jsp
 * This file servers as the path for the Subscriptions page.
 * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
 */
%>

<%@ page errorPage="Error_Toolbar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Display the path section.--%>
<div class="mstrPathContainer">
<web:displayBean bean="pathBean" styleName="PathStyle"/>
<%@include file='/jsp/Logo.jsp' %>
</div>