<%
 /****
  * Current_Item_Path.jsp
  * This file includes the content of the Error Page section.
  * This consist on a go Home link, the Back and Forward buttons, the Folder Up button
  * and the "Error page" text.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Display the path section --%>
<div class="mstrPathContainer">
<web:ifFeature name="!mobile-server">
	<web:then>
		<web:displayBean bean="pathBean" styleName="CurrentItemStyle"/>
	</web:then>
	<web:else>   
		<div class="mstrPathText">
			<span class="mstrPathLast"><web:descriptor key="mstrWeb.1142" desc="About"/></span>
		</div>
	</web:else>
</web:ifFeature>
<%@include file='/jsp/Logo.jsp' %>
</div>