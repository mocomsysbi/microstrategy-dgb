<%
 /*
  * NCAddreses_Content.jsp
  */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<div id="preferenceDRL" ></div>

<script type="text/javascript">
    //Set application globals.
    var mstrApp = {
        Privs : '<web:connectionValue property="privsXML"/>',
        name: '<web:value type="config" name="servletDeploymentName"/>',
        pageName: '<web:beanValue property="name"/>',
        <web:ifFeature name="useCookies"><web:then></web:then><web:else>
            httpSessionId: '<web:connectionValue property="containerSessionId" />',
            addJSessionIdToURL: <web:connectionValue property="addJSessionIdToURL" />,
        </web:else></web:ifFeature>
        <web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
            validateRandNum: '<web:value type="httpSession" name="validateRandNum"/>',
        </web:then></web:ifFeature>  
        sessionState:'<web:connectionValue property="sessionState"/>',
        servletState: '<web:connectionValue property="servletState"/>',
        localeId: '<web:connectionValue property="locale"/>',
        helpUrl: '<web:value type="systemPreference" name="helpUrl" />',
        displayLocaleId: '<web:connectionValue property="displayLocaleID"/>',
        jsRoot: '../javascript/',  
        jsMojoRoot: '../javascript/mojo/js/source/',
        mstrDescs : <web:bundleDescriptor name="mojo-drl"/>,
        projectName: '<web:connectionValue property="projectName"/>',
        projectAlias: '<web:connectionValue property="projectAlias"/>',
        projectID: '<web:connectionValue property="projectID"/>'
    };

</script>

<web:resource type="jsbundle" bundleName="mojo-bootstrap"  />
<web:resource type="jsbundle" bundleName="mojo-drl"  />

