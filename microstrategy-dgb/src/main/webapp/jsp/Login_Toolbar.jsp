<%
 /*
  * Login_Toolbar.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Toolbar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<TABLE WIDTH="158" BORDER="0" CELLSPACING="0" CELLPADDING="0">
    <TR>
        <TD>
            <TABLE BORDER=0 CELLPADDING=2 CELLSPACING=0>
				<%-- Render the name of the I-Server is available --%>
                <web:ifBeanValue bean="login" property="getLoginRequiredServerName">
                    <web:then>
	                    <TR>
		                    <TD VALIGN="TOP"><IMG ALT="" BORDER="0" HEIGHT="1" <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="13" /></TD>
	    	                <TD VALIGN="CENTER" CLASS="login-toolbar-title"><web:descriptor key="mstrWeb.24" desc="Data Source" /></TD>
	        	        </TR>
	            	    <TR>
	                	    <TD><IMG ALT="" BORDER=0 HEIGHT=1 <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH=13 /></TD>
	                    	<TD VALIGN="TOP">
	                        <web:beanValue bean="login" property="loginRequiredServerName" encode="true"/>
                    </web:then>
                    <web:else>
	                    <TR>
	                	    <TD><IMG ALT="" BORDER=0 HEIGHT=1 <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH=13 /></TD>
	                    	<TD VALIGN="TOP">
                    </web:else>
                 </web:ifBeanValue>
				</TD>
	            </TR>
            </TABLE>
        </TD>
    </TR>
    <TR>
        <TD>
        <%@include file='/jsp/Help_Section.jsp' %>
        </TD>
    </TR>
    <TR>
        <TD><IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="158" HEIGHT="1" ALT="" BORDER="0" /></TD>
    </TR>
</TABLE>