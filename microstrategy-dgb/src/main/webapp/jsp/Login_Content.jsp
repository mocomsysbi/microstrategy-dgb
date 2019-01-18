<%
 /*
  * Login_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%-- Render the login bean --%>
<web:displayBean bean="login" />
