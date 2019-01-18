<%
 /*
  * Subscriptions_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<web:ifFeature name="dhtml"><web:then>
        <web:clientSideDescriptor IDs="191,192,1087,1088,1995,3296,6073,15474,15497" />
</web:then></web:ifFeature>
<%-- Render the subscriptions page --%>
<web:displayGuiComponent name="allSubscriptions"/>
