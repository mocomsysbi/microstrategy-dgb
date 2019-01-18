<%
 /*
  * NCAddreses_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<table id="prefNCAddresses" width="100%" border="0" cellspacing="0" cellpadding="0" >
    <tr>
        <td colspan="2" valign="top"><web:displayBean bean="preferences" styleName="PreferencesNCStyle"/></td>
    </tr>
</table>
