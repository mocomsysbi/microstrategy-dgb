<%
 /****
  * Login_ShortcutsBar.jsp
  * This file includes the content of the shorcuts bar section for the login page.
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
<div class="mstrHeaderContainer">
<%-- Render the toolbar section if the user has a session. --%>
<web:ifFeature type="systemPreference" name="showOfficeLink"><web:then>
<web:ifFeature type="misc" name="officeSetup"><web:then>
<span class="mstrShortcut"><a href="<web:value type="misc" name="officeSetup"/>" target="_blank"><web:descriptor key="mstrWeb.3847" desc="Install MicroStrategy Office" /></a></span>
</web:then></web:ifFeature>
</web:then></web:ifFeature>
</div>

<%@include file='/jsp/Logo_Small.jsp' %>