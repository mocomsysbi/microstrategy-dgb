<%
 /*
  * Document_FastExport_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  * This page just displays all the children of the page using
  * their generateOutput() method.
  */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<%--
 Loads all the beans in the FastDocumentExport page. If the document has
 prompts, the corresponding editor will be loaded to resolve them.
--%>
<web:displayBean/>
<web:displayGuiComponent name="attFormsQual"/>
<web:displayGuiComponent name="metricQualLevel"/>
<web:displayGuiComponent name="elementPicker"/>
