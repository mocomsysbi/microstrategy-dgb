<%
    /*
     * Document_Path.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Path.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%--
 Render the "document" bean using the "ObjectPathStyle" style.
 You can find the transform that is mapped to the style in styleCatalog.xml.
--%>
<web:displayBean bean="frame.db" styleName="ObjectPathStyle"/>