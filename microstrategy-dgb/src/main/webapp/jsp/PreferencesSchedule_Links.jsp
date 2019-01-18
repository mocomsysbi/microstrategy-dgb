<%
    /*
     * PreferencesSchedule_Links.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%><%@ page errorPage="Error_Links.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");
%><jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<web:resource type="style" name="mstr/pagePreferences.css"/>
<web:resource type="javascript" name="DHTML.js"/>

<web:scriptlet>
self.UNIT_SEPARATOR = '<web:value type="enum" name="com.microstrategy.web.app.utils.ExpressionHelper.UNIT_SEPARATOR"/>';
</web:scriptlet>


    <!-- Base Mojo CSS file -->
    <web:resource type="js-style" name="mojo/css/core.css"/>
    <!-- Mojo Custom Group Editor CSS file -->
    <web:resource type="js-style" name="mojo/css/cge.css"/>
    <!-- Mojo Widgets CSS common in non-mojo-based pages -->
    <web:resource type="js-style" name="mojo/css/page-common.css"/>
