<%
 /*
  * PDF_Process_Fast_Export.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<html>
    <head>
    	<style>
    	    <web:ifFeature type="systemPreference" name="enableFrameBreaking" value="1"><web:then>
    		body { display : none;}
    		</web:then></web:ifFeature>
    		</style>
        <web:resource type="javascript" name="DHTML.js"/>
        <web:resource type="javascript" name="print.js"/>
    </head>
    <body>
        <web:ifFeature type="systemPreference" name="enableFrameBreaking" value="1"><web:then>
        		<script> 
    			if (self == top) {
    			  var theBody = document.getElementsByTagName('body')[0];
    			  theBody.style.display = "block";
    			} else { 
    			  top.location = self.location; 
    			}
    			</script>
        		</web:then>
	</web:ifFeature>  
		<%-- Render the report bean as spedified in pageConfig.xml  --%>
        <web:displayBean bean="rb" />
    </body>
</html>