<%
 /*
  * PreferenceSchedule_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%><%@ page errorPage="Error_Content.jsp"
%><%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"
%>

<web:clientSideDescriptor IDs="512"/>

<%--
	Render the 'preferences' bean.
	This will render a particular section (i.e. General, Grid, Graph preferences).
--%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
    <tr>
        <td valign="top"><web:displayBean bean="preferences" styleName="ScheduleAdminPreferencesStyle"/></td>
    </tr>
</table>