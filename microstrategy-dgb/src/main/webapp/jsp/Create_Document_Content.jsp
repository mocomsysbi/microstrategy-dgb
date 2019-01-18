<%
  /*
   * Create_Document_Content.jsp
   * Copyright 2003 MicroStrategy Incorporated. All rights reserved.
   */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<div class="mstrPanelPortrait" id="create_document">
<div class="mstrPanelTitleBar">
<span class="mstrPanelTitle"><web:descriptor key="mstrWeb.2918"/></span>
</div>
<%--
 Render the "createDocument" bean using the "FolderStyleCreateDocument" style.
 You can find the transform that is mapped to the style in styleCatalog.xml.
--%>
<web:displayBean bean="folderCreateDocument" styleName="FolderStyleCreateDocument" />
</div>
</div>
