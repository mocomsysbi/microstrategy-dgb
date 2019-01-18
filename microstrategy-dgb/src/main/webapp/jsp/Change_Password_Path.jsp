<%
    /*
     * Change_Password_Path.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Path.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

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
                        <%--
                         If the user has the "change password" preference, show the "return to"
                         hyperlink (allows the user to be moved back to the page where s/he was before).
                        --%>
                        <web:ifBeanValue property="getName" value="prefChPwd">
                            <web:then>
                                <web:displayBean bean="pathBean" styleName="PathStyle"/>
                            </web:then>
                        </web:ifBeanValue>
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
        <%--
         If the user has the "change password" preference, show the "return to"
         hyperlink (allows the user to be moved back to the page where s/he was before).
        --%>
        <web:ifBeanValue property="getName" value="prefChPwd">
            <web:then>
                <web:displayBean bean="pathBean" styleName="PathStyle"/>
            </web:then>
        </web:ifBeanValue>
    </web:else>
</web:ifFeature>
