<%
    /*
     * Admin_Help_Section.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>
<%--
 Display the Help secion in a panel. The panel will allow us to show and
 hide the links to the Online Help.
--%>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2">
    <TR>
        <TD WIDTH="15">
            <IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="15" HEIGHT="1" ALT="" />
        </TD>
        <TD>
            <a href="<web:value type="helpAdmin" name="Manage_system_from_Web.htm"/>" target="_new">
              <web:descriptor key="mstrWeb.555" desc="NEED HELP?" />
            </a>
        </TD>
    </TR>
</TABLE>
