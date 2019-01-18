<%
 /*
  * SaveAs_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

 <web:clientSideDescriptor IDs = "3380,2947"/>

<web:displayBean bean="saveasbean" />
