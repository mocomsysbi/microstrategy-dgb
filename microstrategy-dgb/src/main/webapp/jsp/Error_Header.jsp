<%
    /*
     * Error_Header.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */

    /*
     * This page is used as the error page for Header jsp files.
     */
%><%@ page isErrorPage="true"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><table border="0" width="100%" bgcolor="#990000" cellspacing="0" cellpadding="0" <web:resource attribute="BACKGROUND" name="photoHeader5.gif"/>>
    <tr><%--Display a link to the projects page and the Online Help page.--%>
        <td width="1%" valign="middle" nowrap="1">
            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHome" ><span class="mstrIcon-tb" id="tbHome" <web:descriptor attribute="title" key="mstrWeb.1" desc="Home" />></span></web:urlEvent>
            <a href="<web:value type="helpUser" name=""/>" target="_new"><img <web:resource attribute="SRC" name="IconHelp.gif"/> width="22" height="21" <web:descriptor attribute="ALT" key="mstrWeb.1143" desc="Help" /> border="0" align="absmiddle" /></a>
        </td>
        <td width="98%" valign="middle" nowrap="1">
			<%-- Display the error description. --%>
            <div class='menu'>&nbsp;<web:descriptor key="mstrWeb.1167" desc="An error has occurred on this page." />(<web:errorValue property="message"/>)</div>
        </td>
    </tr>
    <tr>
        <td colspan="2" bgcolor="#996666" ><img <web:resource attribute="SRC" name="1ptrans.gif"/> width="1" height="1" alt="" border="0" /></td>
    </tr>
</table>