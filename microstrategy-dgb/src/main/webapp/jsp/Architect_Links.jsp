<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>
<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd " >

<link rel="stylesheet" type="text/css" href="../javascript/mojo/css/core.css" />
<link rel="stylesheet" type="text/css" href="../javascript/mojo/css/architect.css" />

<script type="text/javascript">
    // Set up the config object first.
    mstrConfig = {
        thousandsSep: '<web:value type="misc" name="thousandSeparator"/>',
        decimalSep: '<web:value type="misc" name="decimalSeparator"/>',
        listSep: '<web:value type="misc" name="listSeparator"/>',
        taskURL: '<web:taskProcessorName />',
        <web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
            validateRandNum: '<web:value type="httpSession" name="validateRandNum"/>',
        </web:then></web:ifFeature>
        onMobileDevice: false,
        mstrDescs: <web:bundleDescriptor name="mojo-bootstrap,mojo-ar"/>
    };

    //Set application globals.
    var mstrApp = {
        placeholder: 'pagePlaceholder',
        projectID: '<web:connectionValue property="projectID"/>',
        name: '<web:value type="config" name="servletDeploymentName"/>',
        pageName: '<web:beanValue property="name"/>',
        //_JSP[    
        <%-- no need to add jsession id for asp --%>
        <web:ifFeature type="systemPreference" name="useCookies" value="1"><web:then><%-- add jsessionid only cookie is not disabled --%>
         sessionId: '<web:connectionValue property="containerSessionId" />',
        </web:then></web:ifFeature>
         //_JSP] 
        sessionState:'<web:connectionValue property="sessionState"/>',
        servletState: '<web:connectionValue property="servletState"/>',
        localeId: '<web:connectionValue property="locale"/>',
        displayLocaleId: '<web:connectionValue property="displayLocaleID"/>',
        jsRoot: '../javascript/',   <%-- TODO: Need to send down actual value --%>
        jsMojoRoot: '../javascript/mojo/js/source/',
        persistTaskParams: <web:value type="persistParameters" name=""/>,
        getPersistParams: function () {return this.persistTaskParams;},
        isTouchApp: function() {return false;},
        autocomplete: '<web:value type="systemPreference" name="autocomplete"/>',
        getSearchAutoCompleteDelay: function(){return microstrategy.searchAutoCompleteDelay;}
    };
</script>

<web:resource type="jsbundle" bundleName="mojo-bootstrap" />
<web:resource type="jsbundle" bundleName="mojo-ar" />