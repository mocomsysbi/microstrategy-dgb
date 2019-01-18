<%
 /*
  * UserManager_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<web:ifFeature name="userManagerViewModeType" type="preference" value="1"><web:then>
<web:displayBean bean="ugb" styleName="UserGroupIcon" />
</web:then><web:else>
<web:displayBean bean="ugb" styleName="UserGroupList" />
</web:else></web:ifFeature>

