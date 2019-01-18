<%
 /****
  * UserManagemer_ShortcutsBar.jsp
  * This file includes the default content of the shorcuts bar section.
  * This consist on the toolbar link, a search box, and logout and help links.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<%-- Render the toolbar section if the user has a session. --%>
<table cellpadding="0" cellspacing="0" border="0">
<colgroup>
	<col class="mstrHeaderShortcutsCol"/>
	<col class="mstrHeaderSearchCol"/>
	<col class="mstrHeaderHelpCol"/>
</colgroup>
<tr><td nowrap="nowrap">
<web:ifConnectionValue><web:then>
<web:shortcutOptions type="toolbar" shortcutClass="mstrShortcut" shortcutSelectedClass="mstrShortcutSelected">
<web:shortcutElement />
</web:shortcutOptions>
<web:ifFeature name="object-search"><web:then>
</td><td nowrap="nowrap">

<web:ifFeature name="dhtml;quick-search-enabled">
<web:then>


<%-- Search Box section --%>
<div id="mstrSearchSuggestQS" class="mstrSearchSuggestSections" scriptclass="mstrSearch" n="mstrSearchSuggest">
<jsp:include page='/jsp/SearchSuggest_Content.jsp' flush="true" />
<script language=javascript>
     var searchPropsQuick = <web:displayBean bean="ssb" styleName="ServerSearchSuggestQuickStyle"/>;

     if (typeof(microstrategy) != 'undefined') { 
         microstrategy.bonesToRegister.push(
                  {
                      id : "mstrSearchSuggestQS", 
                      loadCondition : "true"  ,
                      properties : {
                           enableSuggestion: false,
                           showAsPopup: true,
                           showSuggestAsPopup: true,
                           isServerSearch: true,
                           isMiniSearchBox: true,
                           rootFolderType: 39,
                           searchDomain: 3, <%-- //3 - Repository domain; 4 - Configuration domain --%>

                           <web:ifFeature name="edit-security-role-properties;create-security-roles">
	                           <web:then>
	                               objectType: '8704,8705,44'
	                           </web:then>
	                           <web:else>
	                               objectType: '8704,8705'
	                           </web:else>
                           </web:ifFeature>
                      }
                  //,
                  //   properties: searchPropsQuick
                  //
                   });
     }
</script>
</div>
</web:then>
<web:else> 
<web:ifFeature name="edit-security-role-properties;create-security-roles">
    <web:then><web:quickSearch objectTypes="8704,8705,44"/></web:then>
    <web:else><web:quickSearch objectTypes="8704,8705"/> </web:else>
</web:ifFeature>
</web:else>
</web:ifFeature>

</td><td nowrap="nowrap">
</web:then></web:ifFeature>
</web:then></web:ifConnectionValue>

<%-- Render a hyperlink to the Online Help. --%>
<span class="mstrShortcut"><web:resource type="helpAdmin"/></span>
<%-- Render the logout button if the user session is not shared with portlet. --%>
<web:ifFeature name="is-portlet"><web:then></web:then><web:else>
<span class="mstrShortcut"><web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventLogout"><web:descriptor key="mstrWeb.8" desc="Logout" /></web:urlEvent></span>
</web:else></web:ifFeature>
</td></tr></table>

<%@include file='/jsp/serverAdmin/Server_Logo_Small.jsp' %>
