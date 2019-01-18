<%
  /****
  * Desktop_Create_Section.jsp
  * This file displays links to Create Report and Create Document.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" %>
    <web:clientSideDescriptor IDs = "15474" />
<web:ifFeature name="create-objects">
<web:then>
 <div class="mstrDesktopSection" id="dktpSectionCreate">
  <div class="mstrDesktopSectionTitle"><div class="mstrDesktopSectionIcon"><web:descriptor key="mstrWeb.6155" desc="Create" /></div></div>
</web:then>
<web:else>
	<web:ifFeature name="template-documents;dhtml;documents-design-mode">
	<web:then>
 <div class="mstrDesktopSection" id="dktpSectionCreate">
  <div class="mstrDesktopSectionTitle"><div class="mstrDesktopSectionIcon"><web:descriptor key="mstrWeb.6155" desc="Create" /></div></div>
	</web:then>
	</web:ifFeature>
</web:else>
</web:ifFeature>

<div class="mstrLargeIconView">
 <web:dynTable cols="2" >
  <col class="mstrLargeIconViewCell" />
  <col class="mstrLargeIconViewCell" />

  <web:ifFeature name="dhtml;create-analysis"><web:then>
  <web:dynTableCell>
   <table class="mstrLargeIconViewItem" cellspacing="0">
    <tr><td>
        <span class="mstrIcon" id="mstrIconIVE" <web:descriptor attribute="title" key="mstrWeb.14825" desc="Create Dossier" /> onclick="microstrategy.createIVE();" style="cursor: pointer;"></span>
    </td><td class="mstrLargeIconViewItemText">
    <div class="mstrLargeIconViewItemName">
        <a href="#" class="mstrLink" onclick="microstrategy.createIVE();"><web:descriptor key="mstrWeb.14825" desc="Create Dossier" /></a>
    </div>
    <div class="mstrLargeIconViewItemDescription">
     <web:descriptor desc="Create an enterprise report, scorecard, or dossier from scratch or from a template." key="mstrWeb.15446"/>
    </div>
   </td></tr></table>
  </web:dynTableCell>
 </web:then></web:ifFeature>

  <%-- Show the "Create Report" icon if the feature is enabled for the current user.--%>
  <web:ifFeature name="create-view-reports"><web:then>
   <web:dynTableCell>
    <table class="mstrLargeIconViewItem" cellspacing="0">
     <tr><td>
     <web:ifFeature name="accessibility"><web:then>
      <img class="a508" <web:resource type="style" attribute="src" name="mstr/images/dktpCreateReport.gif"/> <web:descriptor attribute="alt" key="mstrWeb.5" desc="Create Report" /> <web:descriptor attribute="title" key="mstrWeb.5" desc="Create Report" /> />
     </web:then><web:else>
      <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenCreate">
       <span class="mstrIcon" id="mstrIconCreateReport" <web:descriptor attribute="title" key="mstrWeb.5" desc="Create Report" /> ></span>
      </web:urlEvent>
     </web:else></web:ifFeature>
    </td><td class="mstrLargeIconViewItemText">
     <div class="mstrLargeIconViewItemName">
      <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenCreate">
       <web:descriptor key="mstrWeb.5" desc="Create Report" />
      </web:urlEvent>
     </div>
     <div class="mstrLargeIconViewItemDescription">
      <web:descriptor key="mstrWeb.49" desc="Create and publish a new report on this site." /><BR />
     </div>
    </td></tr></table>
   </web:dynTableCell>
  </web:then></web:ifFeature>
  <%-- Show the "Create Document" icon if the feature is enabled for the current user. --%>
 <web:ifFeature name="template-documents;dhtml;documents-design-mode"><web:then>
  <web:dynTableCell>
   <table class="mstrLargeIconViewItem" cellspacing="0">
    <tr><td>
    <web:ifFeature name="accessibility"><web:then>
     <img class="a508" <web:resource type="style" attribute="src" name="mstr/images/dktpCreateDocument.gif"/> <web:descriptor attribute="alt" key="mstrWeb.2918" desc="Create Document" /> <web:descriptor attribute="title" key="mstrWeb.2918" desc="Create Document" /> />
    </web:then><web:else>
     <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenCreateDocument">
      <span class="mstrIcon" id="mstrIconCreateDocument" <web:descriptor attribute="title" key="mstrWeb.2918" desc="Create Document" /> ></span>
     </web:urlEvent>
    </web:else></web:ifFeature>
    </td><td class="mstrLargeIconViewItemText">
    <div class="mstrLargeIconViewItemName">
     <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenCreateDocument">
      <web:descriptor key="mstrWeb.3288" desc="Create Document"/>
     </web:urlEvent>
    </div>
    <div class="mstrLargeIconViewItemDescription">
     <web:descriptor key="mstrWeb.15446" desc="Create a new document on this site."/>
    </div>
   </td></tr></table>
  </web:dynTableCell>
 </web:then></web:ifFeature>

  <%-- Show the "Create Prompt" icon if the feature is enabled for the current user. --%>
 <web:ifFeature name="dhtml;use-prompt-editor"><web:then>
  <web:dynTableCell>
   <table class="mstrLargeIconViewItem" cellspacing="0">
    <tr><td>
    <web:ifFeature name="accessibility"><web:then>
     <img <web:resource attribute="src" name="1ptrans.gif"/> <web:descriptor attribute="alt" key="mstrWeb.5233" desc="Create Prompt" /> />
    </web:then><web:else>
		<web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenCreatePromptPage">
      <span class="mstrIcon" id="mstrIconCreatePrompt" <web:descriptor attribute="title" key="mstrWeb.5233" desc="Create Prompt" /> ></span>
     </web:urlEvent>
    </web:else></web:ifFeature>
    </td><td class="mstrLargeIconViewItemText">
    <div class="mstrLargeIconViewItemName">
		<web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenCreatePromptPage">
	      <web:descriptor desc="Create Prompt" key="mstrWeb.5233"/>
     </web:urlEvent>
    </div>
    <div class="mstrLargeIconViewItemDescription">
     <web:descriptor desc="Create a prompt to ask for user input." key="mstrWeb.8980"/>
    </div>
   </td></tr></table>
  </web:dynTableCell>
 </web:then></web:ifFeature>

   <%-- Show the "Create Filter" icon if the feature is enabled for the current user. --%>
 <web:ifFeature name="dhtml;use-report-filter-editor;savetemplatefilter"><web:then>
  <web:dynTableCell>
   <table class="mstrLargeIconViewItem" cellspacing="0">
    <tr><td>
    <web:ifFeature name="accessibility"><web:then>
     <img <web:resource type="style" attribute="src" name="mstr/images/dktpCreateFilter.gif"/> <web:descriptor attribute="alt" key="mstrWeb.5568" desc="Create Filter" /> />
    </web:then><web:else>
		<web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenFilterEditor">
        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentIsNew" value="true" />

      <span class="mstrIcon" id="mstrIconCreateFilter" <web:descriptor attribute="title" key="mstrWeb.5568" desc="Create Filter" /> ></span>
     </web:urlEvent>
    </web:else></web:ifFeature>
    </td><td class="mstrLargeIconViewItemText">
    <div class="mstrLargeIconViewItemName">
		<web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenFilterEditor">
            <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentIsNew" value="true" />
	      <web:descriptor desc="Create Filter" key="mstrWeb.5568"/>
     </web:urlEvent>
    </div>
    <div class="mstrLargeIconViewItemDescription">
     <web:descriptor desc="Create a filter to filter data." key="mstrWeb.8981"/>
    </div>
   </td></tr></table>
  </web:dynTableCell>
 </web:then></web:ifFeature>

   <%-- Show the "Import Data" icon if the feature is enabled for the current user. --%>
 <web:ifFeature name="dhtml;web-import-data"><web:then>
	 <web:dynTableCell>
	   <table class="mstrLargeIconViewItem" cellspacing="0">
	    <tr><td>
	        <span class="mstrIcon" id="mstrIconImportData" <web:descriptor attribute="title" key="mstrWeb.13427" desc="Access Data" /> onclick="microstrategy.openDataImport();" style="cursor: pointer;"></span>
	    </td><td class="mstrLargeIconViewItemText">
	    <div class="mstrLargeIconViewItemName">
	        <a href="#" class="mstrLink" onclick="microstrategy.openDataImport();"><web:descriptor key="mstrWeb.13427" desc="Access Data" /></a>
	    </div>
	    <div class="mstrLargeIconViewItemDescription">
	     <web:descriptor desc="Import Data from Files, Databases, Salesforce, Hadoop or Web Services." key="mstrWeb.9170"/>
	    </div>
	   </td></tr></table>
	  </web:dynTableCell>
 </web:then></web:ifFeature>

 <web:ifFeature name="dhtml;web-use-custom-group-editor"><web:then>
  <web:dynTableCell>
   <table class="mstrLargeIconViewItem" cellspacing="0">
    <tr><td>
        <span class="mstrIcon" id="mstrIconCGE" <web:descriptor attribute="title" key="mstrWeb.8130" desc="Create Custom Group" /> onclick="microstrategy.openCustomGroupEditor();" style="cursor: pointer;"></span>
    </td><td class="mstrLargeIconViewItemText">
    <div class="mstrLargeIconViewItemName">
        <a href="#" class="mstrLink" onclick="microstrategy.openCustomGroupEditor();"><web:descriptor key="mstrWeb.8130" desc="Create Custom Group" /></a>
    </div>
    <div class="mstrLargeIconViewItemDescription">
     <web:descriptor desc="Create a custom group to segment report data." key="mstrWeb.8979"/>
    </div>
   </td></tr></table>
  </web:dynTableCell>
 </web:then></web:ifFeature>

  <web:ifFeature name="dhtml;create-metric"><web:then>
  <web:dynTableCell>
   <table class="mstrLargeIconViewItem" cellspacing="0">
    <tr><td>
        <span class="mstrIcon" id="mstrIconME" <web:descriptor attribute="title" key="mstrWeb.8978" desc="Create Metric" /> onclick="microstrategy.openMetricEditor();" style="cursor: pointer;"></span>
    </td><td class="mstrLargeIconViewItemText">
    <div class="mstrLargeIconViewItemName">
        <a href="#" class="mstrLink" onclick="microstrategy.openMetricEditor();"><web:descriptor key="mstrWeb.8978" desc="Create Metric" /></a>
    </div>
    <div class="mstrLargeIconViewItemDescription">
     <web:descriptor desc="Create a metric to analyze data." key="mstrWeb.8977"/>
    </div>
   </td></tr></table>
  </web:dynTableCell>
 </web:then></web:ifFeature>

 </web:dynTable>
</div>

<web:ifFeature name="template-reports">
<web:then>
 </div>
</web:then>
<web:else>
	<web:ifFeature name="template-documents;dhtml;documents-design-mode">
	<web:then>
 </div>
	</web:then>
	</web:ifFeature>
</web:else>
</web:ifFeature>
