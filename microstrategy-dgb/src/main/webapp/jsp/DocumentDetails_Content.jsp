<%
  /*
   * DocumentDetails_Content.jsp
   * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
   */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<%--
 Display the Document Details page.
 Render the "document" bean using the "DocumentDetailsStyle" style.
 You can find the transform that is mapped to the style in styleCatalog.xml.
--%>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0">
    <TR>
        <TD COLSPAN="2" VALIGN="TOP"><web:displayBean bean="db" /></TD>
    </TR>
</TABLE>

