<%
 /****
  * About_ShortcutsBar.jsp
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
<%--
 Display a URL pointing to the Online Help.
--%>
<span><web:resource type="helpAdmin"/></span>
<%--
 If the user has a session that not shared with portlet, display the logout button.
--%>
<web:ifConnectionValue><web:then>
<web:ifFeature name="is-portlet"><web:then></web:then><web:else>
<span><web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventLogout"><web:descriptor key="mstrWeb.8" desc="Logout" /></web:urlEvent></span>
</web:else></web:ifFeature>
</web:then></web:ifConnectionValue>

