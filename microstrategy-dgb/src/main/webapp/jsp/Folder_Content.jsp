<%
    /*
     * Folder_Content.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<%-- Render the folder contents. --%>
<web:ifFeature name="i-frame">
 <web:then>
  <web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.FOLDER_BROWSER_SCOPE" bean="fbb" />
 </web:then>
</web:ifFeature>
<web:ifFeature name="dhtml">
 <web:then>
  <web:clientSideDescriptor IDs = "73,271,272,2033,2102,2509,2946,2947,2948,3380,3680,3677,3878,4223,5674,6595,7914,8044,8145,8146,8147,8210,8211,8212,8213,8953,9242,15474,13885,14111,12933" />
 </web:then>
</web:ifFeature>
<web:displayGuiComponent name="folder_browser"/>
<web:displayGuiComponent name="object_manipulation"/>
<web:displayGuiComponent name="omd_create_folder"/>