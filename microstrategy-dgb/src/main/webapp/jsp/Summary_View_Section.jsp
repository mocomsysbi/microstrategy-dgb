<%
  /****
  * Summary_View_Section.jsp
  * This file displays links to Shared Reports, My Reports, Create Reports and
  * Create Document.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" %>

   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <web:ifFeature name="public-reports"><web:then>
     <tr>
      <td width="100%" valign="top">
      <!-- BEGIN: SHARED REPORTS -->
       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mstrSummaryHeader">
        <tr>
         <td colspan="2" nowrap="1">&nbsp;&nbsp;
          <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenSharedReports"><web:descriptor key="mstrWeb.2" desc="Shared Reports" /></web:urlEvent>
         </td>
         <td  align="right">
          <web:ifDisplayMore bean="shared" maxObjects="3:6;8:10;55:2"><web:then>
           <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenSharedReports" ><span class="summary-more"><web:descriptor key="mstrWeb.1005" desc="More..." /></span></web:urlEvent>&nbsp;
          </web:then></web:ifDisplayMore>
         </td>
        </tr>
       </table>
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
         <td valign="top">
          <web:displayGuiComponent name="summary_shared"/>
         </td>
        </tr>
       </table>
       <!-- END: SHARED REPORTS -->
      </td>
     </tr>

     <tr>
      <td><img src="../images/1ptrans.gif" width="1" height="20" alt="" border="0" /></td>
     </tr>
    </web:then></web:ifFeature>

    <web:ifFeature name="profile-reports"><web:then>
     <tr>
      <td width="100%" valign="top">
       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mstrSummaryHeader">
        <!-- BEGIN: MY REPORTS -->
        <tr>
         <td colspan="3" nowrap="1">&nbsp;&nbsp;
          <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenMyReports"><web:descriptor key="mstrWeb.3" desc="My Reports" /></web:urlEvent>
         </td>
         <td align="right">
          <web:ifDisplayMore bean="my" maxObjects="3:6;8:10;55:2"><web:then>
           <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenMyReports" ><span class="summary-more"><web:descriptor key="mstrWeb.1005" desc="More..." /></span></web:urlEvent>&nbsp;
          </web:then></web:ifDisplayMore>
         </td>
        </tr>
       </table>
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
         <td valign="top" colspan="3">
          <web:displayGuiComponent name="summary_my"/>
         </td>
        </tr>
        <!-- END: MY REPORTS -->
       </table>
      </td>
     </tr>

     <tr>
      <td><img src="../images/1ptrans.gif" width="1" height="20" alt="" border="0" /></td>
     </tr>
    </web:then></web:ifFeature>

    <web:ifFeature name="template-reports">
     <web:then>
      <tr>
       <td width="100%" valign="top">
        <!-- BEGIN: CREATE REPORTS -->
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mstrSummaryHeader">
         <tr>
          <td colspan="3" nowrap="1">&nbsp;&nbsp;
           <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenCreate"><web:descriptor key="mstrWeb.5" desc="Create Report" /></web:urlEvent>
          </td>
          <td align="right">
           <web:ifDisplayMore bean="create" maxObjects="3:6;8:10;55:2"><web:then>
            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenCreate" ><span class="summary-more"><web:descriptor key="mstrWeb.1005" desc="More..." /></span></web:urlEvent>&nbsp;
           </web:then></web:ifDisplayMore>
          </td>
         </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
          <td valign="top" colspan="3">
             <div class="mstrPanelPortrait" id="create_report">
				<%-- Render the 'Create Reports' bean. --%>
	            <web:displayBean bean="create" styleName="FolderStyleCreateReportSummary" />
             </div>
          </td>
         </tr>
        </table>
        <!-- END: CREATE REPORTS -->
       </td>
      </tr>
      <tr>
       <td><img src="../images/1ptrans.gif" width="1" height="20" alt="" border="0" /></td>
      </tr>
     </web:then></web:ifFeature>

    <web:ifFeature name="template-documents;dhtml;documents-design-mode">
     <web:then>
      <tr>
       <td width="100%" valign="top">
        <!-- BEGIN: CREATE DOCUMENTS -->
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mstrSummaryHeader">
         <tr>
          <td colspan="3" nowrap="1">&nbsp;&nbsp;
           <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenCreateDocument"><web:descriptor key="mstrWeb.2918" desc="Create Document" /></web:urlEvent>
          </td>
          <td align="right">
           <web:ifDisplayMore bean="createDocument" maxObjects="14081:6;8:10"><web:then>
            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenCreateDocument"><span Class="summary-more"><web:descriptor key="mstrWeb.1005" desc="More..." /></span></web:urlEvent>&nbsp;
           </web:then></web:ifDisplayMore>
          </td>
         </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
          <td valign="top" colspan="3">
             <div class="mstrPanelPortrait" id="create_document">
             <%-- Render the 'Create Documents' section. --%>
	            <web:displayBean bean="createDocument" styleName="FolderStyleCreateDocumentSummary" />
             </div>
          </td>
         </tr>
        </table>
        <!-- END: CREATE DOCUMENTS -->
       </td>
      </tr>
      <tr>
       <td><img src="../images/1ptrans.gif" width="1" height="20" alt="" border="0" /></td>
      </tr>
     </web:then></web:ifFeature>


    </table>
