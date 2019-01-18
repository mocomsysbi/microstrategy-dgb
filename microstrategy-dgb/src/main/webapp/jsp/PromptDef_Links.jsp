 <%
 /****
  * PromptDef_Links.jsp
  * This page includes the link definitions that should be added for the
  * page of Prompt Definition Editor
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
<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />
<web:resource type="javascript" name="bone.js"/>
<web:resource type="javascript" name="editor.js"/>
<web:resource type="javascript" name="dialog.js"/>
<web:resource type="javascript" name="tab.js"/>
<web:resource type="javascript" name="TabManager.js"/>
<web:resource type="javascript" name="Cart.js"/>

<web:resource type="javascript" name="number.js"/>
<web:resource type="javascript" name="serializer.js"/>
<web:resource type="javascript" name="updateManager.js"/>
<web:resource type="javascript" name="updateManagerEventsPrompt.js"/>
<web:resource type="javascript" name="updateManagerEventsReport.js"/>
<web:resource type="javascript" name="updateManagerEventsRW.js"/>
<web:resource type="javascript" name="updateManagerEventsDocument.js"/>
<web:resource type="javascript" name="promptDefTab.js"/>
<web:resource type="javascript" name="promptDefTabManager.js"/>
<web:resource type="javascript" name="promptDefCommands.js"/>
<web:resource type="javascript" name="constantPromptDefCommands.js"/>
<web:resource type="javascript" name="objectsPromptDefCommands.js"/>
<web:resource type="javascript" name="elementsPromptDefCommands.js"/>
<web:resource type="javascript" name="expressionPromptDefCommands.js"/>
<web:resource type="javascript" name="promptDef.js"/>
<web:resource type="javascript" name="selections.js"/>
<web:resource type="javascript" name="mstrObjectBrowserImpl.js"/>
<web:resource type="javascript" name="singleObjectSelector.js"/>
<web:resource type="javascript" name="mask.js"/>
<web:resource type="javascript" name="mstrReportObjectsImpl.js"/>
<web:resource type="javascript" name="mstrProjectBrowserImpl.js"/>
<web:resource type="javascript" name="objSelProjectBrowser.js"/>
<web:resource type="javascript" name="mstrPromptMultipleObjSelectorImpl.js"/>
<web:resource type="javascript" name="PromptFunctions.js"/>
<web:resource type="javascript" name="mstrObjectExplorerImpl.js"/>
<web:resource type="javascript" name="mstrSaveAsEditorImpl.js"/>

<jsp:include page='/jsp/Prompt_Links.jsp' flush="true" /> 

<web:resource type="style" name="mstr/pagePrompts.css"/>
<web:resource type="style" name="mstr/pageFilter.css"/>
<web:resource type="style" name="mstr/pageTabManager.css"/>
<script language="JavaScript">
self.submitLink = function submitLink(oAnchor) {
    var sTarget; sTarget = oAnchor.target;
    //submit always using a form so max state is submitted:
    var oForm = createDynamicForm(oAnchor.href);
    if (sTarget) oForm.target = sTarget;
    submitForm(oForm);
    return false;
}
</script>
