<%
 /****
  * NCSendNow_Toolbar.jsp
  * This file servers as the toolbar section for the Send Now from folder page.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.0
  * xhtml: true
  ****/
%>

<%@ page errorPage="Error_Toolbar.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Render the 'send now page toolbar' bean --%>
<div class="mstrDockTopContainer">
<web:displayBean bean="ncSubTb"/>
</div>