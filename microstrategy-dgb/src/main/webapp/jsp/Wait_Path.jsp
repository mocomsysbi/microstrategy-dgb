<%
    /*
     * Wait_Path.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Path.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
    <TR>
        <TD WIDTH="15" ROWSPAN="2" VALIGN="TOP">
            <TABLE WIDTH="158" BORDER="0" CELLSPACING="0" CELLPADDING="0">
                <TR>
                    <TD WIDTH="99%" HEIGHT="15" VALIGN="TOP"><%@include file='/jsp/Search_Section.jsp' %></TD>
                    <TD WIDTH="1%" ROWSPAN="11" WIDTH="15" HEIGHT="15" ALIGN="LEFT" VALIGN="TOP">
                        <web:ifFeature name="object-search">
                            <web:then>
                                <IMG <web:resource attribute="SRC" name="corner_search_left_gray.gif"/> WIDTH="15" HEIGHT="15" ALT="" BORDER="0" />
                            </web:then>
                        </web:ifFeature>
                    </TD>
                </TR>
                <TR><TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="1" HEIGHT="3" ALT="" BORDER="0" /></TD></TR>
            </TABLE>
        </TD>
        <TD WIDTH="15" ROWSPAN="2" ><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="15" HEIGHT="1" ALT="" BORDER="0" /></TD>
        <TD VALIGN="MIDDLE" WIDTH="100%">
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" >
                <TR>
                     <TD WIDTH="100%" ALIGN="LEFT"><web:objectPath folderStyle="FolderPathStyle" reportStyle="ObjectPathStyle" documentStyle="ObjectPathStyle"/></TD>
                </TR>
            </TABLE>
        </TD>
        <TD WIDTH="15" ROWSPAN="2"><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="15" HEIGHT="1" ALT="" BORDER="0" /></TD>
    </TR>
</TABLE>
