<%
/****
* RW_Content.jsp
* This page displays the content of the Report Writing Documents.
*
* Copyright 2004 MicroStrategy Incorporated. All rights reserved.
* version: 1.2
* xhtml: true
****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<% // this map is used for drag and drop mapping // %>
<map id="useMap" name="useMap" mapfor="1"></map>

<web:ifFeature name="dhtml"><web:then>
    <script language="JavaScript">
        if (typeof(microstrategy) != 'undefined') {
            microstrategy.EXECUTION_SCOPE = microstrategy.RWD_EXECUTION;
            microstrategy.RESIZE_SUBSECTIONS = microstrategy.RESIZE_EACH_SUBSECTION;
        }
        self.SORT_ASCENDING = '<web:value type="enum" name="com.microstrategy.web.beans.EnumViewBeanEvents.SORT_ORDER_ASCENDING"/>';
        self.SORT_DESCENDING = '<web:value type="enum" name="com.microstrategy.web.beans.EnumViewBeanEvents.SORT_ORDER_DESCENDING"/>';
        </script>

        <script language="JavaScript">
            if (typeof(microstrategy) != 'undefined') {
                microstrategy.DISPLAY_MODE = microstrategy.VIEW_MODE;
            }</script>
        <web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.REPORT_WRITER_SCOPE" bean="rwb" />

</web:then></web:ifFeature>

<web:ifBeanValue bean="rwb" property="getXMLStatus" value="3"><web:then>
    <web:displayGuiComponent name="groupby"/>
</web:then></web:ifBeanValue>



<web:ifBeanValue bean="rwb" property="getXMLStatus" value="6"><web:then>
    <web:displayGuiComponent name="rw_area_prompts"/>
    <web:displayGuiComponent name="attFormsQual"/>
    <web:displayGuiComponent name="metricQualLevel"/>
    <web:displayGuiComponent name="elementPicker"/>
</web:then>
<web:else>
    <web:displayGuiComponent name="rw_area"/>
</web:else>
</web:ifBeanValue>
