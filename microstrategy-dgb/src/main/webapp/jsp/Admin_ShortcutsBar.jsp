<%
 /****
  * Admin_ShortcutsBar.jsp
  * This file includes the content of the shorcuts bar section in the
  * admin pages.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<%--
 Display the Help secion as defined in the shortcut-list defined in adminPageConfig.xml (toolbar)
 The shortcutOptions tag will go through all the shortcut elements and render them.
--%>
<web:shortcutOptions type="toolbar" shortcutClass="mstrShortcut" shortcutSelectedClass="mstrShortcutSelected">
<web:shortcutElement />
</web:shortcutOptions>
<%--
 Display a hyperlink to "Admin Online Help".
--%>
<span class="mstrShortcut"><web:resource type="helpAdmin"/></span>


<%@include file='/jsp/Logo_Small.jsp' %>