<%
 /****
  * SaveAs_Error.jsp
  * This page is used as the content of the error section for the save as page.
  * It's similar to the Generic_Error.jsp, except it overrides the message for certain actions
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<web:ifErrorValue><web:then>
    <web:ifErrorValue property="code" value="-2147468986">
    <web:else>
        <web:ifErrorValue property="code" value="-2147467618">
        <web:else>
            <div class="mstrAlert">
            <div class="mstrAlertTitle"><web:errorValue property="title"/></div>

            <%--Add a message when trying to save a report in an invalid folder: --%>
            <web:ifErrorValue property="code" value="-2147074340">
            <web:then>
                <div class="mstrAlertMessage"><web:descriptor key="mstrWeb.985" desc="This action could not be performed because you do not have write access for this folder or for this report." />
                <web:errorValue property="message"/></div>
            </web:then>
            <web:else>
                <div class="mstrAlertMessage"><web:errorValue property="message"/></div>
            </web:else>
            </web:ifErrorValue>
        </web:else>
        </web:ifErrorValue>
    </web:else>
    </web:ifErrorValue>

<%--Add contact info, if any --%>
<web:ifErrorValue property="contactInfo"><web:then>
<div class="mstrContactInfo">
<web:descriptor key="mstrWeb.99" desc="Contact Info:" />
<web:errorValue property="contactInfo"/>
</div>
</web:then></web:ifErrorValue>

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
