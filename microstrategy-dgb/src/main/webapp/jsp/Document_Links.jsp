<%
 /****
  * Document_Links.jsp
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

<%--
 Check if the user has the DHTML preference turned on to determine whether
  the page should load some JavaScripr functions.

 <web:ifFeature name="dhtml">
     [JavaScript code]
 </web:ifFeature>
--%>
<%-- DHTML.js is necessary when HTML mode is On and current document is prompted which is waiting for user's input --%>
<web:ifBeanValue bean="db" property="getXMLStatus" value="6"><web:then>
<web:ifFeature name="dhtml"><web:then>
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
<web:ifFeature name="dhtml"><web:then>
<web:resource type="javascript" name="Menu.js"/>
<web:resource type="javascript" name="htmlDocumentMenu.js"/>
<web:resource type="javascript" name="Filter2.js"/>
<web:resource type="javascript" name="NCScripts.js"/>
<web:resource type="javascript" name="errors.js"/>
<web:resource type="javascript" name="dialog.js"/>
<web:resource type="javascript" name="HTMLAttributes.js"/>
<web:resource type="javascript" name="editor.js"/>
<web:resource type="javascript" name="dropdown.js"/>
<web:resource type="javascript" name="toolbar.js"/>
<web:resource type="javascript" name="updateManager.js"/>
<web:resource type="javascript" name="serializer.js"/>
<web:resource type="javascript" name="contactsEditor.js"/>
<web:resource type="javascript" name="selections.js"/>
<web:ifFeature name="auto-recover-objects"><web:then>
    <web:scriptlet>
        mstrApp = mstrApp || {};
        mstrApp.name = '<web:value type="config" name="servletDeploymentName"/>';
        mstrApp.maxSessionIdleTime = <web:value type="misc" name="maxSessionIdleTime"/>;
        mstrApp.timeBeforeSessionTimeoutWarning = <web:value type="preference" name="timeBeforeSessionTimeoutWarning"/>;
        mstrApp.enableWarningSessionTimeout = <web:value type="preference" name="enableWarningSessionTimeout"/>;
        mstrLocalStorage.setItem("lastMsgRecoveryInfo" + mstrConfig.lastMsgKey, '<web:beanValue property="lastMsgRecoveryInfo"/>');
    </web:scriptlet>
    <web:resource type="javascript" name="mstrSessionManager.js"/>
</web:then></web:ifFeature>
    <%--Recent Objects feature --%>
    <web:scriptlet>
        mstrApp = mstrApp || {};
        mstrApp.features = {
            <web:value type="features" name="showPreviews"/>
        };
        mstrLocalStorage.addRecentObjectInfo('<web:beanValue property="lastMsgRecoveryInfo"/>');
    </web:scriptlet>

</web:then></web:ifFeature>

<web:ifFeature name="lTbar" type="browserSetting" value="1"><web:then>
</web:then></web:ifFeature>
<web:resource type="style" name="mstr/pageDocument.css"/>
</web:else>
</web:ifBeanValue>

