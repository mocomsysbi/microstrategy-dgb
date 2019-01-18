<%
  /****
  * Summary_Tools_Section.jsp
  * This file displays links to My Subscriptions, History List and Preferences.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" %>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
     
      <tr>
       <td width="100%" valign="top">
        <!-- BEGIN: MY SUBSCRIPTIONS -->
        <web:ifFeature name="subscriptions"><web:then>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mstrSummaryHeader">
         <tr>
          <td colspan="3" nowrap="1">&nbsp;&nbsp;
           <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenMySubscriptions"><web:descriptor key="mstrWeb.1077" desc="My Subscriptions" /></web:urlEvent>
          </td>
          <td align="right">
           <web:ifDisplayMore bean="webSubscriptions" maxObjects="5"><web:then>
            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenMySubscriptions"><span class="summary-more"><web:descriptor key="mstrWeb.1005" desc="More..." /></span></web:urlEvent>&nbsp;
           </web:then><web:else>
            <web:ifDisplayMore bean="ncSubscriptions" maxObjects="5"><web:then>
             <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenMySubscriptions"><span class="summary-more"><web:descriptor key="mstrWeb.1005" desc="More..." /></span></web:urlEvent>&nbsp;
            </web:then></web:ifDisplayMore>
           </web:else></web:ifDisplayMore>
          </td>
         </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
          <td valign="top" colspan="3">
             <%-- Render the 'NC Subcriptions' section. --%>
             <web:displayBean bean="ncSubscriptions" styleName="NCSubscriptionsListStyle" />
          </td>
         </tr>
        </table>
        <!-- END: MY SUBSCRIPTIONS -->

       </td>
      </tr>

      <tr>
       <td><img src="../images/1ptrans.gif" width="1" height="20" alt="" border="0" /></td>
      </tr>
      </web:then>
     </web:ifFeature>
     <web:ifFeature name="history-list"><web:then>
      <tr>
       <td width="100%" valign="top">
        <!-- BEGIN: HISTORY LIST -->
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mstrSummaryHeader">
         <tr>
          <td width="99%" colspan="3" nowrap="1">&nbsp;&nbsp;
           <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHistoryList"><web:descriptor key="mstrWeb.4" desc="History List" /></web:urlEvent>
          </td>
          <td width="1%" align="right">
           <web:ifDisplayMore bean="inbox" maxObjects="5"><web:then>
            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHistoryList"><span class="summary-more"><web:descriptor key="mstrWeb.1005" desc="More..." /></span></web:urlEvent>&nbsp;
           </web:then></web:ifDisplayMore>
          </td>
         </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
          <td valign="top" colspan="3">
             <%-- Render the 'History List' bean. --%>
           <web:displayBean bean="inbox" styleName="HistoryListSummaryStyle" />
          </td>
         </tr>
        </table>
        <!-- END: HISTORY LIST -->
       </td>
      </tr>

      <tr>
       <td><img src="../images/1ptrans.gif" width="1" height="20" alt="" border="0" /></td>
      </tr>
     </web:then></web:ifFeature>

     <web:ifFeature name="preferences"><web:then>
      <tr>
       <td width="100%" valign="top">
        <!-- BEGIN: PREFERENCES -->
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mstrSummaryHeader">
         <tr>
         <td width="99%" colspan="3" nowrap="1">&nbsp;&nbsp;
          <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPreferences"><web:descriptor key="mstrWeb.862" desc="Preferences" /></web:urlEvent>
         </td>
         <td width="1%" align="right">
          <!-- More not needed -->
         </td>
        </tr>
       </table>
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
         <td colspan="3" valign="top">
     <%-- Render hyperlinks to the various 'Preferences' section. --%>
     <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPreferences">
        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentPreferenceGroup" value="general"/>
        <web:descriptor key="mstrWeb.295" desc="General"  />
     </web:urlEvent>,&nbsp;

     <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPreferences">
        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentPreferenceGroup" value="grid"/> 
        <web:descriptor key="mstrWeb.240" desc="Grid  display" />
     </web:urlEvent>,&nbsp;

     <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPreferences">
        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentPreferenceGroup" value="graph"/> 
        <web:descriptor key="mstrWeb.268" desc="Graph display"  />
     </web:urlEvent>,&nbsp;
     
     <web:ifFeature name="export">
        <web:then>
            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenExportOptions">
                <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentPreferenceGroup" value="export"/> 
                <web:descriptor key="mstrWeb.246" desc="Export" />
            </web:urlEvent>,&nbsp;
        </web:then>
     </web:ifFeature>
     
     <web:ifFeature name="pdf;pdf-print">
        <web:then>
            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPDFOptions">
                <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentPreferenceGroup" value="pdfPrint"/> 
                 <web:descriptor key="mstrWeb.3092" desc="Print (PDF)" />
            </web:urlEvent>,&nbsp;
        </web:then>
     </web:ifFeature>
     
     <web:ifFeature name="change-drill-preferences">
        <web:then>
            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPreferences">
                <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentPreferenceGroup" value="drill"/> 
                <web:descriptor key="mstrWeb.692" desc="Drill modes"  />
            </web:urlEvent>,&nbsp;
        </web:then>
     </web:ifFeature>
     
     <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPreferences">
        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentPreferenceGroup" value="prompts"/> 
        <web:descriptor key="mstrWeb.326" desc="Prompts"  />
     </web:urlEvent>,&nbsp;
     
     <web:ifFeature name="show-logout-options">
        <web:then>
            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPreferences">
                <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentPreferenceGroup" value="security"/> 
                <web:descriptor key="mstrWeb.2696" desc="Security" />
            </web:urlEvent>,&nbsp;
        </web:then>
     </web:ifFeature>
     
     <web:ifFeature name="create-email-address">
        <web:then>
            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventNCAddresses"> 
                <web:descriptor key="mstrWeb.3127" desc="Email Addresses"  />
            </web:urlEvent>,&nbsp;
        </web:then>
     </web:ifFeature>
     
     <web:ifFeature name="create-file-location">
        <web:then>
            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventNCFileAddresses"> 
                <web:descriptor key="mstrWeb.3128" desc="File Locations"  />
            </web:urlEvent>,&nbsp;
        </web:then>
     </web:ifFeature>
     
     <web:ifFeature name="create-print-location">
        <web:then>
            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventNCPrintAddresses"> 
                <web:descriptor key="mstrWeb.3147" desc="Printers"  />
            </web:urlEvent>
        </web:then>
     </web:ifFeature>

         </td>
        </tr>
       </table>
       <!-- END: PREFERENCES -->
      </td>
     </tr>
      <tr>
      <td><img src="../images/1ptrans.gif" width="1" height="20" alt="" border="0" /></td>
     </tr>
    </web:then></web:ifFeature>
   </table>

