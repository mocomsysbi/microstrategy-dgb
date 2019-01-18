<%
 /*
  * Diagnostics_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  * This page just displays all the children of the page using
  * their generateOutput() method.
  */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%--
 Either display the graphical output for the DiagnosticsBean (DiagnosticsViewerStyle),
 or the interface required for changing statistic properties (DiagnosticsStatisticsStyle),
 or the interface required for changing diagnostic properties which are
 applicable to all servers (DiagnosticsPropertiesStyle).
--%>
<web:ifBeanValue bean="diagBean" property="getShowState" value="1">
    <web:then>
        <web:displayBean bean="diagBean" styleName="DiagnosticsViewerStyle" />
    </web:then>
    <web:else>
        <web:ifBeanValue bean="diagBean" property="getShowState" value="2">
            <web:then>
                <web:displayBean bean="diagBean" styleName="DiagnosticsStatisticsStyle" />
            </web:then>
            <web:else>
                <web:displayBean bean="diagBean" styleName="DiagnosticsPropertiesStyle" />
            </web:else>
        </web:ifBeanValue>
    </web:else>
</web:ifBeanValue>
