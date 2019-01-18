<%
    /*
     * PDF_Options_Path.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<div class="mstrPathContainer">
<div class="mstrPathText">
	<span class="mstrPathLast">
	    <web:beanValue property="title"/>
	</span>
</div>
<%@include file='/jsp/Logo.jsp' %>
</div>
