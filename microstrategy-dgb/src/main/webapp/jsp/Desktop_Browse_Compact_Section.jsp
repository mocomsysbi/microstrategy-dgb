<%
  /****
  * Desktop_Browse_Compact_Section.jsp
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

  <web:ifFeature name="public-reports"><web:then>
    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenSharedReports" linkAttributes ="class='mstr-dskt-lnk shared'">
      <div class="mstr-dskt-icn"></div>
      <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.2" desc="Shared Reports" /></div>
      <div class="mstr-dskt-dsc"><web:descriptor key="mstrWeb.1322" desc="Run reports and share reports with others." /></div>
    </web:urlEvent>
  </web:then></web:ifFeature>
  <web:ifFeature name="profile-reports"><web:then>
    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenMyReports" linkAttributes ="class='mstr-dskt-lnk profile'">
       <div class="mstr-dskt-icn"></div>
       <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.3" desc="My Reports" /></div>
       <div class="mstr-dskt-dsc"><web:descriptor key="mstrWeb.48" desc="Run your own personal reports and access favorites." /></div>
      </web:urlEvent>
  </web:then></web:ifFeature>
  <web:ifFeature name="history-list"><web:then>
    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHistoryList" linkAttributes ="class='mstr-dskt-lnk inbox'">
       <div class="mstr-dskt-icn"></div>
       <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.4" desc="History List" /></div>
       <div class="mstr-dskt-dsc"><web:descriptor  key="mstrWeb.50" desc="View previously run or scheduled reports." /></div>
      </web:urlEvent>
  </web:then></web:ifFeature>
  <web:ifFeature name="subscriptions"><web:then>
    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenMySubscriptions" linkAttributes ="class='mstr-dskt-lnk subs'">
       <div class="mstr-dskt-icn"></div>
       <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.1077" desc="My Subscriptions" /></div>
       <div class="mstr-dskt-dsc"><web:descriptor key="mstrWeb.1078" desc="View a list of the reports to which you are subscribed." /></div>
      </web:urlEvent>
  </web:then></web:ifFeature>


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

