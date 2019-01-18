<%
/*
 * Search_Toolbar.jsp
 * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
 */
%>

<%@ page errorPage="Error_Toolbar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<TABLE WIDTH="158" BORDER="0" CELLSPACING="0" CELLPADDING="0">
    <TR><TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="1" HEIGHT="3" ALT="" BORDER="0" /></TD></TR>
    <TR>
        <TD>
			<%-- Render 'Search Tips' in a panel. --%>
            <web:panel language="1" name="seh" useImage="true">
                <web:panelTitle><span class="mstrHighlighted">&nbsp;<web:descriptor key="mstrWeb.712" ucase="true" desc="SEARCH TIPS" /></span></web:panelTitle>
                <web:panelCloseInfo width="13" height="13" img="1arrow_down.gif"><web:descriptor key="mstrWeb.1946" desc="Hide Search tips" /></web:panelCloseInfo>
                <web:panelOpenInfo width="13" height="13" img="1arrow_right.gif"><web:descriptor key="mstrWeb.1945" desc="Show Search tips" /></web:panelOpenInfo>
                <web:panelContent>
                    <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2">
                        <TR>
                            <TD VALIGN="TOP" WIDTH="3"><IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" /></TD>
                            <TD VALIGN="TOP"><web:descriptor key="mstrWeb.892" desc="Use the advanced search to specify restrictions on dates, object types, and descriptions." /></TD>
                        </TR>
                        <TR>
                            <TD VALIGN="TOP" WIDTH="3"><IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" /></TD>
                            <TD VALIGN="TOP"><web:descriptor key="mstrWeb.297" desc="You can use the wildcard '?' to indicate a single character." /></TD>
                        </TR>
                        <TR>
                            <TD VALIGN="TOP" WIDTH="3"><IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" /></TD>
                            <TD VALIGN="TOP"><web:descriptor key="mstrWeb.301" desc="You can use the wildcard '*' to indicate any number of characters." /></TD>
                        </TR>
                    </TABLE>
                </web:panelContent>
            </web:panel>
        </TD>
    </TR>
    <TR><TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="1" HEIGHT="3" ALT="" BORDER="0" /></TD></TR>
    <TR><TD><%@include file='/jsp/Help_Section.jsp' %></TD></TR>
    <TR><TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="158" HEIGHT="1" ALT="" BORDER="0" /></TD></TR>
</TABLE>
