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



<!-- Base Mojo CSS file -->
<web:resource type="js-style" name="mojo/css/core.css" />
<!-- Mojo Custom Group Editor CSS file -->
<web:resource type="js-style" name="mojo/css/cge.css" />

    <!-- Mojo Widgets CSS common in non-mojo-based pages-->
    <web:resource type="js-style" name="mojo/css/folder.css"/>

<web:resource type="style" name="mstr/pageSearch.css"/>

<%-- Render the JavaScript functions if necessary --%>
<web:ifFeature name="dhtml">
    <web:then>
    <web:clientSideDescriptor IDs="15474,13384"/>
    <web:resource type="jsbundle" bundleName="bone-search" />
<web:scriptlet>
	var mstrApp = {
	    name: '<web:value type="config" name="servletDeploymentName"/>',
	    pageName: '<web:beanValue property="name"/>',
	    <web:ifFeature name="useCookies"><web:then></web:then><web:else>
            httpSessionId: '<web:connectionValue property="containerSessionId" />',
            addJSessionIdToURL: <web:connectionValue property="addJSessionIdToURL" />,
        </web:else></web:ifFeature>
        sessionState:'<web:connectionValue property="sessionState"/>',
	    localeId: '<web:connectionValue property="locale"/>',
    helpUrl: '<web:value type="systemPreference" name="helpUrl" />',
    units: '<web:value type="misc" name="units"/>',
    unitsLabel: '<web:value type="misc" name="unitsLabel"/>',
        serverName: '<web:connectionValue property="serverName"/>',
        projectName: '<web:connectionValue property="projectName"/>',
        projectAlias: '<web:connectionValue property="projectAlias"/>',
        serverPort: '<web:connectionValue property="serverPort"/>',

    objectsBlockCount: '<web:value type="preference" name="objectsBlockCount" />',
    elementsBlockCount: '<web:value type="preference" name="elementsBlockCount" />',
    useQuickSearch: function() {return microstrategy.useQuickSearch();},
    searchAutoComplete: function(){return microstrategy.enableSearchAutoComplete;},
    searchAutoCompleteDelay: function(){return microstrategy.searchAutoCompleteDelay;},

    jsRoot: '../javascript/',   <%-- TODO: Need to send down actual value --%>
    jsMojoRoot: '../javascript/mojo/js/source/',
    mstrDescs : <web:bundleDescriptor name="mojo-bootstrap,mojo-cge,mojo-metric"/>,
    onSessionExpired: window.mstrAppOnSessionExpired,
    features: {
    <web:value type="features" name="create-folder"/>
    }
};
</web:scriptlet>

<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.REPORT_SCOPE" bean="OMD" />
<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.FOLDER_BROWSER_SCOPE" bean="OMD" />

    </web:then>
</web:ifFeature>

