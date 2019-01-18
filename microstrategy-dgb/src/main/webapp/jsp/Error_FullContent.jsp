<%
 /****
  * Error_FullContent.jsp
  * This is the contents of the template uses to layout the content of a generic error page.
  *
  * Copyright 2010 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");
%>

<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<%--
  JSPTag tag will be removed from the ASPx page when this page is converted from JSP
  The contents of the ASPTag tag will replace the JSP ones.
--%>
<%
//_JSP[
String links = null;
String header = null;
String shortcuts = null;
String path = null;
String dockTop = null;
String dockLeft = null;
String dockRight = null;
String dockBottom = null;
String footer = null;

//Only add the null check on jsp part now for the issue 810640 seems can't be reproduced on ASP side
if(mstrPage != null && mstrPage.getTemplateInfo() != null) {
	links = mstrPage.getTemplateInfo().getSection("links");
	header = mstrPage.getTemplateInfo().getSection("header");
	shortcuts = mstrPage.getTemplateInfo().getSection("shortcutsBar");
	path = mstrPage.getTemplateInfo().getSection("path");
	dockTop = mstrPage.getTemplateInfo().getSection("dockTop");
	dockLeft = mstrPage.getTemplateInfo().getSection("dockLeft");
	dockRight = mstrPage.getTemplateInfo().getSection("dockRight");
	dockBottom = mstrPage.getTemplateInfo().getSection("dockBottom");
	footer = mstrPage.getTemplateInfo().getSection("footer");
}

if (links == null || links.length() == 0) links = "/jsp/Global_Links.jsp";
if (header == null || header.length() == 0) header = "/jsp/Empty.jsp";
if (shortcuts == null || shortcuts.length() == 0) shortcuts = "/jsp/Generic_ShortcutsBar.jsp";
if (path == null || path.length() == 0) path = "/jsp/Generic_Path.jsp";
if (dockTop == null || dockTop.length() == 0) dockTop = "/jsp/Empty.jsp";
if (dockLeft == null || dockLeft.length() == 0) dockLeft = "/jsp/Empty.jsp";
if (dockRight == null || dockRight.length() == 0) dockRight = "/jsp/Empty.jsp";
if (dockBottom == null || dockBottom.length() == 0) dockBottom = "/jsp/Empty.jsp";
if (footer == null || footer.length() == 0) footer = "/jsp/Empty.jsp";
//_JSP]
//_ASP[
/*
    Dim links As String
    Dim header As String
    Dim shortcuts As String
    Dim path As String
    Dim dockTop As String
    Dim dockLeft As String
    Dim dockRight As String
    Dim dockBottom As String
    Dim footer As String

    Dim oTemplate as Microstrategy.web.App.Beans.ITemplateInfo
    oTemplate = mstrPage.TemplateInfo()

    If Not oTemplate Is Nothing Then
        links = oTemplate.getSection("links")
        header = oTemplate.getSection("header")
        shortcuts = oTemplate.getSection("shortcutsBar")
        path = oTemplate.getSection("path")
        dockLeft = oTemplate.getSection("dockLeft")
        dockTop = oTemplate.getSection("dockTop")
        dockRight = oTemplate.getSection("dockRight")
        dockBottom = oTemplate.getSection("dockBottom")
        footer = oTemplate.getSection("footer")
    End If

    If Len(links) = 0 Then
        links = "Global_Links.ascx"
    End If
    If Len(header) = 0 Then
        header = "Empty.ascx"
    End If
    If Len(shortcuts) = 0 Then
        shortcuts = "Generic_ShortcutsBar.ascx"
    End If
    If Len(path) = 0 Then
        path = "Generic_Path.ascx"
    End If
    If Len(dockLeft) = 0 Then
        dockLeft = "Empty.ascx"
    End If
    If Len(dockRight) = 0 Then
        dockRight = "Empty.ascx"
    End If
    If Len(dockBottom) = 0 Then
        dockBottom = "Empty.ascx"
    End If
    If Len(dockTop) = 0 Then
        dockTop = "Empty.ascx"
    End If
    If Len(footer) = 0 Then
        footer = "Empty.ascx"
    End If

    If Not oTemplate Is Nothing Then
        DirectCast(oTemplate, MicroStrategy.Web.BridgeInf.IWebBridge).Dispose()
            oTemplate = Nothing
    End If

*/
//_ASP]
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd ">
<html>
<head>
<web:metaContentType/>

