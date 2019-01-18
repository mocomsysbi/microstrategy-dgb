<%
 /*
  * Error_Toolbar.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */

  /*
   * This page is used as the error page for Toolbar jsp files.
   */
%>

<%@ page isErrorPage="true" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<TABLE WIDTH="158" BORDER="0" CELLSPACING="0" CELLPADDING="8" >
    <TR>
<%--
  JSPTag tag will be removed from the ASPx page when this page is converted from JSP
  The contents of the ASPTag tag will replace the JSP ones.
--%>

        <TD VALIGN="MIDDLE">MICROSTRATEGY 9</TD>

    </TR>
    <TR>
        <TD>
            <web:descriptor key="mstrWeb.1167" desc="An error has occurred on this page." /><BR /> <BR />
            (<web:errorValue property="message"/>)
        </TD>
    </TR>
    <web:ifFeature type="systemPreference" name="renderExceptionInfo"><web:then>
    <TR>
        <TD>
			<%-- Add panel with the stack trace information in case the user wants to see the error details. --%>
            <web:panel language="1" name="err" useImage="true">
                <web:panelTitle><web:descriptor key="mstrWeb.189" desc="Details" />...</web:panelTitle>
                <web:panelCloseInfo imgClass="mstrImageLink" width="13" height="13" img="1arrow_down.gif"></web:panelCloseInfo>
                <web:panelOpenInfo imgClass="mstrImageLink" width="13" height="13" img="1arrow_right.gif"></web:panelOpenInfo>
                <web:panelContent>
                    <web:errorValue property="stackTrace"/>
                </web:panelContent>
            </web:panel>
        </TD>
    </TR>
    </web:then></web:ifFeature>
</TABLE>

<TABLE WIDTH="158" BORDER="0" CELLSPACING="0" CELLPADDING="0">
    <TR>
        <TD COLSPAN="2"><IMG SRC="images/1ptrans.gif" WIDTH="158" HEIGHT="1" ALT="" BORDER="0" /></TD>
    </TR>
</TABLE>
