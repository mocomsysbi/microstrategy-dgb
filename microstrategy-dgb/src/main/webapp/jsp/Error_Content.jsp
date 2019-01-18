<%
 /*
  * Error_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */

  /*
   * This page is used as the error page for Content jsp files.
   */
%>

<%@ page isErrorPage="true" %>
<%@ page import="com.microstrategy.web.app.*"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<web:resourceMgr type="scriptFiles" location="head"/>

<BR />
<TABLE WIDTH="90%">
    <TR>
        <TD>
            <HR SIZE="1" /><FONT SIZE="2" COLOR="#CC0000"><span class="mstrHighlighted"><web:descriptor key="mstrWeb.1167" desc="An error has occurred on this page." /></span></FONT><BR />
            <BR /><web:errorValue property="message"/><BR />
            <HR SIZE="1" /><BR />
        </TD>
    </TR>
    <web:ifFeature type="systemPreference" name="renderExceptionInfo"><web:then>
    <TR>
        <TD>
			<%-- Display the root of the error and the stack trace in a Panel
				 The stack trace can be shown or hidden.
			 --%>
            <web:panel language="1" name="err" useImage="true">
                <web:panelTitle><span class="mstrHighlighted"><web:descriptor key="mstrWeb.189" desc="Details" />...</span></web:panelTitle>
                <web:panelCloseInfo imgClass="mstrImageLink" width="13" height="13" img="1arrow_down.gif"></web:panelCloseInfo>
                <web:panelOpenInfo imgClass="mstrImageLink" width="13" height="13" img="1arrow_right.gif"></web:panelOpenInfo>
                <web:panelContent>
                    <web:ifErrorValue property="root">
                        <web:then>
                            <P><span class="mstrHighlighted">Root trace info   :</span><BR>
                            <web:errorValue property="root"/>
                            </P>
                        </web:then>
                    </web:ifErrorValue>
                    <P><span class="mstrHighlighted">Exception trace info:</span><BR/>
                    <web:errorValue property="stackTrace"/>
                    </P>

                </web:panelContent>
            </web:panel>
        </TD>
    </TR>
    </web:then></web:ifFeature>
</TABLE>

<TABLE WIDTH="158" BORDER="0" CELLSPACING="0" CELLPADDING="0">
    <TR>
        <TD COLSPAN="2"><IMG SRC="images/1ptrans.gif" WIDTH="158" HEIGHT="1" ALT="" BORDER="0" /></TD>
    </TR>
</TABLE>

<web:resourceMgr type="scriptFiles"/>
<div id="mstrScriptFiles" name="mstrScriptFiles" iframe="true">
</div>
<div id="mstrInlineScripts" name="mstrInlineScripts" iframe="true">
<web:resourceMgr type="inlineScripts"/> 
</div>