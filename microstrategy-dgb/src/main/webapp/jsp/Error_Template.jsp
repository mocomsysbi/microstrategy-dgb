<%
 /****
  * Error_Template.jsp
  * This is the template use to layout the content of a generic error page.
  * In general this page is reached when there is an unexpected exception
  * (i.e. an Exception caught by the servlet).
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%>
<%@include file='/jsp/Error_FullContent.jsp' %>
