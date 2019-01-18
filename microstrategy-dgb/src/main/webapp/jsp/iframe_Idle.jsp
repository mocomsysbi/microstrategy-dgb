<%
  /*
   * iframe_Idle.jsp
   * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
   */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<%--

--%>

<web:javascript type="domain" />
<HTML>
    <BODY onBeforeUnload="if (window.parent.iframe.notifyParent) {window.parent.iframe.notifyParent();}">
        <SCRIPT LANGUAGE="Javascript">
            self.isIframe = true;
            <%--
           // Commented out the line below - Instead, hide the wait page at mstrEventManager.initializeBones which happens after page and all (including dynamic) JS files are loaded
           // and are able to give users better visual idea when page is ready.
           // if (window.parent.iframe && window.parent.iframe.hideWaitPage) window.parent.iframe.hideWaitPage();
           --%>
        </SCRIPT>
		<web:logging action="statistics"/>
    </BODY>
</HTML> 
