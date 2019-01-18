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

<web:resource type="style" name="mstr/mstrUserManagement.css"/>
<web:resource type="style" name="mstr/pageSecurityRoles.css"/>
<web:resource type="style" name="mstr/pageTabManager.css"/>

<web:ifFeature name="dhtml"><web:then>
<web:resource type="javascript" name="serializer.js"/>
<web:resource type="javascript" name="updateManager.js"/>
<web:resource type="javascript" name="bone.js"/>
<web:resource type="javascript" name="dialog.js"/>
<web:resource type="javascript" name="HTMLAttributes.js"/>
<web:resource type="javascript" name="editor.js"/>
<web:resource type="javascript" name="tab.js"/>
<web:resource type="javascript" name="features.js"/>
<web:resource type="javascript" name="treev3.js"/>
<web:resource type="javascript" name="selections.js"/>
<web:resource type="javascript" name="mstrPrivileges.js"/>
<web:resource type="javascript" name="TabManager.js"/>
<web:resource type="javascript" name="mstrAdminTabManagerImpl.js"/>


</web:then></web:ifFeature>

