<%
 /****
  * Report_Links.jsp
  * This file is used to include css and js files in the documents' page.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="Error_Links.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");
%><jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />
    <web:beanValue name="smartBanner" property="Output"/>
<!-- Base Mojo CSS & JS file -->
    <web:resource type="js-style" name="mojo/css/core.css" />
    <web:resource type="js-style" name="mojo/css/report.css"/>
    <web:resource type="js-style" name="mojo/css/cge.css"/>

<%-- DHTML Mode - Needed for prompted and unprompted reports --%>
<web:ifFeature name="dhtml">
    <web:then>
        <script type='text/javascript'>
        window.mstrApp = {
            features: {
                <web:value type="features" name="create-analysis,run-vi-flash,run-vi-smart,IE9Pre,object-search"/>
            },
            name: '<web:value type="config" name="servletDeploymentName"/>',
            pageName: '<web:beanValue property="name"/>',
            <web:ifFeature name="useCookies"><web:then></web:then><web:else>
                httpSessionId: '<web:connectionValue property="containerSessionId" />',
                addJSessionIdToURL: <web:connectionValue property="addJSessionIdToURL" />,
            </web:else></web:ifFeature>
            sessionState:'<web:connectionValue property="sessionState"/>',
            localeId: '<web:connectionValue property="locale"/>',
            helpUrl: '<web:value type="systemPreference" name="helpUrl" />',
            optimizeFitToPage : <web:value type="systemPreference" name="optimizeFitToPage"/>,
            units: '<web:value type="misc" name="units"/>',
            unitsLabel: '<web:value type="misc" name="unitsLabel"/>',
            serverName: '<web:connectionValue property="serverName"/>',
            projectName: '<web:connectionValue property="projectName"/>',
            projectAlias: '<web:connectionValue property="projectAlias"/>',
            serverPort: '<web:connectionValue property="serverPort"/>',
            pendingMojoEditor: '<web:value type="requestKey" name="oe"/>',
            jsRoot: '../javascript/',   <%-- TODO: Need to send down actual value --%>
            jsMojoRoot: '../javascript/mojo/js/source/',
            mstrDescs :  <web:bundleDescriptor name="mojo-bootstrap,mojo-dde,mojo-ros,mojo-session-manager,mojo-dae,mojo-starburst"/>,
            rememberLastEditorPanel : '<web:beanValue bean="accordion" property="rememberLastEditorPanel"/>',
            onSessionExpired: window.mstrAppOnSessionExpired,
            getMsgID: function () {return microstrategy.bones.UniqueReportID.messageID;},
            oi: {
                objId: '<web:beanValue bean="rb" property="objectID"/>',
                objType: '<web:beanValue bean="rb" property="objectType"/>'
            },
            getLastMsgRecoveryInfo: function (){ return '<web:beanValue property="lastMsgRecoveryInfo"/>';},
        };
        </script>
    </web:then>
</web:ifFeature>

<%-- Is the Report Prompted? (xmlStatus is waiting for user's input [6]) --%>
<web:ifBeanValue bean="frame.rb" property="getXMLStatus" value="6">
    <web:then>
        <%-- DHTML Mode? --%>
        <web:ifFeature name="dhtml">
            <web:then>
   <%-- Prompt page dhtml mode needs this javascript --%>
   <web:resource type="javascript" name="Calendar.js"/>
   <web:resource type="javascript" name="updateManager.js"/>
   <web:resource type="javascript" name="PromptFunctions.js"/>
   <jsp:include page='/jsp/Prompt_Links.jsp' flush="true" />
 </web:then>
 <web:else>
  <%-- DHTML.js is necessary when HTML mode is On and current report is prompted which is waiting for user's input --%>
   <web:resource type="javascript" name="DHTML.js"/>

                <%-- Special fix for Netscape-based Browsers to display prompts correctly --%>
                <%-- issue 234010 --%>
                <web:ifFeature name="netscape">
                    <web:then>
                        <style type="text/css">
            table.mstrVerticalDocks {
                                table-layout: fixed !important;
            }
        </style>
                    </web:then>
                </web:ifFeature>
 </web:else>
 </web:ifFeature>
 <web:resource type="style" name="mstr/pagePrompts.css"/> <%-- this css will be loaded by PromptsClassicTransform.java --%>
</web:then>
<web:else>
    <%-- For XML Status other than 6 --%>
    <%-- DHTML Mode? --%>
    <web:ifFeature name="dhtml">
        <web:then>
            <web:resource type="jsbundle" bundleName="bone-report" location="head"/>
            <web:resource type="js-style" name="mojo/css/dde.css" />
          
            <web:ifFeature name="quick-search-enabled;!is-view-report;!xda-customsql-report;!xda-mdx-report;report-template-search" type="bean" value="frame.rb">
            <web:then>
                    <!-- Report Template Search Resources -->
                    <script type='text/javascript'>
                    window.mstrApp.maxSearchResults = '<web:value type="preference" name="maxSearchResults" />';
                    window.mstrApp.objectsBlockCount = '<web:value type="preference" name="objectsBlockCount" />';
                    window.mstrApp.elementsBlockCount = '<web:value type="preference" name="elementsBlockCount" />';
                    window.mstrApp.gridSearchObjectTypes = '<web:value type="preference" name="gridSearchObjectTypes" />';
                    </script>
            </web:then>
            </web:ifFeature>
            <web:ifFeature name="auto-recover-objects"><web:then>
                <web:scriptlet>
                    mstrApp.maxSessionIdleTime = <web:value type="misc" name="maxSessionIdleTime"/>;
                    mstrApp.timeBeforeSessionTimeoutWarning = <web:value type="preference" name="timeBeforeSessionTimeoutWarning"/>;
                    mstrApp.enableWarningSessionTimeout = <web:value type="preference" name="enableWarningSessionTimeout"/>;
                    mstrLocalStorage.setItem("lastMsgRecoveryInfo" + mstrConfig.lastMsgKey, '<web:beanValue property="lastMsgRecoveryInfo"/>');
                </web:scriptlet>
            <web:resource type="javascript" name="mstrSessionManager.js"/>
            </web:then></web:ifFeature>

            <%--Recent Objects Feature --%>
            <web:resource type="javascript" name="libraries/html2canvas.js"/>
            <web:scriptlet>
                mstrLocalStorage.addRecentObjectInfo('<web:beanValue property="lastMsgRecoveryInfo"/>');
            </web:scriptlet>

            <!-- JUIL css files (required) -->
             <web:resource type="style" name="mstr/widgets.css"/>

            <web:scriptlet>
                    self.submitLink = function submitLink(oAnchor) {
                    var sTarget; sTarget = oAnchor.target;
                    <%-- // #405410 if attribute iframe is present add it to the href --%>
                    if (oAnchor.getAttribute && oAnchor.getAttribute("useIframe")) oAnchor.href = replaceURLParameter(oAnchor.href, "iframe", "true");
                    //submit always using a form so max state is submitted:
                    var oForm = createDynamicForm(oAnchor.href);
                    if (sTarget) oForm.target = sTarget;
                    submitForm(oForm);
                    return false;
                }
            </web:scriptlet>
        </web:then>
        <web:else>
                <web:ifFeature name="accessibility"><web:then>
					<web:ifFeature name="auto-recover-objects"><web:then>
					    <script>
					        mstrApp.maxSessionIdleTime = <web:value type="misc" name="maxSessionIdleTime"/>;
					        mstrApp.timeBeforeSessionTimeoutWarning = <web:value type="preference" name="timeBeforeSessionTimeoutWarning"/>;
					        mstrApp.enableWarningSessionTimeout = <web:value type="preference" name="enableWarningSessionTimeout"/>;
                            mstrApp.is508 = true;
                            mstrApp.name ='<web:value type="config" name="servletDeploymentName"/>';
                            mstrApp.mstrDescs = <web:bundleDescriptor name="mojo-bootstrap,mojo-session-manager"/>;
					    </script>

                        <script src="../javascript/bundles/bone-global.js"></script>
					    <script src="../javascript/mstrSessionManager.js"></script>
					</web:then></web:ifFeature>
                </web:then></web:ifFeature>
        </web:else>
    </web:ifFeature>

    <web:resource type="style" name="mstr/pageReport.css"/>
</web:else>
</web:ifBeanValue>
