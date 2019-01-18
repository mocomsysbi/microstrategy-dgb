<%
 /*
  * Print_Options_Toolbar.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Toolbar.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<web:ifBeanValue bean="preferences" property="useForHeaderFooter">
<web:then>
<style type="text/css">
  .mstrVerticalDocks .tdDockLeft {display: none;}
</style>
</web:then>
    <web:else>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0">
            <TR>
                <TD>
                    <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2">
                        <TR>
                            <TD VALIGN="TOP"><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="13" HEIGHT="1" ALT="" BORDER="0" /></TD>
                            <TD VALIGN="MIDDLE"><web:displayBean bean="preferences"  renderGroupList="true"/></TD>
                        </TR>
                    </TABLE>
                </TD>
            </TR>
            <TR>
                <TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="1" HEIGHT="3" ALT="" BORDER="0" /></TD>
            </TR>
            <TR>
                <TD>
                    <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2">
                        <TR>
                            <TD VALIGN="TOP"><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="13" HEIGHT="1" ALT="" BORDER="0" /></TD>
                            <TD>
								<%-- Render the hyperlink to the 'Change Password' page only for standard authentication. --%>
								<web:ifFeature name="change-password">
                                	<web:then>
		                                <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebOpenPrefChangePwdPage">
                		                    <web:descriptor key="mstrWeb.497" desc="Change Password" />
                                		</web:urlEvent>
									</web:then>
								</web:ifFeature>
                            </TD>
                        </TR>
                    </TABLE>
                </TD>
            </TR>
            <TR>
                <TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="158" HEIGHT="1" ALT="" BORDER="0" /></TD>
            </TR>
        </TABLE>
    </web:else>
</web:ifBeanValue>
