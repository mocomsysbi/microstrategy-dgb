<%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<html>
  <head>
    <style type="text/css">
    .disabled {
		background-color: #CCC; 
	}
    </style>
    <script language="javascript">
    	self.enableTextInput = function enableTextInput(textInput, enable) {
    		textInput.disabled = (!enable); 
    		textInput.className = (enable) ? '' : 'disabled';     	
    	}
    </script>
    <title><web:descriptor key="mstrWeb.5086" desc="Widget Deployment Page" /></title>
  </head>
  <body>
    <div class="mstrPanelPortrait">
      <div class="mstrPanelTitleBar">
        <div class="mstrPanelTitle">
            <web:descriptor key="mstrWeb.5085" desc="Widget Deployment" />
        </div>
      </div>
      <div class="mstrPanelBody">
        <table cellspacing="0" cellpadding="0" width="100%" class="mstrAdminProperties">
          <tr>
            <td width="100%">
              <form target="results" <web:taskProcessorName attribute="action"  type="admin"/> >
              	<p>
              		<web:descriptor key="mstrWeb.5076" desc="This page allows the Administrator to deploy a MicroStrategy Widget automatically to various MicroStrategy products in the system. To deploy a widget, indicate the location where you have uncompressed the downloaded file, particularly the location of the widget SWF file. Then, specify the MicroStrategy products in which you would like to deploy the widget and the file path used by those products. For more information, see the MicroStrategy Widget Deployment Guide located in the Documentation folder of your downloaded widget." />
              		<br><br>
              		<web:descriptor key="mstrWeb.5094" desc="To download widgets visit the MicroStrategy Widgets Library available on the Technical Support portal at https://resource.microstrategy.com/support/, under Developer Resources." />
                </p>
                <br>
                <table cellpadding="2" border="0" cellspacing="0" width="100%">
	              <tr>
                    <td valign="top" width="10%">
               	 		<web:descriptor key="mstrWeb.5077" desc="Widget SWF File Folder:" />
                	</td>
                    <td valign="top">
		                <input type="text" size="100" name="widgetSrcFolderPath" /><br>			                
	              		<web:descriptor key="mstrWeb.3993" desc="Example:" />&nbsp;C:\GraphMatrixWidget-1.0.0.009\Graph Matrix Widget\
					</td>
				  </tr>
                </table>		              		
                <br>
                <div style="padding-left:40px;">
                <table cellpadding="2" border="0" cellspacing="0" width="95%">
	              <tr>
                    <td valign="top" colspan="2">
                      <input type="checkbox" name="deployWeb" value="true" checked="true">
                      &nbsp;&nbsp;
                      <web:descriptor key="mstrWeb.3610" desc="MicroStrategy Web" />
                      <br><br>
                    </td>
                  </tr>
                  <tr>
                    <td valign="top" colspan="2">
                      <input type="checkbox" name="enableDesktopPath" value="false" onclick="enableTextInput(desktopPath, this.checked);">
                      &nbsp;&nbsp;
                      <web:descriptor key="mstrWeb.5084" desc="MicroStrategy Desktop" />
                    </td>
                  </tr>
                  <tr>
	                <td style="padding-left:50px;">
	                	<web:descriptor key="mstrWeb.5078" desc="MicroStrategy Common Files Path:" />
	                </td>
                    <td valign="top">
                      <input type="text" size="100" name="desktopPath" disabled="true" class="disabled" value="C:\Program Files\Common Files\MicroStrategy\"/>
                    </td>
                  </tr>
                  <tr>
                    <td valign="top" colspan="2">
                      <input type="checkbox" name="enableNcsPath" value="false" onclick="enableTextInput(ncsPath, this.checked);">
                      &nbsp;&nbsp;
                      <web:descriptor key="mstrWeb.5083" desc="MicroStrategy Narrowcast Server" />
                    </td>
                  </tr>
                  <tr>
	                <td style="padding-left:50px;">
		                <web:descriptor key="mstrWeb.5079" desc="Narrowcast Server Delivery Engine Path:" />
	                </td>
                    <td valign="top">
                      <input type="text" size="100" name="ncsPath" disabled="disabled" class="disabled" value="C:\Program Files\MicroStrategy\Narrowcast Server\Delivery Engine\" />
                    </td>
                  </tr>
                  <tr>
                    <td valign="top" colspan="2">
                      <input type="checkbox" name="enableOfficePath" value="false" onclick="enableTextInput(officePath, this.checked);">
                      &nbsp;&nbsp;
                      <web:descriptor key="mstrWeb.4383" desc="MicroStrategy Office" />
                    </td>
                  </tr>
                  <tr>
    				<td style="padding-left:50px;">
		                <web:descriptor key="mstrWeb.5080" desc="MicroStrategy Web Services Deployment Path:" />
		            </td>
                    <td valign="top">
                      <input type="text" size="100" name="officePath" disabled="disabled" class="disabled" value="C:\Program Files\MicroStrategy\Web Services\swf\"/>
                    </td>
                  </tr>
                  <tr>
                    <td valign="top" colspan="2" class="adminButtonBar">
                      <input type="submit" class="mstrButton" name="submit" <web:descriptor attribute="value" key="mstrWeb.5081" desc="Deploy Widget" /> onclick="document.getElementById('resultsDiv').style.display='block';"/>
                      <br>
                    </td>
                  </tr>
                  <tr>
                    <td valign="top" align="left" colspan="2">
                      <div name="resultsDiv" id="resultsDiv" class="mstrPanelPortrait" style="display:none">
						<div class="mstrPanelTitleBar"><web:descriptor key="mstrWeb.5082" desc="Results:" /></div>
						<div class="mstrPanelBody">
						  <iframe name="results" width="100%" height="500" frameborder="0"></iframe>
						</div>
	                  </div>
                    </td>
                  </tr>
                </table>
                </div>
                <!-- Hidden Inputs -->
                <input type="hidden" name="taskId" value="deployWidget"/>
                <input type="hidden" name="taskEnv" value="html"/>
              </form>
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>

