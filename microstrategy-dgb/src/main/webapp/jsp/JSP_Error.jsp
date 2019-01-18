<%
 /****
  * JSP_Error.jsp
  * This page is used as the error-page of JSP files.
  * If a runtime exception happens inside the JSP code, this is the page
  *  that will be displayed.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page isErrorPage="true"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<div class="mstrAlert">
<div class="mstrAlertTitle"><web:descriptor key="mstrWeb.1167" desc="An error has occurred on this page." /></div>
<div class="mstrAlertMessage"><web:errorValue property="message"/></div>
</div>
<%--
  Render the stack trace in HTML comments so developers can track the
  source of the error.
--%>
<web:ifFeature type="systemPreference" name="renderExceptionInfo"><web:then>
<!--
<web:errorValue property="stackTrace"/>
-->
</web:then></web:ifFeature>