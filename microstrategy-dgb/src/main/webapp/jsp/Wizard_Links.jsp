<%
/*
 * Wizard_Links.jsp
 * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
 */
%><%@ page errorPage="Error_Links.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"%><%
  PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");
%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<web:ifFeature name="dhtml"><web:then>
 <web:resource type="javascript" name="errors.js"/>
 <web:resource type="javascript" name="serializer.js"/>
 <web:resource type="javascript" name="updateManager.js"/>
 <web:resource type="javascript" name="bone.js"/>
 <web:resource type="javascript" name="dialog.js"/>
 <web:resource type="javascript" name="HTMLAttributes.js"/>
 <web:resource type="javascript" name="editor.js"/>
 <web:resource type="javascript" name="mask.js"/>
 <web:resource type="javascript" name="maskMapped.js"/>
 <web:resource type="javascript" name="selections.js"/>
 <web:resource type="javascript" name="tree.js"/>
 <web:resource type="javascript" name="toolbar.js"/>
 <web:resource type="javascript" name="ctrlToolbar.js"/>
 <web:resource type="javascript" name="docCommands.js"/>
 <web:resource type="javascript" name="viewerCommands.js"/>
 <web:resource type="javascript" name="doc.js"/>
 <web:resource type="javascript" name="section.js"/>
 <web:resource type="javascript" name="subSection.js"/>
 <web:resource type="javascript" name="docSelections.js"/>
 <web:resource type="javascript" name="observer.js"/>
 <web:resource type="javascript" name="docViewer.js"/>
 <web:resource type="javascript" name="objectBrowser.js"/>
</web:then></web:ifFeature>
