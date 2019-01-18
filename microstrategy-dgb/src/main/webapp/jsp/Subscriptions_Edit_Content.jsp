<%
 /*
  * Subscriptions_Edit_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<web:resource type="javascript" name="NCScripts.js"/>
<web:displayBean bean="subFrame" styleName="SubscriptionFrameStyle" />

<%--
  Have the 'attFormsQual' and the 'metricQualLevel' editors available
  in case the page needs them.
--%>
<web:displayGuiComponent name="attFormsQual"/>
<web:displayGuiComponent name="metricQualLevel"/>
<web:displayGuiComponent name="elementPicker"/>
<web:displayGuiComponent name="contactsBrowser"/>

<web:ifFeature name="dhtml"><web:then>
<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.EDIT_SUBSCRIPTION_SCOPE" bean="ncSub" />
<jsp:include page='/jsp/CommonDescriptors.jsp' flush="true"/>
<web:clientSideDescriptor IDs = "3878,2946,2947,2948,5865" />
</web:then></web:ifFeature>
