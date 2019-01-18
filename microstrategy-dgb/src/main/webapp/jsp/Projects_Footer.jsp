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
<%--Copyright &#169; 1996-2008 MicroStrategy, Incorporated.--%>
<span class="copyright"><web:descriptor key="mstrWeb.5167" desc="copyright"/></span>

<%--
 The script included in the "JSP" tag will be removed when this
 file gets converted into ASP.Net. Instead, the ASP section will
 be executed.
--%>

<web:ifFeature name="administrator">
    <web:then>
        <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenAbout" target="_new" linkAttributes="onclick='window.setTimeout(function(){iframe && iframe.hideWaitPage(true);}, 500);'">
            <web:descriptor key="mstrWeb.11280" desc="About MicroStrategy Intelligent EnterpriseTM Platform"/>
        </web:urlEvent>
    </web:then><web:else>
        <span id="staticBrandingText">
            <web:descriptor key="mstrWeb.16165" desc="MicroStrategy Intelligent EnterpriseTM Platform"/>
        </span>
    </web:else>
</web:ifFeature>

<%--
 If the user has access to the Admin Page, display a link to that page.
 The link has to be generated as below ONLY and we should not use the web:event tag to generate the link
 as that way the admin servlet security specified in the web.xml will not work. Any other link
 other than the way below will not be secure and the user/pwd dialog will not pop up.
 This is for issue #189136
--%>
<web:ifShowAdminPage><web:then>
<A HREF="<web:value name="adminServletDeploymentName" type="config" />" Class="mstrLink"><web:descriptor key="mstrWeb.5181" desc="Go to the Web Administrator"/></A>
</web:then></web:ifShowAdminPage>
<web:ifFeature name="any-iserver-admin-from-web"><web:then>
<A HREF="<web:value name="serverAdminServletDeploymentName" type="config" />" Class="mstrLink"><web:descriptor key="mstrWeb.5182" desc="Go to the Intelligence Server Administrator"/></A>
</web:then></web:ifFeature>

<web:resource type="helpUser" name="Accessing_a_project.htm"/>

<%-- CSS Analyzer placeholder --%>
</div>