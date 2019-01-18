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

<div class="mstrLargeIconView">
 <web:dynTable cols="2" >
  <col class="mstrLargeIconViewCell" />
  <col class="mstrLargeIconViewCell" />

  <%-- Show the "Preferences" icon if the feature is enabled for the current user. --%>
 <web:ifFeature name="preferences"><web:then>
  <web:dynTableCell>
   <table class="mstrLargeIconViewItem" cellspacing="0">
   <tr><td>
    <web:ifFeature name="accessibility"><web:then>
     <img class="a508" <web:resource type="style" attribute="src" name="mstr/images/dktpPreferences.gif"/> <web:descriptor attribute="alt" key="mstrWeb.862" desc="Preferences" /> <web:descriptor attribute="title" key="mstrWeb.862" desc="Preferences" /> />
    </web:then><web:else>
     <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPreferences">
      <span class="mstrIcon" id="mstrIconPreferences" <web:descriptor attribute="title" key="mstrWeb.862" desc="Preferences" /> ></span>
     </web:urlEvent>
    </web:else></web:ifFeature>
    </td><td class="mstrLargeIconViewItemText">
      <div class="mstrLargeIconViewItemName">
       <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPreferences"><web:descriptor key="mstrWeb.862" desc="Preferences" /></web:urlEvent>
      </div>
     <%-- Display User Preferences --%>
    <web:displayBean bean="preferences" styleName="DesktopUserPreferencesStyle" />
    </td></tr></table>
  </web:dynTableCell>
 </web:then></web:ifFeature>
 
  <%-- Show the "Version Info" icon if this is search page. --%>
 <web:ifBeanValue property="getName" value="search">
 <web:then>
	  <web:dynTableCell>
	  <table class="mstrLargeIconViewItem" cellspacing="0">
	  <tr><td>
	   <web:ifFeature name="accessibility"><web:then>
	    <img class="a508" <web:resource type="style" attribute="src" name="mstr/images/dktpVersion.gif"/> <web:descriptor attribute="title" key="mstrWeb.10" desc="Search" /> />
	   </web:then><web:else>
	    
	   </web:else></web:ifFeature>
	   </td></tr></table>
	  </web:dynTableCell>
  </web:then>
  <web:else>
  
	 <%-- Show the "Search" icon if the feature is enabled for the current user. --%>
	 <web:ifFeature name="object-search"><web:then>
	  <web:dynTableCell>
	  <table class="mstrLargeIconViewItem" cellspacing="0">
	  <tr><td>
	   <web:ifFeature name="accessibility"><web:then>
	    <img class="a508" <web:resource type="style" attribute="src" name="mstr/images/dktpSearch.gif"/> <web:descriptor attribute="alt" key="mstrWeb.10" desc="Search" /> <web:descriptor attribute="title" key="mstrWeb.10" desc="Search" /> />
	   </web:then><web:else>
	    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenSearch" >
	     <span class="mstrIcon" id="mstrIconSearch" <web:descriptor attribute="title" key="mstrWeb.10" desc="Search" /> ></span>
	    </web:urlEvent>
	   </web:else></web:ifFeature>
	   </td><td class="mstrLargeIconViewItemText">
	   <div class="mstrLargeIconViewItemName">
	    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenSearch">
	     <web:descriptor key="mstrWeb.10" desc="Search" />
	    </web:urlEvent>
	   </div>
	   <div class="mstrLargeIconViewItemDescription">
	    <web:descriptor key="mstrWeb.3287" desc="Search folders for reports and documents on this site."/>
	   </div>
	  </td></tr></table>
	  </web:dynTableCell></web:then>
	 </web:ifFeature>
  
  </web:else>
 </web:ifBeanValue>
 

  <%-- Show the "Intelligence Server Administrator" icon if the feature is enabled for the current user. --%>
 <web:ifFeature name="accessibility">
 <web:else>
	 <web:ifFeature name="any-iserver-admin-from-web"><web:then>
	   <web:dynTableCell>
		  <table class="mstrLargeIconViewItem" cellspacing="0">
		   <tr>
		     <td>
	    	    <a HREF="<web:value name="serverAdminServletDeploymentName" type="config" />" class="mstrLink">
		           <span class="mstrIcon" id="mstrIconIServerAdmin" <web:descriptor attribute="title" key="mstrWeb.5874" desc="Intelligence Server Administrator" /> ></span>
		        </a>
		     </td>
		     <td class="mstrLargeIconViewItemText">
			    <div class="mstrLargeIconViewItemName">
			      <a HREF="<web:value name="serverAdminServletDeploymentName" type="config" />" class="mstrLink">
			        <web:descriptor key="mstrWeb.5874" desc="Intelligence Server Administrator" />
			      </a>
			   </div>
			   <div class="mstrLargeIconViewItemDescription">
			      <web:descriptor key="mstrWeb.5182" desc="Go to the Intelligence Server Administrator"/>
			   </div>
		     </td>
		    </tr>
		  </table>
	  </web:dynTableCell></web:then>
    </web:ifFeature>
 </web:else>
 </web:ifFeature> 
 <%-- Show the "Architect" icon if the feature is enabled for the current user. --%>
 <web:ifFeature name="accessibility">
 <web:else>
	 <web:ifFeature type="systemPreference" name="enableQB" ><web:then>
	   <web:dynTableCell>
		  <table class="mstrLargeIconViewItem" cellspacing="0">
		   <tr>
		     <td>
	    	    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenArchitect" >
		           <span class="mstrIcon" id="mstrIconArchitect" <web:descriptor attribute="title" key="mstrWeb.5937" desc="Architect" /> ></span>
		        </web:urlEvent>
		     </td>
		     <td class="mstrLargeIconViewItemText">
			    <div class="mstrLargeIconViewItemName">
			       <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenArchitect">
			        <web:descriptor key="mstrWeb.5937" desc="Architect"/>
			       </web:urlEvent>
			   </div>
			   <div class="mstrLargeIconViewItemDescription">
			      <web:descriptor desc="Create a Project Schema"/>
			   </div>
		     </td>
		    </tr>
		  </table>
	  </web:dynTableCell></web:then>
    </web:ifFeature>
 </web:else>
 </web:ifFeature>


</web:dynTable>
</div>

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
