<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%@ page import="com.microstrategy.web.app.beans.PageComponent" %>

<div id="mainApp"></div>
<div id="mainAppMsg"></div>

<jsp:include page='/jsp/Mojo_Config.jsp' flush="true"/>

<script type="text/javascript">
    window.console = window.console || {log: function(){}};  //avoid IE9 error
	window.mstr_profile = {
		enabled: true,
		timeStart: function(label) {
			if ( console.time && this.enabled ) {
				console.time(label);
			}
		},
		timeEnd: function(label) {
			if ( console.timeEnd && this.enabled ) {
				console.timeEnd(label);
			}
		},
		group: function() {
			if ( console.group && this.enabled ) {
				console.group(arguments);
			}
		},
		groupEnd: function() {
			if ( console.groupEnd && this.enabled ) {
				console.groupEnd();
			}
		},
		log: function() {
			if ( this.enabled ) {
				Function.prototype.apply.call(console.log, console, arguments);
			}
		}
	};

	mstr_profile.log("Initial Load started");
	mstr_profile.timeStart("Initial Load");

	// Add the Debug flags to the mstrConfig object.
	mstrConfig.debugFlags = <web:beanValue property="debugFlags"/>;


    mstrConfig.units = '<web:value type="misc" name="units"/>';
    mstrConfig.unitsLabel = '<web:value type="misc" name="unitsLabel"/>';
	mstrConfig.jsLibs = '../javascript-libraries/';

	mstrConfig.pluginsVisList = <web:value type="misc" name="VIGalleryVisList"/>;
	mstrConfig.pluginsWidgetVisMap = <web:value type="misc" name="pluginsWidgetVisMap"/>;
    mstrConfig.paletteThemes = <web:value type="misc" name="paletteThemes"/>;

   // Append application specific config.
    mstrConfig.mstrDescs = <web:bundleDescriptor name="html5-vi,vi-gm,vi-heatmap,vi-network,mojo-map,vi-ngm,vi-kpi"/>;
    <web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
        mstrConfig.validateRandNum = '<web:value type="httpSession" name="validateRandNum"/>';
    </web:then></web:ifFeature>
</script>

<web:resource type="javascript" name="libraries/modernizr.js"/>

<!-- Load libraries for annotations feature -->
<web:resource type="javascript" name="libraries/jquery.min.js"/>
<web:resource type="javascript" name="libraries/annotate.js"/>

<!-- Support touch events in mobile -->
<web:resource type="javascript" name="libraries/hammer.min.js"/>

<web:resource type="javascript" name="libraries/webfont.js"/>


<web:resource type="jsbundle" bundleName="html5-vi" debugBundleName="html5-vi-debug"/>
<web:ifFeature type="misc" name="jsBundleDebug"><web:then>
    <web:resource type="jsbundle" bundleName="vi-gm" />
    <web:resource type="jsbundle" bundleName="vi-ngm" />
	<web:resource type="jsbundle" bundleName="vi-heatmap" />
	<web:resource type="jsbundle" bundleName="vi-network" />
    <web:resource type="jsbundle" bundleName="mojo-map" />
    <web:resource type="jsbundle" bundleName="vi-kpi" />
</web:then></web:ifFeature>
<web:resource type="javascript" name="mstrLocalStorage.js"/>
<web:ifFeature name="auto-recover-objects">
    <web:then>
        <web:scriptlet>
            mstrLocalStorage.setItem("lastMsgRecoveryInfo" + mstrConfig.lastMsgKey, '<web:beanValue property="lastMsgRecoveryInfo"/>');
        </web:scriptlet>
  </web:then>
</web:ifFeature>

    <%--Recent Objects Feature --%>
    <web:resource type="javascript" name="libraries/html2canvas.js"/>
    <web:scriptlet>
        mstrLocalStorage.addRecentObjectInfo('<web:beanValue property="lastMsgRecoveryInfo"/>');
    </web:scriptlet>

<!--  Custom format feature -->
<web:resource type="javascript" name="libraries/ssf.js"/>
<web:resource type="javascript" name="libraries/nlp_compromise.min.js"/>

