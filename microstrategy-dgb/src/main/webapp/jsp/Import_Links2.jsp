<%
 /****
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="Error_Links.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>
<%
 /****
 * Display the "links" section of the template as specified in pageConfig.xml (i.e. Admin_Links.jsp)
 * <jsp:include page="[a page section]" />
  ****/
%>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="shortcut icon" href="../style/mstr/images/favicon.ico" type="image/x-icon" />

<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<jsp:include page='/jsp/Mojo_Config.jsp' flush="true"/>
<script type="text/javascript">

	//Set up the config object first.
	mstrConfig.mstrDescs = <web:bundleDescriptor name="mojo-bootstrap,mojo-di,mojo-qb,mojo-wh"/>;
	mstrConfig.hasProfileReports = 1;

    <web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
    mstrConfig.validateRandNum = '<web:value type="httpSession" name="validateRandNum"/>';
    </web:then></web:ifFeature>

    //Set application object.
    var mstrApp = {
            placeholder: 'pagePlaceholder',
            Privs : '<web:connectionValue property="privsXML"/>',
            appPath: '<web:connectionValue property="applicationPath" />',
            serverName: '<web:connectionValue property="serverName"/>',
            projectName: '<web:connectionValue property="projectName"/>',
            projectAlias: '<web:connectionValue property="projectAlias"/>',
            serverPort: '<web:connectionValue property="serverPort"/>',
            cubeID: '<web:value type="requestKey" name="cubeID"/>',
            cubeName: '<web:value type="requestKeyEncoded" name="cubeName"/>',
            folderID: '<web:value type="requestKey" name="folderId"/>',
            isEdit: '<web:value type="requestKey" name="isEdit"/>', 
            isNewAnalysis: '<web:value type="requestKey" name="isNewAnalysis"/>',
            tableID: '<web:value type="requestKey" name="tableID"/>',
            launchingApp: '<web:value type="requestKey" name="launchingApp"/>',
            messageID: '<web:beanValue bean="wiz" property="messageID"/>',                
            isCloudPro: false, <%-- ('<web:value type="config" name="cloudEdition" />' == 'Professional'), --%>
            isEMMACube: true,
            name: '<web:value type="config" name="servletDeploymentName"/>',
            pageName: '<web:beanValue property="name"/>',       
            helpUrl: '<web:value type="systemPreference" name="helpUrl" />',    
            userHelpPage: '<web:value type="systemPreference" name="userHelpPage" />',
            helpTopic: 'import_data_page.htm',
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
            <web:ifFeature name="web-import-database"><web:then>
                allowImportDB: 1,
            </web:then></web:ifFeature>
            diParams: <web:displayBean beanName="wiz" />
        };     
	
</script>

<link rel="stylesheet" type="text/css" href="../javascript/mojo/css/core.css" />
<link rel="stylesheet" type="text/css" href="../javascript/mojo/css/cge.css" />
<link rel="stylesheet" type="text/css" href="../javascript/mojo/css/data-import.css" />	
	
<web:resource type="javascript" name="updateManager.js"/>
<web:resource type="javascript" name="serializer.js"/>

<web:resource type="jsbundle" bundleName="mojo-bootstrap" />
<web:resource type="jsbundle" bundleName="mojo-di" />
<web:resource type="jsbundle" bundleName="mojo-qb" />

<web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.IMPORT_SCOPE"/>
