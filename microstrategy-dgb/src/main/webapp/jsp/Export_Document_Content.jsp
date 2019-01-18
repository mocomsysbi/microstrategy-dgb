<%/*
* Export_Document_Content.jsp
* Copyright 2002 MicroStrategy Incorporated. All rights reserved.
*/
%><%@ page errorPage="Error_Content.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><web:exportSetContentType documentBean="db"
/><web:displayBean bean="db" />
