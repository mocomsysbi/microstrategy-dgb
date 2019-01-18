<%
 /****
  * Basic_Path.jsp
  * This file includes the content of the Path section for pages such as Desktop and Summary.
  * This consist on a go Home link, the Return-to link (to go to Home as well)
  * and the name of the current project the user is logged in to.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>

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
                    <table>
                    	<tr>
		                    <td>
		                    	<web:ifFeature name="dhtml">
			                        <web:then>
			                        	<div id="mstrPathAccount" style="cursor:pointer;">
					                    	<span class="mstrPathLast mstrAccountName" title="<web:connectionValue property="userName"/>"><web:connectionValue property="userName"/></span>
					                    	<div id='mstrAccountMenu' class='mstrAccountMenu path' > </div>
					                	</div>
			                        </web:then>
			                        <web:else>
			                        	<%-- Render a hyperlink to the Online Help. --%> 
					                    <span class="mstrHelpShortcut"><web:resource type="helpUser" /></span>
				                	</web:else>
			                	</web:ifFeature>
	                		</td>
	                	</tr>
                	</table>
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
