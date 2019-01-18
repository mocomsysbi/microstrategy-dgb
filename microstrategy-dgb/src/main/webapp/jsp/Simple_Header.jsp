<%
    /*
     * Simple_Header.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
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

<%@include file='/jsp/Logo_Small.jsp' %>