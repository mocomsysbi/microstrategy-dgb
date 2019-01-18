<%
    /*
     * Report_Iframe_Links.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Links.jsp"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>

<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("iframe_links")%>' flush="true" />

<web:ifFeature name="dhtml">
    <web:then>
        <web:resource type="javascript" name="Drill.js"/>
        <web:resource type="javascript" name="IncrementalFetchCheckBoxes.js"/>
        <web:resource type="javascript" name="tableUtils.js"/>
        <web:resource type="javascript" name="lockSet.js"/>
    </web:then>
</web:ifFeature>