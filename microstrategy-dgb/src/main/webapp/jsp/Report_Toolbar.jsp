<%
/*
 * Report_Toolbar.jsp
 * This page displays the menus and toolbars for the Report page.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<div class="mstrDockTopContainer">
<%-- Only show the menus and toolbars if the report bean is "ready": --%>
<web:ifBeanValue bean="frame.rb" property="getXMLStatus" value="3"><web:then>
 <%--Toolbars: only show in view mode --%>
 <web:ifBeanValue bean="frame" property="getDesignMode" value="0"><web:then>
  <web:ifFeature name="dhtml">
    <web:then>
     <div class='mstrDockTopContent'>    
	   <web:displayGuiComponent name="ribbonFeaturesUpdate"/>
        <web:displayBean bean="ribbonBean" styleName="RptRibbonToolbars" />
     </div>
    </web:then>
  </web:ifFeature>

	  <web:ifFeature name="dhtml">
	  <web:then>
		<!-- New toolbar -->
		<%-- wrapper DIV for toolbars/menubar, which has fixed height to avoid pushing down doc section when toolbars are loaded --%>
	  <%--
		<div id = "standardToolbarFullScreenHolder" layout="ReportFullscreenToolbarBlockLoader" class="mstrTabbedMenuVBoxItem"></div>
	  --%>
	  </web:then>
	  <web:else>
		  <!-- Old toolbar -->
		  <div class="mstrMenuBar" id="mstrMenuDiv">
		    <table border=0 cellpadding=0 cellspacing=0 ><tr>
		     <td class="mstrMenuItems"><web:displayGuiComponent name="report_menus" /></td>
		     <td class="mstrMenuLastUpdated" nowrap><web:displayGuiComponent name="report_last_update" /></td>
		    </tr></table>
		   </div>
		   <web:displayGuiComponent name="report_toolbar_standard" />
		   <div id = "normalScreenOnlyToolBar">
		   <web:displayGuiComponent name="report_toolbar_crosstab" />
		   <web:displayGuiComponent name="report_toolbar_grid" />
		   <web:displayGuiComponent name="report_toolbar_graph" />
		   <web:displayGuiComponent name="report_toolbar_panels" />
		   <web:displayGuiComponent name="report_toolbar_format" />
		  </div>
		  <div class="mstrSpacer"/>
	   </web:else></web:ifFeature>

 </web:then>
 <web:else>
   <web:displayGuiComponent name="report_design_mode_toolbar" />
   <web:displayGuiComponent name="report_toolbar_graph" />
   <div class="mstrSpacer"/>
 </web:else></web:ifBeanValue>
</web:then></web:ifBeanValue>
</div>