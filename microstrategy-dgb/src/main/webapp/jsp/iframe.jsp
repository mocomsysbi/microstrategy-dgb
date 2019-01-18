<%
/*
* iframe.jsp
* Copyright 2001 MicroStrategy Incorporated. All rights reserved.
*/
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page import="com.microstrategy.web.app.beans.PageComponent"%>

<web:javascript type="domain" />

<%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>

<html>
    <web:performanceTimer action="initialize"/>
    <web:performanceTimer action="start"/>
    <%--
      If the request is not ready, add the JavaScript funtion to refresh the page
      after certain period of time.
    --%>
    <head>
        <web:ifBeanValue property="getXMLStatus" value="2"><web:then>
        <web:wait/>
        </web:then></web:ifBeanValue>
    </head>
    <body onload="if (typeof(document.readyState) == 'undefined') document.readyState = 'complete';window.parent.microstrategy.eventManager.executeFunction('window.microstrategy.eventManager.onreload()');window.parent.iframe.hideWaitCurtain(); <web:performanceString/>" onBeforeUnload="window.parent.iframe.notifyParent();">
        <script>
            self.asDescriptors = new Array();
            self.pageTitle = "<web:beanValue property="title" jsEncode="true"/><web:descriptor key="mstrWeb.8965" desc=". MicroStrategy 9" />";
        </script>

        <%-- Render the error section as specified in pageConfig.xml --%>
        <div id="mstrWeb_error" NAME="mstrWeb_error" IFRAME="true">
            <jsp:include page='<%=mstrPage.getTemplateInfo().getSection("error")%>' flush="true" />
        </div>
        <%-- Render all GUI components defined for the current page. --%>
        <web:displayGuiComponent/>
        <%--
          If there is an error and the status of the I-Server is not an error
          (i.e. the report didn't error out). Set the page not to update the
          window.
        --%>
	<web:ifBeanValue property="getXMLStatus" value="4">
	    <web:else>
		<web:ifFeature name="dhtml">
		    <web:then>
			<web:scriptPageState updateWindow="false"/>
		    </web:then>
		</web:ifFeature>
	    </web:else>
	</web:ifBeanValue>
        <%--
          If the 'show-wait' property is enabled, show the wait page in HTML
          comments.
        --%>
        <web:ifTemplateValue property="show-wait">
            <web:then>
                <comment id="mstrWeb_wait_body" name="mstrWeb_wait_body" iframe="true"><!--<div class="mstrWaitBoxBody <web:ifBeanValue property="getXMLStatus" value="2"><web:then>mstrDialogBone</web:then></web:ifBeanValue>" id="mstrWeb_wait_body" name="mstrWeb_wait_body" iframe="true">
                            <web:ifBeanValue property="getXMLStatus" value="2">
                                <web:then>
                                	<div class="mstrIcon-wait"><div class="mstrIcon-close-wait" onmousedown="window.parent.iframe.stopWindow();hasLoaded=false;" <web:descriptor attribute="title" key="mstrWeb.221" desc="Cancel" />></div></div>
                                    <div>
                                        <div class="mstrWaitBoxStatus">
                                            <web:descriptor key="mstrWeb.91" desc="Current status:" />
                                            <web:descriptor type="status" />
                                        </div>
                                    <div class="mstrSpacer"></div>
                                    </div>
                                    <web:wait type="buttons"/>
                                </web:then>
                                <web:else>
                                    <div>
										<div class="mstrIcon-wait"><div class="mstrIcon-close-wait" onmousedown="window.parent.iframe.stopWindow();hasLoaded=false;" <web:descriptor attribute="title" key="mstrWeb.221" desc="Cancel" />></div></div>
                                        <div class="mstrSpacer"></div>
                                    </div>
                                </web:else>
                            </web:ifBeanValue>
                            <div class="mstrSpacer"></div>
                </div>--></comment>
            </web:then>
        </web:ifTemplateValue>
        <comment id="mstrInlineScripts" iframe="true"><!--<div id="mstrInlineScripts"><span>&nbsp;</span><web:resourceMgr type="scriptFiles"/><web:resourceMgr type="inlineScripts"/></div>--></comment>
        <%-- Display the statistics information gathered from the page. --%>
        <web:logging action="statistics"/>        
        <%-- Hide the wait page if the request is still being processed. --%>
        <script language="Javascript">
            self.isIframe = true;
            <web:ifBeanValue property="getXMLStatus" value="2">
                <web:then>
                    window.parent.iframe.hideWaitPage();
                </web:then>
            </web:ifBeanValue>
            <%-- Check again, if the request is not ready show the wait page;
                     otherwise, hide it.
            --%>

            <web:ifBeanValue property="getXMLStatus" value="2">
                <web:then>
                    window.parent.iframe.showWaitPage();
                </web:then>
                <web:else>
                    window.parent.iframe.hideWaitPage(false);
                </web:else>
            </web:ifBeanValue>
            window.parent.iframe.replaceComponents(window.parent, this);
            <%--
                  If the request is ready, indicate that JavaScript will be used to
                  update the IFrame.
            --%>
            <web:ifBeanValue property="getXMLStatus" value="3">
                <web:then>
                    <web:javascript eventName="onload" forIframeUpdate="true" />
                </web:then>
            </web:ifBeanValue>
        </script>
        <%--Call 'doRedirect' if the status returns 'Processing'. --%>
        <web:ifBeanValue property="getXMLStatus" value="2">
            <web:then>
                <script language="JavaScript">doRedirect();</script>
            </web:then>
        </web:ifBeanValue>
        <web:logging action="viewSourceDebug"/>
    </body>
</html>
