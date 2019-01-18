        <%
 /****
  * RW_Links.jsp
  * This page includes the link definitions that should be added for the
  * page of Report Writing Documents
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="Error_Links.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"%><%
  PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");
%>
            <web:beanValue name="smartBanner" property="Output"/>
<web:resource type="js-style" name="mojo/css/core.css" />
<web:resource type="js-style" name="mojo/css/rw.css"/>
<web:resource type="js-style" name="mojo/css/transactionEditor.css" />
<web:resource type="js-style" name="mojo/css/docViewsEditor.css" />
<web:resource type="js-style" name="mojo/css/cge.css"/>

<web:ifFeature name="rw-analysis-view-mode" type="bean" value="rwframe">
    <web:then>
	    <style type="text/css">
		  .mstrWeb .mstrDockTop {
		    padding-bottom: 0 !important; /*reduce bottom shadow effect to make VI Doc touch the toolbar without visual gap in between, espeically in dark theme*/
		  }
		</style>
    </web:then>
</web:ifFeature>

<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<%-- Are we in a Prompted RWD? --%>
<web:ifBeanValue bean="rwframe.rwb" property="getXMLStatus" value="6">
    <web:then>
        <%-- In DHTML Mode? --%>
        <web:ifFeature name="dhtml">
            <web:then>
                <%-- Prompt page dhtml mode needs this javascript --%>
                <web:resource type="javascript" name="Calendar.js"/>
                <web:resource type="javascript" name="serializer.js"/>
                <web:resource type="javascript" name="updateManager.js"/>
                <web:resource type="javascript" name="PromptFunctions.js"/>
                <jsp:include page='/jsp/Prompt_Links.jsp' flush="true" />
            </web:then>
            <web:else>
                <%-- DHTML.js is necessary when HTML mode is On and current report is prompted which is waiting for user's input --%>
                <web:resource type="javascript" name="DHTML.js"/>
            </web:else>
        </web:ifFeature>
        <web:resource type="style" name="mstr/pagePrompts.css"/>
    </web:then>
    <web:else>
        <%-- For cases when XMLStatus != 6 --%>
        <%-- These are only necessary if editing is enabled --%>

        <%-- Files for the new look and feel --%>
        <web:resource type="style" name="mstr/pageRW.css"/>
         <%-- #358599 - avoid narrow window wrapping menubar  --%>
        <web:ifFeature name="IE7">
            <web:then>
                 <style type="text/css">
                       .mstrDockTop {position: relative !important; z-index: 105;}

                       <%-- // TQMS# 768266 - ribbon toolbar disappear when mouseover --%>
                       .mstrDockTopContainer {position: relative;}

                       <web:ifFeature type="bean" name="rw-flash-view-mode;page-full-screen-mode;"  value="rwframe"><web:then>
                            .mstrToolbar2End {position: absolute;}
                       </web:then></web:ifFeature>
                 </style>
             </web:then>
        </web:ifFeature>

        <%-- Are we in DHTML mode? --%>
        <web:ifFeature name="dhtml">
            <web:then>
                <script>
                    var mstrApp = {
                        name: '<web:value type="config" name="servletDeploymentName"/>',
                        pageName: '<web:beanValue property="name"/>',
                        isHomePage: <web:value type="requestKey" name="isHomePage" />,
                        <web:ifFeature name="useCookies"><web:then></web:then><web:else>
                            httpSessionId: '<web:connectionValue property="containerSessionId" />',
                            addJSessionIdToURL: <web:connectionValue property="addJSessionIdToURL" />,
                        </web:else></web:ifFeature>
                        sessionState:'<web:connectionValue property="sessionState"/>',
                        localeId: '<web:connectionValue property="locale"/>',
                        helpUrl: '<web:value type="systemPreference" name="helpUrl" />',
                        upgradeHelpUrl: '<web:value type="systemPreference" name="upgradeHelpUrl" />',
                        optimizeFitToPage : <web:value type="systemPreference" name="optimizeFitToPage"/>,
                        units: '<web:value type="misc" name="units"/>',
                        unitsLabel: '<web:value type="misc" name="unitsLabel"/>',
                        serverName: '<web:connectionValue property="serverName"/>',
    					projectName: '<web:connectionValue property="projectName"/>',
    					projectAlias: '<web:connectionValue property="projectAlias"/>',
 						serverPort: '<web:connectionValue property="serverPort"/>',
 						pendingMojoEditor: '<web:value type="requestKey" name="oe"/>',
                        pathInfo: <web:displayBean beanName="pathBean" styleName="MojoPathStyle"/>,
                        preferences: {
                            startPage: '<web:value type="preference" name="startPage"/>'
                        },
                        objectsBlockCount: '<web:value type="preference" name="objectsBlockCount" />',
                        elementsBlockCount: '<web:value type="preference" name="elementsBlockCount" />',
                        jsRoot: '../javascript/',   <%-- TODO: Need to send down actual value --%>
                        jsMojoRoot: '../javascript/mojo/js/source/',
                        mstrDescs : <web:bundleDescriptor name="mojo-bootstrap,mojo-txe,mojo-tc,mojo-fe,mojo-dae,mojo-session-manager,mojo-starburst,mojo-theme,mojo-vis-props"/>,
                        onSessionExpired: window.mstrAppOnSessionExpired,
                        rememberLastEditorPanel : '<web:beanValue bean="accordion" property="rememberLastEditorPanel"/>',
                        getThousandSep: function () {
                            return mstrConfig.thousandsSep;
                        },
                        getDecimalSep: function () {
                            return mstrConfig.decimalSep;
                        },
                        getMsgID: function() {
                            return microstrategy.getViewerBone().messageID;
                        },
                        getLastMsgRecoveryInfo: function (){ return '<web:beanValue property="lastMsgRecoveryInfo"/>';},
                        oi: {
                            objId: '<web:beanValue bean="rwb" property="objectID" encode="true"/>',
                            objType: '<web:beanValue bean="rwb" property="objectType"/>'
                        },
                        features: {
                            <web:value type="features" name="create-analysis,run-vi-flash,run-vi-smart,IE9Pre,showPreviews"/>
                        },

                        /**VisPropsEditor workaround: **/
                        customization: {
                            getCustomThresholds: function () {return <web:value type="misc" name="customThresholds"/>;}
                        }
                        /**End: VisPropsEditor **/
                    };
                </script>

                <web:ifFeature type="bean" value="rwframe" name="rw-interactive-view-mode-full-screen-reporter">
                    <web:then>
                    <web:resource type="jsbundle" bundleName="bone-rw-ivm-fullscreen-reporter" />
                    </web:then>
                    <web:else>
                        <web:ifFeature type="bean" name="rw-flash-view-mode;page-full-screen-mode;"  value="rwframe"><web:else>
                            <web:resource type="style" name="mstr/widgets.css"/>
                        </web:else></web:ifFeature>

                        <web:ifBeanValue bean="rwframe.rwb" property="getXMLStatus" value="2">
                        <web:else>
                            <%-- Are we in Interactive, Editable or Design Modes? --%>
                            <web:ifFeature type="bean" value="rwframe" name="rw-interactive-view-mode-eplus">
                                <web:then>
	                                 <web:ifFeature type="bean" value="rwframe" name="rw-editable-view-mode-eplus">
	                                 <web:then>
	                                     <%--RW Design Mode or Editable View Mode --%>
	                                     <web:resource type="jsbundle" bundleName="bone-rw-evm" />
	                                 </web:then>
	                                 <web:else>
	                                     <%--RW Interactive View Mode Only --%>
	            	                     <web:resource type="jsbundle" bundleName="bone-rw-ivm" />
	                                 </web:else>
	                                 </web:ifFeature>
                                </web:then>
                                <web:else>
                                    <%-- Flash VI --%>
                                    <web:ifFeature type="bean" value="rwframe" name="rw-analysis-dashboard-view-mode">
                                    <web:then>
                                        <%--RW Analysis Document - Flash VI --%>
                                        <web:resource type="jsbundle" bundleName="bone-rw-vi" />
                                    </web:then>
                                    <web:else>
	                                    <web:ifFeature  type="bean" value="rwframe" name="rw-flash-view-mode">
	                                    <web:then>
	                                        <%--RW Flash View Mode Only --%>
	                                        <web:resource type="jsbundle" bundleName="bone-rw-flash" />
	                                    </web:then>
	                                    <web:else>
                                           <web:ifFeature type="bean" value="rwframe" name="is-doc-visualization-mode;rw-static-view-mode">
                                               <web:then>
                                                    <%-- RW Document is in visualization Mode --%>
                                                    <web:resource type="jsbundle" bundleName="bone-rw-flash" />
                                               </web:then>
                                               <web:else>
                                                   <web:ifFeature type="bean" value="rwframe" name="rw-static-view-mode">
                                                       <web:then>
                                                            <%-- RW Document is in visualization Mode --%>
                                                            <web:resource type="jsbundle" bundleName="bone-rw-static" />
                                                       </web:then>
                                                   </web:ifFeature>
                                               </web:else>
                                           </web:ifFeature>
                                        </web:else>
	                                    </web:ifFeature>
                                    </web:else>
                                    </web:ifFeature>
                                </web:else>
                            </web:ifFeature>
                        </web:else>
                        </web:ifBeanValue>

                    </web:else>
                </web:ifFeature>
                <web:ifFeature name="auto-recover-objects">
                    <web:then>
                        <web:scriptlet>
                            mstrApp.maxSessionIdleTime = <web:value type="misc" name="maxSessionIdleTime"/>;
                            mstrApp.timeBeforeSessionTimeoutWarning = <web:value type="preference" name="timeBeforeSessionTimeoutWarning"/>;
                            mstrApp.enableWarningSessionTimeout = <web:value type="preference" name="enableWarningSessionTimeout"/>;
                            mstrLocalStorage.setItem("lastMsgRecoveryInfo" + mstrConfig.lastMsgKey, '<web:beanValue property="lastMsgRecoveryInfo"/>');
                        </web:scriptlet>
                        <web:resource type="javascript" name="mstrSessionManager.js"/>
                    </web:then>
                </web:ifFeature>

                <%--Recent Objects Feature --%>
                <web:resource type="javascript" name="libraries/html2canvas.js"/>
                <web:scriptlet>
                    mstrLocalStorage.addRecentObjectInfo('<web:beanValue property="lastMsgRecoveryInfo"/>');
                </web:scriptlet>

                <web:scriptlet>
                self.submitLink = function submitLink(oAnchor) {

                    var sTarget; sTarget = oAnchor.target;
                    //submit always using a form so max state is submitted:
                    var oForm = createDynamicForm((oAnchor.getAttribute && oAnchor.getAttribute('hv')) || oAnchor.href);
                    if (sTarget) oForm.target = sTarget;
                    submitForm(oForm);
                    if(window.event) {
                        window.event.cancelBubble  = true;
                    }
                    return false;
                }
                </web:scriptlet>
            </web:then>
        </web:ifFeature>

    </web:else>
</web:ifBeanValue>

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
