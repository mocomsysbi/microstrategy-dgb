<%
 /****
  * Empty_Path.jsp
  * This file includes the content of the Path section for pages showing only empty pathbar.
  * This consists of logo only.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<table cellpadding="0" cellspacing="0" border="0">
    <tr><td>
		<div class="mstrPathContainer">
		<%@include file='/jsp/serverAdmin/Server_Logo.jsp' %>
		</div>
	</td>
    <td nowrap="1"><jsp:include page='<%=mstrPage.getTemplateInfo().getSection("path_options")%>' flush="true" /></td>
    </tr>
</table>