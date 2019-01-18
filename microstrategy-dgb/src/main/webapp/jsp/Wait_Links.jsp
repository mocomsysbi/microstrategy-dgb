<%
    /*
     * Wait_Links.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>
<%@ page errorPage="Error_Links.jsp"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<web:beanValue name="smartBanner" property="Output"/>

<web:resource type="style" name="mstr/fsm.css"/>
<web:resource type="style" name="mstr/mstr.css"/>
<%-- Load theme style --%>
<web:ifFeature name="only-load-theme-specific-css"><web:then>
    <web:resource type="theme-specific-style"/>
</web:then><web:else>
    <web:resource type="all-themes-style"/>
</web:else></web:ifFeature>
<web:resource type="style" name="mstr/pageWait.css"/>
<web:ifFeature name="accessibility"><web:then>
    <web:resource type="style" name="mstr/508.css"/>
</web:then></web:ifFeature>


<%-- if document domain is defined, set the domain, regardless the dhtml feature. --%>
<web:ifFeature type="config" name="jsDocumentDomain">
<web:then><web:javascript type="domain" /></web:then>
</web:ifFeature>

<script type='text/javascript'>
    window.isEdgeModeEnabled = '<web:value type="systemPreference" name="useIEEdgeMode"/>' == '1';
</script>
<web:ifFeature name="dhtml"><web:then>
    <web:resource type="jsbundle" bundleName="bone-global" location="head"/>
	<web:resource type="javascript" name="dropdown.js"/>
</web:then></web:ifFeature>

