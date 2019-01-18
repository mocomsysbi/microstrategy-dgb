<%@ page errorPage="Error_Content.jsp"
%><%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%@ page import="com.microstrategy.web.app.beans.PageComponent" %>
<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<web:ifErrorValue>
	<web:then>
		<web:ifBeanValue bean="rwb" property="getXMLStatus" value="4">
			<web:then>
				<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("content_core")%>' flush="true" />
			</web:then>
			<web:else>
				<jsp:include page='/jsp/Error_FullContent.jsp' />
			</web:else>
		</web:ifBeanValue>
	</web:then>
	<web:else>
		<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("content_core")%>' flush="true" />
	</web:else>
</web:ifErrorValue>
