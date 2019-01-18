
<%
	/****
	 * Generic_Path.jsp
	 * This file includes the content of the Path section.
	 * This consist on a go Home link, the Back and Forward buttons, the Folder Up button
	 * and the name of the current project the user is logged in to.
	 *
	 * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
	 * version: 1.2
	 * xhtml: true
	 ****/
%>
<%@ page errorPage="JSP_Error.jsp"%><%@ page
	contentType="text/html; charset=UTF-8"%><%@ taglib uri="/webUtilTL.tld"
	prefix="web"%>


<%-- Display the Help secion as defined in the shortcut-list defined in adminPageConfig.xml (toolbar)
     The shortcutOptions tag will go through all the shortcut elements and render them. --%>
     
<div class="mstrAdminPathShortcuts">

    <web:ifConnectionValue><web:then>
    <web:ifBeanValue property="getName" value="search"><web:then></web:then>
    <web:else>
	    <%-- Add the old search for the server admins page --%>
		<web:ifFeature name="edit-security-role-properties;create-security-roles">
		    <web:then><web:quickSearch objectTypes="8704,8705,44"/></web:then>
		    <web:else><web:quickSearch objectTypes="8704,8705"/> </web:else>
		</web:ifFeature>
	</web:else>
	</web:ifBeanValue>
	</web:then></web:ifConnectionValue>

    <web:shortcutOptions type="toolbar" shortcutClass="mstrShortcut" shortcutSelectedClass="mstrShortcutSelected">
    <web:shortcutElement />
    </web:shortcutOptions>
    <%--
     Display a hyperlink to "Admin Online Help".
    --%>
    <span class="mstrShortcut"><web:resource type="helpAdmin"/></span>
    
    <web:ifConnectionValue><web:then>
    <%-- Render the logout button if the user session is not shared with portlet. --%>
	<web:ifFeature name="is-portlet"><web:then></web:then><web:else>
	<span class="mstrShortcut"><web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventLogout"><web:descriptor key="mstrWeb.8" desc="Logout" /></web:urlEvent></span>
	</web:else></web:ifFeature>
	</web:then></web:ifConnectionValue>
	
</div>


	<web:scriptlet>
	    var mstrApp = window.mstrApp || {};
		mstrApp.isAdminPage = true;
	</web:scriptlet>