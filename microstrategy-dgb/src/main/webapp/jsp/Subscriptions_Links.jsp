<%
  /****
  * Subscriptions_Links.jsp
  * This page includes the link definitions that should be added for the
  * summary page to look properly
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%>

<%@ page errorPage="Error_Links.jsp"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>

<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<web:ifFeature name="dhtml"><web:then>
<web:resource type="jsbundle" bundleName="bone-subscriptions"/>
<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.DELIVERY_SERVICE_SCOPE" bean="allSubscriptions" />

<!-- Base Mojo CSS file -->
<web:resource type="js-style" name="mojo/css/core.css"/>
<!-- Mojo Custom Group Editor CSS file -->
<web:resource type="js-style" name="mojo/css/cge.css"/>
    <!-- Mojo Widgets CSS common in non-mojo-based pages -->
    <web:resource type="js-style" name="mojo/css/page-common.css"/>
</web:then></web:ifFeature>

<web:resource type="style" name="mstr/pageSubscriptions.css"/>
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
	    serverName: '<web:connectionValue property="serverName" />',
	    projectName: '<web:connectionValue property="projectName" />',
	    projectAlias: '<web:connectionValue property="projectAlias"/>',
	    serverPort: '<web:connectionValue property="serverPort"/>',
	    objectsBlockCount: '<web:value type="preference" name="objectsBlockCount" />',
	    elementsBlockCount: '<web:value type="preference" name="elementsBlockCount" />',
	    useQuickSearch: function() {return microstrategy.useQuickSearch();},
	    searchAutoComplete: function(){return microstrategy.enableSearchAutoComplete;},
        searchAutoCompleteDelay: function(){return microstrategy.searchAutoCompleteDelay;},

	    jsRoot: '../javascript/',   <%-- TODO: Need to send down actual value --%>
	    jsMojoRoot: '../javascript/mojo/js/source/',
	    mstrDescs : <web:bundleDescriptor name="mojo-bootstrap,mojo-cge,mojo-metric,mojo-ive-picker"/>,
	    onSessionExpired: window.mstrAppOnSessionExpired,
	    features: {
            <web:value type="features" name="create-folder,web-import-data,web-use-sharing-editor,modify-report-list,design-mode,modify-report-list,create-view-report,define-query-report-builder,template-reports,web-define-view-report,dhtml,upload-mstr,create-folder,save-report-privilege;web-import-mstr"/>
        },
        uploadMstrFileFn: {
	        'upload' : microstrategy.uploadDashboardFile,
	        'callback' : microstrategy.uploadCallback
	    }
	};
</web:scriptlet>
