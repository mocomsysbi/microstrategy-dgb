<%
  /****
  * Desktop_View_Section.jsp
  * This file displays links to Shared Reports, My Reports, and History List.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<web:ifFeature name="public-reports">
<web:then>
 <div class="mstrDesktopSection" id="dktpSectionView">
  <div class="mstrDesktopSectionTitle"><div class="mstrDesktopSectionIcon"><web:descriptor key="mstrWeb.1825" desc="Browse" /></div></div>
</web:then>
<web:else>
	<web:ifFeature name="profile-reports">
	<web:then>
 <div class="mstrDesktopSection" id="dktpSectionView">
  <div class="mstrDesktopSectionTitle"><div class="mstrDesktopSectionIcon"><web:descriptor key="mstrWeb.1825" desc="Browse" /></div></div>
	</web:then>
	<web:else>
		<web:ifFeature name="history-list">
		<web:then>
 <div class="mstrDesktopSection" id="dktpSectionView">
  <div class="mstrDesktopSectionTitle"><div class="mstrDesktopSectionIcon"><web:descriptor key="mstrWeb.1825" desc="Browse" /></div></div>
		</web:then>
	<web:else>
		<web:ifFeature name="subscriptions">
		<web:then>
 <div class="mstrDesktopSection" id="dktpSectionView">
  <div class="mstrDesktopSectionTitle"><div class="mstrDesktopSectionIcon"><web:descriptor key="mstrWeb.1825" desc="Browse" /></div></div>
		</web:then>
		</web:ifFeature>
	</web:else>
		</web:ifFeature>
	</web:else>
	</web:ifFeature>
</web:else>
</web:ifFeature>

<div class="mstrLargeIconView">
 <web:dynTable cols="2" >
  <col />
  <col />

  <%--
   Show the "Shared Reports" icon if the feature is enabled for the current user.
  --%>
  <web:ifFeature name="public-reports"><web:then>
   <web:dynTableCell>
    <table cellspacing="0" class="mstrLargeIconViewItem">
    <tr><td>
     <web:ifFeature name="accessibility"><web:then>
      <img class="a508" <web:resource type="style" attribute="src" name="mstr/images/dktpSharedReports.gif"/> <web:descriptor attribute="alt" key="mstrWeb.2" desc="Shared Reports" /> <web:descriptor attribute="title" key="mstrWeb.2" desc="Shared Reports" /> />
     </web:then><web:else>
      <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenSharedReports">
       	<span class="mstrIcon" id="mstrIconSharedReports" <web:descriptor attribute="title" key="mstrWeb.2" desc="Shared Reports" />></span>
      </web:urlEvent>
     </web:else></web:ifFeature>
     </td><td class="mstrLargeIconViewItemText">
     <div class="mstrLargeIconViewItemName">
      <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenSharedReports">
	       <web:descriptor key="mstrWeb.2" desc="Shared Reports" />
      </web:urlEvent>
     </div>
     <div class="mstrLargeIconViewItemDescription">
      <web:descriptor key="mstrWeb.1322" desc="Browse a list of prepared reports available to all users." />
     </div>
    </td></tr></table>
   </web:dynTableCell>
  </web:then></web:ifFeature>
  <%--Show the "My Reports" icon if the feature is enabled for the current user. --%>
  <web:ifFeature name="profile-reports"><web:then>
   <web:dynTableCell>
    <table cellspacing="0" class="mstrLargeIconViewItem">
    <tr><td>
     <web:ifFeature name="accessibility"><web:then>
      <img class="a508" <web:resource type="style" attribute="src" name="mstr/images/dktpMyReports.gif"/> <web:descriptor attribute="alt" key="mstrWeb.3" desc="My Reports" /> <web:descriptor attribute="title" key="mstrWeb.3" desc="My Reports" /> />
     </web:then><web:else>
      <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenMyReports">
       	<span class="mstrIcon" id="mstrIconMyReports" <web:descriptor attribute="title"  key="mstrWeb.3" desc="My Reports" /> ></span>
      </web:urlEvent>
     </web:else></web:ifFeature>
     </td><td class="mstrLargeIconViewItemText">
     <div class="mstrLargeIconViewItemName">
      <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenMyReports">
       <web:descriptor key="mstrWeb.3" desc="My Reports" />
      </web:urlEvent>
      </div>
      <div class="mstrLargeIconViewItemDescription">
       <web:descriptor key="mstrWeb.48" desc="View reports you have created and saved for future use." />
      </div>
    </td></tr></table>
   </web:dynTableCell>
  </web:then></web:ifFeature>
  <%-- Show the "History List" icon if the feature is enabled for the current user. --%>
 <web:ifFeature name="history-list"><web:then>
  <web:dynTableCell>
   <table cellspacing="0" class="mstrLargeIconViewItem">
   <tr><td>
    <web:ifFeature name="accessibility"><web:then>
     <img class="a508" <web:resource type="style" attribute="src" name="mstr/images/dktpHistoryList.gif"/> <web:descriptor attribute="alt" key="mstrWeb.4" desc="History List" /> <web:descriptor attribute="title" key="mstrWeb.4" desc="History List" /> />
    </web:then><web:else>
      <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHistoryList" >
      <span class="mstrIcon" id="mstrIconHistoryList" <web:descriptor attribute="title" key="mstrWeb.4" desc="History List" /> ></span>
     </web:urlEvent>
    </web:else></web:ifFeature>
    </td><td class="mstrLargeIconViewItemText">
    <div class="mstrLargeIconViewItemName">
     <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHistoryList">
      <web:descriptor key="mstrWeb.4" desc="History List" />
     </web:urlEvent>
    </div>
    <div class="mstrLargeIconViewItemDescription">
     <web:descriptor  key="mstrWeb.50" desc="View an up-to-date summary of the status of my requests." />
    </div>
   </td></tr></table>
  </web:dynTableCell>
 </web:then></web:ifFeature>
  <%-- Show the "My subscriptions" icon if the feature is enabled for the current user. --%>
 <web:ifFeature name="subscriptions"><web:then>
  <web:dynTableCell>
   <table cellspacing="0" class="mstrLargeIconViewItem">
   <tr><td>
    <web:ifFeature name="accessibility"><web:then>
     <img class="a508" <web:resource type="style" attribute="src" name="mstr/images/dktpScheduledReports.gif"/> <web:descriptor attribute="alt" key="mstrWeb.1077" desc="My Subscriptions" /> <web:descriptor attribute="title" key="mstrWeb.1077" desc="My Subscriptions" /> />
    </web:then><web:else>
     <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenMySubscriptions">
      <span class="mstrIcon" id="mstrIconMySubscriptions" <web:descriptor attribute="title" key="mstrWeb.1077" desc="My Subscriptions" /> ></span>
     </web:urlEvent>
    </web:else></web:ifFeature>
    </td><td class="mstrLargeIconViewItemText">
    <div class="mstrLargeIconViewItemName">
     <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenMySubscriptions">
      <web:descriptor key="mstrWeb.1077" desc="My Subscriptions" />
     </web:urlEvent>
    </div>
    <div class="mstrLargeIconViewItemDescription">
     <web:descriptor key="mstrWeb.1078" desc="View a list of the reports to which you are subscribed." />
    </div>
   </td></tr></table>
  </web:dynTableCell>
 </web:then></web:ifFeature>
 </web:dynTable>
</div>

<web:ifFeature name="public-reports">
<web:then>
 </div>
</web:then>
<web:else>
	<web:ifFeature name="profile-reports">
	<web:then>
 </div>
	</web:then>
	<web:else>
		<web:ifFeature name="history-list">
		<web:then>
 </div>
		</web:then>
	<web:else>
		<web:ifFeature name="subscriptions">
		<web:then>
 </div>
		</web:then>
		</web:ifFeature>
	</web:else>
		</web:ifFeature>
	</web:else>
	</web:ifFeature>
</web:else>
</web:ifFeature>

