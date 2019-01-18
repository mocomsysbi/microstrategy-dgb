<%
/*
 * Subscriptions_Toolbar.jsp
 * This file servers as the toolbar for the Subscriptions page.
 * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
 */
%>

<%@ page errorPage="Error_Toolbar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Load the subscriptions toolbar. --%>
<div class="mstrDockTopContainer">
<web:displayBean bean="subscriptionsTb" />
</div>