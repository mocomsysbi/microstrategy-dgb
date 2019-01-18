<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%@ page import="com.microstrategy.web.app.beans.PageComponent" %>

<div id="mainApp"></div>
<div id="mainAppMsg"></div>

<jsp:include page='/jsp/Mojo_Config.jsp' flush="true"/>

<script type="text/javascript">

	// Add the Debug flags to the mstrConfig object.
	mstrConfig.debugFlags = <web:beanValue property="debugFlags"/>;

   // Append application specific config.
    mstrConfig.mstrDescs = <web:bundleDescriptor name="mojo-bootstrap,mojo-home"/>;
    <web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
        mstrConfig.validateRandNum = '<web:value type="httpSession" name="validateRandNum"/>';
    </web:then></web:ifFeature>
</script>

    <web:resource type="javascript" name="libraries/modernizr.js"/>
    <web:resource type="javascript" name="libraries/jquery.min.js"/>
    <web:resource type="javascript" name="libraries/slick/slick.min.js"/>
    <web:resource type="jsbundle" bundleName="mojo-bootstrap" />
    <web:resource type="jsbundle" bundleName="mojo-home" />


<script type="text/javascript">
var isQuickSearchEnabled = <web:ifFeature name="quick-search-enabled" ><web:then>true</web:then><web:else>false</web:else></web:ifFeature>;

var mstrApp = new mstrmojo.home.HomeApp({
        <web:ifFeature name="useCookies"><web:then></web:then><web:else>
            httpSessionId: '<web:connectionValue property="containerSessionId" />',
            addJSessionIdToURL: <web:connectionValue property="addJSessionIdToURL" />,
        </web:else></web:ifFeature>
        displayLocaleId: '<web:connectionValue property="displayLocaleID"/>',
        units: '<web:value type="misc" name="units"/>',
        unitsLabel: '<web:value type="misc" name="unitsLabel"/>',
        <%--enableAutomaticSessionRecovery: <web:ifFeature name="auto-recover-objects"><web:then>1</web:then><web:else>0</web:else></web:ifFeature>,--%>
        <%--enableWarningSessionTimeout: <web:value type="preference" name="enableWarningSessionTimeout"/>,--%>
        <%--timeBeforeSessionTimeoutWarning: <web:value type="preference" name="timeBeforeSessionTimeoutWarning"/>,--%>
        features: {
            <web:value type="features" name="flashvi,dhtml,define-query-report-builder,modify-report-list,design-mode,template-reports,web-define-view-report,create-objects,create-analysis,run-vi-flash,run-vi-smart,IE9Pre,create-folder,web-use-sharing-editor,create-html-container,object-search,showPreviews,show-sample-recents,export-new-window"/>
        },
        getPersistParams: function () {return this.persistTaskParams;},
        helpLocaleId: '<web:connectionValue property="helpLocale"/>',
        helpUrl: '<web:value type="systemPreference" name="helpUrl" />',
        upgradeHelpUrl: '<web:value type="systemPreference" name="upgradeHelpUrl" />',
        optimizeFitToPage : <web:value type="systemPreference" name="optimizeFitToPage"/>,
        isHomePage: <web:value type="requestKey" name="isHomePage"/>,
        jsMojoRoot: '../javascript/mojo/js/source/',
        jsRoot: '../javascript/',   <%-- TODO: Need to send down actual value --%>
        localeId: '<web:connectionValue property="locale"/>',
        maxSessionIdleTime: <web:value type="misc" name="maxSessionIdleTime"/>,
        name: '<web:value type="config" name="servletDeploymentName"/>',
        pageName: '<web:beanValue property="name"/>',
        persistTaskParams: <web:value type="persistParameters" name=""/>,
        placeholder: 'mainApp',
        preferences: {
            startPage: '<web:value type="preference" name="startPage"/>'
        },
        Privs : '<web:connectionValue property="privsXML"/>',
		projectName: '<web:connectionValue property="projectName"/>',
		projectAlias: '<web:connectionValue property="projectAlias"/>',
        searchAutoComplete: function(){return  '<web:value type="preference" name="enableSearchAutoComplete" />' == '1';},
        searchAutoCompleteDelay: function(){return '<web:value type="preference" name="searchAutoCompleteDelay" />';},
        serverName: '<web:connectionValue property="serverName"/>',
		serverPort: '<web:connectionValue property="serverPort"/>',
        serverProxy: new mstrmojo.ServerProxy({
            transport: mstrmojo.XHRServerTransport
        }),
        servletState: '<web:connectionValue property="servletState"/>',
        sessionState:'<web:connectionValue property="sessionState"/>',
        useQuickSearch: function() {return isQuickSearchEnabled && '<web:value type="preference" name="enableQuickSearch" />' == '1';},
        getMsgID: function () {return mstrApp.rootCtrl.docCtrl.model.mid;},
        userHelpPage: '<web:value type="systemPreference" name="userHelpPage" />',
        rwbBeanPath: '<web:beanValue bean="rwb" property="path"/>',
        saveFolderId: '<web:beanValue bean="rwb" property="saveFolderId" />',
        <web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
            validateRandNum: '<web:value type="httpSession" name="validateRandNum"/>',
        </web:then></web:ifFeature>

        pathInfo: <web:displayBean beanName="pathBean" styleName="MyPageMojoPathStyle"/>,
        homeModelData: <web:value type="preference" name="homecardsDef" /> || [],

        uploadMstrFileFn: {
            'upload' : mstrmojo.mstr.ui.MstrFileUploadHelper.uploadDashboardFile,
            'callback' : mstrmojo.mstr.ui.MstrFileUploadHelper.uploadCallback
        },
        <%-- Reading the preference of whether or not to allow guest access for Sharing URL Editor --%>
        <web:ifFeature name="guest-mode-enabled" >
            <web:then>
                guestModeEnabled: true,
            </web:then>
            <web:else>
                guestModeEnabled: false
            </web:else>
        </web:ifFeature>
    });


        mstrApp.start();

</script>

