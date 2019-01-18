<%
 /****
  * Admin_Error.jsp
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
 If there is an error, display the title and the error message.
--%>
<web:ifErrorValue><web:then>
<div class="mstrAlert">
<div class="mstrAlertTitle"><web:errorValue property="title"/></div>
<div class="mstrAlertMessage"><web:errorValue property="message"/></div>
</div>
<%--
 Show the stack trace for the erro in HTML comments.
--%>
<web:ifFeature type="systemPreference" name="renderExceptionInfo"><web:then>
<!--stackTrace -->
<div class="mstrStackTraceError">
    <web:errorValue property="stackTrace"/>
</div>
</web:then></web:ifFeature>
<web:ifFeature type="systemPreference" name="renderRequestInfo"><web:then>
<!-- request -->
<div class="mstrRequestError">
    <web:requestString/>
</div>
</web:then></web:ifFeature>
</web:then></web:ifErrorValue>
