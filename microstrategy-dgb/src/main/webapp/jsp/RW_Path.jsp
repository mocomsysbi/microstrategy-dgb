<%
/*
 * RW_Path.jsp
 * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
 */
%><%@ page errorPage="Error_Path.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<%-- Render the path links and info about the location of the object being transformed.--%>
<web:displayBean bean="rwframe.rwb" styleName="ObjectPathStyle"/>