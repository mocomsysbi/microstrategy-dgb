<%
 /*
  * NCDeleteAddreses_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Render the 'addresses' bean.--%>
<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
    <TR>

      <TD COLSPAN="2" VALIGN="TOP"><web:displayBean bean="preferences" styleName="PreferencesNCStyle"/></TD>

    </TR>
</TABLE>