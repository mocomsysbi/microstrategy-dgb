<%
 /****
  * Server_Logo_Small.jsp
  * created based on Logo.jsp, TQMS#344586
  * This file includes the mstrWeb startburst logo.
  * This file should be included in each header JSP file of I-Server where the Starburst logo should display.
  *
  ****/
%>

<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<%--mstrWeb Starburst --%>
<web:urlEvent includeState="false" eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHome" linkAttributes ="id='mstrStarburstSmall' onclick='submitLinkAsFormWithoutState(this);return false;'">
    <div id='mstrLogo' class='mstrLogoSmall' <web:descriptor attribute="TITLE" key="mstrWeb.5834" desc="Intelligence Server Administrator" /> > </div>
</web:urlEvent>

<style type="text/css">
#mstrStarburst {top:1px;}
.path.mstrLogo {display: block !important;}
.path.mstrLogoSmall {display: none !important;}
.mstrPathContainer {padding-left: 70px !important;}
</style>