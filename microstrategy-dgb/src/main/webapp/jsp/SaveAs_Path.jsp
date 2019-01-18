<%
    /*
     * SaveAs_Path.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Path.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Render path links and information about the location of the object being transformed.--%>
<web:displayBean bean="saveasbean.rb" styleName="ObjectPathStyle"/>
