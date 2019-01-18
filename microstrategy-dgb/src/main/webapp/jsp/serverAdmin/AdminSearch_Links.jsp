<%
    /*
     * Search_Links.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Links.jsp"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>

<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<web:resource type="style" name="mstr/pageSearch.css"/>
<%-- Render the JavaScript functions if necessary --%>
<web:ifFeature name="dhtml">
    <web:then>
        <web:resource type="javascript" name="Calendar.js"/>
        
		<web:scriptlet> 
		var mstrApp = {
		    name: '<web:value type="config" name="servletDeploymentName"/>',
		    pageName: '<web:beanValue property="name"/>',
		    <web:ifFeature name="useCookies"><web:then></web:then><web:else>
                httpSessionId: '<web:connectionValue property="containerSessionId" />',
                addJSessionIdToURL: <web:connectionValue property="addJSessionIdToURL" />,
            </web:else></web:ifFeature>
		    sessionState:'<web:connectionValue property="sessionState"/>',    
		    useQuickSearch: function() {return microstrategy.useQuickSearch();},
		    onSessionExpired: window.mstrAppOnSessionExpired
		};
		</web:scriptlet>

    </web:then>
</web:ifFeature>

