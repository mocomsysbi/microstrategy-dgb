<%
 /****
  * Preferences_ShortcutsBar.jsp
  * This file includes the content of the shorcuts bar section in the preferences page.
  * It mimics the output of the Generic_ShortcutsBar, except that it defines
  * different links for the help section: one for admin, one for users.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<%-- Render the shortcut elements if the user has a session--%>
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
</web:then></web:ifConnectionValue>
<%-- Render the 'search' section if this feature is available to the user. --%>
<web:ifFeature name="object-search"><web:then>
</td><td nowrap="nowrap">


<web:ifFeature name="dhtml">
<web:then>

<%-- Search Box section --%>
<jsp:include page='/jsp/SearchSuggest_Content.jsp' flush="true" />

</web:then>
<web:else>
<web:quickSearch/>
</web:else>
</web:ifFeature>

</td><td nowrap="nowrap">
</web:then></web:ifFeature>
<%--
	Display a hyperlink to the 'Admin Help' page or the regular 'Help' page
	depending on certain preferences.
--%>
<web:ifBeanValue bean="preferences" property="getCurrentLevel" value="server"><web:then>
<span class="mstrShortcut"><web:resource type="helpAdmin"/></span>
</web:then>
<web:else>
<web:ifBeanValue bean="preferences" property="getCurrentLevel" value="project"><web:then>
<span class="mstrShortcut"><web:resource type="helpAdmin"/></span>
</web:then><web:else>
<span class="mstrShortcut"><web:resource type="helpUser"/></span>
</web:else></web:ifBeanValue>
</web:else></web:ifBeanValue>
<%-- Render the logout button if the user has a session that not shared with portlet. --%>
<web:ifConnectionValue><web:then>
<web:ifFeature name="is-portlet"><web:then></web:then><web:else>
<span class="mstrShortcut"><web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventLogout"><web:descriptor key="mstrWeb.8" desc="Logout" /></web:urlEvent></span>
</web:else></web:ifFeature>
</web:then></web:ifConnectionValue>
</td></tr></table>

<%@include file='/jsp/Logo_Small.jsp' %>