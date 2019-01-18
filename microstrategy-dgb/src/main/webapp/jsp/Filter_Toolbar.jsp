<%
/*
 * Filter_Toolbar.jsp
 * This page displays the toolbars for the filter editor page.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<%-- Render the 'filter toolbar' bean --%>
<div class="mstrDockTopContainer">
<web:displayBean bean="filterTb"/>
</div>
