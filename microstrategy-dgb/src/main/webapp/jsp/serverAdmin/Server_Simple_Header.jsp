<%
    /*
     * Server_Simple_Header.jsp
     * created based on Simple_Header.jsp, TQMS#344586
     * Copyright 2009 MicroStrategy Incorporated. All rights reserved.
     */
%><%@ page errorPage="Error_Header.jsp" 
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" 
%>
<table cellpadding="0" cellspacing="0" border="0"><tr><td nowrap="nowrap">
<%--
 Display hyperlink to online help.
--%>
<span><web:resource type="helpUser"/></span>
</td></tr></table>

<%@include file='/jsp/serverAdmin/Server_Logo_Small.jsp' %>