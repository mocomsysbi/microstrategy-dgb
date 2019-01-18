<%
 /*
  * GroupEdit_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<web:clientSideDescriptor IDs = "512,2946,2947,2948,3037,3039,3041,3574,3878,4421,4426,5674,6098" />
<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.ADMIN_SCOPE" bean="g_entMgr" />
<web:displayBean bean="g_entMgr" />
