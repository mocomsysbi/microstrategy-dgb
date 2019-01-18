<%
    /*
     * Login_Links.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Links.jsp"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>

<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>
<%--
 Display the "links" section of the template as specified in pageConfig.xml (i.e. Admin_Links.jsp)
 <jsp:include page="[a page section]" />
--%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />
<web:beanValue name="smartBanner" property="Output"/>
<web:clientSideDescriptor IDs="14138,14140" />

<script type="text/javascript" >
    // Set common config properties for most applications
    mstrConfig.isUsherAuthVisible = <web:ifFeature type="preference" name="enableUsherAuthenticationOption"><web:then>true</web:then><web:else>false</web:else></web:ifFeature>;

    mstrConfig.enabledAuthMode = <web:beanValue name="lb" property="availableAuthenticationModes"/>;
    mstrConfig.defaultLoginMode = <web:beanValue name="lb" property="defaultAuthenticationMode"/>;
    mstrConfig.serverName = '<web:connectionValue property="serverName"/>';
    mstrConfig.projectName = '<web:connectionValue property="projectName"/>';
    
    mstrConfig.serverPort = '<web:connectionValue property="serverPort"/>';
    mstrConfig.authMode = '<web:connectionValue property="authenticationMode"/>';
    
    mstrConfig.usherRegistrationOption = parseInt('<web:connectionValue property="usherRegistrationOption"/>', 10);
    mstrConfig.usherRegistrationDomain = '<web:connectionValue property="usherRegistrationDomain"/>';
    
    <%-- // login first. For such cases ConnectionValueTag returns "- none -" as serverName instead of empty value. --%>
    if(<web:value type="systemPreference" name="loginFirst"/>) {
    	mstrConfig.serverName = '';
    }
    
    window.mstrApp.mstrDescs = <web:bundleDescriptor name="mojo-bootstrap,mojo-usher"/>;
</script>

<web:resource type="js-style" name="mojo/css/core.css" />
<web:resource type="style" name="mstr/pageLogin.css"/>

<web:resource type="jsbundle" bundleName="mojo-bootstrap" />
<web:resource type="jsbundle" bundleName="mojo-usher"/>
<%--
<web:resource type="javascript" name="mojo/js/source/UsherLogin.js"/>
--%>
<web:resource type="javascript" name="loginUtils.js"/>
<web:scriptlet>
   mstrApp = mstrApp || {};
   mstrApp.qrCodeLifeInSeconds =  <web:value type="misc" name="usherQRCodeLife" />  ;
</web:scriptlet>

<web:ifFeature name="dhtml">
  <web:then>
    <web:scriptlet>
        <%--
        // Automatic Session Recovery: Set an session scope flag to be checked at applicable Folder page
        //  whether user comes to this page for the first time after log in
        //  --- True: it will allow to continue processing last message Notification display.
        //  --- False: last message will not display.
        // Once browser tab/window closes, this sessionStorage item will be deleted by browser.
        --%>
        if (window.sessionStorage) {
           window.sessionStorage.setItem('msg_user_login', 1);
        }
    </web:scriptlet>
  </web:then>
</web:ifFeature>
