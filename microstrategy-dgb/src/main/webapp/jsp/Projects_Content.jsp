<%
	/****
	 * Projects_Content.jsp
	 * This page just displays all the children of the page using
	 * their generateOutput() method.
	 *
	 * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
	 * version: 1.2
	 * xhtml: true
	 ****/
%>
<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld"	prefix="web"%>
<%-- Render the 'If you are not...' hyperlink for 508 mode and regular mode. --%>
<web:ifConnectionValue property="loginFirst">
<web:then>
    <web:ifConnectionValue property="needNewPswd">
    <web:then>
    </web:then>
    <web:else>
    <web:ifConnectionValue property="loginFirstUser">  <%-- #619957 make sure that there is projects configured and user is logged in --%>
	    <web:then>
			<div class="mstrInstruct"><web:descriptor key="mstrWeb.859"
				desc="Welcome" /> <web:connectionValue property="loginFirstUser" />.
			(<web:ifFeature name="accessibility">
				<web:then>
					<web:urlEvent
						eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventQuickLogout">
						<web:descriptor key="mstrWeb.860" desc="If you are not ##,"
							replaceValue="$com.microstrategy.web.app.taglibs.ConnectionValueTagHelper:setProperty.loginFirstUser$" />&nbsp;<web:descriptor
							key="mstrWeb.861" desc="click here" />
					</web:urlEvent>
				</web:then>
				<web:else>
					<web:descriptor key="mstrWeb.860" desc="If you are not ##,"
						replaceValue="$com.microstrategy.web.app.taglibs.ConnectionValueTagHelper:setProperty.loginFirstUser$" />&nbsp;<web:urlEvent
						eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventQuickLogout">
						<web:descriptor key="mstrWeb.861" desc="click here" />
					</web:urlEvent>
				</web:else>
			</web:ifFeature>.)</div>
		</web:then>
	</web:ifConnectionValue>
	</web:else>
    </web:ifConnectionValue>
</web:then>
</web:ifConnectionValue>
<br />
<div class="mstrSpacer"></div>
<%-- Render the list of projects to show to the user for logging in --%>
<web:displayBean beanName="projects" styleName="ProjectsStyle" />