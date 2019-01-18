<%
 /****
  * Generic_ShortcutsBar.jsp
  * This file includes the default content of the shorcuts bar section.
  * This consist on the toolbar link, a search box, and logout and help links.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<%-- Render the toolbar section if the user has a session. --%>
<table cellpadding="0" cellspacing="0" border="0">
<colgroup>
	<col class="mstrHeaderShortcutsCol"/>
	<col class="mstrHeaderSearchCol"/>
	<col class="mstrHeaderHelpCol"/>
</colgroup>
<tr><td nowrap="nowrap">
<web:ifConnectionValue><web:then>
<web:shortcutOptions type="toolbar" shortcutClass="mstrShortcut" shortcutSelectedClass="mstrShortcutSelected">
<web:shortcutElement />
</web:shortcutOptions>
<web:ifFeature name="object-search"><web:then>
</td><td nowrap="nowrap">

<web:ifFeature name="dhtml">
<web:then>

<!-- Search Box section -->
<jsp:include page='/jsp/SearchSuggest_Content.jsp' flush="true" />

</web:then>
<web:else>
<web:displayGuiComponent name="folder_search"/>
</web:else>
</web:ifFeature>

</td><td nowrap="nowrap">
</web:then></web:ifFeature>
</web:then></web:ifConnectionValue>

<%-- Render a hyperlink to the Online Help. --%>
<span class="mstrShortcut"><web:resource type="helpUser"/></span>
<%-- Render the logout button if the user has a session that not shared with portlet. --%>
<web:ifConnectionValue><web:then>
<web:ifFeature name="is-portlet"><web:then></web:then><web:else>
<span class="mstrShortcut"><web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventLogout"><web:descriptor key="mstrWeb.8" desc="Logout" /></web:urlEvent></span>
</web:else></web:ifFeature>
</web:then></web:ifConnectionValue>
</td></tr></table>

<%@include file='/jsp/Logo_Small.jsp' %>