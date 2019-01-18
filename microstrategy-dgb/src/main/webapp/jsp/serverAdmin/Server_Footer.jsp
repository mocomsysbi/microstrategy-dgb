<%
 /****
  * Copyright_Footer.jsp
  * This file displays MicroStrategy's Tagline.
  * It's used as the footer for the Projects and Login pages.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<div class="mstrFooter">
<span><web:descriptor key="mstrWeb.5167" desc="copyright"/></span>

<web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenAbout" target="_new" linkAttributes="onclick='window.setTimeout(function(){iframe && iframe.hideWaitPage(true);}, 500);'">
<web:descriptor key="mstrWeb.11280" desc="About Microstrategy Intelligent EnterpriseTM Platform"/>
</web:urlEvent>

<%--
 Generate a link to the main web servlet
--%>
<web:ifShowAdminPage><web:then>
<A HREF="<web:value name="webServletDeploymentName" type="config" />" Class="mstrLink"><web:descriptor key="mstrWeb.5183" desc="Go to MicroStrategy Web Home"/></A>
<A HREF="<web:value name="adminServletDeploymentName" type="config" />" Class="mstrLink"><web:descriptor key="mstrWeb.5181" desc="Go to the Web Administrator"/></A>
</web:then><web:else>
<A HREF="<web:value name="webServletDeploymentName" type="config" />" Class="mstrLink"><web:descriptor key="mstrWeb.5183" desc="Go to MicroStrategy Web Home"/></A>
</web:else></web:ifShowAdminPage>

<web:resource type="helpAdmin" name="IServer_Admin.htm"/>
</div>