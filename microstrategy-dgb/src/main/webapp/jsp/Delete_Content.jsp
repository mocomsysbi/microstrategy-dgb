<%
  /*
   * Delete_Content.jsp
   * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
   */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<div class="mstrPanelPortrait" id="divDeleteConfirm">
 <div class="mstrPanelTitleBar">
  <span class="mstrPanelTitle"><web:descriptor key="mstrWeb.3169" desc="Confirm Delete" /></span>
 </div>
<%--
 Render the "fb" (folder bean) bean using the "FolderStyleDeleteObject" style.
 You can find the transform that is mapped to the style in styleCatalog.xml.
--%>
 <web:displayBean bean="fb" styleName="FolderStyleDeleteObject" />
</div>