<script type="text/javascript">
//Derived Metric Editor
var isQuickSearchEnabled = <web:ifFeature name="quick-search-enabled" ><web:then>true</web:then><web:else>false</web:else></web:ifFeature>;


var mstrApp = new mstrmojo.vi.VisualInsightApp({
        isWSStyling: true,
	    supportAdvFilter: true,
	    enableLoggingRequest: false,
		hiddenSec: '<web:value type="requestKey" name="hiddensections"/>',
        <web:ifFeature name="useCookies"><web:then></web:then><web:else>
            httpSessionId: '<web:connectionValue property="containerSessionId" />',
            addJSessionIdToURL: <web:connectionValue property="addJSessionIdToURL" />,
        </web:else></web:ifFeature>
        authMode: '<web:connectionValue property="authenticationMode"/>',
        displayLocaleId: '<web:connectionValue property="displayLocaleID"/>',
        drillRtnPrntVal: '<web:value type="preference" name="drillRetainParent"/>',
        enableAutomaticSessionRecovery: <web:ifFeature name="auto-recover-objects"><web:then>1</web:then><web:else>0</web:else></web:ifFeature>,
        enableWarningSessionTimeout: <web:value type="preference" name="enableWarningSessionTimeout"/>,
        enableEmbeddedImages: <web:value type="preference" name="enableEmbeddedImages"/>,
        features: {
            <web:value type="features" name="auto-add-history-list,create-analysis,create-folder,create-html-container,disable-access-data-from-cloud-app,disable-access-data-from-database,disable-access-data-from-file,disable-dashboard-design,disable-reexecute-cube-report,disable-reexecute-regular-report,disable-reexecute-view-report,disable-save-dataset,documents-design-mode,edit-ive,guid-as-node-identifier,hide-objects-description,insert-new-metric,mbx,modify-report-list,ngm,ngmPartial,number-formatting,object-search,project-MCE-join,run-vi-flash,save-analysis,set-attributeform-display,showPreviews,single-workingset,sort-drill-paths,use-natural-language,vi-unsupport-create-edit-dummy-dataset,vi-unsupport-create-edit-rolap-report,warn-overwrite-flashVI,web-disable-manage-document-dataset,web-execute-cube-report,web-export-to-csv-privilege,web-export-to-excel-privilege,web-export-to-pdf-privilege,web-is-schema-defined,web-use-sharing-editor,web-drill-and-link,web-import-database"/>
        },
        objectsBlockCount: '<web:value type="preference" name="objectsBlockCount" />',
        viLayoutsCacheSize: '<web:value type="systemPreference" name="viLayoutsCacheSize" />',
        FlashResBundleURL : '<web:value name="resBundles/DashboardViewerBundle_" type="flashResURL"/>',
        getPersistParams: function () {return this.persistTaskParams;},
        getSelectAllForUnsetForVI: function() {return '<web:value type="preference" name="selectAllForUnsetForVI" />' === '1';},
        getShowVIWelcome: function(){return parseInt('<web:value type="preference" name="showVIWelcome" />');},
        getShowVISamples: function() {return '<web:value type="preference" name="showVISamples" />' === '1';},
        getShowVITutorial: function(){return  '<web:value type="preference" name="showVITutorial" />' === '1';},
        helpLocaleId: '<web:connectionValue property="helpLocale"/>',
        helpUrl: '<web:value type="systemPreference" name="helpUrl" />',
        upgradeHelpUrl: '<web:value type="systemPreference" name="upgradeHelpUrl" />',
        optimizeFitToPage : <web:value type="systemPreference" name="optimizeFitToPage"/>,
        isShare: <web:value type="requestKey" name="share"/>,
        isHomePage: <web:value type="requestKey" name="isHomePage"/>,
        jsMojoRoot: '../javascript/mojo/js/source/',
        jsRoot: '../javascript/',   <%-- TODO: Need to send down actual value --%>
        localeId: '<web:connectionValue property="locale"/>',
        maxSessionIdleTime: <web:value type="misc" name="maxSessionIdleTime"/>,
        name: '<web:value type="config" name="servletDeploymentName"/>',
        pageName: '<web:beanValue property="name"/>',
        pathInfo: <web:displayBean beanName="pathBean" styleName="MojoPathStyle"/>,
        persistTaskParams: <web:value type="persistParameters" name=""/>,
        placeholder: 'mainApp',
        preferences: {
            startPage: '<web:value type="preference" name="startPage"/>'
        },
        customization: {
        	getCustomThresholds: function () {return <web:value type="misc" name="customThresholds"/>;}
        },
        Privs : '<web:connectionValue property="privsXML"/>',
		projectName: '<web:connectionValue property="projectName"/>',
        projectAlias: '<web:connectionValue property="projectAlias"/>',
        userID: '<web:connectionValue property="userID"/>',
        searchAutoComplete: function(){return  '<web:value type="preference" name="enableSearchAutoComplete" />' == '1';},
        searchAutoCompleteDelay: function(){return '<web:value type="preference" name="searchAutoCompleteDelay" />';},
        serverName: '<web:connectionValue property="serverName"/>',
		serverPort: '<web:connectionValue property="serverPort"/>',
        serverProxy: new mstrmojo.ServerProxy({
            transport: mstrmojo.XHRServerTransport
        }),
        servletState: '<web:connectionValue property="servletState"/>',
        sessionState:'<web:connectionValue property="sessionState"/>',
        timeBeforeSessionTimeoutWarning: <web:value type="preference" name="timeBeforeSessionTimeoutWarning"/>,
        useQuickSearch: function() {return isQuickSearchEnabled && '<web:value type="preference" name="enableQuickSearch" />' == '1';},
        getMsgID: function () {return mstrApp.rootCtrl.docCtrl.model.mid;},
        userHelpPage: '<web:value type="systemPreference" name="userHelpPage" />',
        rwbBeanPath: '<web:beanValue bean="rwb" property="path"/>',
        saveFolderId: '<web:beanValue bean="rwb" property="saveFolderId" />',
        getLastMsgRecoveryInfo: function (){ return '<web:beanValue property="lastMsgRecoveryInfo"/>';},
        <web:ifFeature type="requestKey" name="hiddensections" value="contains:dockTop"><web:then>
	    	tbModelData: '',
	    	menubarModelData: <web:displayBean beanName="menuBean" />
	    </web:then>	<web:else>
	        tbModelData: <web:displayBean beanName="ribbonBean" />,
	        menubarModelData: <web:displayBean beanName="menuBean" />,
	    </web:else></web:ifFeature>
        <web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
            validateRandNum: '<web:value type="httpSession" name="validateRandNum"/>'
        </web:then></web:ifFeature>
    });
