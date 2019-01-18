<%/*
 * Export_Cancel_Content.jsp
 * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
 */
%><% // Note: do not put any empty lines on this file, it breaks double byte in WebLogic
%><%@ page errorPage="Error_Content.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>


<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=100%>
    <TR>
        <TD COLSPAN="2">
            &nbsp;
        </TD>
    </TR>
    <TR>
        <TD VALIGN=TOP WIDTH=1%>
            <IMG <web:resource attribute="SRC" name="jobError.gif"/> WIDTH="55" HEIGHT="65" ALT="" BORDER="0" />
        </TD>
	<TD VALIGN=TOP ALIGN=LEFT>
            <FONT SIZE="2" COLOR="#CC0000"><span class="mstrHighlighted"><web:descriptor key="mstrWeb.630" desc="Unable to export" /></span></FONT>
            <BR/><BR/>
            <FONT SIZE="2"><web:descriptor key="mstrWeb.1197" desc="Your request has been cancelled" /></FONT>
            <BR /><BR />
        </TD>
    </TR>
    <TR>
        <TD>&nbsp;</TD>
        <TD>
	    <BR/>
			<%-- Cancel the request and close the window if called from FastExport (using JavaScript)--%>
			<%-- //DE54301 FastExport is deprecated. the window should be closed by the close button --%>
            <web:formEvent formMethod="POST" eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventCancel">
                <INPUT TYPE="SUBMIT" <web:descriptor attribute="VALUE" key="mstrWeb.2102" desc="Close" />
                	ONCLICK="if ((window.name=='_new') || (window.name='_blank')) window.close();"/>
            </web:formEvent>
        </TD>
    </TR>
</TABLE>