<!--  favicon -->
<link rel="shortcut icon" href="../style/mstr/images/favicon.ico" type="image/x-icon" />
<!--  end favicon -->

<title><web:beanValue property="title" encode="true"/><web:descriptor key="mstrWeb.8965" desc=". MicroStrategy" /></title>

<%-- Add the 'links' file as specified in pageConfig.xml--%>
<jsp:include page='<%=links%>' flush="true" />
<style type="text/css">
.mstr, .mstr input, .mstr select, .mstr textarea, .mstr table, .mstr th, .mstr td {
<web:ifFeature name="fontFamilyOption" type="preference" value="1"><web:then>
font-family: <web:beanValue property="fontName"/>;
</web:then></web:ifFeature>
<web:ifFeature name="fontSizeOption" type="preference" value="1"><web:then>
font-size: <web:beanValue property="fontSize"/>pt;
</web:then></web:ifFeature>
}
<web:ifFeature type="systemPreference" name="enableFrameBreaking" value="1"><web:then>
body { display : none;}
</web:then></web:ifFeature>
</style>
<web:ifFeature name="doubleByte"><web:then>
<web:resource type="style" name="mstr/mstrDB.css" />
</web:then></web:ifFeature>

<%-- load browser specific stylesheet --%>
<web:value type="misc" name="browserSpecificCSS"/>

</head>
<body class="mstrWeb mstrWebErrorPage <web:ifConnectionValue><web:then><web:value type='preference' name='colorTheme' /></web:then><web:else><web:value type='browserSetting' name='colorTheme' /></web:else></web:ifConnectionValue>" <web:ifFeature name="dhtml"><web:then> onload="if(typeof(document.readyState) == 'undefined') document.readyState = 'complete';microstrategy.eventManager.executeFunction('microstrategy.eventManager.onload()');" </web:then></web:ifFeature>>
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
<%--
  This custom tag automatically includes the "global.css" and "{PAGENAME}Page.css" files found insite the "/style" subfolder of a
  plugin folder.
  It can be used to customize the look and feel of the application without modifying any configuration file or jsp.
--%>
<web:resource type="custom-style" />

<web:ifFeature name="dhtml"><web:then>
<%--
  This custom tag automatically includes the "global.js" and "{PAGENAME}Page.js" files found inside the "/javascript" subfolder of a
  plugin folder.
  It can be used to include automatically some custom javascript in a wait page without modifying any configuration file or jsp.
--%>
<web:resource type="custom-javascript" />
</web:then></web:ifFeature>
<%-- Link to jump to a different section when 508 compliance is enabled--%>
<web:ifFeature name="accessibility"><web:then>
<!--start:508-->
<a class="mstrSkipNavLink" href="#SKIPNAV"><img <web:resource attribute="SRC" name="header_mstr_web.gif"/> width=222 height=27 <web:descriptor attribute="alt" key="mstrWeb.1884" desc="Skip Navigation" /> border=0/></a>
<!--end:508-->
</web:then></web:ifFeature>

