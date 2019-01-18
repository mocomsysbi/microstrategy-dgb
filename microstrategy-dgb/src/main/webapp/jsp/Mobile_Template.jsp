<%@ page errorPage="JSP_Error.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>
<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd " >

<html>
	<head>
		<web:metaContentType />
		<title>
		    <web:beanValue property="title" encode="true" /> - <web:descriptor key="mstrWeb.5088" desc="MicroStrategy Mobile" />
		</title>
		<link rel="shortcut icon" href="../javascript/mojo/css/android/app-icon.png" type="image/x-icon" />
		<web:resource type="js-style" name="mojo/css/core.css" />
		<web:resource type="js-style" name="mojo/css/oivm.css" />
		<web:resource type="js-style" name="mojo/css/Vis.css" />
		<jsp:include page='<%=mstrPage.getTemplateInfo().getSection("header")%>' flush="true" />
	</head>
	
	<body>
	    <jsp:include page='<%=mstrPage.getTemplateInfo().getSection("content")%>' flush="true" />
	</body>
</html>