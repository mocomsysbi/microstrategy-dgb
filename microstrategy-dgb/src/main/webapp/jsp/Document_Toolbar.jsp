<%
/*
 * Document_Toolbar.jsp
 * This page displays the menus and toolbars for the Document page.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<%-- Only show the menus and toolbars if the document bean is "ready": --%>
<web:ifBeanValue bean="db" property="getXMLStatus" value="3"><web:then>
 <div class="mstrMenuBar">
  <web:displayGuiComponent name="document_menus" />
 </div>
 <web:displayGuiComponent name="document_toolbar_standard" />
 <div class="mstrSpacer"/>
</web:then></web:ifBeanValue>
