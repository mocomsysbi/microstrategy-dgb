<%
    /*
     * Create_Links.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Links.jsp"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>

<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>
<%--
 Display the "links" section of the template as specified in pageConfig.xml (i.e. Admin_Links.jsp)
 <jsp:include page="[a page section]" />
--%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<%--
 Check if the user has the DHTML preference turned on to determine whether
  the page should load some JavaScripr functions.

 <web:ifFeature name="dhtml">
     [JavaScript code]
 </web:ifFeature>
--%>
<web:ifFeature name="dhtml"><web:then>
<web:clientSideDescriptor IDs = "13384" />

<web:resource type="style"  name="mstr/pageCreate.css" /> 
<web:resource type="javascript" name="createReport.js"/>
<web:resource type="javascript" name="selections.js"/>
<web:resource type="javascript" name="mstrTreeViewImpl.js"/>
<web:resource type="javascript" name="mstrObjectBrowserImpl.js"/>
<web:resource type="javascript" name="mstrObjectExplorerImpl.js"/>
<web:resource type="javascript" name="mstrXDAObjectExplorerImpl.js"/>
<web:resource type="javascript" name="serializer.js"/>
<web:resource type="javascript" name="updateManager.js"/>
<web:resource type="javascript" name="updateManagerEventsCreateReport.js"/>
<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.CREATE_REPORT_SCOPE" bean="ObjectExplorer" />
</web:then>
<web:else>
<web:resource type="style" name="mstr/pageCreateReport.css"/>
</web:else>
</web:ifFeature>
