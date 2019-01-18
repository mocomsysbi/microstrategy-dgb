<%
 /****
  * LoginWarning_Path.jsp
  * This file includes the content of the Path section for the Activation page.
  * This consists of the MicroStrategy Logo link, the Home link,
  * the forward, backward and up navigation;
  * and the name of the current project the user is logged in to.
  *
  * Copyright 2015 MicroStrategy Incorporated. All rights reserved.
  * version: 1.0
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<div id="mstrRecentsGenPopup">
    <div class="mstrMenuContent" ty="content">
        <web:shortcutOptions type="recents" shortcutClass="mstrMenuItem" shortcutSelectedClass="mstrMenuItem">
            <web:shortcutElement />
        </web:shortcutOptions>

    </div>
</div>
<%-- Render the path section --%>

<web:ifFeature name="showHeaderBar" type="systemPreference" value="0">
    <web:then>
        <table cellpadding="0" cellspacing="0" border="0">
            <colgroup>
                <col />
                <web:ifFeature name="is-cloud-unified">
                	<web:then>
                		<col class="mstrFeedback" />
               		</web:then>
                </web:ifFeature>
                <col class="mstrPathHelpCol"/>
            </colgroup>
            <tr>
                <td class="mstrPathTDLeft">
                    <%-- Display the path section --%>
                    <div class="mstrPathContainer">
                        <web:displayBean bean="pathBean" styleName="DesktopPathStyle"/>
                        <%@include file='/jsp/Logo.jsp' %>
                    </div>
                </td>
                <web:ifFeature name="is-cloud-unified">
                	<web:then>
                		<jsp:include page='../html/CloudUnifiedFeedback.html' flush="true" />
               		</web:then>
                </web:ifFeature>
                <td>
                        <%-- Render a hyperlink to the Online Help. --%> 
                    <span class="mstrHelpShortcut"><web:resource type="helpUser" /></span>
                </td>
            </tr>
        </table>    
    </web:then>
    <web:else>
        <div class="mstrPathContainer">
            <web:displayBean bean="pathBean" styleName="DesktopPathStyle"/>
            <%@include file='/jsp/Logo.jsp' %>
        </div>
    </web:else>
</web:ifFeature>    
