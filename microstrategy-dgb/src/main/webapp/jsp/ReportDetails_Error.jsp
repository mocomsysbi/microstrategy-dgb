<%
 /****
  * ReportDetails_Error.jsp
  * This page is used as the content of the error section for the report details page.
  * If the bean is in error, the transform will render the error.  Otherwise, the 
  * generic jsp error page will be called.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<web:ifBeanValue bean="rb" property="getXMLStatus" value="4">
<web:else>
	<jsp:include page='Generic_Error.jsp' flush="false" />
</web:else>
</web:ifBeanValue>