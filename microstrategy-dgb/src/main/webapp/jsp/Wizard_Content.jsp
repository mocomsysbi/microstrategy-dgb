<%
 /*
  * Wizard_Content.jsp
  * Copyright 2003 MicroStrategy Incorporated. All rights reserved.
  * This page just displays all the children of the page using
  * their generateOutput() method.
  */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<br/><br/><br/><div align="center">
<%--
This will act as HTML container for a Wizard. It'll provide of space
Wizard step pages will be displayed.
It divides rendering process into the following sections:
	Error message (renderGenericError). In this area, any error will be displayed if it's derived from a validation task.
	Navigation Index (renderNavigationIndex). Optional area for displaying an index for allowing step navigation.
	Wizard content (renderContent). Space designated for rendering each of the HTML specific to each Wizard step.
	Execution bar
--%>
<web:displayGuiComponent name="report_wizard"/>
</div>
