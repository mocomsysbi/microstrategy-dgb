<%
 /****
  * AndroidApp.jsp
  * This page is a template for the Android Application content.
  *
  * Copyright 2010 MicroStrategy Incorporated. All rights reserved.
  * version: 1.0
  * xhtml: true
  ****/
%>
<%@ page errorPage="JSP_Error.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<div id="mainApp"></div>
<jsp:include page='/jsp/Mojo_Config.jsp' flush="true"/>
<script type="text/javascript"> 
          // Append application specific config.
          mstrConfig.jsLibs = '../javascript-libraries/';
          mstrConfig.mstrDescs = <web:bundleDescriptor name="mojo-coreui,android-app-hosted"/>;
</script>

<script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script> 

<%-- Include the Mojo JavaScript bundles! --%>
<web:resource type="jsbundle" bundleName="mojo-coreui" debugBundleName="mojo-coreui-debug" />
<web:resource type="jsbundle" bundleName="android-app-hosted" />

<script type="text/javascript">     
          //Set application globals.
          mstrApp = new mstrmojo.MobileApp({
              id: 'mobileApp',
              deviceType: 3,          /* mstrmojo.MobileConfigConstants.DEVICE_ANDROID */
              placeholder: 'mainApp',
              name: '<web:value type="config" name="servletDeploymentName"/>',
              pageName: '<web:beanValue property="name"/>',
              localeId: '<web:connectionValue property="locale"/>',
              helpUrl: '<web:value type="systemPreference" name="helpUrl" />',
              displayLocaleId: '<web:connectionValue property="displayLocaleID"/>',
              jsRoot: '../javascript/',   <%-- TODO: Need to send down actual value --%>
              jsMojoRoot: '../javascript/mojo/js/source/',
              viewFactory: new mstrmojo.android.medium.ViewFactory(),
              firstGoBack: true,
              serverProxy: new mstrmojo.MobileServerProxy({
                  transport: mstrmojo.XHRServerTransport
              }),
              persistTaskParams: <web:value type="persistParameters" name=""/>,
              getPersistParams: function () {return this.persistTaskParams;}
          });
       mstrApp.start();

       //Push a dummy state so we can handle the back button.
       window.history.pushState({d:"data"},"title");

       window.onpopstate = function(evt){
           //The Chrome browser raises this event whenever web window is shown for the first time 
           if ( mstrApp.firstGoBack ) {
               mstrApp.firstGoBack = false;
           } else {
	           //Have we handled the back button?
	           if (mstrApp.goBack()) {
	               //Add another dummy state to the window history so we can handle the next one as well.
	               window.history.pushState({d:"data"},"title");
	           }
           }
           return false;
       }
</script>



