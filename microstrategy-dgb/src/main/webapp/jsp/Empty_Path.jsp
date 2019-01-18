<%
 /****
  * Empty_Path.jsp
  * This file includes the content of the Path section for pages showing only empty pathbar.
  * This consists of logo only.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<web:ifFeature name="showHeaderBar" type="systemPreference" value="0">
    <web:then>
        <table cellpadding="0" cellspacing="0" border="0" style="table-layout:fixed">
            <colgroup>
                <col class="mstrAdminPathShortcutsCol" style="width:100%"/>
                <web:ifFeature name="is-cloud-unified">
                	<web:then>
                		<col class="mstrFeedback" />
                	</web:then>
                </web:ifFeature>
                <col class="mstrPathHelpCol" />
            </colgroup>
            <tr>
                <td class="mstrPathTDLeft">
                    <div class="mstrPathContainer">
                        <%--
                        Display the Help secion as defined in the shortcut-list defined in adminPageConfig.xml (toolbar)
                        The shortcutOptions tag will go through all the shortcut elements and render them.
                        --%>
                        <div class="mstrAdminPathShortcuts">
                            <web:ifBeanValue property="getName" value="chPwd">
                                <web:else>
                                    <web:ifFeature type="systemPreference" name="showOfficeLink">
                                        <web:then>
                                            <web:ifFeature type="misc" name="officeSetup">
                                                <web:then>
                                                    <span class="mstrShortcut"><a
                                                    href="<web:value type="misc" name="officeSetup" />"
                                                    target="_blank"><web:descriptor key="mstrWeb.3847"
                                                    desc="Install MicroStrategy Office" /></a></span>
                                                </web:then>
                                            </web:ifFeature>
                                        </web:then>
                                    </web:ifFeature>
                                </web:else>
                            </web:ifBeanValue>
                        </div>
                        <%@include file='/jsp/Logo.jsp' %>   
                    </div>
                </td>
                <web:ifFeature name="is-cloud-unified">
	                <web:then>
	                	<jsp:include page='../html/CloudUnifiedFeedback.html' flush="true" />
                	</web:then>
                </web:ifFeature>
                <td>
                    <span class="mstrHelpShortcut welcome"><web:resource type="helpUser" /></span>
                </td>
            </tr>
        </table>
    </web:then>
    <web:else>
        <div class="mstrPathContainer">
            <%@include file='/jsp/Logo.jsp' %>
        </div>
    </web:else>
</web:ifFeature>     
