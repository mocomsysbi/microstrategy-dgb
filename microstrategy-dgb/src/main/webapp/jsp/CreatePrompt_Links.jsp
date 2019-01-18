 <%
 /****
  * CreatePrompt_Links.jsp
  * This page includes the link definitions that should be added for the
  * page of Prompt Definition Editor
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="Error_Links.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"%><%
  PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");
%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />
<web:resource type="style" name="mstr/pageCreate.css"/>
