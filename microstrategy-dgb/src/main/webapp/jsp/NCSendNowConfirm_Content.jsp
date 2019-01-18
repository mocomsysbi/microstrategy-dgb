<%
  /*
   * NCSendNowConfirm_Content.jsp
   * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
   */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Renders the confirmation message on a successful Send Now email subscription. --%>
<web:displayBean bean="ncSub" styleName="SendNowConfirmStyle" />
