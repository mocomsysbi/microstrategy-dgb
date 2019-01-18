<%
 /****
  * Global_Links.jsp
  * This page includes the link definitions that should be added to all server administration pages to look properly
  *
  * Copyright 2005 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="Error_Links.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%>
<jsp:include page='/jsp/Global_Links.jsp' flush="true" />
