<%
  /*
   * Create_Content.jsp
   * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
   */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>


<div class="mstrPanelPortrait" id="create_report">
<div class="mstrPanelTitleBar">
<span class="mstrPanelTitle"><web:descriptor key="mstrWeb.5"/></span>
</div>
<%--
 Render the "create" bean using the "FolderStyleCreateReport" style.
 You can find the transform that is mapped to the style in styleCatalog.xml.
--%>
<web:displayBean bean="folderCreate" styleName="FolderStyleCreateReport" />
</div>
</div>
<web:displayGuiComponent name="XDACubePickerBean"/>
<web:displayGuiComponent name="ObjectExplorer"/>
