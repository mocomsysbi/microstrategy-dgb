<%@ page errorPage="JSP_Error.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%@ page import="com.microstrategy.web.app.beans.PageComponent" %>
<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<%-- Start up the Web Statistics... --%>
<web:performanceTimer action="initialize" />
<web:performanceTimer action="start" />

<!DOCTYPE html>

<html>
<head>
<web:metaContentType/>
<title><web:beanValue property="title" encode="true"/><web:descriptor key="mstrWeb.8965" desc=". MicroStrategy 9" /></title>
<link rel="shortcut icon" href="../style/mstr/images/favicon.ico" type="image/x-icon" />
<web:ifBeanValue property="getName" value="Html5Vi"><web:then>
   	<web:resource type="js-style" name="mojo/css/core-ws.css"/>
</web:then><web:else>
    <web:resource type="js-style" name="mojo/css/core.css"/>
</web:else></web:ifBeanValue>
<web:resource type="js-style" name="mojo/css/Vis.css" />
<web:ifFeature name="doubleByte"><web:then>
    <web:resource type="style" name="mstr/mstrDB.css"/>
</web:then></web:ifFeature>
<%-- Load theme style --%>
<web:ifBeanValue property="getName" value="Html5Vi"><web:else>
    <web:ifFeature name="only-load-theme-specific-css"><web:then>
    	<web:resource type="theme-specific-style"/>
    </web:then><web:else>
    	<web:resource type="all-themes-style"/>
    </web:else></web:ifFeature>
</web:else></web:ifBeanValue>
<web:ifFeature type="systemPreference" name="enableFrameBreaking" value="1"><web:then>
<style type="text/css">
body { display : none;}
</style>
</web:then></web:ifFeature>

<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("header_mojo")%>' flush="true" />

<%--
  This custom tag automatically includes the "global.css" and "{PAGENAME}Page.css" files found insite the "/style" subfolder of a
  plugin folder.
  It can be used to customize the look and feel of the application without modifying any configuration file or jsp.
--%>
<web:resource type="custom-style" />

</head>

<body class="<web:value type='misc' name='cssClass'/>" onload="<web:javascript eventName="onload"/>">
<web:ifFeature type="systemPreference" name="enableFrameBreaking" value="1"><web:then>
<script>
if (self == top) {
    var theBody = document.getElementsByTagName('body')[0];
    theBody.style.display = "block";
} else {
    top.location = self.location;
}
</script>
</web:then>
</web:ifFeature>
    <web:ifFeature name="IE6">
        <web:then>
            <web:descriptor key="mstrWeb.7912" desc="This feature is not supported by the current browser. Refer to the MicroStrategy Mobile Readme file for a list of supported browsers." />
        </web:then>
        <web:else>
            <jsp:include page='<%=mstrPage.getTemplateInfo().getSection("content_mojo")%>' flush="true" />
        </web:else>
    </web:ifFeature>

<%--
  This custom tag automatically includes the "global.js" and "{PAGENAME}Page.js" files found inside the "/javascript" subfolder of a
  plugin folder.
  It can be used to include automatically some custom javascript in a given page without modifying any configuration file or jsp.
--%>
<web:resource type="custom-javascript" />

    <textarea id="debugInfo" style="display:none">
        <web:showDebugInfo contentType="text/xml" />
    </textarea>

<%-- Trigger the collection of Web Statistics --%>
<web:logging action="statistics" />

<%-- statistics on Screen --%>
<web:ifFeature type="systemPreference" name="statisticsMode" value="8"><%--OFF --%>
<web:else>
    <web:ifFeature type="systemPreference" name="statisticsMode" value="2"><%-- File --%>
    <web:else> <%--Screen --%>
        <web:resource type="style" name="mstr/mstrStats.css"/>
        <web:resource type="javascript" name="mstrStats.js" />
    </web:else>
    </web:ifFeature>
</web:else>
</web:ifFeature>

</body>
</html>