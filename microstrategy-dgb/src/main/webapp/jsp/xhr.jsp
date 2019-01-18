<%
/*
* xhr.jsp
* Copyright 2009 MicroStrategy Incorporated. All rights reserved.
*/
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>
<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>
<script>
    var msgRecoveryInfo = '<web:beanValue property="lastMsgRecoveryInfo"/>';
    if (msgRecoveryInfo) {
       mstrLocalStorage.setItem("lastMsgRecoveryInfo" + mstrConfig.lastMsgKey, msgRecoveryInfo);
    }
</script>

<div id="mstrWeb_error" NAME="mstrWeb_error" IFRAME="true">
     <jsp:include page='<%=mstrPage.getTemplateInfo().getSection("error")%>' flush="true" />
</div>
{status:'<web:beanValue property="XMLStatus"/>', title:'<web:beanValue property="title" encode="true"/><web:descriptor key="mstrWeb.8965" desc=". MicroStrategy 9" />', <web:ifBeanValue property="getXMLStatus" value="3"><web:then>script:'<web:javascript eventName="onload" jsEncode="true"/>',</web:then></web:ifBeanValue><web:ifBeanValue property="getXMLStatus" value="2"><web:then><web:wait displayMode="json"/>,</web:then></web:ifBeanValue>components:[<web:displayGuiComponent displayMode="json"/><web:ifBeanValue property="getXMLStatus" value="4"><web:else><web:ifFeature name="dhtml"><web:then><web:scriptPageState updateWindow="false" displayMode="json"/></web:then></web:ifFeature></web:else></web:ifBeanValue><web:ifTemplateValue property="show-wait"><web:then>{id:'mstrWeb_wait_body', content:'<div class=\"mstrWaitBoxBody <web:ifBeanValue property="getXMLStatus" value="2"><web:then>mstrDialogBone</web:then></web:ifBeanValue>\" id=\"mstrWeb_wait_body\" name=\"mstrWeb_wait_body\"><web:ifBeanValue property="getXMLStatus" value="2"><web:then><div class=\"mstrIcon-wait\"><div class=\"mstrIcon-close-wait\" onmousedown=\"window.parent.iframe.stopWindow();hasLoaded=false;\" <web:descriptor attribute="title" key="mstrWeb.221" desc="Cancel" />></div></div><div><div class=\"mstrWaitBoxStatus\"><web:descriptor key="mstrWeb.91" desc="Current status:" jsEncode="true"/><web:descriptor type="status" jsEncode="true"/></div><div class=\"mstrSpacer\"></div></div><web:wait type="buttons" displayMode="json"/></web:then><web:else><div><div class=\"mstrIcon-wait\"><div class=\"mstrIcon-close-wait\" onmousedown=\"window.parent.iframe.stopWindow();hasLoaded=false;\" <web:descriptor attribute="title" key="mstrWeb.221" desc="Cancel" />></div></div><div class=\"mstrSpacer\"></div></div></web:else></web:ifBeanValue><div class=\"mstrSpacer\"></div></div>'},</web:then></web:ifTemplateValue>{id:'mstrInlineScripts', content:'<div id=\"mstrInlineScripts\"><span>&nbsp;<\/span><web:resourceMgr type="scriptFiles" jsEncode="true"/><web:resourceMgr type="inlineScripts" jsEncode="true"/><\/div>'},<web:logging action="statistics" displayMode="json"/>]
}