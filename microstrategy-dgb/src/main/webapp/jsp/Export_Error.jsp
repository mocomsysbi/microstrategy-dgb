<%
 /****
  * Export_Error.jsp
  * This page is used as the content of the error section when exporting.
  * If any, it renders a predefined error message to the user.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<web:ifErrorValue><web:then>
<div class="mstrAlert">
<div class="mstrAlertTitle"><web:descriptor key="mstrWeb.416" desc="Unable to export"/> </div>
<div class="mstrAlertMessage">
<web:descriptor key="mstrWeb.417" desc="You cannot export this report because it has exceeded the limits that the Administrator has set for the maximum number of columns and rows to export."/><br />
<web:descriptor key="mstrWeb.418" desc="Please perform some manipulations on the report or contact the Administrator."/>
</div>
<%-- Display the contact info if available. --%>
<web:ifErrorValue property="contactInfo"><web:then>
<div class="mstrContactInfo">
<web:descriptor key="mstrWeb.99" desc="Contact Info:" />
<web:errorValue property="contactInfo"/>
</div>
</web:then></web:ifErrorValue>
</div>
<%-- Display the stack trace as HTML comments so developers can see the source code
	and figure out the root of the error.
--%>
<web:ifFeature type="systemPreference" name="renderExceptionInfo"><web:then>
<!--stackTrace -->
<div class="mstrStackTraceError">
    <web:errorValue property="stackTrace"/>
</div>

</web:then></web:ifFeature>
<web:ifFeature type="systemPreference" name="renderRequestInfo"><web:then>
<%-- Display the querystring to gather more info about the state of the page. --%>

<!-- request -->
<div class="mstrRequestError">
    <web:requestString/>
</div>
</web:then></web:ifFeature>
</web:then></web:ifErrorValue>
