<%
 /****
  * Logo.jsp
  *
  * This file includes the mstrWeb startburst logo.
  * This file should be included in each header JSP file where the Starburst logo should display.
  *
  ****/
%>

<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<web:ifFeature name="!mobile-server">
	<web:then>
<%--mstrWeb Starburst --%>
<web:ifFeature type="misc" name="ProjectsPageIsHomePage">
<web:then>
	<web:urlEvent includeState="false" eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHome" linkAttributes ="id='mstrStarburst' onclick='submitLinkAsFormWithoutState(this);return false;'" titleID="mstrWeb.37">
	<web:ifFeature name="accessibility">
	<web:then>
	<img src='images/1ptrans.gif' id='mstrLogo' class='mstrLogo path' <web:descriptor attribute="TITLE" key="mstrWeb.37" desc="Projects" /> <web:descriptor attribute="ALT" key="mstrWeb.37" desc="Projects" />>
	</web:then>
	<web:else>
	    <div id='mstrLogo' class='mstrLogo path' <web:descriptor attribute="TITLE" key="mstrWeb.37" desc="Projects" /> > </div>
	    <div id='mstrLogoMenu' class='mstrLogoMenu path mstrPullArrow'> </div>
	</web:else>
	</web:ifFeature>
	</web:urlEvent>
</web:then>
<web:else>
	<web:urlEvent includeState="false" eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenDesktop" linkAttributes ="id='mstrStarburst' onclick='submitLinkAsFormWithoutState(this);return false;'" titleID="mstrWeb.37">
	<web:ifFeature name="accessibility">
	<web:then>
	<img src='images/1ptrans.gif' id='mstrLogo' class='mstrLogo path' <web:descriptor attribute="TITLE" key="mstrWeb.37" desc="Projects" /> <web:descriptor attribute="ALT" key="mstrWeb.37" desc="Projects" />>
	</web:then>
	<web:else>
	    <div id='mstrLogo' class='mstrLogo path' <web:descriptor attribute="TITLE" key="mstrWeb.37" desc="Projects" /> > </div>
	    <div id='mstrLogoMenu' class='mstrLogoMenu path mstrPullArrow'> </div>
	</web:else>
	</web:ifFeature>
	</web:urlEvent>
</web:else>
</web:ifFeature>
	</web:then>
	<web:else>
		<%--mstrWeb Starburst --%>
		<web:urlEvent includeState="false" eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventAdminOpenHome" linkAttributes ="id='mstrStarburst'" titleID="mstrWeb.2350">
		    <div id='mstrLogo' class='mstrLogo' <web:descriptor attribute="TITLE" key="mstrWeb.2350" desc="Intelligence Servers" /> > </div>
		</web:urlEvent>
	</web:else>
</web:ifFeature>
