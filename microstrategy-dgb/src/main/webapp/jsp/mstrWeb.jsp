<%
 /****
  * mstrWeb.jsp
  * This file servers as the main template for the application. It generates
  *   the overall layout of the page.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd " >
<%--
 In this section, the "initialize" action defines all the javascript methods and
 variables that will be required for the client rendering measurement to take place.
 The "start" action will generate the javascript required for starting the timer
 that will measure up the time the page will take in rendering.

  <web:performanceTimer action="initialize"/><web:performanceTimer action="start"/>
--%>
<html xmlns:v="urn:schemas-microsoft-com:vml">
      <web:performanceTimer action="initialize"/><web:performanceTimer action="start"/>
<head>
<!--[if IE]>
<style>
v\:line { behavior:url(#default#VML); display:inline-block; }
</style >
<![endif]-->


<%--
 The metaContentType tag takes care of rendering the "META" HTML tag information
 for the page, according to what specified on the Locales configuration file, depending
 on the language the user has requested. For example, for english, the definition of this tag:

 <web:metaContentType/>

 will render HTML content as:

 <META http-equiv="Content-Type" content="text/html; charset=UTF-8" />

--%>
<web:metaContentType/>
<%--
  JSPTag tag will be removed from the ASPx page when this page is converted from JSP
  The contents of the ASPTag tag will replace the JSP ones.
--%>

<!--  favicon -->
<link rel="shortcut icon" href="../style/mstr/images/favicon.ico" type="image/x-icon" />
<!--  end favicon -->
<title pgn='<%=mstrPage.getPageInfo().getName()%>'><web:beanValue property="title" encode="true"/><web:descriptor key="mstrWeb.8965" desc=". MicroStrategy 9" /></title>

<%--
 Display the links section of the template as specified in pageConfig.xml (i.e. Login_Links.jsp)
 <jsp:include page="[a page section]" />
--%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("links")%>' flush="true" />

<web:resourceMgr type="scriptFiles" location="head"/>
<web:value type="misc" name="browserSpecificCSS"/>

<web:ifFeature name="doubleByte"><web:then>
<web:resource type="style" name="mstr/mstrDB.css"/>
</web:then></web:ifFeature>

<web:ifFeature name="dhtml"><web:then>
</web:then><web:else>
    <web:resource type="style" name="mstr/html.css"/>
</web:else></web:ifFeature>

<web:ifFeature name="accessibility"><web:then>
    <web:resource type="style" name="mstr/508.css"/>
</web:then></web:ifFeature>

<style type="text/css">
.mstrWeb, .mstrWeb input, .mstrWeb select, .mstrWeb textarea, .mstrWeb table, .mstrWeb th, .mstrWeb td {
font-family: <web:ifFeature name="fontFamilyOption" type="preference" value="1">
<web:then>
<web:beanValue property="fontName"/>;
</web:then>
<web:else>
<web:value type='browserSetting:css' name='fontFamily' />;
</web:else>
</web:ifFeature>

<web:ifFeature name="fontSizeOption" type="preference" value="1">
<web:then>
font-size: <web:beanValue property="fontSize"/>pt;
</web:then>
<web:else>
<web:ifConnectionValue><web:else>
font-size: <web:value type='browserSetting:css' name='fontSize' />pt;
</web:else></web:ifConnectionValue>
</web:else>
</web:ifFeature>
}
<web:ifFeature type="systemPreference" name="enableFrameBreaking" value="1"><web:then>
body { display : none;}
</web:then></web:ifFeature>
</style>

<%--
  This custom tag automatically includes the "global.css" and "{PAGENAME}Page.css" files found insite the "/style" subfolder of a
  plugin folder.
  It can be used to customize the look and feel of the application without modifying any configuration file or jsp.
--%>
<web:resource type="custom-style" />

<%--
 Check if the user has the DHTML preference turned on to determine whether
  the page should load some JavaScripr functions.

 <web:ifFeature name="dhtml">
     [JavaScript code]
 </web:ifFeature>
--%>

<web:ifFeature name="dhtml"><web:then>
<%-- get descriptors for full screen mode --%>
<web:clientSideDescriptor IDs = "2,3,239,1279,2058,2213,2947,3610,4325,4664,4665,5877,6595,8661,8953,9163,15463,11866,11867,14356" />
<%--
 The "logging" tag displays the required HTML and Javascript code for being able to track
 down client rendering times and statistics for each one of the pages where this tag is included. These
 tags will not display any content if the Administrator of the application has not enabled
 client rendering logging on the application's configuration file. Examples of use of this
 tag include:

 <web:logging action="reset"/> (set the page to an empty location)
 <web:logging action="logTimes"/> (Stop the timer so the rendering times will be logged.)
--%>
<!--start:scriptVariables-->
<script>
if(typeof(microstrategy) != 'undefined') {
  microstrategy.persistParams = <web:value type="persistParameters" name=""/>;
}
</script>
<web:scriptlet>
<web:logging action="logTimes"/>
<web:pageState attribute="self.pageState" stateLevel="0"/>;

if(typeof(microstrategy) != 'undefined') {
 microstrategy.servletName = '<web:value type="config" name="servletDeploymentName"/>';
    microstrategy.servletState = '<web:connectionValue property="servletState"/>';
 microstrategy.pageName = '<web:beanValue property="name"/>';
 microstrategy.waitPageDelay = "<web:value type="preference" name="dhtmlWaitPageDelay" />";
 microstrategy.userPalette = "<web:value type="preference" name="userPalette" />";
 microstrategy.pageScreenMode = "<web:beanValue property="screenMode" />";
 microstrategy.FOLDER_IMAGES = '<web:value type="misc" name="Image"/>';
 microstrategy.IMG_SRC_TRANSPARENT = microstrategy.FOLDER_IMAGES + '1ptrans.gif';
 microstrategy.features = {<web:value type="features" name="web-import-data,web-use-sharing-editor,flashvi"/>};
 <web:ifFeature type="systemPreference" name="validateRandNum"><web:then>
 	microstrategy.validateRandNum = '<web:value type="httpSession" name="validateRandNum"/>';
 </web:then></web:ifFeature>

 <web:ifFeature type="misc" name="jsBundleDebug"><web:then>
 	microstrategy.jsBundleDebug = true;
 </web:then></web:ifFeature>

<web:ifFeature name="useCookies"><web:then></web:then><web:else>
    microstrategy.httpSessionId = '<web:connectionValue property="containerSessionId" />';
    microstrategy.addJSessionIdToURL = '<web:connectionValue property="addJSessionIdToURL" />';
</web:else></web:ifFeature>
microstrategy.buildVersion = '<web:connectionValue property="xmlAPIVersion"/>';
microstrategy.appVersion = '<web:value type="systemPreference" name="appVersion"/>';

mstr.Settings.Locale.ID = '<web:connectionValue property="locale"/>';
mstr.Settings.Locale.THOUSANDSEP = '<web:value type="misc" name="thousandSeparator"/>';
mstr.Settings.Locale.DECIMALSEP = '<web:value type="misc" name="decimalSeparator"/>';
mstr.Settings.Locale.LISTSEP = '<web:value type="misc" name="listSeparator"/>';
mstr.Settings.Locale.DATEOUTPUTFORMAT = '<web:value type="misc" name="dateOutputFormat"/>';

 if (microstrategy.number) {
  microstrategy.number.locale = '<web:connectionValue property="locale"/>';
  microstrategy.number.units = '<web:value type="misc" name="units"/>';
  microstrategy.number.unitsLabel = '<web:value type="misc" name="unitsLabel"/>';
 }
 microstrategy.mstrwid = '<web:value type="requestKeyEncoded" name="mstrwid" />';
 microstrategy.displayLocaleID = '<web:connectionValue property="displayLocaleID"/>';
 microstrategy.wrapCharacterEnabled = '<web:value type="preference" name="wrapCharacter"/>';

 microstrategy.maxSearchResults = '<web:value type="preference" name="maxSearchResults"/>';
 microstrategy.blockCount = '<web:value type="preference" name="elementsBlockCount"/>';
 microstrategy.objectsBlockCount = '<web:value type="preference" name="objectsBlockCount" />';

 microstrategy.enableQuickSearch = '<web:value type="preference" name="enableQuickSearch" />' == '1';
 microstrategy.enableSearchAutoComplete = '<web:value type="preference" name="enableSearchAutoComplete" />' == '1';
 microstrategy.IServerVesion = '<web:connectionValue property="serverVersion" />';
 microstrategy.searchAutoCompleteDelay = '<web:value type="preference" name="searchAutoCompleteDelay" />';
 microstrategy.enableGridViewSearch = '<web:value type="preference" name="enableGridViewSearch" />' == '1';
 microstrategy.projectId = '<web:connectionValue property="projectID"/>';
 microstrategy.adminInfo = '<web:value type="misc" name="adminInfo" />';
 microstrategy.reportCreationViewMode = '<web:value type="preferenceEncoded" name="reportCreationViewMode" />';
<web:ifFeature name="quick-search-enabled" >
<web:then>
    microstrategy.isQuickSearchEnabled = true;
</web:then>
<web:else>
    microstrategy.isQuickSearchEnabled = false;
</web:else>
</web:ifFeature>
<%-- Reading the preference of whether or not to allow guest access for Sharing URL Editor --%>
<web:ifFeature name="guest-mode-enabled" >
<web:then>
    microstrategy.guestModeEnabled = true;
</web:then>
<web:else>
    microstrategy.guestModeEnabled = false;
</web:else>
</web:ifFeature>


<web:ifConnectionValue><web:then>microstrategy.hasSession = true;</web:then><web:else>
    <web:ifBeanValue property="getName" value="welcome"><web:then>
        <web:ifConnectionValue property="loginFirst"><web:then>microstrategy.hasSession = true;</web:then></web:ifConnectionValue>
</web:then></web:ifBeanValue></web:else></web:ifConnectionValue>
 }

   if (microstrategy.hasSession) {
       microstrategy.enableAutomaticSessionRecovery = <web:ifFeature name="auto-recover-objects"><web:then>1</web:then><web:else>0</web:else></web:ifFeature>;
       microstrategy.showRecoverLink = <web:value type="misc" name="showRecoverLink"/>;
   }


    <%-- @todo: The following are unnecessary in this page... need to include them on a page-by-page basis. --%>
self.asDescriptors = new Array();
self.url = null;

//Defining constants to be used as generic separators.
self.ITEM_SEPARATOR = '<web:value type="enum" name="com.microstrategy.web.app.utils.ExpressionHelper.ITEM_SEPARATOR"/>';
self.UNIT_SEPARATOR = '<web:value type="enum" name="com.microstrategy.web.app.utils.ExpressionHelper.UNIT_SEPARATOR"/>';
self.EXPRESSION_SEPARATOR = '<web:value type="enum" name="com.microstrategy.web.app.utils.ExpressionHelper.EXPR_SEPARATOR"/>';
self.ANSWER_SEPARATOR = '<web:value type="enum" name="com.microstrategy.web.app.utils.ExpressionHelper.ANSWER_SEPARATOR"/>';
self.SIMPLE_SEPARATOR = '<web:value type="enum" name="com.microstrategy.web.app.utils.ExpressionHelper.SIMPLE_SEPARATOR"/>';
self.SIMPLE_SEPARATOR_COMMA = '<web:value type="enum" name="com.microstrategy.web.app.utils.ExpressionHelper.SIMPLE_SEPARATOR_COMMA"/>';
self.CLIPBOARD_ITEM_SEPARATOR = '<web:value type="enum" name="com.microstrategy.web.beans.EnumRWBeanEvents.ITEM_SEPARATOR"/>';

</web:scriptlet>
<!--end:scriptVariables-->

<%--
  This custom tag automatically includes the "global.js" and "{PAGENAME}Page.js" files found inside the "/javascript" subfolder of a
  plugin folder.
  It can be used to include automatically some custom javascript in a given page without modifying any configuration file or jsp.
--%>
<web:resource type="custom-javascript" />

</web:then></web:ifFeature>

</head>
<%--
 The performanceString tag determines whether to load the JavaScript functions
 that measure the time that it takes for the page to load.

 <web:performanceString/>
--%>
<body class="<web:value type='misc' name='cssClass'/>"
<web:ifFeature name="dhtml"><web:then>
onload="if (typeof(document.readyState) == 'undefined') document.readyState = 'complete';microstrategy.eventManager.executeFunction('microstrategy.eventManager.onload()');Init();<web:javascript eventName="onload" />"
  <web:ifFeature name="IE7"><web:then>
  onresize="setTimeout('microstrategy.resizeAtBodyLoading = true; microstrategy.eventManager.onwinresize();',100);"
  </web:then><web:else>
  onresize="microstrategy.eventManager.onwinresize();"
  </web:else></web:ifFeature>
onbeforeunload="Unload();"
</web:then><web:else>
onload="if (typeof(document.readyState) == 'undefined') document.readyState = 'complete';
<web:performanceString/>"
</web:else></web:ifFeature>
>
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



<web:ifFeature name="dhtml"><web:then>
    <web:ifFeature name="i-frame"><web:then>
	    <web:ifTemplateValue property="show-wait"><web:then>
			<%--
			 This section loads the small wait page that is shown when an action is executed
			 by the user. (i.e. sorting on the report or going to a different page).
			--%>
			<!--start:waitIframe-->
			<div id="mstrWeb_wait" name="mstrWeb_wait">
			    <div class="mstrWaitBox" style="display:block;visibility:visible;z-index:9999;" id="divWaitBox" scriptclass="mstrDialogImpl" dg="1" ty="edt">
					<div class="mstrWaitBoxBody" id="mstrWeb_wait_body" name="mstrWeb_wait_body" iframe="true">
					    <div>
					        <div class="mstrIcon-wait"><div class="mstrIcon-close-wait" onmousedown="iframe.stopWindow();hasLoaded=false;" <web:descriptor attribute="title" key="mstrWeb.221" desc="Cancel" />></div></div>
					       <div class="mstrSpacer"></div>
					    </div>
					    <div class="mstrSpacer"></div>
					</div>
					<div id="divWaitBox_dg" name="divWaitBox_dg" class="mstrDragRect"></div>
			   </div>
			</div>
            <div id="mstrWeb_waitCurtain" class="divWaitCurtain"></div>
			<web:scriptlet>
			    if (typeof(microstrategy) != 'undefined') {
			         microstrategy.bonesToRegister.push({id : "divWaitBox", loadCondition : "true",  properties : {'allowCancel':<web:ifTemplateValue property="allow-cancel"><web:then>true</web:then><web:else>false</web:else></web:ifTemplateValue>}});
			    }
			</web:scriptlet>
			<!--end:waitIframe-->
		</web:then></web:ifTemplateValue>
    </web:then></web:ifFeature>
</web:then></web:ifFeature>


<%--
 The "performanceString" tag will take care of stopping the timer and record the results.
 The "performanceTimer" tag should have been initialized in order for this tag to work properly.
 The "logTimes" action will take care of enabling the whole logging feature in the javascript code, as
 well as recording the name of the page that will be analyzed.
 Initializes the client side performance object. This tag is used to measure performance of the
 rendering of the HTML page.
--%>
<web:performanceTimer action="initializeClientAction"/>
<%--
 If accessibility (508) mode is enabled, some sections of the page need to
 include the "SKIPNAV" link so the section can be skipped by the 508 readed
--%>
<web:ifConnectionValue><web:then>
<web:ifFeature name="accessibility"><web:then>
<!--start:508-->
<a href="#SKIPNAV" class="mstrSkipNavLink" <web:descriptor attribute="title" key="mstrWeb.1884" desc="Skip Navigation"/>> <img <web:resource attribute="SRC" name="header_mstr_web.gif"/> width=222 height=27 <web:descriptor attribute="alt" key="mstrWeb.1884" desc="Skip Navigation" /> border=0/></a>
<!--end:508-->
</web:then></web:ifFeature>
</web:then><web:else>
<!--start:508-->
<a class="mstrSkipNavLink" href="#SKIPNAV"><div class="mstrSkipNav"><img <web:resource attribute="SRC" name="1ptrans.gif"/> width=1 height=1 <web:descriptor attribute="alt" key="mstrWeb.1884" desc="Skip Navigation" /> border=0/></div></a>
<!--end:508-->
</web:else></web:ifConnectionValue>

<table width="100%" cellspacing="0" cellpadding="0" class="mstrToolbarWrapper">
<tr><td>
<%-- Place holder for header customizations--%>
<DIV class="mstrCustomHeaderDIV">
<TABLE class="mstrCustomHeader" cellspacing="0" cellpadding="0">
   <TR>
    <TD class="mstrCustomHeaderLeft"><img src="../images/1ptrans.gif" alt="" /></TD>
    <TD class="mstrCustomHeaderCenter"><img src="../images/1ptrans.gif" alt="" /></TD>
    <TD class="mstrCustomHeaderRight"><img src="../images/1ptrans.gif" alt="" /></TD>
   </TR>
</TABLE>
</DIV>
<web:ifFeature type="requestKey" name="hiddensections" value="header,path,dockTop"><web:else>
<web:ifFeature name="not-flash-full-screen-mode"><web:then>
<web:ifFeature name="page-rw-interactive-view-mode-full-screen-reporter"><web:else>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:header"><web:else>
	<div class="mstrHeader" id="mstrWeb_shortcutsBar" name="mstrWeb_shortcutsBar" iframe="true">
		<%--
		 Display the "shortcutsBar" section of the template as specified in pageConfig.xml (i.e. About_ShortcutsBar.jsp)
		 <jsp:include page="[a page section]" />
		--%>
		<web:ifFeature name="showHeaderBar" type="systemPreference" value="0">
        <web:then>
          <web:ifFeature name="dhtml"><web:then></web:then>
	          <web:else>
	              <jsp:include page='<%=mstrPage.getTemplateInfo().getSection("header")%>' flush="true" />
	          </web:else>
          </web:ifFeature>
        </web:then>
        <web:else>
		  <jsp:include page='<%=mstrPage.getTemplateInfo().getSection("header")%>' flush="true" />
		</web:else>
		</web:ifFeature>
	</div>
</web:else></web:ifFeature>
</web:else></web:ifFeature>
</web:then></web:ifFeature>
<%-- Place holder for banner customizations--%>
<DIV class="mstrCustomBannerDIV">
<TABLE class="mstrCustomBanner">
  <TR>
    <TD class="mstrCustomBannerLeft"><img src="../images/1ptrans.gif" alt="" /></TD>
    <TD class="mstrCustomBannerCenter"><img src="../images/1ptrans.gif" alt="" /></TD>
    <TD class="mstrCustomBannerRight"><img src="../images/1ptrans.gif" alt="" /></TD>
  </TR>
</TABLE>
</DIV>
<web:ifFeature name="not-flash-full-screen-mode"><web:then>
<web:ifFeature name="page-rw-interactive-view-mode-full-screen-reporter"><web:else>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:path"><web:else>
<div class="mstrPath" id="mstrWeb_path" name="mstrWeb_path" iframe="true">
<%--
 Display the "path" section of the template as specified in pageConfig.xml (i.e. Change_Password_Path.jsp)
 <jsp:include page="[a page section]" />
--%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("path")%>' flush="true" />
</div>
</web:else></web:ifFeature>
</web:else></web:ifFeature>
</web:then></web:ifFeature>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:dockTop"><web:else>
<div class="mstrDockTop" id="mstrWeb_dockTop" name="mstrWeb_dockTop" iframe="true">
<%--
 Display the "dockTop" section of the template as specified in pageConfig.xml (i.e. RW_Toolbar.jsp)
 <jsp:include page="[a page section]" />
--%>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:dockTop"><web:else>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("dockTop")%>' flush="true" />
</web:else></web:ifFeature>
</div>
</web:else></web:ifFeature>
</web:else></web:ifFeature>
</td></tr>
</table>


<web:ifFeature name="not-flash-full-screen-mode"><web:then>
<div class="mstrFooterWrapper <web:ifFeature name="showFooterPath" type="preference" value="0"><web:then>close</web:then></web:ifFeature>" id="mstrWeb_footer" name="mstrWeb_footer" iframe="true">
<%--
 Display the "footer" section of the template as specified in pageConfig.xml (i.e. Copyright_Footer.jsp)
 <jsp:include page="[a page section]" />
--%>
<web:ifFeature name="page-rw-interactive-view-mode-full-screen-reporter"><web:else>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:footer"><web:else>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("footer")%>' flush="true" />
</web:else></web:ifFeature>
</web:else></web:ifFeature>
</div>
</web:then></web:ifFeature>


<div id="mstrWebContents">
    <web:ifFeature name="dhtml"><web:then>
        <script>
           //do layout here to avoid DOM Tree repaint on page with large amount of html
           if (window.microstrategy) {
               microstrategy.initLayoutProps();
               microstrategy.doLayout();
           }
        </script>
    </web:then></web:ifFeature>

<table id="mstrWebContentTable" class="mstrVerticalDocks" cellspacing="0" cellpadding="0">
<tr>
<web:ifFeature name="page-rw-interactive-view-mode-full-screen-reporter"><web:else>
<web:ifFeature name="not-flash-full-screen-mode"><web:then>
<td class="tdDockLeft" id="td_mstrWeb_dockLeft">
<div class="mstrDockLeft" id="mstrWeb_dockLeft" name="mstrWeb_dockLeft" iframe="true" >
<%--
 Display the "dockLeft" section of the template as specified in pageConfig.xml (i.e. RW_LeftToolbar.jsp)
 <jsp:include page="[a page section]" />
--%>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:dockLeft"><web:else>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("dockLeft")%>' flush="true" />
</web:else></web:ifFeature>
</div>
</td>
</web:then></web:ifFeature>
</web:else></web:ifFeature>
<td class="mstrDockCenter">
<div class="mstrError" id="mstrWeb_error" name="mstrWeb_error" iframe="true">
<%--
 Display the "error" section of the template as specified in pageConfig.xml (i.e. RW_Error.jsp)
 <jsp:include page="[a page section]" />
--%>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:error"><web:else>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("error")%>' flush="true" />
</web:else></web:ifFeature>
</div>
<div class="mstrContent" id="mstrWeb_content" name="mstrWeb_content" iframe="true">
<!-- Display the Project Header Preference -->
<web:ifFeature name="not-flash-full-screen-mode"><web:then>
<web:ifFeature type="preference" name="projectHeader"><web:then>
<div class="mstrProjectHeader"><web:connectionValue property="projectHeader" /></div>
</web:then></web:ifFeature>
</web:then></web:ifFeature>
<web:ifConnectionValue><web:then>
<web:ifFeature name="accessibility"><web:then>
<a class="mstrSkipNavAnchor" name="SKIPNAV"><img <web:resource attribute="SRC" name="1ptrans.gif"/> width="0" height="0" border="0" alt="" /></a>
</web:then></web:ifFeature>
</web:then><web:else>
<a class="mstrSkipNavAnchor" name="SKIPNAV"><img <web:resource attribute="SRC" name="1ptrans.gif"/> width="0" height="0" border="0" alt="" /></a>
</web:else></web:ifConnectionValue>
<!--start:mainContent-->
<%--
 Display the "content" section of the template as specified in pageConfig.xml (i.e. RW_Content.jsp)
 <jsp:include page="[a page section]" />
--%>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:content"><web:else>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("content")%>' flush="true" />
</web:else></web:ifFeature>
<!--end:mainContent-->
</div>
</td>
<web:ifFeature name="not-flash-full-screen-mode"><web:then>
<td class="tdDockRight" id="td_mstrWeb_dockRight">
<div class="mstrDockRight" id="mstrWeb_dockRight" name="mstrWeb_dockRight" iframe="true">
<%--
 Display the "dockRight" section of the template as specified in pageConfig.xml
 <jsp:include page="[a page section]" />
--%>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:dockRight"><web:else>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("dockRight")%>' flush="true" />
</web:else></web:ifFeature>
</div>
</td>
</web:then></web:ifFeature>
</tr>
</table>

<%--
 Display the statistics information gathered from the page.
 This tag will not display any content if the Administrator of
 the application has not enabled client rendering logging on the
 application's configuration file
--%>
<web:logging action="statistics"/>

<web:ifFeature name="not-flash-full-screen-mode"><web:then>
<div class="mstrDockBottom" id="mstrWeb_dockBottom" name="mstrWeb_dockBottom" iframe="true" >
<%--
 Display the "dockBottom" section of the template as specified in pageConfig.xml
 <jsp:include page="[a page section]" />
--%>
<web:ifFeature name="page-rw-interactive-view-mode-full-screen-reporter"><web:else>
<web:ifFeature type="requestKey" name="hiddensections" value="contains:dockBottom"><web:else>
<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("dockBottom")%>' flush="true" />
</web:else></web:ifFeature>
</web:else></web:ifFeature>
</div>
</web:then></web:ifFeature>

</div>

<web:ifFeature name="IE7">
    <web:then>
        <div style="border-bottom: 1px solid transparent"></div> <%-- TQMS 741862 --%>
    </web:then>
</web:ifFeature>

<web:ifFeature name="dhtml"><web:then>
<web:ifFeature name="i-frame"><web:then>
<web:ifTemplateValue property="iframe"><web:then>
<%--
 This field records error and stack trace info sent from the web server
--%>
<web:ifFeature name="renderExceptionInfo" type="systemPreference"><web:then>
<textarea id="errorInfo" name="errorInfo" style="visibility:hidden; display:none;" ></textarea>
</web:then></web:ifFeature>
<web:scriptlet>
if (typeof(microstrategy) != 'undefined' && microstrategy.updateManager != null) microstrategy.updateManager.useIframe = true;
</web:scriptlet>

<!--"end:iframe"-->
</web:then></web:ifTemplateValue>
</web:then></web:ifFeature>

<!--start:Calendar-->
<%--
 The Calendar control is loaded for all pages so the prompt page and other components can
  take advantage of it.
--%>
<div id="Calendar"></div>
<!--end:Calendar-->

<!--"start:messageBox"-->
<web:displayGuiComponent type="message"/>
<!--"end:messageBox"-->

<!--"start:pageState"-->
<web:scriptPageState />
<!--"end:pageState"-->

<web:ifFeature name = "IE6">
    <web:then>
        <iframe name="popupMask" id="popupMask1" border="0" style="position:absolute;display:none;visibility:hidden" src="../html/Empty.html"></iframe>
        <iframe name="popupMask" id="popupMask2" border="0" style="position:absolute;display:none;visibility:hidden" src="../html/Empty.html"></iframe>
        <iframe name="popupMask" id="popupMask3" border="0" style="position:absolute;display:none;visibility:hidden" src="../html/Empty.html"></iframe>
        <iframe name="popupMask" id="popupMask4" border="0" style="position:absolute;display:none;visibility:hidden" src="../html/Empty.html"></iframe>
    </web:then>
</web:ifFeature>

</web:then></web:ifFeature>


<%--  Parallel JS:
Let inlineScripts handles both of the types: scriptFiles and inlineScripts. Also see the changes in ResourceMgrTagHelper java class.
--%>
<web:ifFeature name="dhtml"><web:then>
<div id="mstrInlineScripts" name="mstrInlineScripts" iframe="true">
<web:resourceMgr type="inlineScripts"/>
</div>
</web:then>
</web:ifFeature>

<web:ifFeature name="dhtml"><web:then>
<web:ifFeature name="i-frame"><web:then>
<web:ifTemplateValue property="iframe"><web:then>
<!--"start:iframe"-->
<%--
IFrame loads up. If it is visible, display the contents on the main page.
--%>
<iframe id="frameManager" name="frameManager" <web:ifFeature type="browserSetting" name="iframeVisible" value="1"><web:then>style="display: block;z-index: 100;"</web:then></web:ifFeature> src="<web:value name="servletDeploymentName" type="config" postContent="?pg=iframeIdle" />" ></iframe>
<!--"end:iframe"-->
</web:then></web:ifTemplateValue>
</web:then></web:ifFeature>
</web:then></web:ifFeature>

<textarea id="debugInfo" style="display:none">
<web:showDebugInfo contentType="text/xml" />
</textarea>

<%-- form to submit by xhr callback when response contains error of session expired  --%>
<web:formEvent formName="formRefresh" formMethod="POST" eventID="com.microstrategy.web.app.beans.EnumPageEvents.WebEventRefresh" appendPageState="false">
</web:formEvent>
    </body>
</html>