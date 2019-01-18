<%
    /*
     * Fast_Export_Links.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Links.jsp"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>
<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<%--
 Display the "links" section of the template as specified in pageConfig.xml (i.e. Admin_Links.jsp)
 <jsp:include page="[a page section]" />
--%>
<jsp:include page='<%=mstrPage.getTemplateInfo().getDefaultTemplate().getSection("links")%>' flush="true" />


<%-- DHTML.js is necessary when HTML mode is On and current RW document is prompted which is waiting for user's input --%>
<web:ifBeanValue bean="rb" property="getXMLStatus" value="6"><web:then>
  <web:ifFeature name="dhtml"><web:then>
   <%-- Prompt page dhtml mode needs this javascript --%>
   <web:resource type="javascript" name="Calendar.js"/>
   <web:resource type="javascript" name="serializer.js"/>
   <web:resource type="javascript" name="updateManager.js"/>
   <web:resource type="javascript" name="PromptFunctions.js"/>
   <jsp:include page='/jsp/Prompt_Links.jsp' flush="true" /> 	
 </web:then>
 <web:else>
  <%-- DHTML.js is necessary when HTML mode is On and current report is prompted which is waiting for user's input --%>
   <web:resource type="javascript" name="DHTML.js"/>
   <web:ifFeature name="netscape"><web:then>
		<style type="text/css"> <%-- issue 234010 --%>
			table.mstrVerticalDocks {
				table-layout: fixed !important;	<%-- needed for Netscape 7 to render Prompts content correctly --%>

			}
		</style>
   </web:then></web:ifFeature>
 </web:else>
 </web:ifFeature>
 <web:resource type="style" name="mstr/pagePrompts.css"/>
 
</web:then></web:ifBeanValue>
