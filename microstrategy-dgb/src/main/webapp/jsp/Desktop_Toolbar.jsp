<%
  /*
   * Desktop_Toolbar.jsp
   * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
   */
%>

<%@ page errorPage="Error_Toolbar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%--
 Display the Search section, project name ,server name and help section if the user has
 a session. Otherwise just show the help section.
--%>
<web:ifConnectionValue>
    <web:then>
        <TABLE WIDTH="158" BORDER="0" CELLSPACING="0" CELLPADDING="0">
            <TR>
            <TD WIDTH="100%" HEIGHT="15" VALIGN="TOP">
                <%@include file='/jsp/Search_Section.jsp' %>
            </TD>
            <TD WIDTH="1%" ROWSPAN="6" WIDTH="15" HEIGHT="15" ALIGN="LEFT" VALIGN="TOP">
                <web:ifFeature name="object-search">
                    <web:then>
                        <IMG <web:resource attribute="SRC" name="corner_search_left_gray.gif"/> WIDTH="15" HEIGHT="15" ALT="" BORDER="0" />
                    </web:then>
                </web:ifFeature>
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
                        <TD VALIGN="MIDDLE"><span class="mstrHighlighted"><web:connectionValue property="projectAlias"/></span></TD>
                    </TR>
                    <TR>
                        <TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="13" HEIGHT="1" ALT="" BORDER="0" /></TD>
                        <TD VALIGN="TOP">
                        <BR /><web:descriptor key="mstrWeb.15" desc="Server:" /> <span class="mstrHighlighted"><web:connectionValue property="serverName"/></span>
                        </TD>
                    </TR>
                </TABLE>
            </TD>
        </TR>
        <TR>
            <TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="1" HEIGHT="3" ALT="" BORDER="0" /></TD>
        </TR>
        <TR>
            <TD>
                <%@include file='/jsp/Help_Section.jsp' %>
            </TD>
        </TR>
        <TR>
            <TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="158" HEIGHT="1" ALT="" BORDER="0" /></TD>
        </TR>
        </TABLE>
    </web:then>
    <web:else>
        <TABLE WIDTH="158" BORDER="0" CELLSPACING="0" CELLPADDING="0">
            <TR>
                <TD><%@include file='/jsp/Help_Section.jsp' %></TD>
                <TD WIDTH="1%" ROWSPAN="2" WIDTH="15" HEIGHT="15" ALIGN="LEFT" VALIGN="TOP">
                    <IMG <web:resource attribute="SRC" name="corner_search_left_gray.gif"/> WIDTH="15" HEIGHT="15" ALT="" BORDER="0" />
                </TD>
            </TR>
            <TR>
                <TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="158" HEIGHT="1" ALT="" BORDER="0" /></TD>
            </TR>
        </TABLE>
    </web:else>
</web:ifConnectionValue>
