<%
/*
 * Document_LeftToolbar.jsp
 * This page displays the left toolbar for the Report page.which will display the related reports
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<%--Display the Related Reports section if the user has the "lTbar" enabled.--%>
<web:ifFeature name="lTbar" type="browserSetting" value="1"><web:then>
 <web:ifFeature name="dhtml"><web:then>
  <web:resource type="javascript" name="relatedReports.js"/>
  <div id="relatedReports" scriptclass="mstrRelatedReportsImpl" >
 </web:then></web:ifFeature>
 <div class="mstrPanelTitleBar"> 
    <span class="mstrPanelTitle">
         <web:descriptor key="mstrWeb.106" desc="RELATED REPORTS" />
     </span>
     <span class="mstrPanelTitleButtonBar">       
        <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumPageEvents.WebEventSetPermanentBrowserSetting">
            <img <web:resource attribute="SRC" name="1ptrans.gif"/> id="btnDockLeft" class="mstrIcon-btn mstrIcon-btnClose" <web:descriptor attribute="title" key="mstrWeb.2102" desc="Close" /> />
            <web:eventArgument name="com.microstrategy.web.app.beans.EnumPageEvents.WebEventArgumentBrowserSettingName" value="lTbar" />
            <web:eventArgument name="com.microstrategy.web.app.beans.EnumPageEvents.WebEventArgumentBrowserSettingValue" value="0" />
        </web:urlEvent>
     </span>   
</div>

<web:displayBean bean="frame.db" styleName="DocumentStyleRelatedReports"/>
 <web:ifFeature name="dhtml"><web:then>
  </div>
  <web:scriptlet>
  if (typeof(microstrategy) != 'undefined') microstrategy.bonesToRegister.push({id : "relatedReports", loadCondition : "true",  properties : null});
  </web:scriptlet>
 </web:then></web:ifFeature>
</web:then></web:ifFeature>
