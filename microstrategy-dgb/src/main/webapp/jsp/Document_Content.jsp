<%
 /****
  * Document_Content.jsp
  * This page displays the guiComponents required in the document page.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<%--
 Display the document area or a prompt editor if the document
 has embedded prompts
--%>
<web:displayGuiComponent name="document_area" isContainer="true"/>

<web:ifFeature name="dhtml"><web:then>
 <jsp:include page='/jsp/CommonDescriptors.jsp' flush="true"/>
 <web:clientSideDescriptor IDs = "3274,3275,2790,4388,4389,5097,5583,5865,6036" />
 <web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.DOCUMENT_SCOPE" bean="frame.db" />
 <web:ifBeanValue bean="db" property="getXMLStatus" value="6">
 	<web:then>
	  <web:displayGuiComponent name="attFormsQual"/>
	  <web:displayGuiComponent name="metricQualLevel"/>
	  <web:displayGuiComponent name="elementPicker"/>
	 </web:then>
	 <web:else>
	   <web:displayGuiComponent name="contactsBrowser"/>
	   <web:displayGuiComponent name="historyListSubscriptionEditor" />
	   <web:displayGuiComponent name="emailSubscriptionEditor" />
	   <web:displayGuiComponent name="fileSubscriptionEditor" />
	   <web:displayGuiComponent name="printSubscriptionEditor" />
	   <web:displayGuiComponent name="cacheSubscriptionEditor" />
	   <web:displayGuiComponent name="sendNowSubscriptionEditor" />
	 </web:else>
 </web:ifBeanValue>
</web:then></web:ifFeature>
