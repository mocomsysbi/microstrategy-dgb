<%@ page errorPage="JSP_Error.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%@ page import="com.microstrategy.web.app.beans.PageComponent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd " >

<html>
<head>
<web:metaContentType/>
<title>MicroStrategy Architect</title>
<link rel="shortcut icon" href="../style/mstr/images/favicon.ico" type="image/x-icon" />
<web:resource type="js-style" name="mojo/css/core.css"/>
<web:resource type="js-style" name="mojo/css/projectmanagement.css"/>

<body>
<div id="toolbarPlaceholder"></div>
<div id="pagePlaceholder"></div>

<script type="text/javascript">
	//Set up the config object first.
	mstrConfig = {
		thousandsSep: '<web:value type="misc" name="thousandSeparator"/>',
		decimalSep: '<web:value type="misc" name="decimalSeparator"/>',
		listSep: '<web:value type="misc" name="listSeparator"/>',
		taskURL: '<web:taskProcessorName />',
		mstrDescs: <web:bundleDescriptor name="mojo-ar"/>
	};

	//Set application globals.
	var mstrApp = {
		placeholder: 'pagePlaceholder',
		toolbarplaceholder: 'toolbarPlaceholder',
		Privs : '<web:connectionValue property="privsXML"/>',
		FlashResBundleURL : '<web:value name="resBundles/DashboardViewerBundle_" type="flashResURL"/>',    
		name: '<web:value type="config" name="servletDeploymentName"/>',
		pageName: '<web:beanValue property="name"/>',
		<web:ifFeature name="useCookies"><web:then></web:then><web:else>
            httpSessionId: '<web:connectionValue property="containerSessionId" />',
            addJSessionIdToURL: <web:connectionValue property="addJSessionIdToURL" />,
        </web:else></web:ifFeature>
        sessionState:'<web:connectionValue property="sessionState"/>',
		servletState: '<web:connectionValue property="servletState"/>',
		localeId: '<web:connectionValue property="locale"/>',
		displayLocaleId: '<web:connectionValue property="displayLocaleID"/>',
		jsRoot: '../javascript/',   <%-- TODO: Need to send down actual value --%>
		jsMojoRoot: '../javascript/mojo/js/source/',
		persistTaskParams: <web:value type="persistParameters" name=""/>,
		getPersistParams: function () {return this.persistTaskParams;},
		isOIVM: function() {return true;},
		serverName: '<web:connectionValue property="serverName"/>'
	};
</script>

<web:resource type="jsbundle" bundleName="mojo-bootstrap" />
<web:resource type="jsbundle" bundleName="mojo-pm" />

<script type="text/javascript">
	//TODO: We need to remove this dependency from the code.
	mstrmojo.App = mstrConfig;

	// Create and start the app.
	mstrApp = new mstrmojo.architect.projectmanagement.ArchitectAdminApp(mstrmojo.hash.copy(mstrApp));
	mstrApp.start();
</script>

</body>
</html>