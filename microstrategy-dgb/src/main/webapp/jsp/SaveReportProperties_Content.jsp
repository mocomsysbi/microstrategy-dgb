<%
 /*
  * SaveReportProperties_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>
<%@ page errorPage="Error_Content.jsp"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<HTML>
<BODY>
<web:resource type="javascript" name="DHTML.js"/>
<web:resource type="javascript" name="print.js"/>
    <%-- Generate the output for a Report to be exported --%>
    <web:displayBean bean="rb" />
</BODY>
</HTML>
