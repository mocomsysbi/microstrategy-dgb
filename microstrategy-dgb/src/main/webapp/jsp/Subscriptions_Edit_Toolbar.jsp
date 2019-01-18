<%
/*
 * Subscriptions_Edit_Toolbar.jsp
 * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
 */
%>

<%@ page errorPage="Error_Toolbar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Render the 'Subscribed reports' section using bullets. --%>
<web:panel language="0" name="lTbar" position="horizontal" halign="right" useImage="false">
    <web:panelContent>
        <TABLE WIDTH="158" BORDER="0" CELLSPACING="0" CELLPADDING="0">
            <TR>
                <TD>
                    <web:panel language="1" name="relSubs" useImage="true">
                        <web:panelTitle><span class="mstrHighlighted"><web:descriptor key="mstrWeb.1333" desc="SUBSCRIBED REPORTS" /></span></web:panelTitle>
                        <web:panelCloseInfo imgClass="mstrImageLink" width="13" height="13" img="1arrow_down.gif"><web:descriptor key="mstrWeb.1938" desc="Hide Subscribed Reports" /></web:panelCloseInfo>
                        <web:panelOpenInfo imgClass="mstrImageLink" width="13" height="13" img="1arrow_right.gif"><web:descriptor key="mstrWeb.1937" desc="Show Subscribed Reports" /></web:panelOpenInfo>
                        <web:panelContent>
                            <web:displayBean bean="webSubscriptions" styleName="SubscriptionsBulletStyle" />
                        </web:panelContent>
                    </web:panel>
                </TD>
            </TR>
            <TR><TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="1" HEIGHT="3" ALT="" BORDER="0" /></TD></TR>
            <TR><TD><%@include file='/jsp/Help_Section.jsp' %></TD></TR>
            <TR><TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="158" HEIGHT="1" ALT="" BORDER="0" /></TD></TR>
        </TABLE>
    </web:panelContent>
</web:panel>
