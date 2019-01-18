<%
 /****
  * Generic_Content.jsp
  * This page just displays all the children of the page using
  * their generateOutput() method.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%-- Render all the beans associated to the current page as specified in pageConfig.xml--%>
<web:displayBean/>
