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

<web:ifFeature name="dhtml"><web:then>
<web:resource type="javascript" name="treev3.js"/>
<web:resource type="javascript" name="updateManager.js"/>
<web:resource type="javascript" name="serializer.js"/>
<web:resource type="javascript" name="mstrObjectList.js"/>

<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.FOLDER_BROWSER_SCOPE" bean="srFolder" />
</web:then></web:ifFeature>
