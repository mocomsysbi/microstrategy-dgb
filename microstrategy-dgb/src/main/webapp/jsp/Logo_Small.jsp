<%
 /****
  * Logo_Small.jsp
  * 
  * This file includes the mstrWeb startburst logo of small version to fit into shortcuts bar. 
  * This file should be included in each header JSP file where the Starburst logo should display.
  *
  ****/
%>

<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<%--mstrWeb Starburst --%>
<web:urlEvent includeState="false" eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHome" linkAttributes ="id='mstrStarburstSmall'" titleID="mstrWeb.37">
<web:ifFeature name="accessibility">
<web:then>
<img src='images/1ptrans.gif' id='mstrLogoSmall' class='mstrLogoSmall path' <web:descriptor attribute="TITLE" key="mstrWeb.37" desc="Projects" /> >
</web:then>
<web:else>  
    <div id='mstrLogo' class='mstrLogoSmall' <web:descriptor attribute="TITLE" key="mstrWeb.37" desc="Projects" /> > </div>
</web:else>
</web:ifFeature>
</web:urlEvent>

<style type="text/css">
#mstrStarburst {top:1px;/*when shortcuts bar is shown, the large logo should set top:1*/}
.path.mstrLogo {display: block !important;}
.path.mstrLogoSmall {display: none !important;}
.mstrPathContainer {padding-left: 70px !important;}
</style>