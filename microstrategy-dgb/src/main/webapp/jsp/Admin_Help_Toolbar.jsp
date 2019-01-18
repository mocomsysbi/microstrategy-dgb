<%
 /*
  * Admin_Help_Toolbar.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Toolbar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<TABLE WIDTH="158" BORDER="0" CELLSPACING="0" CELLPADDING="0">
    <TR>
        <TD>
            <IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="13" HEIGHT="1" ALT="" BORDER="0" />
            <web:descriptor key="mstrWeb.624" desc="Administrator Page" />
        </TD>
    </TR>
    <TR>
        <TD colspan="2">
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2">
<%--
 Display the Help secion as defined in the shortcut-list defined in pageConfig.xml (toolbar1)
 The shortcutOptions tag will go through all the shortcut elements and render them.
--%>
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
    <TR>
        <TD>
            <IMG <web:resource attribute="SRC" name="1ptrans.gif"/> WIDTH="13" HEIGHT="1" ALT="" BORDER="0" />
            <web:descriptor key="mstrWeb.266" desc="Project Defaults" />
        </TD>
    </TR>
    <TR>
        <TD>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2">
			<%--
			 Display the Help secion as defined in the shortcut-list defined in pageConfig.xml (toolbar2)
			 The shortcutOptions tag will go through all the shortcut elements and render them.
			--%>
                <web:shortcutOptions type="toolbar2" ucase="false" shortcutClass="help-toolbar" >
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
