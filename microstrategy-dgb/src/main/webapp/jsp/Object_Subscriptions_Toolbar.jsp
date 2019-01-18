<%
 /*
  * Object_Subscriptions_Toolbar.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Toolbar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Render the Help Section as part of this toolbar. --%>
<web:panel language="0" name="lTbar" position="horizontal" halign="right" useImage="false">
    <web:panelContent>
        <TABLE WIDTH="158" BORDER="0" CELLSPACING="0" CELLPADDING="0">
            <TR>
                <TD><%@include file='/jsp/Help_Section.jsp' %></TD>
            </TR>
            <TR>
                <TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="158" HEIGHT="1" ALT="" BORDER="0" /></TD>
            </TR>
        </TABLE>
    </web:panelContent>
</web:panel>