<%
 /*
  * Help_Toolbar.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Toolbar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<%-- Render the shotcut elements dor the toolbar as specified in pageConfig.xml--%>
<TABLE WIDTH="158" BORDER="0" CELLSPACING="0" CELLPADDING="0">
    <TR>
        <TD>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2">
                <web:shortcutOptions type="toolbar1" ucase="false" shortcutClass="help-toolbar" >
                    <web:shortcutProperty name=""  selectedValue=""/>
                    <TR>
                        <TD>
                            <IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="13" HEIGHT="1" ALT="" BORDER="0" />
                        </TD>
                        <TD VALIGN="TOP" WIDTH="3">
                            <IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" />
                        </TD>
                        <TD VALIGN="TOP"><web:shortcutElement /></TD>
                    </TR>
                </web:shortcutOptions>
            </TABLE>
        </TD>
    </TR>
</TABLE>