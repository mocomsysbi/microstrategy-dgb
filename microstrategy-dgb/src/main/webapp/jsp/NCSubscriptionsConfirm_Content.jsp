<%
  /*
   * NCSubscriptionsConfirm_Content.jsp
   * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
   */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Render the confirmation message on a successful Email, File or Print subscription. --%>
<web:displayBean bean="ncSub" styleName="SubscriptionConfirmStyle" />
<web:ifFeature name="dhtml"><web:then>
<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.EDIT_SUBSCRIPTION_SCOPE" bean="ncSub" />
</web:then></web:ifFeature>
