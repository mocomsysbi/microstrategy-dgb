<%
 /****
  * Server_Logo.jsp
  * created based on Logo.jsp, TQMS#344586
  * This file includes the mstrWeb startburst logo.
  * This file should be included in each header JSP file of I-Server where the Starburst logo should display.
  *
  ****/
%>

<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<%--mstrWeb Starburst --%>
<web:urlEvent includeState="false" eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHome" linkAttributes ="id='mstrStarburst' onclick='submitLinkAsFormWithoutState(this);return false;'">
    <div id='mstrLogo' class='mstrLogo path' <web:descriptor attribute="TITLE" key="mstrWeb.5834" desc="Intelligence Server Administrator" /> > </div>
    <div id='mstrLogoSmall' class='mstrLogoSmall path' <web:descriptor attribute="TITLE" key="mstrWeb.5834" desc="Intelligence Server Administrator" /> > </div>
</web:urlEvent>


<%--when logo shows, pathbar must show too to make room enough for logo--%>
<style type="text/css">
.path.mstrLogo {display: none;}
.mstrLogoSmall {display: none;}
.path.mstrLogoSmall {display: block;}
.mstrHeader {padding-left: 70px;}
#mstrStarburst {top:1px;}
</style>