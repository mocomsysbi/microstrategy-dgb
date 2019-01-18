<%
 /****
  * Document_Error.jsp
  * This page is used as the content of the error section for Documents.
  * First it checks whether the page is prompted, if so it just shows a flag
  * indicating the user to look forward for the prompt errors.
  * Otherwise, it only displays the error message in case the RWBean is not displaying the error itself.
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

<%-- If prompted, just show a message with a flag: --%>
<web:ifBeanValue bean="db" property="getXMLStatus" value="6"><web:then>
<div class="promptMessage"><web:errorValue property="message" default="mstrWeb.980"/></div><%--Descriptor: "Follow the instructions marked below by a red flag." --%>
</web:then><web:else>

<%-- If not prompted, only show the alert box if the RWBean is not going to render the error message itself: --%>
<web:ifBeanValue bean="db" property="getXMLStatus" value="4"><web:else>
<div class="mstrAlertTitle"><web:errorValue property="title"/></div>
<div class="mstrAlertMessage"><web:errorValue property="message"/></div>

<%--Contact info, if available: --%>
<web:ifErrorValue property="contactInfo"><web:then>
<div class="mstrContactInfo">
<web:descriptor key="mstrWeb.99" desc="Contact Info:" />
<web:errorValue property="contactInfo"/>
</div>
</web:then></web:ifErrorValue>

</web:else></web:ifBeanValue></web:else></web:ifBeanValue>

</div>
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
