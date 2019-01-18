<%
 /*
  * Search_Section.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>
<%-- Render the 'Quick Search' toolbar if this feature is available. --%>
<web:ifFeature name="object-search">
    <web:then>
        <TABLE BGCOLOR="#CCCCCC" WIDTH="100%" HEIGHT="15" BORDER="0" CELLSPACING="0" CELLPADDING="0">
            <TR>
                <TD ROWSPAN="3"><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> ALT="" WIDTH="4" HEIGHT="1" /></TD>
                <TD COLSPAN="2" CLASS="mstrTitle"><web:descriptor key="mstrWeb.44" desc="Quick search" /><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> ALT="" WIDTH="1" HEIGHT="15" /></TD>
            </TR>
            <TR>
                <TD COLSPAN="2" WIDTH="100%"><web:quickSearch/></TD>
            </TR>
            <TR>
                <TD VALIGN="TOP">
					<%--Render a link to the 'Advanced Search' page.--%>
                    <web:advancedSearchLink>
                        <web:descriptor key="mstrWeb.2391" desc="advanced search" />
                    </web:advancedSearchLink>
                    <BR /><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> ALT="" WIDTH="1" HEIGHT="3" />
                </TD>
                <TD ALIGN="RIGHT" VALIGN="BOTTOM"><IMG <web:resource attribute="SRC" name="outside_corner_left_gray.gif"/> WIDTH="15" HEIGHT="15" ALT="" BORDER="0" /></TD>
            </TR>
        </TABLE>
    </web:then>
</web:ifFeature>
