<%@ page errorPage="JSP_Error.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<script type="text/javascript" >
    var isQuickSearchEnabled = <web:ifFeature name="quick-search-enabled" ><web:then>true</web:then><web:else>false</web:else></web:ifFeature>;

    // Set common config properties for most applications
    mstrConfig = {
        resolveOnly :'<web:value type="requestKey" name="resolveOnly"/>' === 'true',//PAUSE MODE
        taskURL: '<web:taskProcessorName />',
        thousandsSep: '<web:value type="misc" name="thousandSeparator"/>',
        decimalSep: '<web:value type="misc" name="decimalSeparator"/>',
        listSep: '<web:value type="misc" name="listSeparator"/>',
        onMobileDevice: false,
        webVersion: '<web:value type="misc" name="webVersion"/>',
        pluginRoot: '<web:value type="misc" name="pluginRoot"/>',
        <web:ifFeature type="preference" name="enableUsherAuthenticationOption"><web:then>
        isUsherAuthVisible: true, </web:then>
        <web:else>isUsherAuthVisible: false,</web:else></web:ifFeature>
        isEdgeModeEnabled: '<web:value type="systemPreferenceEncoded" name="useIEEdgeMode" />' == '1',
        isLinkJSEnabled: '<web:value type="systemPreference" name="allowRSDHyperlinkJavaScript"/>' == '1',
        serverName: '<web:connectionValue property="serverName"/>',
        projectName: '<web:connectionValue property="projectName"/>',
        projectId: '<web:connectionValue property="projectID"/>',
        serverPort: '<web:connectionValue property="serverPort"/>',
        servletState: '<web:connectionValue property="servletState"/>',
        authMode: '<web:connectionValue property="authenticationMode"/>',
        shareToGuestWhenEnabled: '<web:value type="systemPreference" name="shareToGuestWhenEnabled"/>' == '1',
        browserLang: '<web:connectionValue property="browserLang"/>',
        libraryWebBaseURL: '<web:value type="systemPreferenceSessionEncoded" name="consumerWebBaseURL" />',
        connectorWebBaseURL: '<web:value type="systemPreferenceSessionEncoded" name="connectorWebBaseURL" />',
        seamlessLoginEnabled: '<web:value type="systemPreference" name="allowSeamlessLoginToLibrary" />' == '1',
        disableShareLinkBar: '<web:value type="systemPreference" name="disableShareLinkBar" />' == '1',
        features: {
            <web:value type="features" name="is-two-step-verification-required,create-object,enable-login-editor,show-dossier-library-link"/>
        },
        lastMsgKey: '<web:beanValue property="lastMessageKey"/>',
        isQuickSearchEngineEnabled: isQuickSearchEnabled,
        enableQuickSearchPref: isQuickSearchEnabled && '<web:value type="preference" name="enableQuickSearch" />' == '1',
        enableSearchAutoComplete: '<web:value type="preference" name="enableSearchAutoComplete" />' == '1',
        searchAutoCompleteDelay: '<web:value type="preference" name="searchAutoCompleteDelay" />' || 200,
        addTimeStampToPreventCaching: '<web:value type="systemPreference" name="addTimeStampToPreventCaching"/>' == '1',
        useNamespaceInCookie: <web:value type="misc" name="useNamespaceInCookie"/>,
        <web:ifFeature type="preference" name="showPreviews"><web:then>
			showPreviews: '<web:value type="preference" name="showPreviews" />' == '1',
		</web:then><web:else>
			showPreviews: false,
		</web:else></web:ifFeature>
    };

    <web:ifConnectionValue>
        <web:then>
        <%--//Search related settings:--%>
            mstrConfig.searchProps = {
                rootFolderType: 39, <%-- Default: Project root --%>
                isMiniSearchBox: false,
                showAsPopup: false,
                maxSearchResults: <web:value type="preference" name="maxSearchResults"/> || 50,
                allowedObjectTypesData: [].concat(<web:value type="misc" name="searchObjectTypes" />)
            };

        </web:then>
    </web:ifConnectionValue>
</script>