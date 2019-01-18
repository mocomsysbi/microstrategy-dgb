<%
/*
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
<web:resource type="style" name="mstr/pageUserManager.css"/>

<web:ifFeature name="dhtml"><web:then>
<web:clientSideDescriptor IDs="3037,4359,4438,4460,4461"/> 
<web:resource type="javascript" name="treev3.js"/>
<web:resource type="javascript" name="updateManager.js"/>
<web:resource type="javascript" name="serializer.js"/>
<web:resource type="javascript" name="mstrObjectList.js"/>
<web:resource type="javascript" name="mstrUserEntities.js"/>
<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.ADMIN_SCOPE" bean="ugb" />
</web:then></web:ifFeature>
