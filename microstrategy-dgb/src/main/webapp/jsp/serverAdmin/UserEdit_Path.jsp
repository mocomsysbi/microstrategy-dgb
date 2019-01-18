<%
 /*
  * UserEdit_Path.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<table cellpadding="0" cellspacing="0" border="0">
    <tr><td>
        <div class="mstrPathContainer">
        <web:displayBean bean="path" styleName="GroupPathStyle" />
        <%@include file='/jsp/serverAdmin/Server_Logo.jsp' %>
        </div>
    </td>
    <td nowrap="1"><jsp:include page='<%=mstrPage.getTemplateInfo().getSection("path_options")%>' flush="true" /></td>
    </tr>
</table>