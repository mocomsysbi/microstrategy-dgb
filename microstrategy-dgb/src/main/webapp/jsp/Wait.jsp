<%
 /*
  * Wait.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd " >
<%@ page errorPage="Error_Content.jsp"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>
<web:clientSideDescriptor IDs = "2947"/>

<html>
<head>
<web:metaContentType/>

<!--  favicon -->
<link rel="shortcut icon" href="../style/mstr/images/favicon.ico" type="image/x-icon" />
<!--  end favicon -->

<title><web:beanValue property="title" encode="true"/><web:descriptor key="mstrWeb.8965" desc=". MicroStrategy 9" /></title>
<style type="text/css">
.mstrWeb, .mstrWeb input, .mstrWeb select, .mstrWeb textarea, .mstrWeb table, .mstrWeb th, .mstrWeb td {
<web:ifFeature name="fontFamilyOption" type="preference" value="1"><web:then>
font-family: <web:beanValue property="fontName"/> !important;
</web:then></web:ifFeature>
<web:ifFeature name="fontSizeOption" type="preference" value="1"><web:then>
font-size: <web:beanValue property="fontSize"/>pt !important;
</web:then></web:ifFeature>
}
<web:ifFeature type="systemPreference" name="enableFrameBreaking" value="1"><web:then>
body { display : none;}
</web:then></web:ifFeature>
</style>



<%--
 Display the "links" section of the template as specified in pageConfig.xml
 <jsp:include page="[a page section]" />
--%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("links")%>' flush="true" />
<web:resourceMgr type="scriptFiles" location="head"/>

<web:value type="misc" name="browserSpecificCSS"/>
<web:ifFeature name="doubleByte"><web:then>
<web:resource type="style" name="mstr/mstrDB.css" />
</web:then></web:ifFeature>

<%--
  This custom tag automatically includes the "global.css" and "{PAGENAME}Page.css" files found inside the "/style" subfolder of a
  plugin folder.
  It can be used to customize the look and feel of the application without modifying any configuration file or jsp.
--%>
<web:resource type="custom-style" />

<web:wait/>


<web:ifFeature name="dhtml"><web:then>
<%--
  This custom tag automatically includes the "global.js" and "{PAGENAME}Page.js" files found inside the "/javascript" subfolder of a
  plugin folder.
  It can be used to include automatically some custom javascript in a wait page without modifying any configuration file or jsp.
--%>
<web:resource type="custom-javascript" />
</web:then></web:ifFeature>

</head>
<body class="<web:value type='misc' name='cssClass'/>"
<web:ifFeature name="dhtml"><web:then> onload="if (typeof(document.readyState) == 'undefined') document.readyState = 'complete';microstrategy.eventManager.executeFunction('microstrategy.eventManager.onload()');" onBeforeUnload="bExecute = false; window.clearTimeout(sTimeOutID);" onUnload="bExecute = false; window.clearTimeout(sTimeOutID);" </web:then></web:ifFeature> >
<web:ifFeature name="accessibility">
<web:then>
<a class="mstrSkipNavLink" href="#SKIPNAV"><img <web:resource attribute="src" name="header_mstr_web.gif"/> width=222 height=27 alt="<web:descriptor key="mstrWeb.1884" desc="Skip Navigation" />" border=0/></a>
</web:then>
</web:ifFeature>
<table class="mstrToolbarWrapper" width="100%" cellspacing="0" cellpadding="0">
<tr><td>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:header"><web:else>
<div class="mstrHeader" id="mstrWeb_shortcutsBar" name="mstrWeb_shortcutsBar" iframe="true">
<%--
 Display the "header" section of the template as specified in pageConfig.xml
 <jsp:include page="[a page section]" />
--%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("header")%>' flush="true" />
</div>
</web:else></web:ifFeature>
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
<%-- Place holder for banner customizations--%>
<DIV class="mstrCustomBannerDIV">
<TABLE class="mstrCustomBanner">
  <TR>
    <TD class="mstrCustomBannerLeft"><img src="../images/1ptrans.gif" /></TD>
    <TD class="mstrCustomBannerCenter"><img src="../images/1ptrans.gif" /></TD>
    <TD class="mstrCustomBannerRight"><img src="../images/1ptrans.gif" /></TD>
  </TR>
</TABLE>
</DIV>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:path"><web:else>
<div class="mstrPath" id="mstrWeb_path" name="mstrWeb_path" iframe="true">
<%--
 Display the "path" section of the template as specified in pageConfig.xml
 <jsp:include page="[a page section]" />
--%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("path")%>' flush="true" />
</div>
</web:else></web:ifFeature>
<div class="mstrDockTop" id="mstrWeb_dockTop" name="mstrWeb_dockTop" iframe="true">
<%--
 Display the "dockTop" section of the template as specified in pageConfig.xml
 <jsp:include page="[a page section]" />
--%>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:dockTop"><web:else>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("dockTop")%>' flush="true" />
</web:else></web:ifFeature>
<div class="mstrSpacer"></div>
</div>
</td></tr>
</table>
<div id="mstrWebContents">
    <web:ifFeature name="dhtml"><web:then>
        <script>
           //do layout here to avoid DOM Tree repaint on page with large amount of html
            microstrategy.initLayoutProps();
           microstrategy.doLayout();
        </script>
    </web:then></web:ifFeature>
<table class="mstrVerticalDocks" cellspacing="0">
    <tr>
        <td class="tdDockLeft" id="td_mstrWeb_dockLeft">
<div class="mstrDockLeft" id="mstrWeb_dockLeft" name="mstrWeb_dockLeft" iframe="true">
<web:ifFeature name="lTbar" type="browserSetting" value="0"><web:then>
<web:urlEvent eventID="com.microstrategy.web.app.beans.EnumPageEvents.WebEventSetPermanentBrowserSetting"><img <web:resource attribute="SRC" name="1ptrans.gif"/> id="btnDockLeft" <web:descriptor attribute="title" key="mstrWeb.171" desc="Show Toolbar" /> />
<web:eventArgument name="com.microstrategy.web.app.beans.EnumPageEvents.WebEventArgumentBrowserSettingName" value="lTbar" />
<web:eventArgument name="com.microstrategy.web.app.beans.EnumPageEvents.WebEventArgumentBrowserSettingValue" value="1" />
</web:urlEvent>
</web:then></web:ifFeature>
<web:ifFeature name="lTbar" type="browserSetting" value="1"><web:then>
<web:urlEvent eventID="com.microstrategy.web.app.beans.EnumPageEvents.WebEventSetPermanentBrowserSetting"><img <web:resource attribute="SRC" name="1ptrans.gif"/> id="btnDockLeft" <web:descriptor attribute="title" key="mstrWeb.170" desc="Hide Toolbar" /> />
<web:eventArgument name="com.microstrategy.web.app.beans.EnumPageEvents.WebEventArgumentBrowserSettingName" value="lTbar" />
<web:eventArgument name="com.microstrategy.web.app.beans.EnumPageEvents.WebEventArgumentBrowserSettingValue" value="0" />
</web:urlEvent>
</web:then></web:ifFeature>
<%--
 Display the "dockLeft" section of the template as specified in pageConfig.xml
 <jsp:include page="[a page section]" />
--%>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:dockLeft"><web:else>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("dockLeft")%>' flush="true" />
</web:else></web:ifFeature>
</div>
        </td>
        <td class="tdDockCenter">
<%--
 Display the "error" section of the template as specified in pageConfig.xml
 <jsp:include page="[a page section]" />
--%>
<div class="mstrError" id="mstrWeb_error" name="mstrWeb_error" iframe="true">
<web:ifFeature type="requestKey" name="hiddensections" value="contains:error"><web:else>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("error")%>' flush="true" />
</web:else></web:ifFeature>
</div>
<div class="mstrContent" id="mstrWeb_content" name="mstrWeb_content" iframe="true">
<web:ifFeature name="accessibility"><web:then>
<a class="mstrSkipNavAnchor" name="SKIPNAV"><img <web:resource attribute="src" name="1ptrans.gif"/> width="0" height="0" border="0"/></a>
</web:then></web:ifFeature>
<web:displayBean status="2"/>
<%--
 Display the "content" section of the template as specified in pageConfig.xml
 <jsp:include page="[a page section]" />
--%>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:content"><web:else>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("content")%>' flush="true" />
</web:else></web:ifFeature>
</div>
        </td>
        <td class="tdDockRight">
<%--
 Display the "dockRight" section of the template as specified in pageConfig.xml
 <jsp:include page="[a page section]" />
--%>
<div class="mstrDockRight" id="mstrWeb_dockRight" name="mstrWeb_dockRight" iframe="true">
<web:ifFeature type="requestKey" name="hiddensections" value="contains:dockRight"><web:else>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("dockRight")%>' flush="true" />
</web:else></web:ifFeature>
</div>
        </td>
    </tr>
</table>
<%--
 Display the "dockBottom" section of the template as specified in pageConfig.xml
 <jsp:include page="[a page section]" />
--%>
<div class="mstrDockBottom" id="mstrWeb_dockBottom" name="mstrWeb_dockBottom" iframe="true">
<web:ifFeature type="requestKey" name="hiddensections" value="contains:dockBottom"><web:else>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("dockBottom")%>' flush="true" />
</web:else></web:ifFeature>
</div>
</div>
<%--
 Display the "footer" section of the template as specified in pageConfig.xml
 <jsp:include page="[a page section]" />
--%>
<div class="mstrFooterWrapper" id="mstrWeb_footer" name="mstrWeb_footer" iframe="true">
<web:ifFeature type="requestKey" name="hiddensections" value="contains:footer"><web:else>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("footer")%>' flush="true" />
</web:else></web:ifFeature>
</div>
<web:resourceMgr type="scriptFiles"/>
<div id="mstrScriptFiles" name="mstrScriptFiles" iframe="true">
</div>
<div id="mstrInlineScripts" name="mstrInlineScripts" iframe="true">
<web:resourceMgr type="inlineScripts"/>
</div>

<web:ifFeature name="dhtml">
<web:then>
<script language="JavaScript">doRedirect();</script>
<web:scriptPageState />
</web:then>
</web:ifFeature>
</body>
</html>
