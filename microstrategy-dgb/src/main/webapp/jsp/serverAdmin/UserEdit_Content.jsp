<%
 /*
  * UserEdit_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<web:clientSideDescriptor IDs = "512,2316,2324,2946,2947,2948,3037,3039,3041,3574,3878,4421,4426,5583,5674,5856,5859,6098,6117,6173" />
<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.ADMIN_SCOPE" bean="entMgr" />
<web:displayBean bean="entMgr" />
