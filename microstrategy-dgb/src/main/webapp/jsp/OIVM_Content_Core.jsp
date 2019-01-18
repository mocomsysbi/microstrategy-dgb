<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%@ page import="com.microstrategy.web.app.beans.PageComponent" %>

<span id="pagePlaceholder"></span>

<jsp:include page='/jsp/Mojo_Config.jsp' flush="true"/>
<style type="text/css">
.unselectable {
    -moz-user-select: none;
    -ms-user-select: none;
    -webkit-user-select: none;
}
</style>
<script type="text/javascript">
    // Append application specific config.
    mstrConfig.mstrDescs = <web:bundleDescriptor name="mojo-oivm"/>;
    <web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
        mstrConfig.validateRandNum = '<web:value type="httpSession" name="validateRandNum"/>';
    </web:then></web:ifFeature>
    mstrConfig.pluginsVisList = <web:value type="misc" name="pluginsVisList"/>;

    window.console = window.console || {log: function(){}};  //avoid IE9 error
	window.mstr_profile = {
		enabled: false,
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
    
	mstrConfig.units = '<web:value type="misc" name="units"/>';
    mstrConfig.unitsLabel = '<web:value type="misc" name="unitsLabel"/>';
</script>

<web:resource type="jsbundle" bundleName="mojo-oivm"  />

<web:ifFeature type="misc" name="jsBundleDebug"><web:then>
	<web:ifFeature type="bean" value="rwb" name="!IE9Pre"><web:then>
		<web:resource type="jsbundle" bundleName="vi-gm" />
		<web:resource type="jsbundle" bundleName="vi-heatmap" />
		<web:resource type="jsbundle" bundleName="vi-network" />
		<web:resource type="jsbundle" bundleName="mojo-map" />
	</web:then></web:ifFeature>
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

<!-- Support touch events in mobile -->
<web:resource type="javascript" name="libraries/hammer.min.js"/>

<script type="text/javascript">
    //Set application globals.
    mstrApp = new mstrmojo.OIVMApp({
    	hiddenSec: '<web:value type="requestKey" name="hiddensections"/>',
		isExpress: true,
        placeholder: 'pagePlaceholder',
        Privs : '<web:connectionValue property="privsXML"/>',
        FlashResBundleURL : '<web:value name="/resBundles/DashboardViewerBundle_" type="flashResURL"/>',
        name: '<web:value type="config" name="servletDeploymentName"/>',
        pageName: '<web:beanValue property="name"/>',
        serverName: '<web:connectionValue property="serverName"/>',
        projectName: '<web:connectionValue property="projectName"/>',
        projectAlias: '<web:connectionValue property="projectAlias"/>',
        serverPort: '<web:connectionValue property="serverPort"/>',
        authMode: '<web:connectionValue property="authenticationMode"/>',
        pendingMojoEditor: '<web:value type="requestKey" name="oe"/>',
        features: {
            <web:value type="features" name="create-analysis,run-vi-flash,run-vi-smart,IE9Pre,web-use-sharing-editor,ask-before-save-changes,web-sort,object-search,showPreviews,is-document-center-align,ignore-incremental-rendering,modify-grid-level-in-documents,grid-layout,use-view-filter-editor,web-drill-and-link"/>
        },
        <web:ifFeature name="useCookies"><web:then></web:then><web:else>
            httpSessionId: '<web:connectionValue property="containerSessionId" />',
            addJSessionIdToURL: <web:connectionValue property="addJSessionIdToURL" />,
        </web:else></web:ifFeature>
        sessionState:'<web:connectionValue property="sessionState"/>',
        servletState: '<web:connectionValue property="servletState"/>',
        localeId: '<web:connectionValue property="locale"/>',
        helpUrl: '<web:value type="systemPreference" name="helpUrl" />',
        upgradeHelpUrl: '<web:value type="systemPreference" name="upgradeHelpUrl" />',
        displayLocaleId: '<web:connectionValue property="displayLocaleID"/>',
        jsRoot: '../javascript/',   <%-- TODO: Need to send down actual value --%>
        jsMojoRoot: '../javascript/mojo/js/source/',
        viewFactory: new mstrmojo.OIVMViewFactory(),
        persistTaskParams: <web:value type="persistParameters" name=""/>,
        getPersistParams: function () {return this.persistTaskParams;},
        prevViewMedia: <web:beanValue property="previousViewMedia" encode="true"/>,
        <web:ifBeanValue name="rwb" property="getXMLStatus" value="4"> <!-- WebBeanRequestEndsInError -->
            <web:then>
                error: <web:displayBean beanName="rwb" />,
            </web:then>
            <web:else>
                <web:ifFeature type="requestKey" name="hiddensections" value="contains:dockTop"><web:then>
                    tbModelData: '',
                </web:then><web:else>
                    tbModelData: <web:displayBean beanName="ribbonBean" />,
                </web:else></web:ifFeature>

		        <web:ifFeature name="jsonMode" type="requestKey" value="true"><web:then>
	                docModelData: <web:displayBean beanName="rwb"  styleName="JsonRWDStyle"/>,
		        </web:then><web:else>
		            docModelData: <web:displayBean beanName="rwb" />,
		        </web:else>
		        </web:ifFeature>
            </web:else>
        </web:ifBeanValue>
        <web:ifFeature name="guest-mode-enabled" >
            <web:then>
                guestModeEnabled: true,
            </web:then>
            <web:else>
                guestModeEnabled: false,
            </web:else>
        </web:ifFeature>
        maxSessionIdleTime: <web:value type="misc" name="maxSessionIdleTime"/>,
        timeBeforeSessionTimeoutWarning: <web:value type="preference" name="timeBeforeSessionTimeoutWarning"/>,
        showSelectAllMenuOptionForSelector : <web:value type="systemPreference" name="showSelectAllMenuOptionForSelector"/>,
        optimizeFitToPage : <web:value type="systemPreference" name="optimizeFitToPage"/>,
        enableWarningSessionTimeout: <web:value type="preference" name="enableWarningSessionTimeout"/>,
        enableAutomaticSessionRecovery: <web:ifFeature name="auto-recover-objects"><web:then>1</web:then><web:else>0</web:else></web:ifFeature>,
		isOIVM: function() {return true;},
		ibuildVersion: '<web:connectionValue property="xmlAPIVersion"/>',
		appVersion: '<web:value type="systemPreference" name="appVersion"/>',
        getMsgID: function() {
            return mstrApp.docModel.mid;
        },
        pathInfo: <web:displayBean beanName="pathBean" styleName="MojoPathStyle" />,
        getLastMsgRecoveryInfo: function (){ return '<web:beanValue property="lastMsgRecoveryInfo"/>';}
    });
    mstrmojo.App = mstrApp;
    mstrApp.start();
</script>
<web:ifFeature type="systemPreference" name="webTestAuto" value="true"><%--OFF --%>
<web:then>
    <web:resource type="javascript" name="mstrTestAuto.js" />
</web:then></web:ifFeature>




