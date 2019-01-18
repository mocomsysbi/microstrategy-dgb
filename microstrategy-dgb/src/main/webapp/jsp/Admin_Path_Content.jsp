<%
 /****
  * Admin_Path_Content.jsp
  * 
  * Display a hyperlink to the project page using the "Home" icon.
  * Also, display a hyperlink to the project page using the "Return to" icon..
  *
  ****/
%>

<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<div class="mstrPathContainer">
    <web:ifFeature name="!mobile-server">
	    <web:then>     
		    <div class="mstrPathIcons">
			    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHome"
			    ><span class="mstrIcon-tb" id="tbHome" <web:descriptor attribute="title" key="mstrWeb.1" desc="Home" />></span></web:urlEvent>
			    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHome"
			    ><span class="mstrIcon-tb" id="tbReturn" <web:descriptor attribute="title" key="mstrWeb.1" desc="Home" />></span></web:urlEvent>
		    </div>
	    </web:then>
    </web:ifFeature>
    <div class="mstrPathText"><span class="mstrPathLast"><web:beanValue property="title"/></span></div><div class="mstrSpacer"></div>
    <%@include file='/jsp/Logo.jsp' %>
</div>