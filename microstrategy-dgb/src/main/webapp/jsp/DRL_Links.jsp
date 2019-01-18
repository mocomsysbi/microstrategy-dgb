<%
    /*
     * DAL_Links.jsp
     */
%><%@ page errorPage="Error_Links.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");
%><jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<web:resource type="style" name="mstr/pagePreferences.css"/>
<web:resource type="js-style" name="mojo/css/core.css"/>
<web:resource type="js-style" name="mojo/css/drl.css"/>
<web:resource type="js-style" name="mojo/css/page-common.css"/>