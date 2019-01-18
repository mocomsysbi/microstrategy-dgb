<%
  /****
  * Subscriptions_Filtered_Links.jsp
  * This page includes the link definitions that should be added for the
  * summary page to look properly
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%>

<%@ page errorPage="Error_Links.jsp"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>

<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<web:resource type="style" name="mstr/pageSubscriptions.css"/>
<web:ifFeature name="dhtml"><web:then>
<web:resource type="javascript" name="serializer.js"/>
<web:resource type="javascript" name="updateManager.js"/>
<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.DELIVERY_SERVICE_SCOPE" bean="objectSubscriptions" />
</web:then></web:ifFeature>
