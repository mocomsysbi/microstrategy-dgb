<%
/*
 * Folder_Toolbar.jsp
 * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
 */
%>
<%@ page errorPage="Error_Toolbar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/webUtilTL.tld" prefix="web"%>

<div class="mstrDockTopContainer">
<web:ifBeanValue bean="folderTb">
    <web:then>
		<web:displayBean bean="folderTb" />
    </web:then>
</web:ifBeanValue>
<%-- Render the 'Filter + Template' section if the 'nre-report' feature is available. --%>
<web:ifFeature name="new-report">
    <web:then>
        <web:ifFeature name="executeFilterTemplate" type="preference" value="1">
            <web:then>
                <web:displayGuiComponent name="folder_toolbar" />
            </web:then>
        </web:ifFeature>
    </web:then>
</web:ifFeature>
</div>