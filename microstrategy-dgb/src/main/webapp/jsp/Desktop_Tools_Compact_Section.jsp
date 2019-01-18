<%
  /****
  * Desktop_Tools_Section.jsp
  * This file displays links to My Subscriptions, Search, and Preferences.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" %>


<web:ifFeature name="preferences">
 <web:then>
 <div class="mstrDesktopSection" id="dktpSectionTools">
  <div class="mstrDesktopSectionTitle"><div class="mstrDesktopSectionIcon"><web:descriptor key="mstrWeb.3497" desc="Tools" /></div></div>
 </web:then>
 <web:else>
		<web:ifFeature name="object-search">
		<web:then>
 <div class="mstrDesktopSection" id="dktpSectionTools">
  <div class="mstrDesktopSectionTitle"><div class="mstrDesktopSectionIcon"><web:descriptor key="mstrWeb.3497" desc="Tools" /></div></div>
		</web:then>
		</web:ifFeature>
 </web:else>
</web:ifFeature>

  <web:ifFeature name="preferences"><web:then>
    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPreferences" linkAttributes ="class='mstr-dskt-lnk prefs'">
       <div class="mstr-dskt-icn"></div>
       <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.862" desc="Preferences" /></div>
    </web:urlEvent>
  </web:then></web:ifFeature>
  <web:ifFeature name="object-search"><web:then>
    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenSearch" linkAttributes ="class='mstr-dskt-lnk search'">
       <div class="mstr-dskt-icn"></div>
       <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.10" desc="Search" /></div>
       <div class="mstr-dskt-dsc"><web:descriptor key="mstrWeb.3287" desc="Search folders for reports and documents on this site."/></div>
      </web:urlEvent>
  </web:then></web:ifFeature>
  <web:ifFeature name="any-iserver-admin-from-web"><web:then>
    <a HREF="<web:value name="serverAdminServletDeploymentName" type="config" />" class="mstr-dskt-lnk admin">
       <div class="mstr-dskt-icn"></div>
       <div class="mstr-dskt-nm"><web:descriptor key="mstrWeb.5874" desc="Intelligence Server Administrator" /></div>
       <div class="mstr-dskt-dsc"><web:descriptor key="mstrWeb.5182" desc="Go to the Intelligence Server Administrator"/></div>
    </a>
  </web:then></web:ifFeature>

<web:ifFeature name="subscriptions">
<web:then>
 </div>
</web:then>
<web:else>
	<web:ifFeature name="preferences">
	<web:then>
 </div>
	</web:then>
	<web:else>
		<web:ifFeature name="object-search">
		<web:then>
 </div>
		</web:then>
		<web:else>
            <web:ifFeature name="any-iserver-admin-from-web">
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
