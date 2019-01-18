<%
	/****
	 * Copyright_Footer.jsp
	 * This file displays MicroStrategy's Tagline.
	 * It's used as the footer for the Projects and Login pages.
	 *
	 * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
	 * version: 1.2
	 * xhtml: true
	 ****/
%><%@ page errorPage="JSP_Error.jsp"%><%@ page
	contentType="text/html; charset=UTF-8"%><%@ taglib uri="/webUtilTL.tld"
	prefix="web"%>
<web:ifFeature name="dhtml">
<web:then>
	<web:ifFeature name="showFooterPath" type="preference" value="1"><web:then>
	<div class="mstrFooter">
		<div class="mstrPathContainer">
		  <web:displayGuiComponent name="ft_pathBean" />
		</div>
		<div class="mstrFooterPathClose" onclick="mstrPathImpl.toggleFooterPath()"></div>
	</div>
	</web:then>
	</web:ifFeature>
</web:then>
</web:ifFeature>