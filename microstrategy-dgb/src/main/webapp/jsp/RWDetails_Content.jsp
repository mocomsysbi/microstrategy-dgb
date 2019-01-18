<%
  /*
   * RWDetails_Content.jsp
   * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
   */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<%--
  Show details of a report writing document. It has details like name, path and
  some other things. It also has details about all the children data set objects in it.
--%>
<web:displayBean bean="rwb" />

