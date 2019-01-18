<%
    /*
     * SaveAs_Links.jsp
     * Copyright 2002 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Links.jsp"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>

<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<web:resource type="style" name="mstr/pageSaveAs.css"/>

<%-- Load JavaScript functions if necessary. --%>
<web:ifFeature name="dhtml">
    <web:then>
        <web:resource type="javascript" name="selections.js"/>
    </web:then>
</web:ifFeature>
