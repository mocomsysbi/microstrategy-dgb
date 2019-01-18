<%
    /*
     * Error_Footer.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */

    /*
     * This page is used as the error page for Header jsp files.
     */
%>

<%@ page isErrorPage="true" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<%-- Display the error that ocurred during the execution of a page. --%>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" >
    <TR>
        <TD WIDTH="15" ><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="15" HEIGHT="1" ALT="" BORDER="0" /></TD>
        <TD WIDTH="100%" ALIGN="LEFT"><DIV CLASS='menu'>&nbsp;<web:descriptor key="mstrWeb.1167" desc="An error has occurred on this page." />(<web:errorValue property="message"/>)</DIV></TD>
        <TD WIDTH="15" ><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="15" HEIGHT="1" ALT="" BORDER="0" /></TD>
    </TR>
</TABLE>
