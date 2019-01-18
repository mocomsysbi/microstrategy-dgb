<%
 /*
  * Help_Header.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%><%@ page errorPage="Error_Header.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><a name="top"></a>
<%-- Render the shortcut elements as specified in pageConfig.xml for the Help page. --%>
<web:shortcutOptions type="toolbar" shortcutClass="mstrShortcut" shortcutSelectedClass="mstrShortcutSelected">
<web:shortcutElement />
</web:shortcutOptions>
