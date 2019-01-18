<%
 /****
  * Preferences_TopToolbar.jsp
  * This file servers as the toolbar section for the preferences page.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.0
  * xhtml: true
  ****/
%>

<%@ page errorPage="Error_Toolbar.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Render the 'preferences page toolbar' bean --%>
<div class="mstrDockTopContainer">
<web:displayBean bean="prefTb"/>
</div>