</script>

<web:resource type="javascript" name="mojo/js/source/config/vi/viWelcomeData.js"/>

<script type="text/javascript">

<web:ifBeanValue name="rwb" property="getXMLStatus" value="4"> <%-- WebBeanRequestEndsInError --%>
    <web:then>
        mstrApp.start({"mstrerr": <web:displayBean beanName="rwb" />, 'docId': '<web:beanValue bean="rwb" property="objectID"/>', 'rwb': '<web:value type="beanState" name="rwb"/>'});
    </web:then>
    <web:else>
        mstrApp.start({nsj: true,'bs': '<web:value type="beanState" name="rwb"/>', 'mid': '<web:beanValue bean="rwb" property="messageID"/>',
                     <%--
        	           //DE5943. We need to notify the client that original request came from inbox.
        	           //        Wu use the presense of the "inbox" (inbox bean state) request parameter as indicator
        	           //        that request came from inbox.
                     --%>
        	           'ibx': '<web:value type="requestKey" name="inbox"/>'});
    </web:else>
</web:ifBeanValue>

	mstr_profile.timeEnd("Initial Load");

</script>
<web:ifFeature type="systemPreference" name="webTestAuto" value="true"><%--OFF --%>
<web:then>
    <web:resource type="javascript" name="mstrTestAuto.js" />
</web:then></web:ifFeature>
