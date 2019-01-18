<%
    /*
     * Preferences_Path.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     * @deprecated we are not using this JSP anymore as Preferences use Generic_Path.jsp and the pages for PDF, Print and Export use Preferences_PrintPDFExport_Path.jsp
     */
%>

<%@ page errorPage="Error_Path.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<%--
	Render the path section unless we are in the 'printHeaderFooter'
	preferences section.
--%>
<web:ifBeanValue bean="preferences" property="getCurrentGroup" value="printHeaderFooter">
    <web:else>
		<web:displayBean bean="pathBean" styleName="PathStyle"/>
    </web:else>
</web:ifBeanValue>