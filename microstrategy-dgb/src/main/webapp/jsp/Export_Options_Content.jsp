<%
 /*
  * Export_Options_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%><%@ page errorPage="Error_Content.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><table width="100%" border="0" cellspacing="0" cellpadding="0" >
<tr>
<td valign="top">
<%--Render the 'Export Options' bean. --%>
<web:ifBeanValue bean="options" property="getCurrentGroupName" value="excelHeaderFooter"><web:then>
<web:displayBean bean="options" styleName="ExcelHeaderFooterStyle" />
</web:then><web:else>
<web:clientSideDescriptor IDs = "3986"/>
<web:displayBean bean="options" styleName="ExportOptionsStyle" />
</web:else></web:ifBeanValue>
</td>
</tr>
</table>
