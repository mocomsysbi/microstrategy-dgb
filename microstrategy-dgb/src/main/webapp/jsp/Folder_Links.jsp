<%
 /****
  * Folder_Links.jsp
  * This page includes the link definitions that should be added for the
  * folder pages to look properly
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="Error_Links.jsp"
%><%@ page import="com.microstrategy.web.app.utils.JavaScriptBundles"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>
<%--
 Display the "links" section of the template as specified in pageConfig.xml (i.e. Admin_Links.jsp)
 <jsp:include page="[a page section]" />
--%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />
<web:beanValue name="smartBanner" property="Output"/>
<web:ifFeature name="dhtml"><web:then>
<web:clientSideDescriptor IDs = "134,221,2948,3829,3680,3833,8044,9181,13384,14532" />

<web:resource type="jsbundle" bundleName="bone-folder" />

<!-- Base Mojo CSS file -->
<web:resource type="js-style" name="mojo/css/core.css"/>
<!-- Mojo Custom Group Editor CSS file -->
<web:resource type="js-style" name="mojo/css/cge.css"/>

<web:resource type="js-style" name="mojo/css/folder.css"/>
<web:resource type="style" name="mstr/pageFolder.css"/>
<web:ifFeature name="is-portlet"><web:then>
<style>
#folderAllModes {min-width:920px;}
</style>
</web:then></web:ifFeature>

<web:scriptlet>
window.mstrApp = {
    name: '<web:value type="config" name="servletDeploymentName"/>',
    pageName: '<web:beanValue property="name"/>',
    <web:ifFeature name="useCookies"><web:then></web:then><web:else>
        httpSessionId: '<web:connectionValue property="containerSessionId" />',
        addJSessionIdToURL: <web:connectionValue property="addJSessionIdToURL" />,
    </web:else></web:ifFeature>
    sessionState:'<web:connectionValue property="sessionState"/>',
    localeId: '<web:connectionValue property="locale"/>',
    helpLocaleId: '<web:connectionValue property="helpLocale"/>',
    helpUrl: '<web:value type="systemPreference" name="helpUrl" />',
    units: '<web:value type="misc" name="units"/>',
    unitsLabel: '<web:value type="misc" name="unitsLabel"/>',
    serverName: '<web:connectionValue property="serverName"/>',
  	projectName: '<web:connectionValue property="projectName"/>',
  	projectAlias: '<web:connectionValue property="projectAlias"/>',
   	serverPort: '<web:connectionValue property="serverPort"/>',

    objectsBlockCount: '<web:value type="preference" name="objectsBlockCount" />',
    elementsBlockCount: '<web:value type="preference" name="elementsBlockCount" />',
    enableSearchAutoComplete: '<web:value type="preference" name="enableSearchAutoComplete" />',
    optimizeFitToPage : <web:value type="systemPreference" name="optimizeFitToPage"/>,
    useQuickSearch: function() {return microstrategy.useQuickSearch();},
    searchAutoComplete: function(){return microstrategy.enableSearchAutoComplete;},
    searchAutoCompleteDelay: function(){return microstrategy.searchAutoCompleteDelay;},

    jsRoot: '../javascript/',   <%-- TODO: Need to send down actual value --%>
    jsMojoRoot: '../javascript/mojo/js/source/',
    mstrDescs : <web:bundleDescriptor name="mojo-bootstrap,mojo-sharing,mojo-acl,mojo-cge,mojo-metric,mojo-ive-picker"/>,
    onSessionExpired: window.mstrAppOnSessionExpired,
    features: {
        <web:value type="features" name="create-folder,web-import-data,web-use-sharing-editor,modify-report-list,design-mode,modify-report-list,create-view-report,define-query-report-builder,template-reports,web-define-view-report,dhtml,upload-mstr,create-folder,save-report-privilege;web-import-mstr,showPreviews,web-execute-cube-report"/>
    },
    uploadMstrFileFn: {
        'upload' : microstrategy.uploadDashboardFile,
        'callback' : microstrategy.uploadCallback
    },
    currentFolderId: function() {return microstrategy.bones.folderAllModes? microstrategy.bones.folderAllModes.folderId : ''}
};
</web:scriptlet>

<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.REPORT_SCOPE" bean="fb" />
</web:then></web:ifFeature>
