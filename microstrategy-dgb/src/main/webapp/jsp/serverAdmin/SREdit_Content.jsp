<%
 /*
  * SREdit_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<web:clientSideDescriptor IDs = "512,3878,2946,2947,2948,5674" />
<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.ADMIN_SCOPE" bean="srMgr" />
<web:displayBean bean="srMgr" />
