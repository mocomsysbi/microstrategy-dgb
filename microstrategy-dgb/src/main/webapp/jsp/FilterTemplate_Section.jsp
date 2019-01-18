<%
 /*
  * FilterTemplate_Section.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%--
	Display the 'Filter + Template' section in a Panel.
	Users can select a filter and a template to execute
	a report.
--%>
<web:panel language="1" name="rFT" useImage="true">
    <web:panelTitle><span class="mstrHighlighted"><web:descriptor key="mstrWeb.1282" desc="RUN FILTER + TEMPLATE" /></span></web:panelTitle>
    <web:panelCloseInfo width="13" height="13" img="1arrow_down.gif"><web:descriptor key="mstrWeb.1942" desc="Hide Run Filter + Template" /></web:panelCloseInfo>
    <web:panelOpenInfo width="13" height="13" img="1arrow_right.gif"><web:descriptor key="mstrWeb.1941" desc="Show Run Filter + Template" /></web:panelOpenInfo>
    <web:panelContent>
        <TABLE CELLPADDING="2" CELLSPACING="0" BORDER="0">
            <TR>
                <TD><IMG ALT="" SRC="images/Filter.gif" /></TD>
                <TD CLASS="BODY_TEXT"><span class="mstrHighlighted"><web:descriptor key="mstrWeb.1283" desc="Run this filter:" /></span><BR /><web:descriptor key="mstrWeb.1286" desc="Select a filter" /></TD>
            </TR>
            <TR>
                <TD><IMG ALT="" SRC="images/Template.gif" /></TD>
                <TD CLASS="BODY_TEXT"><span class="mstrHighlighted"><web:descriptor key="mstrWeb.1284" desc="with this template:" /></span><BR /><web:descriptor key="mstrWeb.1285" desc="Select a template" /></TD>
            </TR>
        </TABLE>
    </web:panelContent>
</web:panel>
