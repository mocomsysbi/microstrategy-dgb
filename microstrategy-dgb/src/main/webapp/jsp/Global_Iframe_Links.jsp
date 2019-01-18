<%
    /*
     * Global_Iframe_Links.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Links.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%--
 Check if the user has the DHTML preference turned on to determine whether
  the page should load some JavaScripr functions.

 <web:ifFeature name="dhtml">
     [JavaScript code]
 </web:ifFeature>
--%>
<web:ifFeature name="dhtml">
<web:then>
  <web:resource type="javascript" name="DHTML.js"/>
  <web:resource type="javascript" name="IFRAME.js"/>
</web:then>
</web:ifFeature>
