<%
  /****
  * Summary_Content.jsp
  * This file displays the main contents of a welcome desktop page, showing
  * quick links to folders like Shared Reports, My Reports, etc. as well as
  * other features such Preferences, History List, etc.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<%--
	Render the 'If you are not..." hyperlink. If 508 mode is enabled,
	add the name of the user as part of the hyperlink.
--%>
<web:ifFeature name="dhtml">
 <web:then>
  <web:clientSideDescriptor IDs = "191,192,1087,1088,1995,2946,2947,2948,3296,3878,6073" />
 </web:then>
</web:ifFeature>



<div class="mstrInstruct"><web:descriptor key="mstrWeb.859" desc="Welcome" /> <web:connectionValue property="userName"
/>. (<web:ifFeature name="accessibility"><web:then
><web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventQuickLogout"
><web:descriptor key="mstrWeb.860" desc="If you are not ##," replaceValue="$com.microstrategy.web.app.taglibs.ConnectionValueTagHelper:setProperty.userName$"
/>&nbsp;<web:descriptor key="mstrWeb.861" desc="click here"
/></web:urlEvent></web:then><web:else
><web:descriptor key="mstrWeb.860" desc="If you are not ##," replaceValue="$com.microstrategy.web.app.taglibs.ConnectionValueTagHelper:setProperty.userName$"
/>&nbsp;<web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventQuickLogout"
><web:descriptor key="mstrWeb.861" desc="click here"
/></web:urlEvent></web:else></web:ifFeature>.)</div>
<%-- Render the 'Project Status' section if the 'showAtTop' preference is enabled. --%>
<web:ifBeanValue bean="projectStatus" property="isStatusShown"><web:then>
<web:ifBeanValue bean="projectStatus" property="isStatusShownAtTop"><web:then>
<div class="projectStatus"><web:displayBean bean="projectStatus"/></div></web:then></web:ifBeanValue>
</web:then></web:ifBeanValue>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="summary">
 <tr>
   <td valign="top" width="40%">
      <jsp:include page='/jsp/Summary_View_Section.jsp' flush="true" />
   </td>

   <td width="1%"><img <web:resource attribute="src" name="1ptrans.gif"/> width="5" height="1" alt="" border="0" /></td>
   <td valign="top">
      <jsp:include page='/jsp/Summary_Tools_Section.jsp' flush="true" />
   </td>
 </tr>
</table>
<%-- Render the 'Project Status' section if the 'showAtBottom' preference is enabled. --%>
<web:ifBeanValue bean="projectStatus" property="isStatusShown"><web:then>
<web:ifBeanValue bean="projectStatus" property="isStatusShownAtTop"><web:else>
<div class="mstrProjectStatus"><web:displayBean bean="projectStatus"/></div>
</web:else></web:ifBeanValue>
</web:then></web:ifBeanValue>

<web:displayGuiComponent name="XDACubePickerBean"/>
<web:displayGuiComponent name="ObjectExplorer"/>
