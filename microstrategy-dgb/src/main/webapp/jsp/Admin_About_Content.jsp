<%
  /*
   * Admin_About_Content.jsp
   * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
   */
%>
<BR /><BR />
<SPAN class="mstrVersionInfo">
    <SPAN>JSP version:</SPAN>&nbsp;<mstrversion>11.1.0.22546</mstrversion><BR /><BR />
    <SPAN><web:descriptor key="mstrWeb.792" desc="XML API version:" /></SPAN>&nbsp;<web:connectionValue property="xmlAPIVersion"/><BR /><BR />
    <SPAN>Java Virtual Machine:</SPAN>&nbsp;(<web:connectionValue property="JVMVendor"/>&nbsp;<web:connectionValue property="JVMVersion"/>)<BR /><BR />
<%--
 If there is a session and the server versio can be accessed,
 display the Intelligent Server version number.
--%>
    <web:ifConnectionValue property="serverVersion">
        <web:then>
            <SPAN><web:descriptor key="mstrWeb.795" desc="Server version:" /></SPAN>&nbsp;<web:connectionValue property="serverVersion"/><BR /><BR />
        </web:then>
    </web:ifConnectionValue>
    <SPAN><web:descriptor key="mstrWeb.793" desc="Browser version:" /></SPAN>&nbsp;<web:value type="misc" name="userAgent"/> <BR /><BR />
</SPAN>
<%--
 This tag displays all the cookies currently defined on the
 client's browser by the application.
--%>
<web:displayCookies/>
