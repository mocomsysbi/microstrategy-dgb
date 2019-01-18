<%
/*
 * RW_Fast_Export_Error.jsp
 * Copyright 2016 MicroStrategy Incorporated. All rights reserved.
 */
%><%@ page errorPage="Error_Path.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<%--DE47839 Need to render rwb bean to call RWSavePropertiesTransform and set meaningful error message.
Render the path links and info about the location of the object being transformed.--%>
<web:displayBean bean="rwframe.rwb" styleName="RWFastExportStyle"/>