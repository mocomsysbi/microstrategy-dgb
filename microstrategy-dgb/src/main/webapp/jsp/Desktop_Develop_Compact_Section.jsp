<%
  /****
  * Desktop_Develop_Compact_Section.jsp
  * This file displays links to Create Report, Document, Filter, Prompt, Metric and Custom Group.
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
  <div class="mstrDesktopSectionTitle"><div class="mstrDesktopSectionIcon"><web:descriptor key="mstrWeb.13551" desc="Develop" /></div></div>
</web:then>
<web:else>
	<web:ifFeature name="template-documents;dhtml;documents-design-mode">
	<web:then>
 <div class="mstrDesktopSection" id="dktpSectionCreate">
  <div class="mstrDesktopSectionTitle"><div class="mstrDesktopSectionIcon"><web:descriptor key="mstrWeb.13551" desc="Develop" /></div></div>
	</web:then>
	</web:ifFeature>
</web:else>
</web:ifFeature>

  <web:ifFeature name="create-view-reports"><web:then>
    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenCreate" linkAttributes ="class='mstr-dskt-lnk new-report'">
       <div class="mstr-dskt-icn"></div>
       <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.5" desc="Create Report" /></div>
       <div class="mstr-dskt-dsc"><web:descriptor key="mstrWeb.49" desc="Create a grid or graph report from scratch or a template." /></div>
      </web:urlEvent>
  </web:then></web:ifFeature>
  <web:ifFeature name="template-documents;dhtml;documents-design-mode"><web:then>
    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenCreateDocument" linkAttributes ="class='mstr-dskt-lnk new-rwd'">
       <div class="mstr-dskt-icn"></div>
       <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.2918" desc="Create Document"/></div>
       <div class="mstr-dskt-dsc"><web:descriptor key="mstrWeb.15465" desc="Create a banded enterprise report or highly formatted dossier."/></div>
      </web:urlEvent>
  </web:then></web:ifFeature>
  <web:ifFeature name="dhtml;use-report-filter-editor;savetemplatefilter"><web:then>
    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenFilterEditor" linkAttributes ="class='mstr-dskt-lnk new-filter'">
       <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentIsNew" value="true" />
       <div class="mstr-dskt-icn"></div>
       <div class="mstr-dskt-nm"><web:descriptor desc="Create Filter" key="mstrWeb.5568"/></div>
       <div class="mstr-dskt-dsc"><web:descriptor desc="Create a filter to limit the data returned by a query." key="mstrWeb.8981"/></div>
      </web:urlEvent>
  </web:then></web:ifFeature>
  <web:ifFeature name="dhtml;use-prompt-editor"><web:then>
    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenCreatePromptPage" linkAttributes ="class='mstr-dskt-lnk new-prompt'">
       <div class="mstr-dskt-icn"></div>
       <div class="mstr-dskt-nm"><web:descriptor desc="Create Prompt" key="mstrWeb.5233"/></div>
       <div class="mstr-dskt-dsc"><web:descriptor desc="Create a prompt to let users define a report's content." key="mstrWeb.8980"/></div>
      </web:urlEvent>
  </web:then></web:ifFeature>
  <web:ifFeature name="dhtml;create-metric"><web:then>
    <a href="#" class="mstr-dskt-lnk new-metric" onclick="microstrategy.openMetricEditor();">
       <div class="mstr-dskt-icn"></div>
       <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.8978" desc="Create Metric" /></div>
       <div class="mstr-dskt-dsc"><web:descriptor desc="Create a metric to analyze data." key="mstrWeb.8977"/></div>
    </a>
  </web:then></web:ifFeature>
  <web:ifFeature name="dhtml;web-use-custom-group-editor"><web:then>
    <a href="#" class="mstr-dskt-lnk new-cg" onclick="microstrategy.openCustomGroupEditor();">
       <div class="mstr-dskt-icn"></div>
       <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.8130" desc="Create Custom Group" /></div>
       <div class="mstr-dskt-dsc"><web:descriptor desc="Create a custom group to segment report data." key="mstrWeb.8979"/></div>
    </a>
  </web:then></web:ifFeature>

<web:ifFeature name="create-objects">
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
