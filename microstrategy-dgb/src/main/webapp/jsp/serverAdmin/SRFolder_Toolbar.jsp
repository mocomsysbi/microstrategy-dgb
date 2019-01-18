<%
/*
 * Folder_Toolbar.jsp
 * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
 */
%>

<%@ page errorPage="Error_Toolbar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Render the 'Filter + Template' section if the 'nre-report' feature is available. --%>
<div class="mstrDockTopContainer">
<web:displayGuiComponent name="secRole_toolbar" />
</div>