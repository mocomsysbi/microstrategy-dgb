<%
    /*
     * Help_Section.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<web:panel language="1" name="hlp" useImage="true">
    <web:panelTitle><SPAN CLASS="mstrHighlighted"><web:descriptor key="mstrWeb.555" desc="NEED HELP?" /></SPAN></web:panelTitle>
    <web:panelCloseInfo imgClass="" width="13" height="13" img="1arrow_down.gif"><web:descriptor key="mstrWeb.905" desc="Hide Help" /></web:panelCloseInfo>
    <web:panelOpenInfo imgClass="" width="13" height="13" img="1arrow_right.gif"><web:descriptor key="mstrWeb.906" desc="Show Help" /></web:panelOpenInfo>
    <web:panelContent>
		<%-- Render the shortcut elements fof the Help Section as specified in pageConfig.xml--%>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2">
            <web:shortcutOptions type="help" ucase="false" shortcutClass="mstr-link" >
            <web:shortcutProperty name=""  selectedValue=""/>
            <TR>
                <TD VALIGN="TOP" WIDTH="3"><IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" /></TD>
                <TD VALIGN="TOP"><web:shortcutElement /></TD>
            </TR>
            </web:shortcutOptions>
			<%-- Render link to Online Help --%>
            <TR>
                <TD VALIGN="TOP" WIDTH="3"><IMG <web:resource attribute="SRC" /> class="mstrBulletImg" WIDTH="3" HEIGHT="8" ALT="" BORDER="0" /></TD>
                <TD VALIGN="TOP">
                    <a href="<web:value type="helpUser" name=""/>" target="_new">
                        <web:descriptor key="mstrWeb.600" desc="Online help" />
                    </a>
                </TD>
            </TR>
        </TABLE>
    </web:panelContent>
</web:panel>


