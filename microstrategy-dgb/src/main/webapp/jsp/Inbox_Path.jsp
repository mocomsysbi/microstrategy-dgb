<%
 /****
  * Inbox_Path.jsp
  * This file servers as the path for the History List page.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%>

<%@ page errorPage="Error_Toolbar.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Display the path section --%>
<div class="mstrPathContainer">
<web:displayBean bean="pathBean" styleName="PathStyle"/>
<%@include file='/jsp/Logo.jsp' %>
</div>