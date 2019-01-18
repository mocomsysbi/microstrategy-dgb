<%
 /*
  * TopLevelGroups_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<web:ifFeature name="userManagerViewModeType" type="preference" value="1"><web:then>
<web:displayBean bean="gpb" styleName="UserEntitiesIcon" />
</web:then><web:else>
<web:displayBean bean="gpb" styleName="UserEntitiesList" />
</web:else></web:ifFeature>
