
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

    <web:ifFeature type="systemPreference" name="showOfficeLink"><web:then>
	<web:ifFeature type="misc" name="officeSetup"><web:then>
	<span class="mstrShortcut"><a href="<web:value type="misc" name="officeSetup"/>" target="_blank"><web:descriptor key="mstrWeb.3847" desc="Install MicroStrategy Office" /></a></span>
	</web:then></web:ifFeature>
	</web:then></web:ifFeature>
	<span class="mstrShortcut"><web:resource type="helpAdmin"/></span>
	<%--
	    Render the logout link if the user has already a session or the 'Login first'
	    preference has been set and the use session is not shared with portlet.
	--%>
	<web:ifFeature name="is-portlet"><web:then></web:then><web:else>
	<web:ifConnectionValue><web:then>
	<span class="mstrShortcut"><web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventLogout"><web:descriptor key="mstrWeb.8" desc="Logout" /></web:urlEvent></span>
	</web:then><web:else><web:ifConnectionValue property="loginFirst"><web:then>
	<span class="mstrShortcut"><web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventLogout"><web:descriptor key="mstrWeb.8" desc="Logout" /></web:urlEvent></span>
	</web:then></web:ifConnectionValue></web:else></web:ifConnectionValue>
	</web:else></web:ifFeature>
    
</div>