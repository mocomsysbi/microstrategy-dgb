<%
    /*
     * FastExport_Path.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%><%@ page errorPage="FastExport_Path.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<%-- Render the report path --%>
<web:displayBean beanName="rb" styleName="ReportStyleGeneralPath"/>
