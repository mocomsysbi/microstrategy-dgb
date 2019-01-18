<%
 /****
  * Dialog_Path.jsp
  * This file includes the content of the Path section for pages that display dialogs and confirmation pages.
  * This consist on a go Home link, the Back and Forward buttons, the Parent Up button (that uses the back button action)
  * and the name of the current project the user is logged in to.
  *
  * Copyright 2006 MicroStrategy Incorporated. All rights reserved.
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
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
                <col class="mstrPathHelpCol" />
            </colgroup>
            <tr>
                <td class="mstrPathTDLeft">
                    <%-- Display the path section --%>
                    <div class="mstrPathContainer">
                        <web:displayBean bean="pathBean" styleName="DialogPathStyle"/>
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
            <web:displayBean bean="pathBean" styleName="DialogPathStyle"/>
            <%@include file='/jsp/Logo.jsp' %>
        </div>
    </web:else>
</web:ifFeature> 

