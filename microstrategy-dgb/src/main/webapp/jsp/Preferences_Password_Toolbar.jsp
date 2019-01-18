<%
 /*
  * Preferences_Password_Toolbar.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Toolbar.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0">
    <TR>
        <TD>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2">
                <TR>
                    <TD VALIGN="TOP"><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="13" HEIGHT="1" ALT="" BORDER="0" /></TD>
                    <TD VALIGN="MIDDLE"><web:displayBean bean="preferences" ignoreCurrent="true"  renderGroupList="true"/></TD>
                </TR>
            </TABLE>
        </TD>
    </TR>
    <TR>
        <TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="1" HEIGHT="3" ALT="" BORDER="0" /></TD>
    </TR>
    <TR>
        <TD>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2">
                <TR>
                    <TD VALIGN="TOP"><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="13" HEIGHT="1" ALT="" BORDER="0" /></TD>
                    <TD><span class="mstrStandardHighlighted"><web:descriptor key="mstrWeb.497" desc="Change Password" /></span></TD>
                </TR>
            </TABLE>
        </TD>
    </TR>
</TABLE>
