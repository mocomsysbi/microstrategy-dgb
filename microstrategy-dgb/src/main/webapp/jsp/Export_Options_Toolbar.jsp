<%
/*
 * Export_Options_Toolbar.jsp
 * Copyright 2002 MicroStrategy Incorporated. All rights reserved.
 */
%>

<%@ page errorPage="Error_Toolbar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Display instructions for the Export functionality. --%>
<TABLE WIDTH="158" BORDER="0" CELLSPACING="0" CELLPADDING="0">
    <TR><TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="1" HEIGHT="3" ALT="" BORDER="0" /></TD></TR>
    <TR>
        <TD>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2">
                <TR>
                    <TD VALIGN="TOP"><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="13" HEIGHT="1" ALT="" BORDER="0" /></TD>
                    <TD COLSPAN="2" VALIGN="MIDDLE"><span class="mstrHighlighted"><web:descriptor key="mstrWeb.312" desc="INSTRUCTIONS" /></span></TD>
                </TR>
                <TR>
                    <TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="13" HEIGHT="1" ALT="" BORDER="0" /></TD>
                    <TD WIDTH="3" VALIGN="TOP"><IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" /></TD>
                    <TD VALIGN="TOP"><web:descriptor key="mstrWeb.969" desc="Print options enable you to customize the appearance of the report prior to printing. | Click 'Show Printable Version' to show how the report will look when printed." /></TD>
                </TR>
                <TR>
                    <TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="13" HEIGHT="1" ALT="" BORDER="0" /></TD>
                    <TD WIDTH="3" VALIGN="TOP"><IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" /></TD>
                    <TD VALIGN="TOP"><web:descriptor key="mstrWeb.970" desc="Use the guidelines provided to size the report for printing." /></TD>
                </TR>
            </TABLE>
        </TD>
    </TR>
	<%-- Include the Help Section as part of this toolbar. --%>
    <TR><TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="1" HEIGHT="3" ALT="" BORDER="0" /></TD></TR>
    <TR><TD><%@include file='/jsp/Help_Section.jsp' %></TD></TR>
    <TR><TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="158" HEIGHT="1" ALT="" BORDER="0" /></TD></TR>
</TABLE>
