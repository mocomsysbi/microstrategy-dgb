<%
 /****
  * AndroidPhone_ContentApp.jsp
  * This page is a template for the Android Phone Application content.
  *
  * Copyright 2012 MicroStrategy Incorporated. All rights reserved.
  * version: 1.0
  * xhtml: true
  ****/
%>
<%@ page errorPage="JSP_Error.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<div id="mainApp"></div>
<div id="mainAppMsg"></div>

<jsp:include page='/jsp/Mojo_Config.jsp' flush="true"/>
<script type="text/javascript"> 
    // Append application specific config.
    mstrConfig.jsLibs = '../javascript-libraries/';
</script>

<script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script> 

<%-- Include the Mojo JavaScript bundles! --%>
<web:resource type="jsbundle" bundleName="android-phone-hosted" />

<script type="text/javascript">
	var fnStartFailed = function (e) {
	    window.console.log(e);
	
	    // Catch any errors starting up and display alert which will appear in the native app.
	    if (typeof mstrmojo !== "undefined") {
	        mstrmojo.err(e);
	
	    } else {
	        var msg = "Application failed to start due to an irrecoverable error: " + e; 
	        alert(msg);
	        window.console.log(msg);
	    }
	};
	
	try {
		// Instantiate main application and start.
		mstrApp = new mstrmojo.android.AndroidApp({
		    id: 'mobileApp',
		    deviceType: 3,          /* mstrmojo.MobileConfigConstants.DEVICE_ANDROID */
		    placeholder: 'mainApp',
		    name: '<web:value type="config" name="servletDeploymentName"/>',
		    pageName: '<web:beanValue property="name"/>',
		    localeId: '<web:connectionValue property="locale"/>',
		    displayLocaleId: '<web:connectionValue property="displayLocaleID"/>',
		    jsRoot: '../javascript/',   <%-- TODO: Need to send down actual value --%>
		    jsMojoRoot: '../javascript/mojo/js/source/',
		    viewFactory: new mstrmojo.android.medium.factories.ViewFactory(),
		    controllerFactory: new mstrmojo.android.medium.factories.ControllerFactory(),
		    modelFactory: new mstrmojo.android.factories.ModelFactory(),
		    serverProxy: new mstrmojo.MobileServerProxy({
		        transport: mstrmojo.XHRServerTransport
		    })
		});
		
	    // Push a dummy state so we can handle the back button.
	    window.history.pushState({
	        d: 'data'
	    }, 'title');
	    
	    window.onpopstate = function(evt){
	        // The Chrome browser raises this event whenever web window is shown for the first time. 
	        if (!mstrApp.firstGoBack) {
	            mstrApp.firstGoBack = true;
	        } else {
	            //Have we handled the back button?
	            if (mstrApp.goBack()) {
	                //Add another dummy state to the window history so we can handle the next one as well.
	                window.history.pushState({
	                    d: 'data'
	                }, 'title');
	            }
	        }
	        return false;
	    }
	    
	    // Cache device DPI and head element.
	    var dpi = mstrMobileApp.getDeviceDPI(),
	        head = document.head,
	        forEach = mstrmojo.array.forEach;
	    
	    // Iterate required stylesheet types.
	    forEach([ 'all', 'phone' ], function (css, idx) {
	        // Create link.
	        var link = document.createElement('link');
	        
	        // Set default attributes.
	        link.setAttribute('rel', 'stylesheet');
	        link.setAttribute('type', 'text/css');
	        
	        // Set href.
	        link.setAttribute('href', '../javascript/mojo/css/android/' + css + '-' + dpi + '.css' + ((window.mstrConfig && mstrConfig.webVersion) ? '?v='+mstrConfig.webVersion : ''));
	        
	        // Is this the final link?
	        if (idx) {
                // Set link onload event handler.
                link.onload = function () {
                    try {
                        // Start application.
                        mstrApp.start();
                    } catch (ex) {
                        fnStartFailed(ex);
                    }
                };
	        }
	        
	        // Append to head.
	        head.appendChild(link);
	    });

	} catch (e) {
	    fnStartFailed(e);
	}
</script>