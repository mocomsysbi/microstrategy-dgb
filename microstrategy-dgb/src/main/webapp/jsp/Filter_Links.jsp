<%
 /****
  * Filter_Links.jsp
  * This page includes the link definitions that should be added for the
  * folder pages to look properly
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="Error_Links.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<web:resource type="js-style" name="mojo/css/cge.css"/>

<web:resource type="style" name="mstr/pagePrompts.css"/>
<web:resource type="style" name="mstr/widgets.css"/>
<web:resource type="style" name="mstr/pageFilter.css"/>

<web:ifFeature name="dhtml">
	<web:then>
		<web:resource type="javascript" name="serializer.js"/>
		<web:resource type="javascript" name="updateManager.js"/>
		<web:resource type="javascript" name="mstrRWUnitBone.js"/>
		<web:resource type="javascript" name="dropdown.js"/>
		<web:resource type="javascript" name="toolbar.js"/>
		<web:resource type="javascript" name="tab.js"/>
		<web:resource type="javascript" name="selections.js"/>
		<web:resource type="javascript" name="mask.js"/>
		<web:resource type="javascript" name="maskMapped.js"/>
		<web:resource type="javascript" name="colResizeImpl.js"/>

		<web:resource type="javascript" name="mstrGridStatic.js"/>
		<web:resource type="javascript" name="mstrGridReport.js"/>
		<web:resource type="javascript" name="mstrGridRW.js"/>

		<web:resource type="javascript" name="gridMapper.js"/>
		<web:resource type="javascript" name="template.js"/>
		<web:resource type="javascript" name="tableUtils.js"/>

		<web:resource type="javascript" name="number.js"/>
		<web:resource type="javascript" name="Drill.js"/>
		<web:resource type="javascript" name="IncrementalFetchCheckBoxes.js"/>
		<web:resource type="javascript" name="obReportObjs.js"/>
		<web:resource type="javascript" name="tree.js"/>
		<web:resource type="javascript" name="objectBrowser.js"/>
		<web:resource type="javascript" name="NCScripts.js"/>
		<web:resource type="javascript" name="features.js"/>
		<web:resource type="javascript" name="mstrObjectBrowserImpl.js"/>
		<web:resource type="javascript" name="updateManagerEventsReport.js"/>
		<web:resource type="javascript" name="TabManager.js"/>
		<web:resource type="javascript" name="Cart.js"/>
		<web:resource type="javascript" name="updateManagerEventsPrompt.js"/>
		<web:resource type="javascript" name="promptDefTab.js"/>
		<web:resource type="javascript" name="promptDefTabManager.js"/>
		<web:resource type="javascript" name="promptDefCommands.js"/>
		<web:resource type="javascript" name="constantPromptDefCommands.js"/>
		<web:resource type="javascript" name="objectsPromptDefCommands.js"/>
		<web:resource type="javascript" name="elementsPromptDefCommands.js"/>
		<web:resource type="javascript" name="expressionPromptDefCommands.js"/>
		<web:resource type="javascript" name="promptDef.js"/>
		<web:resource type="javascript" name="singleObjectSelector.js"/>
		<web:resource type="javascript" name="mstrReportObjectsImpl.js"/>
		<web:resource type="javascript" name="mstrProjectBrowserImpl.js"/>
		<web:resource type="javascript" name="mstrReportAllObjectsImpl.js"/>
		<web:resource type="javascript" name="mstrFilterObjectsImpl.js"/>
		<web:resource type="javascript" name="objSelProjectBrowser.js"/>
		<web:resource type="javascript" name="mstrPromptMultipleObjSelectorImpl.js"/>
		<web:resource type="javascript" name="PromptFunctions.js"/>

		<%-- JUIL javascript files (required) --%>
		<web:resource type="javascript" name="mstr/core.js"/>
		<web:resource type="javascript" name="mstr/common.js"/>
		<web:resource type="javascript" name="mstr/trees.js"/>
		<web:resource type="javascript" name="mstr/prompts.js"/>

		<!-- update manager -->
		<web:resource type="javascript" name="updateManagerEventsPrompt.js"/>

		<script type='text/javascript'>
		    window.mstrApp = {
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

		        jsRoot: '../javascript/',   <%-- TODO: Need to send down actual value --%>
		        jsMojoRoot: '../javascript/mojo/js/source/',
		        mstrDescs : {},
		        onSessionExpired: window.mstrAppOnSessionExpired
		    };

			self.submitLink = function submitLink(oAnchor) {
			    var sTarget; sTarget = oAnchor.target;
			    //submit always using a form so max state is submitted:
			    var oForm = createDynamicForm(oAnchor.href);
			    if (sTarget) oForm.target = sTarget;
			    submitForm(oForm);
			    return false;
			}
		</script>

		<web:resource type="js-style" name="mojo/css/core.css"/>
		<web:resource type="js-style" name="mojo/css/filter.css"/>
		<web:resource type="js-style" name="mojo/css/dde.css"/>
	</web:then>
</web:ifFeature>

