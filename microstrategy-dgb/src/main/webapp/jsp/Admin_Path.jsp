<%
 /****
  * Admin_Path.jsp
  * This file includes the content of the Path section for pages such as Desktop and Summary.
  * This consist on a go Home link, the Return-to link (to go to Home as well)
  * and the name of the current project the user is logged in to.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<table cellpadding="0" cellspacing="0" border="0">
    <colgroup>
        <col />
        <col class="mstrAdminPathShortcutsCol" />
    </colgroup>
    <tr>
	    <td class="mstrPathTDLeft">
			<div class="mstrPathContainer" style="min-width:300px;">
			    <web:ifFeature name="!mobile-server">
			        <web:then>
			            <div class="mstrPathIcons">
			                
			               <web:ifFeature name="showHomeBtnInNavBar" type="preference" value="1"><web:then>
			                <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHome"
			                ><span class="mstrIcon-tb" id="tbHome" <web:descriptor attribute="title" key="mstrWeb.1" desc="Home" />></span></web:urlEvent>
			                </web:then></web:ifFeature>
			                
			                <web:ifFeature name="showFolderUpBtnInNavBar" type="preference" value="1"><web:then>
			                   <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenHome"
			                   ><span class="mstrIcon-tb" id="tbReturn" <web:descriptor attribute="title" key="mstrWeb.1" desc="Home" />></span></web:urlEvent>
			                </web:then></web:ifFeature>
			            </div>
			        </web:then>
			    </web:ifFeature>
			    <div class="mstrPathText"><span class="mstrPathLast"><web:beanValue property="title"/></span></div><div class="mstrSpacer"></div>
				<%@include file='/jsp/serverAdmin/Server_Logo.jsp' %>
			</div>
        </td>
	    <td><%--
			 Display the Help secion as defined in the shortcut-list defined in adminPageConfig.xml (toolbar)
			 The shortcutOptions tag will go through all the shortcut elements and render them.
			--%>
			<div class="mstrAdminPathShortcuts">
				<web:shortcutOptions type="toolbar" shortcutClass="mstrShortcut" shortcutSelectedClass="mstrShortcutSelected">
				<web:shortcutElement />
				</web:shortcutOptions>
				<%--
				 Display a hyperlink to "Admin Online Help".
				--%>
				<span class="mstrShortcut"><web:resource type="helpAdmin"/></span>
			</div>
	    </td>
    </tr>
</table>
