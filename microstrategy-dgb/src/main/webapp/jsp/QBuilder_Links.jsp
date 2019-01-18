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
<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<jsp:include page='/jsp/Mojo_Config.jsp' flush="true"/>
<script type="text/javascript">
    // Append application specific config.
    mstrConfig.mstrDescs = <web:bundleDescriptor name="mojo-bootstrap,mojo-qb"/>;
        <web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
       mstrConfig.validateRandNum = '<web:value type="httpSession" name="validateRandNum"/>';
        </web:then></web:ifFeature>
        <web:ifFeature name="profile-reports"><web:then>
        mstrConfig.hasProfileReports = 1;
        </web:then></web:ifFeature> 
        <web:ifFeature name="web-define-view-report"><web:then>
        mstrConfig.canCreateReport = 1;
        </web:then></web:ifFeature>
        <web:ifFeature name="create-analysis"><web:then>
        mstrConfig.canCreateAnalysis = 1;
        </web:then></web:ifFeature>
        <web:ifFeature name="documents-design-mode"><web:then>
            <web:ifFeature name="manage-datasets"><web:then>
                <web:ifFeature name="document-execution"><web:then>
                mstrConfig.canCreateDocument = 1;
                </web:then></web:ifFeature>
            </web:then></web:ifFeature>
        </web:then></web:ifFeature>
         <web:ifFeature name="use-database-instance-manager"><web:then>
        mstrConfig.useDataBaseInstanceManager = 1;
        </web:then></web:ifFeature>

    //Set application object.
    mstrApp = {
        placeholder: 'pagePlaceholder', 
        Privs : '<web:connectionValue property="privsXML"/>',
        msgID: '<web:value type="requestKey" name="messageID"/>',
        type: '<web:value type="requestKey" name="type"/>',       
        origin: '<web:value type="requestKey" name="origin"/>',       
        reportID: '<web:value type="requestKey" name="reportID"/>',
        folderID: '<web:value type="requestKey" name="folderID"/>',
        docID: '<web:value type="requestKey" name="messageID"/>',
        projectID: '<web:connectionValue property="projectID"/>',
        isFFSQL: '<web:value type="requestKey" name="FFsql"/>',
        isCloud: ('<web:value type="config" name="cloudEdition" />' == 'Professional'),
        saveAsCube:'<web:value type="requestKey" name="isCube"/>',
        analysisID: '<web:value type="requestKey" name="analysisID"/>',
        isNewAnalysis: '<web:value type="requestKey" name="isNewAnalysis"/>',
        tableID: '<web:value type="requestKey" name="tableID"/>',
        isEMMACube: true, 
        FlashResBundleURL : '<web:value name="resBundles/DashboardViewerBundle_" type="flashResURL"/>',    
        name: '<web:value type="config" name="servletDeploymentName"/>',
        pageName: '<web:beanValue property="name"/>',
        helpUrl: '<web:value type="systemPreference" name="helpUrl" />',
        userHelpPage: '<web:value type="systemPreference" name="userHelpPage" />',
        helpTopics:{
        	mainDB: 'database_import_page.htm',
        	mainSQL: 'freeform_import_page.htm',
        	tableJoin: 'join_options_dialog_box.htm',
        	filterValue: 'Enter_Value_dialog_box.htm',
        	expression: 'expression_dialog_box.htm',
        	condition: 'new_condition_dialog_box.htm'
        },
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
        isTouchApp: function() {return false;}  
    };
</script>


<link rel="stylesheet" type="text/css" href="../javascript/mojo/css/core.css" />
<link rel="stylesheet" type="text/css" href="../javascript/mojo/css/sass/bundles/mojo-qb.css" />
<link rel="stylesheet" type="text/css" href="../javascript/mojo/css/cge.css" />

<web:resource type="jsbundle" bundleName="mojo-bootstrap" />
<web:resource type="jsbundle" bundleName="mojo-qb" />
