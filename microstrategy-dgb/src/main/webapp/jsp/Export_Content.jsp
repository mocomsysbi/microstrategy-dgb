<%/*
 * Export_Content.jsp
 * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
 */
%><% // Note: do not put any empty lines on this file, it breaks double byte in WebLogic
%><%@ page errorPage="Error_Content.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%--
  JSPTag tag will be removed from the ASPx page when this page is converted from JSP
  The contents of the ASPTag tag will replace the JSP ones.
--%><%--
 The JSP version will display the contents of the bean.
 ASP.Net doesn't support UTF-8 characters when exporting so the 'ecelDirectExport' feature
 will export the contents by using an ASP.Net specific tag (ExporttoExcel). If
 the 'ecelDirectExport' feature is not enabled, this feature will work in the same way
 as in JSP.
--%><%//_JSPTag[%><web:exportSetContentType exportBean="eb" reportBean="rb"
/><web:displayBean bean="eb" /><%//_JSPTag]%>
<%//_ASPTag[
/*
<web:exportSetContentType exportBean="eb" reportBean="rb"
/><web:IfPlainTextExport bean="eb"
	><web:mthen
		><web:ifFeature name="excelDirectExport" type="config" value="true"
			><web:mthen
				><web:ExporttoExcel  beanName="eb"
			/></web:mthen
			><web:melse
				><web:displayBean bean="eb"
			/></web:melse
		></web:ifFeature
	></web:mthen
	><web:melse
		><web:displayBean bean="eb"
	/></web:melse
></web:IfPlainTextExport>
*/
//_ASPTag]%>
