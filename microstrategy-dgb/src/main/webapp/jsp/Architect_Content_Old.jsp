<%@ page errorPage="Error_Content.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%@ page import="com.microstrategy.web.app.beans.PageComponent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd " >


<web:resource type="js-style" name="mojo/css/core.css" />
<web:resource type="js-style" name="mojo/css/architect.css" />

<span id="pagePlaceholder"></span>  

<script type="text/javascript">
	//Set application globals.
	var mstrApp = {
		Privs : '<web:connectionValue property="privsXML"/>',
		msgID: '<web:value type="requestKey" name="messageID"/>',		
		reportID: '<web:value type="requestKey" name="reportID"/>',
		projectID: '<web:connectionValue property="projectID"/>',
		isFFSQL: '<web:value type="requestKey" name="FFsql"/>',
		isCloudPro: ('<web:value type="config" name="cloudEdition" />' == 'Professional'),
		saveAsCube:'<web:value type="requestKey" name="isCube"/>',
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
		thousandsSep: '<web:value type="misc" name="thousandSeparator"/>',
		decimalSep: '<web:value type="misc" name="decimalSeparator"/>',
		listSep: '<web:value type="misc" name="listSeparator"/>',
		taskURL: '<web:taskProcessorName />',
		jsRoot: '../javascript/',   <%-- TODO: Need to send down actual value --%>
		jsMojoRoot: '../javascript/mojo/js/source/',
		mstrDescs : <web:bundleDescriptor name="mojo-oivm"/>,
		persistTaskParams: <web:value type="persistParameters" name=""/>,
		getPersistParams: function () {return this.persistTaskParams;},
		isOIVM: function() {return true;}
	};
	var mstrConfig = mstrApp;
</script>
<web:resource type="jsbundle" bundleName="mojo-bootstrap" />
<web:resource type="jsbundle" bundleName="mojo-ar" />
<script type="text/javascript">
mstrmojo.App = mstrApp;

  //  mstrmojo.requiresDescs(5923, 7935, 308, 8510, 168, 118, 8514, 2211, 1154, 1462, 1834, 7931, 6078, 8512, 7936, 5895, 7933, 7937, 5896, 8116, 3167, 1162, 8513, 7932, 5891, 7820, 3379, 7934, 663, 7930, 3397, 3245, 1994); 


	// Create page widget.
	var pg = new mstrmojo.architect.ArchitectPage({
		id:"ArchitectPage",
		placeholder: 'pagePlaceholder'
	});

	
	//Declare and render a data-less view first, before parsing thru data JSON.
	//This allows HTML to be shown as early as possible, and lets it resize itself
	//to fit to window before it gets populated with lots of content.
	//This is good for perceived performance.
	pg.render();
	pg.loadDbrs();
	

</script>
