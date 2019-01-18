<%
  /****
  * Desktop_Content.jsp
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

<web:ifFeature name="!dhtml">
	<web:then>
		<%--
		 The following DIV renders the "If you are not [a user]" string so a user can logout.
		 If 508 is enabled, the name of the user will be part of the hyperlink in order to be
		 interpreted correctly by the 508 reader.
		--%>
		<div class="mstrInstruct"><web:descriptor key="mstrWeb.859" desc="Welcome" /> <web:connectionValue property="userName"
		/> | <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventQuickLogout" linkAttributes="class='mi-dskt-logout'"
		><web:descriptor key="mstrWeb.8338" desc="Sign Out" /></web:urlEvent></div>
	</web:then>	
</web:ifFeature>

<%--
 If the project status should be shown at the top of this page, we will do it here.
--%>

<web:ifBeanValue bean="projectStatus" property="isStatusShown"><web:then>
<web:ifBeanValue bean="projectStatus" property="isStatusShownAtTop"><web:then>
<div class="mstrProjectStatus"><web:displayBean bean="projectStatus"/></div></web:then></web:ifBeanValue>
</web:then></web:ifBeanValue>


<%-- Developer: please do not remove or change the following line, the build script depends on it to build the user manager sample --%>
<!-- User Manager Sample link goes here -->

<web:ifFeature name="accessibility"><web:then>
<%--
Desktop section 1 of 2: Browse.  This includes Shared Reports, My Reports, History List and My Subscriptions.
--%>
  <jsp:include page='/jsp/Desktop_View_Section.jsp' flush="true" />
<%--
Desktop section 2 of 2: Create.  This includes Create Report
--%>
  <jsp:include page='/jsp/Desktop_Create_Section.jsp' flush="true" />
</web:then><web:else>
<%--
Desktop section 1 of 3: Browse.  This includes Shared Reports, My Reports, History List and My Subscriptions.
--%>
  <jsp:include page='/jsp/Desktop_Browse_Compact_Section.jsp' flush="true" />
<%--
Desktop section 2 of 3: Analyze.  This includes Create Dashboard, Data Import and import .mstr files
--%>
  <jsp:include page='/jsp/Desktop_Analyze_Compact_Section.jsp' flush="true" />
<%--
Desktop section 2 of 3: Develop.  This includes Create Report, Document, Filter, Prompt, Metric, Custom Group
--%>
  <jsp:include page='/jsp/Desktop_Develop_Compact_Section.jsp' flush="true" />
</web:else></web:ifFeature>

<%-- If the project status should be shown at the bottom of this page, we will do it here. --%>
<web:ifFeature name="dhtml">
    <web:then>
        <web:clientSideDescriptor IDs = "73,2948,9168"/>
    </web:then>
</web:ifFeature>
<web:ifBeanValue bean="projectStatus" property="isStatusShown"><web:then>
<web:ifBeanValue bean="projectStatus" property="isStatusShownAtTop"><web:else>
<div class="mstrProjectStatus"><web:displayBean bean="projectStatus"/></div>
</web:else></web:ifBeanValue>
</web:then></web:ifBeanValue>
