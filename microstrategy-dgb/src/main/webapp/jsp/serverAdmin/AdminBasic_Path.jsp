<%
 /****
  * AdminBasic_Path.jsp
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<table cellpadding="0" cellspacing="0" border="0">
    <tr><td>
		<div class="mstrPathContainer">
		<div class="mstrPathIcons">
		    <web:ifFeature name="showHomeBtnInNavBar" type="preference" value="1"><web:then>		
			   <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenDefaultDesktop"
			   ><span class="mstrIcon-tb" id="tbHome" <web:descriptor attribute="title" key="mstrWeb.1" desc="Home" />></span></web:urlEvent>
			</web:then></web:ifFeature>
			
			<web:ifFeature name="showFolderUpBtnInNavBar" type="preference" value="1"><web:then>			
			  <a><span class="mstrIcon-tb disabled" id="tbReturn"></span></a>
			</web:then></web:ifFeature>
		</div>
		<div class="mstrPathText mstrServerAdminPath"><span class="mstrPathLast"><web:connectionValue property="serverName"/></span></div><div class="mstrSpacer"></div>
		<%@include file='/jsp/serverAdmin/Server_Logo.jsp' %>
		</div>
	</td>
	<td nowrap="1"><jsp:include page='<%=mstrPage.getTemplateInfo().getSection("path_options")%>' flush="true" /></td>
	</tr>
</table>
	