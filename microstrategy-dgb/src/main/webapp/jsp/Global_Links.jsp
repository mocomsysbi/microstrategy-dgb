<%
 /****
  * Global_Links.jsp
  * This file is used to include all css and js files required in
  * all pages.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="Error_Links.jsp"
%><%@ page contentType="text/html"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%--These includes should eventually be removed. They're currently kept for backwards compatibility: --%>

<jsp:include page='/jsp/Mojo_Config.jsp' flush="true"/>
<script type='text/javascript'>
// Append application specific config.
mstrConfig.simpleDialog = false;
<web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
    mstrConfig.validateRandNum = '<web:value type="httpSession" name="validateRandNum"/>';
</web:then></web:ifFeature>
<web:ifFeature type="preference" name="showPreviews"><web:then>
	mstrConfig.showPreviews = '<web:value type="preference" name="showPreviews" />' == '1';
</web:then><web:else>
	mstrConfig.showPreviews = false;
</web:else></web:ifFeature>

window.mstrAppOnSessionExpired = function() {
    var f = document.getElementById('formRefresh');
    if (f) {
        submitForm(f);
    }
};

window.isEdgeModeEnabled = '<web:value type="systemPreferenceEncoded" name="useIEEdgeMode" />' == '1';

window.mstrApp = {
		name: '<web:value type="config" name="servletDeploymentName"/>',		
        taskURL: '<web:taskProcessorName />',
        <web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
            validateRandNum: '<web:value type="httpSession" name="validateRandNum"/>',
        </web:then></web:ifFeature>
        mstrDescs: <web:bundleDescriptor name="mojo-bootstrap,mojo-coreui,mojo-starburst"/>,
        onSessionExpired: window.mstrAppOnSessionExpired
};

</script>

<web:resource type="style" name="mstr/fsm.css"/>
<web:ifFeature name="not-flash-full-screen-mode"><web:then>
    <web:resource type="style" name="mstr/mstr.css"/>
</web:then></web:ifFeature>
<%-- Load theme style --%>
<web:ifFeature name="only-load-theme-specific-css"><web:then>
    <web:resource type="theme-specific-style"/>
</web:then><web:else>
    <web:resource type="all-themes-style"/>
</web:else></web:ifFeature>
<web:ifFeature name="accessibility"><web:then>
    <web:resource type="style" name="mstr/508.css"/>
</web:then></web:ifFeature>


<%-- statistics on Screen --%>
<web:ifFeature type="systemPreference" name="statisticsMode" value="8"><%--OFF --%>
<web:else>
    <web:ifFeature type="systemPreference" name="statisticsMode" value="2"><%-- File --%>
    <web:else> <%--Screen --%>
        <web:resource type="style" name="mstr/mstrStats.css"/>
    </web:else>
    </web:ifFeature>
</web:else>
</web:ifFeature>


<%-- if document domain is defined, set the domain, regardless the dhtml feature. --%>
<web:ifFeature type="config" name="jsDocumentDomain">
<web:then><web:javascript type="domain" /></web:then>
</web:ifFeature>


<%--
 Check if the user has the DHTML preference turned on to determine whether
  the page should load some JavaScript functions.

 <web:ifFeature name="dhtml">
     [JavaScript code]
 </web:ifFeature>
--%>
<web:ifFeature name="dhtml"><web:then>

<%--Load Javascript required by each page --%>
<web:resource type="jsbundle" bundleName="bone-global" location="head"/>
<web:resource type="jsbundle" bundleName="mojo-bootstrap" location="head"/>
<web:resource type="javascript" name="mstrLocalStorage.js"/>
<web:resource type="javascript" name="mstrSessionStorage.js"/>

<script language="JavaScript">
try { document.execCommand("BackgroundImageCache", false, true); } catch(err) {}
</script>

<web:ifFeature type="systemPreference" name="includeSessionUrl">
<web:then>
    <web:scriptlet>
        if (typeof(microstrategy) != 'undefined') {
            microstrategy.sessionState = '<web:connectionValue property="sessionState"/>';
        }
    </web:scriptlet>
</web:then>
</web:ifFeature>

<web:ifFeature name="ddMenu" type="preference" value="0">
<web:then>
    <web:scriptlet>
         if (typeof(microstrategy) != 'undefined') {
             microstrategy.menuHover = true;
         }
    </web:scriptlet>
</web:then>
</web:ifFeature>


<%-- statistics on Screen --%>
<web:ifFeature type="systemPreference" name="statisticsMode" value="8"><%--OFF --%>
<web:else>
    <web:ifFeature type="systemPreference" name="statisticsMode" value="2"><%-- File --%>
    <web:else> <%--Screen --%>
        <web:resource type="javascript" name="mstrStats.js" />
    </web:else>
    </web:ifFeature>
</web:else>
</web:ifFeature>


</web:then></web:ifFeature>

<web:ifFeature type="systemPreference" name="webTestAuto" value="true"><%--OFF --%>
<web:then>
    <web:resource type="javascript" name="mstrTestAuto.js" />
</web:then></web:ifFeature>
