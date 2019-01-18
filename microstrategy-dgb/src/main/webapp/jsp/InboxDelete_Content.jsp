<%
/*
 * InboxDelete_Content.jsp
 * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
 */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%--
  Render the inbox bean using the specified style or transform (InboxClearTransform).
  See styleCatalog.xml for more information about the style that is being used.
--%>
<web:displayBean bean="inbox" />
