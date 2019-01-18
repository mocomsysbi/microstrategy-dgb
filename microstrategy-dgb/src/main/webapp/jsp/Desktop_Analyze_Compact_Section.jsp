<%
  /****
  * Desktop_Analyze_Compact_Section.jsp
  * This file displays links to Create Dashboard and Import.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<web:clientSideDescriptor IDs = "15474" />
<web:ifFeature name="dhtml;create-analysis">
<web:then>
 <div class="mstrDesktopSection" id="dktpSectionCreate">
  <div class="mstrDesktopSectionTitle"><div class="mstrDesktopSectionIcon"><web:descriptor key="mstrWeb.13549" desc="Analyze" /></div></div>
</web:then>
<web:else>
	<web:ifFeature name="dhtml;web-import-data">
	<web:then>
 <div class="mstrDesktopSection" id="dktpSectionCreate">
  <div class="mstrDesktopSectionTitle"><div class="mstrDesktopSectionIcon"><web:descriptor key="mstrWeb.13549" desc="Analyze" /></div></div>
	</web:then>
    <web:else>
        <web:ifFeature name="dhtml;web-import-data;save-report-privilege">
        <web:then>
     <div class="mstrDesktopSection" id="dktpSectionCreate">
      <div class="mstrDesktopSectionTitle"><div class="mstrDesktopSectionIcon"><web:descriptor key="mstrWeb.13549" desc="Analyze" /></div></div>
        </web:then>
        </web:ifFeature>
    </web:else>
	</web:ifFeature>
</web:else>
</web:ifFeature>

  <web:ifFeature name="dhtml;create-analysis"><web:then>
    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventCreateBlankVI" linkAttributes ="class='mstr-dskt-lnk new-analysis' onclick='return submitCreateIVELink(this,event)'">
       <div class="mstr-dskt-icn"></div>
       <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.14825" desc="Create Dossier" /></div>
       <div class="mstr-dskt-dsc"><web:descriptor desc="Create a dossier from imported or existing data." key="mstrWeb.15434"/></div>
    </web:urlEvent>
  </web:then></web:ifFeature>
  <web:ifFeature name="dhtml;web-import-data"><web:then>
    <web:ifFeature type="systemPreference" name="enableQB"><web:then>
      <a href="javascript:void(0)" class="mstr-dskt-lnk import" onclick="microstrategy.openDataImport();">
        <div class="mstr-dskt-icn"></div>
        <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.13836" desc="Add External Data" /></div>
        <div class="mstr-dskt-dsc"><web:descriptor desc="Import data from files, databases, Salesforce, Hadoop, or web services." key="mstrWeb.9170"/></div>
     </a>
    </web:then><web:else>
      <a href="javascript:void(0)" class="mstr-dskt-lnk import" onclick="microstrategy.openDataImport();">
        <div class="mstr-dskt-icn"></div>
        <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.13836" desc="Add External Data" /></div>
        <div class="mstr-dskt-dsc"><web:descriptor desc="Import data from files, databases, Salesforce, Hadoop, or web services." key="mstrWeb.9170"/></div>
     </a>
    </web:else></web:ifFeature>
    <web:ifFeature name="dhtml;web-import-data;enable-app-schema"><web:then>
     <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenAppSchemaPage" linkAttributes="class='mstr-dskt-lnk appschema'" includeState="false">
       <div class="mstr-dskt-icn"></div>
       <div class="mstr-dskt-nm">Smart Data Preparation</div>
       <div class="mstr-dskt-dsc"><web:descriptor desc="Build the Next Generation Application." /></div>
    </web:urlEvent>
   </web:then>
 </web:ifFeature>
  </web:then></web:ifFeature>
  <web:ifFeature name="dhtml;web-import-data;save-report-privilege;web-import-mstr"><web:then>
    <span class="mstr-dskt-lnk mstr-file">
        <div class="mstr-dskt-icn"></div>
        <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.13404" desc="Upload MicroStrategy File" /></div>
        <div class="mstr-dskt-dsc"><web:descriptor key="mstrWeb.15491" desc="Upload a dossier packaged in a MicroStrategy (.mstr) file." /></div>
        <form id="import_form_dsktp"class="mstrmojo-FileUploadBox" target="import_iframe_dsktp" enctype="multipart/form-data" method="post" action="<web:taskProcessorName />">
            <input type="file" class="mstrmojo-FileUploadBox-file" size="30" name="myFile" onchange="microstrategy.uploadDashboardFile('import_form_dsktp');" accept=".mstr" title="">
            <input type="hidden" name="fileFieldName" value="myFile">
            <input type="hidden" name="taskId" value="importAsyncSaveRWD">
            <input type="hidden" name="taskEnv" value="jsonp2">
            <input type="hidden" name="jsonp" value="parent.microstrategy.uploadCallback(@R@)">
            <input type="hidden" name="myfile" value="">
            <input type="hidden" name="sessionState" value = "<web:connectionValue property="sessionState"/>">
            <input type="hidden" name="folderID" value="" id="import_folderID">
        </form>
        <iframe name="import_iframe_dsktp" style="display:none;" src="about:blank"></iframe>
    </span>
  </web:then></web:ifFeature>

<web:ifFeature name="dhtml;create-analysis">
<web:then>
 </div>
</web:then>
<web:else>
    <web:ifFeature name="dhtml;web-import-data">
    <web:then>
 </div>
    </web:then>
    <web:else>
        <web:ifFeature name="dhtml;web-import-data;save-report-privilege">
        <web:then>
    </div>
    </web:then>
        </web:ifFeature>
    </web:else>
    </web:ifFeature>
</web:else>
</web:ifFeature>
