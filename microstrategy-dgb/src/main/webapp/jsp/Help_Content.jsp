<%
 /*
  * Help_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="Error_Content.jsp" %>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Load the corresponding help file based on the locale and the specified feature.--%>
<table class="main">
    <tr>
        <td valign="top"><web:resource type="helpfile"/></td>
    </tr>
</table>
