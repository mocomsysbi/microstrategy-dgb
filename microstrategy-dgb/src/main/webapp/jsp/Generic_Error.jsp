<%
 /****
  * Generic_Error.jsp
  * This page is used as the default content of the error section.
  * If any, it renders the error message to the user.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Display the error message --%>
<web:ifErrorValue><web:then>
<div class="mstrAlert" <web:ifFeature name="accessibility"><web:then>tabindex="0"</web:then></web:ifFeature> >
<div class="mstrAlertTitle"><web:errorValue property="title"/></div>
<div class="mstrAlertMessage"><web:errorValue property="message"/></div>

<%--Contact info, if available: --%>
<web:ifErrorValue property="contactInfo"><web:then>
<div class="mstrContactInfo">
<web:descriptor key="mstrWeb.99" desc="Contact Info:" />
<web:errorValue property="contactInfo"/>
</div>
</web:then></web:ifErrorValue>

</div>
<%-- Render the stack trace so developers can find the root of the error. --%>
<web:ifFeature type="systemPreference" name="renderExceptionInfo"><web:then>
<!--stackTrace -->
<div class="mstrStackTraceError">
    <web:errorValue property="stackTrace"/>
</div>

<%--
	Include the state of the request to gather more information about what
    happened during the execution of the page.
--%>
</web:then></web:ifFeature>
<web:ifFeature type="systemPreference" name="renderRequestInfo"><web:then>
<!-- request -->
<div class="mstrRequestError">
    <web:requestString/>
</div>
</web:then></web:ifFeature>
</web:then></web:ifErrorValue>