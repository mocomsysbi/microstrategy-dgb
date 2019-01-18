<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<div id="mobileConfigView"></div>
  
<jsp:include page='/jsp/Mojo_Config.jsp' flush="true"/>
<script type="text/javascript">
    // Append application specific config.
    mstrConfig.taskURL = '<web:taskProcessorName type="admin"/>';   // Overwrite
    mstrConfig.taskProcURL = '<web:taskProcessorName />';
    mstrConfig.mstrDescs = <web:bundleDescriptor name="mojo-mobile-list"/>;
    <web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
        mstrConfig.validateRandNum = '<web:value type="httpSession" name="validateRandNum"/>';
    </web:then></web:ifFeature>
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
        
        <web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
 			validateRandNum: '<web:value type="httpSession" name="validateRandNum"/>',
 		</web:then></web:ifFeature>
 	
        isTouchApp: function() {return false;}
    };   
   
    
</script>

 

    


<web:resource type="jsbundle" bundleName="mojo-coreui" debugBundleName="mojo-coreui-debug" />
<web:resource type="jsbundle" bundleName="mojo-mobile-list" />
<web:showBundleDescriptor name="mojo-mobile-list"/>
