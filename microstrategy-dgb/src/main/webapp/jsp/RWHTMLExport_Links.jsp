<%
 /****
  * RWHTMLExport_Links.jsp
  * This page includes the link definitions that should be added for the
  * page of Report Writing Documents
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="Error_Links.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"%><%
  PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");
%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />

<%-- DHTML.js is necessary when HTML mode is On and current RW document is prompted which is waiting for user's input --%>
<web:ifBeanValue bean="rwb" property="getXMLStatus" value="6">
	<web:then>
		<%-- In DHTML Mode? --%>
	    <web:ifFeature name="dhtml">
		    <web:then>
				<%-- Prompt page dhtml mode needs this javascript --%>
				<web:resource type="javascript" name="Calendar.js"/>
				<web:resource type="javascript" name="updateManager.js"/>
				<web:resource type="javascript" name="PromptFunctions.js"/>
				<jsp:include page='/jsp/Prompt_Links.jsp' flush="true" /> 	
			</web:then>
			<web:else>
				<%-- DHTML.js is necessary when HTML mode is On and current report is prompted which is waiting for user's input --%>
				<web:resource type="javascript" name="DHTML.js"/>
			</web:else>
		</web:ifFeature>		
		<web:resource type="style" name="mstr/pagePrompts.css"/>
	</web:then>
</web:ifBeanValue>

<web:resource type="style" name="mstr/pageRWHTMLExport.css"/>

<%-- Javascript files --%>
<web:ifFeature name="dhtml">
	<web:then>
		<script language="JavaScript">
			self.submitLink = function submitLink(oAnchor) {
				var sTarget; sTarget = oAnchor.target;
				//submit always using a form so max state is submitted:
				var oForm = createDynamicForm(oAnchor.href);
				if (sTarget) oForm.target = sTarget;
				submitForm(oForm);
				return false;
			}
		</script>
	</web:then>
</web:ifFeature>
