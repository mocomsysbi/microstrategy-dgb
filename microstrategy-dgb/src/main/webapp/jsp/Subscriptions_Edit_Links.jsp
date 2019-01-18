<%
    /*
     * Subscriptions_Edit_Links.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Links.jsp"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>

<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<web:resource type="style" name="mstr/pagePrompts.css"/>

<web:ifFeature name="dhtml">
<web:then>
    <web:resource type="jsbundle" bundleName="bone-subscriptions-edit"/>

	<jsp:include page='/jsp/Prompt_Links.jsp' flush="true" />
	
	<web:scriptlet>
		if(microstrategy) microstrategy.cancelPromptResize = true;
	</web:scriptlet> 
</web:then>
<web:else>
	<%-- DHTML.js is necessary when HTML mode is on if the the report/document/rwb is prompted--%>
	<web:resource type="javascript" name="DHTML.js"/>
</web:else>
</web:ifFeature>

