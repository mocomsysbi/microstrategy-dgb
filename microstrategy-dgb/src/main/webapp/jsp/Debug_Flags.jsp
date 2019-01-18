<%
 /**
  * Debug_Flags.jsp
  */
%>
<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<script>
	function updateCheckBoxes(flag) {
		if (isNaN(flag)) {
			return;
		}
		var boxes = document.forms['dfForm'].elements['dfcb'];
		for (var i= 0; i < boxes.length; i++) {
			if ((boxes[i].value & flag)===0) {
				boxes[i].checked = false ;
			}
			else {
				boxes[i].checked = true ;
			}
		}
	}
	function init() {
		var flag = <web:debugFlags action="getCurrentFlagValue" />;
		document.forms['dfForm'].hexFlag.value = flag.toString(16);
		updateCheckBoxes(flag);
	}

	function selectAll() {
		var boxes = document.forms['dfForm'].elements['dfcb'];
		for (var i = 0; i < boxes.length; i++) {
			boxes[i].checked = true ;
		}
		updateHexFlag();
	}

	function deSelectAll() {
		var boxes = document.forms['dfForm'].elements['dfcb'];
		for (var i = 0; i < boxes.length; i++) {
			boxes[i].checked = false ;
		}
		updateHexFlag();
	}
	function updateHexFlag() {
		var hexValue = 0;
		var boxes = document.forms['dfForm'].elements['dfcb'];
		for (var i = 0; i < boxes.length; i++) {
			if (boxes[i].checked) {
				hexValue += parseInt(boxes[i].value);
			}
		}
		document.forms['dfForm'].hexFlag.value = hexValue.toString(16);
	}

	function validateHexFlag() {
		var value = document.forms['dfForm'].hexFlag.value;
		if (!value) {
			alert('The number you entered must not be blank.');
			return false;
		}
		if (!/\b[0-9a-f]{1,4}\b/.test(value)) {
			alert('It must be a 1-4 digit of hexadecimal number.');
			return false;
		}
		return true;
	}

	if (window.addEventListener) {
		window.addEventListener("load", init, false);
	} else {
        window.attachEvent("onload", init);
    }
</script>
<style type="text/css">
.mstrAdminPropertiesHeader {
	padding: 0.5em;
	color: #fff;
	background-color: #888;
	font-weight: bold;
}
.mstrAdminPropertiesValue {
    text-align: center;
}
</style>

<form id="dfForm" action="" method="post">
<table cellspacing="0" id="mstrWebContentTable">
<tr><td>
   <fieldset style="margin-bottom: 1em; padding: 0.5em 1em 1em 1em">
      <legend>Debug Flags:</legend>
      <table cellspacing="0" cellpadding="1" class="mstrAdminPropertiesLogin">
          <tr><td class="mstrAdminPropertiesHeader">Flag Description</td><td class="mstrAdminPropertiesHeader">Enabled</td></tr>
          <web:debugFlags action="renderTableOptions" />
      </table>
      <input type="button" style="margin-left:1em; margin-top:0.8em" value="Select All Flags" onClick="selectAll();" />
      <input type="button" style="margin-left:1em; margin-top:0.8em" value="Clear All Flags" onClick="deSelectAll();" />
   </fieldset>
</td></tr>
<tr><td>
   <b>(Hex)</b> 0x<input type="text" id="hexFlag" name="hexFlag" value="<web:debugFlags action="getCurrentFlagValue" />" size="4" onblur="validateHexFlag()"/>

   <input type="submit" style="width:8em; margin-left:3em" value="Apply" class="mstrButton" />
   <input type="button" style="width:8em; margin-left:3em" value="Refresh" class="mstrButton"  onclick="window.location='?pg=debug';" />
</td></tr>
</table>
</form>