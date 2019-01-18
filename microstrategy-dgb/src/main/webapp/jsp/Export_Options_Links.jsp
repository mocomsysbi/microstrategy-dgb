<%
    /*
     * Export_Options_Links.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%><%@ page errorPage="Error_Links.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");
%>
<%--
 Display the "links" section of the template as specified in pageConfig.xml (i.e. Admin_Links.jsp)
 <jsp:include page="[a page section]" />
--%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<web:resource type="javascript" name="export.js"/>
<web:resource type="javascript" name="print.js"/>

<web:ifBeanValue bean="options" property="getShowOptions" value="true"><web:then>
<web:resource type="style" name="mstr/pageExportOptions.css"/>
</web:then><web:else>
<web:resource type="style" name="mstr/pagePreferences.css"/>
</web:else></web:ifBeanValue>