<%-- Add the 'header' file as specified in pageConfig.xml--%>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:header"><web:else>
<div class="mstrHeader" id="mstrWeb_header" name="mstrWeb_header" iframe="true">
<jsp:include page='<%=header%>' flush="true" />
</div>
</web:else></web:ifFeature>
<%-- Add the 'shortcuts' file as specified in pageConfig.xml--%>
<div class="mstrShortcutsBar" id="mstrWeb_shortcutsBar" name="mstrWeb_shortcutsBar" iframe="true">
<jsp:include page='<%=shortcuts%>' flush="true" />
</div>
<%-- Add the 'path' file as specified in pageConfig.xml--%>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:path"><web:else>
<div class="mstrPath" id="mstrWeb_path" name="mstrWeb_path" iframe="true">
<jsp:include page='<%=path%>' flush="true" />
</div>
</web:else></web:ifFeature>
<%-- Add the 'dockTop' file as specified in pageConfig.xml--%>
<div class="mstrDockTop" id="mstrWeb_dockTop" name="mstrWeb_dockTop" iframe="true">
<web:ifFeature type="requestKey" name="hiddensections" value="contains:dockTop"><web:else>
<jsp:include page='<%=dockTop%>' flush="true" />
</web:else></web:ifFeature>
<div class="mstrSpacer"></div>
</div>
<%-- --%>
<div class="mstrDockLeft" id="mstrWeb_dockLeft" name="mstrWeb_dockLeft" iframe="true">
<web:ifFeature name="lTbar" type="browserSetting" value="0"><web:then>
<web:urlEvent eventID="com.microstrategy.web.app.beans.EnumPageEvents.WebEventSetPermanentBrowserSetting"><img <web:resource attribute="SRC" name="1ptrans.gif"/> id="btnDockLeft" <web:descriptor attribute="alt" key="mstrWeb.171" desc="Show Toolbar" /> />
<web:eventArgument name="com.microstrategy.web.app.beans.EnumPageEvents.WebEventArgumentBrowserSettingName" value="lTbar" />
<web:eventArgument name="com.microstrategy.web.app.beans.EnumPageEvents.WebEventArgumentBrowserSettingValue" value="1" />
</web:urlEvent>
</web:then></web:ifFeature>
<web:ifFeature name="lTbar" type="browserSetting" value="1"><web:then>
<web:urlEvent eventID="com.microstrategy.web.app.beans.EnumPageEvents.WebEventSetPermanentBrowserSetting"><img <web:resource attribute="SRC" name="1ptrans.gif"/> id="btnDockLeft" <web:descriptor attribute="alt" key="mstrWeb.170" desc="Hide Toolbar" /> />
<web:eventArgument name="com.microstrategy.web.app.beans.EnumPageEvents.WebEventArgumentBrowserSettingName" value="lTbar" />
<web:eventArgument name="com.microstrategy.web.app.beans.EnumPageEvents.WebEventArgumentBrowserSettingValue" value="0" />
</web:urlEvent>
</web:then></web:ifFeature>
<%-- Add the 'dockLeft' file as specified in pageConfig.xml--%>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:dockLeft"><web:else>
<jsp:include page='<%=dockLeft%>' flush="true" />
</web:else></web:ifFeature>
</div>
<div class="mstrError" id="mstrWeb_error" name="mstrWeb_error" iframe="true">
<web:ifFeature name="accessibility"><web:then>
<a class="mstrSkipNavAnchor" name="SKIPNAV"><img <web:resource attribute="src" name="1ptrans.gif"/> width="0" height="0" border="0" alt=""/></a>
</web:then></web:ifFeature>
<div class="mstrAlert">
<div class="mstrAlertTitle"><web:errorValue property="title"/></div>
<div class="mstrAlertMessage"><web:errorValue property="message"/></div>
<%--Contact info, if available: --%>
<web:ifErrorValue property="contactInfo"><web:then>
<div class="mstrContactInfo">
<web:descriptor key="mstrWeb.99" desc="Contact Info:" />
<web:errorValue property="contactInfo"/>
</div>
</web:then></web:ifErrorValue>
</div>
</div>
<div class="mstrDockRight" id="mstrWeb_dockRight" name="mstrWeb_dockRight" iframe="true">
<%-- Add the 'dockRight' file as specified in pageConfig.xml--%>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:dockRight"><web:else>
<jsp:include page='<%=dockRight%>' flush="true" />
</web:else></web:ifFeature>
</div>
<div class="mstrDockBottom" id="mstrWeb_dockBottom" name="mstrWeb_dockBottom" iframe="true">
<%-- Add the 'dockBottom' file as specified in pageConfig.xml--%>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:dockBottom"><web:else>
<jsp:include page='<%=dockBottom%>' flush="true" />
</web:else></web:ifFeature>
</div>
<div class="mstrFooterWrapper" id="mstrWeb_footer" name="mstrWeb_footer" iframe="true">
<%-- Add the 'footer' file as specified in pageConfig.xml--%>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:footer"><web:else>
<jsp:include page='<%=footer%>' flush="true" />
</web:else></web:ifFeature>
</div>
<web:ifFeature type="systemPreference" name="renderExceptionInfo"><web:then>
<!--stackTrace -->
<div class="mstrStackTraceError">
    <web:errorValue property="stackTrace"/>
</div>
</web:then></web:ifFeature>
<web:ifFeature type="systemPreference" name="renderRequestInfo"><web:then>
<!-- request -->
<div class="mstrRequestError">
    <web:requestString/>
</div>
</web:then></web:ifFeature>
<%--
 Add hidden forms as well as a Javascript variable with the page state information.
 The page will be updated in case there is an IFrame manipulation.
--%>
</body>
</html>
