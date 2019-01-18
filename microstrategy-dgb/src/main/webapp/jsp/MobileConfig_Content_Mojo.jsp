<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<div id="mobileConfigView"></div>

<jsp:include page='/jsp/Mojo_Config.jsp' flush="true"/>
<script type="text/javascript">
    // Append application specific config.
    mstrConfig.taskURL = '<web:taskProcessorName type="admin"/>';   // Overwrite
    mstrConfig.mstrDescs = <web:bundleDescriptor name="mojo-mobile-config"/>;
 	 <web:ifFeature type="preference" name="enableUsherAuthenticationOption"><web:then>
        mstrConfig.isUsherAuthVisible = true; </web:then>
     <web:else>mstrConfig.isUsherAuthVisible = false;</web:else></web:ifFeature>
 		
	var mstrApp = {
		name: '<web:value type="config" name="servletDeploymentName"/>',
		jsRoot: '../javascript/',
		jsMojoRoot: '../javascript/mojo/js/source/',
		localeId: '<web:connectionValue property="locale"/>',
		displayLocaleId: '<web:connectionValue property="displayLocaleID"/>',
		helpUrl: '<web:value type="systemPreference" name="helpUrl" />',
		mstrDescs: <web:bundleDescriptor name="mojo-mobile-config"/>,
		resourceFeedURL: '<web:resourceFeedName/>',
		configId: '<web:value type="requestKeyEncoded" name="configId"/>',
	 	
		<web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
	 		validateRandNum: '<web:value type="httpSession" name="validateRandNum"/>',
	 	</web:then></web:ifFeature>
	 	
		device: '<web:value type="requestKeyEncoded" name="device"/>',
        isTouchApp: function() {return false;}		
	};
</script>

<web:resource type="jsbundle" bundleName="mojo-coreui" debugBundleName="mojo-coreui-debug" />
<web:resource type="jsbundle" bundleName="mojo-mobile-config" />
<web:showBundleDescriptor name="mojo-mobile-config"/>
