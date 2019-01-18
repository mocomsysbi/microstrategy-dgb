<%
    /*
     * Admin_Servers_Toolbar.jsp
     * Copyright 2002 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Toolbar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<TABLE WIDTH="158" BORDER="0" CELLSPACING="0" CELLPADDING="0">
    <TR>
        <TD style="padding-top:10px">
            <TABLE ID="webserver_Table" NAME="webserver_Table" BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
                <TR>
                    <TD ALIGN="left" VALIGN="top" style="padding-bottom:5px">&nbsp;&nbsp;&nbsp;<span class="mstrHighlighted">
                    	<web:ifFeature name="mobile-server">
                    		<web:then>
                    			<web:descriptor key="mstrWeb.7879" desc="MOBILE SERVER" />                    		
                    		</web:then>
                    		<web:else>
                    			<web:descriptor key="mstrWeb.2747" desc="WEB SERVER" />
                    	    </web:else>
                    	</web:ifFeature>
                    </span></TD>
                </TR>
                <TR>
                    <TD style="padding-left:17px">
                        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2">
                            <TR>
                                <TD VALIGN="TOP"><IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" />
                                    <span class="mstrStandardHighlighted"><web:descriptor key="mstrWeb.2350" desc="Intelligence Servers"/></span>
                                </TD>
                            </TR>
                            <TR>
                                <TD style="padding-left:12px">
                                    <IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" />
                                    <%--
                                     Display "Servers" as a hyperlink or highlighted depending on whether
                                     the property is already selected.
                                    --%>
                                    <web:ifBeanValue bean="adminBean" property="getShowDefaultProperties">
                                        <web:then>
                                            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventAdminOpenHome" cssClass="mstrLink">
                                                <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentShowDefault" value="false" />
                                                <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentShowServerProperties" value="false" />
                                                <web:descriptor key="mstrWeb.2694" desc="Servers" />
                                            </web:urlEvent>
                                        </web:then>
                                        <web:else>
                                            <web:ifBeanValue bean="adminBean" property="getShowServerProperties">
                                                <web:then>
                                                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventAdminOpenHome" cssClass="mstrLink">
                                                        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentShowDefault" value="false" />
                                                        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentShowServerProperties" value="false" />
                                                        <web:descriptor key="mstrWeb.2694" desc="Servers" />
                                                    </web:urlEvent>
                                                </web:then>
                                                <web:else>
                                                    <span class="mstrStandardHighlighted"><web:descriptor key="mstrWeb.2694" desc="Servers" /></span>
                                                </web:else>
                                             </web:ifBeanValue>
                                        </web:else>
                                    </web:ifBeanValue>
                                </TD>
                            </TR>
                            <%--
                             Display "Servers" as a hyperlink or highlighted depending on whether
                             the property is already selected.
                            --%>
                            <web:ifBeanValue bean="adminBean" property="getShowServerProperties">
                                <web:then>
                                    <TR>
                                        <TD style="padding-left:12px">
                                        <IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" />
                                        <span class="mstrStandardHighlighted"><web:beanValue bean="adminBean" property="serverName" encode="true"/></span></TD>
                                    </TR>
                                </web:then>
                            </web:ifBeanValue>
                            <%--
                             Display "Default properties" as a hyperlink or highlighted depending on whether
                             the property is already selected.
                            --%>
                            <TR>
                                <TD style="padding-left:12px">
                                    <web:ifBeanValue bean="adminBean" property="getShowDefaultProperties">
                                        <web:then>
                                            <IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" onload="microstrategy.modifyLogins()"/>
                                            <span class="mstrStandardHighlighted"><web:descriptor key="mstrWeb.2695" desc="Defaults"/></span></TD>
                                        </web:then>
                                        <web:else>
                                            <IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0"/>
                                            <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventAdminOpenHome" cssClass="mstrLink">
                                                <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentShowDefault" value="true" />
                                                <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentShowServerProperties" value="false" />
                                                <web:descriptor key="mstrWeb.2695" desc="Defaults"/>
                                            </web:urlEvent>
                                        </web:else>
                                    </web:ifBeanValue>
                                </TD>
                            </TR>
                            <%-- Display "Diagnostics" as a hyperlink or a highlighted element --%>
                            <TR>
                                <TD VALIGN="TOP">
                                    <IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" />
                                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenDiagnostics" cssClass="mstrLink">
                                        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentShow" value="0" />
                                        <web:descriptor key="mstrWeb.2703" desc="Diagnostics" />
                                    </web:urlEvent>
                                </TD>
                            </TR>
                            <%-- Display "Configuration" as a hyperlink or a highlighted element --%>
                            <TR>
                                <TD style="padding-left:12px">
                                    <IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" />
                                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenDiagnostics" cssClass="mstrLink">
                                        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentShow" value="0" />
                                        <web:descriptor key="mstrWeb.2697" desc="Configuration" />
                                    </web:urlEvent>
                                </TD>
                            </TR>
                            <%-- Display "View logs" as a hyperlink or a highlighted element --%>
                            <TR>
                                <TD style="padding-left:12px">
                                    <IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" />
                                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenDiagnostics" cssClass="mstrLink">
                                        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentShow" value="1" />
                                        <web:descriptor key="mstrWeb.2698" desc="View logs" />
                                    </web:urlEvent>
                                </TD>
                            </TR>                            
                            <%-- Display "Statistics" as a hyperlink or a highlighted element --%>
                            <TR>
                                <TD style="padding-left:12px">
                                    <IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" />
                                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenDiagnostics" cssClass="mstrLink">
                                        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentShow" value="2" />
                                        <web:descriptor key="mstrWeb.2706" desc="Statistics" />
                                    </web:urlEvent>
                                </TD>
                            </TR>                           
                            <%-- Display "Security" as a hyperlink or a highlighted element --%>
                            <TR>
                                <TD VALIGN="TOP">
                                    <IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" />
                                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenSecuritySetup" cssClass="mstrLink">
                                        <web:descriptor key="mstrWeb.2696" desc="Security" />
                                    </web:urlEvent>
                                </TD>
                            </TR>
                            <%-- Display "Other Configuration" as a hyperlink or a highlighted element --%>
                            <TR>
                                <TD VALIGN="TOP">
                                    <IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" />
                                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" cssClass="mstrLink">
                                        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="other" />
                                        <web:descriptor key="mstrWeb.12192" desc="Other Configuration" />
                                    </web:urlEvent>
                                </TD>
                            </TR>
                            <web:ifFeature name="!mobile-server"><web:then>
                             <%-- Display "Custom Visualization" as a hyperlink or a highlighted element --%>
                             <TR>
                                 <TD VALIGN="TOP">
                                     <IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" />
                                     <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" cssClass="mstrLink">
                                         <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="customVisualization" />
                                         <web:descriptor key="mstrWeb.4633" desc="Custom Visualizations" />
                                     </web:urlEvent>
                                 </TD>
                             </TR> 
                            </web:then></web:ifFeature>
                            <web:ifFeature name="!web-server"><web:then>
                            <%-- Display "Mobile Configuration" as a hyperlink or a highlighted element --%>
                                <TR>
                                    <TD VALIGN="TOP">
                                        <IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" />
                                        <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" cssClass="mstrLink">
                                            <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="mobileList" />
                                            <web:descriptor key="mstrWeb.7764" desc="Mobile Configuration" />
                                        </web:urlEvent>
                                    </TD>
                                </TR>   
                            </web:then></web:ifFeature>
                        </TABLE>
                    </TD>
                </TR>
             </TABLE>
        </TD>
    </TR>
</TABLE>

