<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%@ page import="com.microstrategy.web.app.beans.PageComponent" %>

<span id="pagePlaceholder"></span>

<style type="text/css">
#dhtml_statistics {
    position: absolute;
    bottom: 21px;
    right: 21px;
    background-color: #EFEFEF;
    border: 1px solid #000;
    z-index: 1000;
    padding: 6px;
}
</style>
<script type="text/javascript"> 
    //Set application config.
    mstrConfig = {
        thousandsSep: '<web:value type="misc" name="thousandSeparator"/>',
        decimalSep: '<web:value type="misc" name="decimalSeparator"/>',
        listSep: '<web:value type="misc" name="listSeparator"/>',
        taskURL: '<web:taskProcessorName />',
        
        <web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
 			validateRandNum: '<web:value type="httpSession" name="validateRandNum"/>',
 		</web:then></web:ifFeature>
        
        onMobileDevice: false
    };
</script>

<web:resource type="jsbundle" bundleName="mojo-coreui" debugBundleName="mojo-coreui" />
<web:resource type="jsbundle" bundleName="mojo-ve"  />

<script type="text/javascript">
	//Set application globals.
	mstrConfig = {
		thousandsSep: '<web:value type="misc" name="thousandSeparator"/>',
		decimalSep: '<web:value type="misc" name="decimalSeparator"/>',
		listSep: '<web:value type="misc" name="listSeparator"/>',
		taskURL: '<web:taskProcessorName />'
	};

var mstrApp = new mstrmojo.ve.VisualExplorerApp({
    	placeholder: 'pagePlaceholder',
		Privs : '<web:connectionValue property="privsXML"/>',
		FlashResBundleURL : '<web:value name="resBundles/DashboardViewerBundle_" type="flashResURL"/>',    
		name: '<web:value type="config" name="servletDeploymentName"/>',
		pageName: '<web:beanValue property="name"/>',
		<web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
			validateRandNum: '<web:value type="httpSession" name="validateRandNum"/>',
	 	</web:then></web:ifFeature>
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
		viewFactory: new mstrmojo.OIVMViewFactory(),
		mstrDescs : <web:bundleDescriptor name="mojo-oivm"/>,
		persistTaskParams: <web:value type="persistParameters" name=""/>,
		getPersistParams: function () {return this.persistTaskParams;},
		prevViewMedia: <web:beanValue property="previousViewMedia" encode="true"/>,
	    <web:ifBeanValue name="rwb" property="getXMLStatus" value="4"> <%-- WebBeanRequestEndsInError --%>
		    <web:then>
		        error: <web:displayBean beanName="rwb" />,  
		    </web:then>
		    <web:else>
			    <web:ifFeature type="requestKey" name="hiddensections" value="contains:dockTop"><web:then>
			        tbModelData: '',
			        abModelData: '',
			        hasHiddenSections: true,
		        </web:then><web:else>
		            tbModelData: <web:displayBean beanName="ribbonBean" />,
		            abModelData: <web:displayBean beanName="actionBar" />,
		        </web:else></web:ifFeature>
		        docModelData: <web:displayBean beanName="rwb" />,
		    </web:else>
	    </web:ifBeanValue>
		isOIVM: function() {return true;}
	});

	mstrmojo.App = mstrApp;
	mstrApp.start();
	
</script>




