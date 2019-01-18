<%
/*
* RW_Toolbar.jsp
* This page displays the toolbars for the RW page.
*
* Copyright 2004 MicroStrategy Incorporated. All rights reserved.
* version: 1.2
* xhtml: true
****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<div class="mstrDockTopContainer">
<%-- Only show the mensu and toolbars if the rwbean is "ready": --%>
<web:ifBeanValue bean="rwframe.rwb" property="getXMLStatus" value="3">
    <web:then>
        <web:ifFeature name="dhtml">
            <web:then>
            	<web:ifFeature type="bean" value="rwframe" name="rw-interactive-view-mode-full-screen-reporter">
            	<web:then>
            		 <web:displayGuiComponent name="rwstd_FSMDHTML" />
            	</web:then>
            	<web:else>
            		<%-- wrapper DIV for toolbars/menubar, which has fixed height to avoid pushing down doc section when toolbars are loaded --%>
				<div class='mstrDockTopContent'>
					<web:displayGuiComponent name="ribbonFeaturesUpdate"/>
     				<web:displayBean bean="ribbonBean" styleName="RWRibbonToolbars" />
   				</div>
            	</web:else>
            	</web:ifFeature>
			</web:then>
            <web:else>
                <web:ifFeature name = "page-full-screen-mode">
                    <web:then>
                        <web:displayGuiComponent name="rwstd_FSM" />
                    </web:then>
                    <web:else>
                        <div class="mstrMenuBar" id="mstrMenuDiv">
                            <table border=0 cellpadding=0 cellspacing=0 >
                                <tr>
                                    <td class="mstrMenuItems"><web:displayGuiComponent name="rwmenu" /></td>
                                    <td class="mstrMenuLastUpdated" nowrap><web:displayGuiComponent name="rwlastupdate" /></td>
                                </tr>
                            </table>
                        </div>
                        <web:displayGuiComponent name="rwstd" />
                        <div class="mstrSpacer"/>
                    </web:else>
                </web:ifFeature>
            </web:else>
         </web:ifFeature>
    </web:then>
</web:ifBeanValue>
</div>