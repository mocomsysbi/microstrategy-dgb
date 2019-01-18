<%
 /****
  * Admin_Copyright_Footer.jsp
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
<%--Copyright &#169; 1996-2008 MicroStrategy, Incorporated.--%>
<span class="copyright"><web:descriptor key="mstrWeb.5167" desc="copyright"/></span>


<web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenAbout" target="_new" linkAttributes="onclick='window.setTimeout(function(){iframe && iframe.hideWaitPage(true);}, 500);'">
<web:descriptor key="mstrWeb.11280" desc="About Microstrategy"/>
</web:urlEvent>


<web:ifFeature name="!mobile-server"><web:then>  
	<web:ifFeature name="any-iserver-admin-from-web"><web:then>
	<A HREF="<web:value name="serverAdminServletDeploymentName" type="config" />" Class="mstrLink"><web:descriptor key="mstrWeb.5182" desc="Go to the Intelligence Server Administrator"/></A>
	</web:then></web:ifFeature>
	
	<A HREF="<web:value name="webServletDeploymentName" type="config" />" Class="mstrLink"><web:descriptor key="mstrWeb.5183" desc="Go to MicroStrategy Web Home"/></A>
</web:then></web:ifFeature>

<web:resource type="helpAdmin"/>

</div>