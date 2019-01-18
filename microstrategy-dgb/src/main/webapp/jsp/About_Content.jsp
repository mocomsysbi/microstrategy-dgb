<%
  /*
   * About_Content.jsp
   * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
   */
%>
<script type="text/javascript" src="//d3js.org/d3.v3.min.js"></script>
<BR /><div class="cntnr"></div><BR />
<SPAN class="mstrVersionInfo">
	<web:ifFeature name="administrator"><web:then>
	    <SPAN><p>JSP version:</P></SPAN>&nbsp;<div style="display:inline"  id="jspversion"><mstrversion>11.1.0.22546</mstrversion></div><BR /><BR />
	    <SPAN><p><web:descriptor key="mstrWeb.792" desc="XML API version:" /></P></SPAN>&nbsp;<div style="display:inline"  id="xmlversion"><web:connectionValue property="xmlAPIVersion"/></div><BR /><BR />
	    <SPAN><p>Java Virtual Machine:</P></SPAN>&nbsp;<div style="display:inline"   id="jvmversion">(<web:connectionValue property="JVMVendor"/>&nbsp;<web:connectionValue property="JVMVersion"/>)</div><BR /><BR />
	<%--
	 If there is a session and the server versio can be accessed,
	 display the Intelligent Server version number.
	--%>
	    <web:ifConnectionValue property="serverVersion">
	        <web:then>
	            <SPAN><p><web:descriptor key="mstrWeb.795" desc="Server version:" /></P></SPAN>&nbsp;<div style="display:inline"   id="serverversion"><web:connectionValue property="serverVersion"/></div><BR /><BR />
	        </web:then>
	    </web:ifConnectionValue>
    </web:then></web:ifFeature>
    <SPAN><p><web:descriptor key="mstrWeb.793" desc="Browser version:" /></P></SPAN>&nbsp;<div style="display:inline"   id="browserversion"><web:value type="misc" name="userAgent"/></div> <BR /><BR />
</SPAN>
<%--
 This tag displays all the cookies currently defined on the
 client's browser by the application.
--%>
<web:displayCookies/>

<web:resource type="style" name="mstr/team.css"/>
<web:resource type="javascript" name="team.js" />
