<%
 /*
  * Search_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<web:clientSideDescriptor IDs = "3037,6117" />
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" >
    <TR>
        <%-- Render the search page.--%>
        <TD COLSPAN="2">
            <web:ifBeanValue bean="sb" property="isAdvanced">
                <web:then>
                   <web:displayBean bean="sb" styleName="AdvancedConfigurationSearchStyle"/>
                </web:then>
                <web:else>
                   <web:displayBean bean="sb" styleName="QuickConfigurationSearchStyle"/>
                </web:else>
            </web:ifBeanValue>
        </TD>
    </TR>
    <%-- If the results are ready for the current search, display the results. --%>
    <web:ifBeanValue bean="sb" property="showResults">
        <web:then>
            <TR>
                <TD COLSPAN="2">
                    <BR /><HR /><BR />
                    <web:displayBean bean="sb.results" styleName="FolderConfigurationSearchResults" />
                </TD>
            </TR>
        </web:then>
    </web:ifBeanValue>
</TABLE> 