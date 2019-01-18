<%
 /****
  * Admin_Servers_Error.jsp
  * This page is used as the content of the error section for Admin pages.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%--
 Include the normal error page
--%>
<jsp:include page='/jsp/Admin_Error.jsp' flush="true" />
<%--
 Include licensing info:
--%>
<web:licensingInfo contentType="admin" administrator="true" />
