<%
 /****
  * Admin_Links.jsp
  * This page includes the link definitions that should be added to the admin pages to look properly
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="Error_Links.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%>
<jsp:include page='/jsp/Global_Links.jsp' flush="true" />

<script type='text/javascript'>
	mstrApp.isAdminPage = true;
</script>

<web:resource type="javascript" name="mstrWebAdmin.js"/>
<web:resource type="style" name="mstr/pageAdmin.css"/>