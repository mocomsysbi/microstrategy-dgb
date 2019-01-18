<%
 /*
  * StartStats.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%-- Initialize the logging statistics module. --%>
<HTML>
    <web:logging action="init" />
</HTML>