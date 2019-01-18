<%
  /****
  * Summary_Links.jsp
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

<web:ifFeature name="dhtml"><web:then>
<web:resource type="js-style" name="mojo/css/core.css"/>
<web:resource type="js-style" name="mojo/css/page-common.css"/>
<web:resource type="js-style" name="mojo/css/cge.css"/>
</web:then></web:ifFeature>

<web:resource type="style" name="mstr/pageDesktop.css"/>
<web:resource type="style" name="mstr/pageSummary.css"/>

<%--
 Check if the user has the DHTML preference turned on to determine whether
  the page should load some JavaScripr functions.

 <web:ifFeature name="dhtml">
     [JavaScript code]
 </web:ifFeature>
--%>
<web:ifFeature name="dhtml"><web:then>
<web:resource type="style" name="mstr/pageCreate.css"/>
<web:resource type="jsbundle" bundleName="bone-summary" />

<web:resource type="javascript" name="updateManagerEventsCreateReport.js"/>
<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.CREATE_REPORT_SCOPE" bean="ObjectExplorer" />
<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.DELIVERY_SERVICE_SCOPE" bean="ncSubscriptions" />
</web:then>
</web:ifFeature>
