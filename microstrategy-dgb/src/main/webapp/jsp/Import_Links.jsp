<%
 /****
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="Error_Links.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>
<%
 /****
 * Display the "links" section of the template as specified in pageConfig.xml (i.e. Admin_Links.jsp)
 * <jsp:include page="[a page section]" />
  ****/
%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<web:resource type="javascript" name="viewerCommands.js"/>
<web:resource type="javascript" name="AC_OETags.js"/>
<web:resource type="javascript" name="updateManager.js"/>
<web:resource type="javascript" name="serializer.js"/>
<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.IMPORT_SCOPE" bean="wiz"/>
