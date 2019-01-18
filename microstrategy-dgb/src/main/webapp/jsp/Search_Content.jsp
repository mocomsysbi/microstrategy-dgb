<%
 /*
  * Search_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<web:ifFeature name="dhtml">
<web:then>

<web:clientSideDescriptor IDs="2,3,73,162,163,271,272,715,1956,1957,1958,1959,1960,1961,1962,1963,1964,1965,1966,1967,1968,1969,1970,1971,1972,1973,1974,1995,2058,2033,2102,2398,2399,2509,2520,2969,2986,3012,3677,3680,3852,3853,3854,3855,3856,3857,3858,3859,3860,3861,3862,3863,4223,5717,5878,5879,5961,5972,8145,8146,8147,8211,8212,8213,8951,8952,9049,9168,9202,9242,14111"/>

<web:ifFeature name="i-frame">
 <web:then>
  <web:updateManager />
 </web:then>
</web:ifFeature>

 <table class="mstrSearchContainer" width="100%" height="100%" cellspacing="0" cellpadding="0">
 <tr>
<td valign="top" width="100%" class="mstrSearchContainerContent">

<%-- Stack 1 - Search --%>

<!--  folder bone elem -->
<div id="folderAllModes" scriptclass="mstrFolderSearchImpl">
   <jsp:include page='/jsp/SearchSuggest_Content.jsp' flush="true" />
</div>

</td>
</tr>
</table>

</web:then>
<web:else>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" >
    <TR>
        <%-- Render the search page.--%>
        <TD COLSPAN="2">
            <web:ifBeanValue bean="sb" property="isAdvanced">
                <web:then>
                   <web:displayBean bean="sb" styleName="AdvancedSearchStyle"/>
                </web:then>
                <web:else>
                   <web:displayBean bean="sb" styleName="QuickSearchStyle"/>
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
                    <web:displayBean bean="sb.results" />
                </TD>
            </TR>
        </web:then>
    </web:ifBeanValue>
</TABLE>


</web:else>
</web:ifFeature>

