<%
 /*
  * LoginWarning_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%><%@ page errorPage="Error_Content.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<script>
<%--
//At this point, <web:ifConnectionValue/> return true, but User Preferences are not available yet
//therefore we add the color theme name saved in browserSetting
--%>
document.body.className += " <web:value type='browserSetting' name='colorTheme'/>";

function showLicenseMessage(index) {
  var prevDiv = (index > 0) ? document.getElementById("licenseMsg" + (index - 1)) :  null;
  var msgDiv = document.getElementById("licenseMsg" + index);
  var nextDiv = document.getElementById("licenseMsg" + (index + 1));

  if (msgDiv) {
    if (prevDiv) {
      prevDiv.style.display = "none";
    }

    msgDiv.style.display = "block";

    <%-- //#303937: to support submitting by Enter - focus on the first Continue button --%>
    if (index == 0) { 
    	document.getElementById('continue0') && document.getElementById('continue0').focus();
    }
  }

  if (!nextDiv) {
    document.getElementById("continue").style.display = "block";
    document.getElementById('3054').focus(); <%-- //#303937: to support submitting by Enter - focus on second Continue button --%>
  }
}

</script>

<div class="mstrError">
<%-- Render the licensing information messages--%>
<web:licensingInfo contentType="all" />

<%-- Render the login bean with the continue button --%>
<div id="continue" class="licenseButtonBar">
 <web:displayBean bean="lb" />
</div>

<script>showLicenseMessage(0);</script>
</div>
