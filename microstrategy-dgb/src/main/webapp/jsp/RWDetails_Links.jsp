<%
    /*
     * RWDetails_Links.jsp
     * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Links.jsp"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>
<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<jsp:include page='/jsp/Global_Links.jsp' flush="true" />

<web:ifFeature name="dhtml"><web:then>
<web:resource type="javascript" name="bone.js"/>
<web:resource type="javascript" name="dialog.js"/>
<web:resource type="javascript" name="HTMLAttributes.js"/>
<web:resource type="javascript" name="editor.js"/>
</web:then></web:ifFeature>

<web:resource type="style" name="mstr/pageReportDetails.css"/>
