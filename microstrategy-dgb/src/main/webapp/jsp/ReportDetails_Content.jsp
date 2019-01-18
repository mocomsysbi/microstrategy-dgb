<%
/*
 * ReportDetails_Content.jsp
 * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
 */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%--
  Show details of a report. It has details like report name,
  report path, report SQL, report filters and some other things..
--%>
<div class="helpButton">
<a href="<web:value type="helpUser" name="View_report_details.htm"/>" target="_new">
<img class="btnHelp" src="../images/1ptrans.gif" title="Help"/>
</a>
</div>
<web:displayBean bean="rb" />
