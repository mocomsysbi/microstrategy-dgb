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
    
    <title><web:descriptor key="mstrWeb.4633" desc="Custom Visualizations" /></title>
  </head>
  <body>
    <div class="mstrPanelPortrait">
      <div class="mstrPanelTitleBar">
        <div class="mstrPanelTitle">
            <web:descriptor key="mstrWeb.4633" desc="Custom Visualizations" />
        </div>
      </div>
      <div class="mstrPanelBody">
        <table cellspacing="0" cellpadding="0" width="100%" class="mstrAdminProperties">
          <tr>
            <td width="100%">
                    <p id= "tooltipDiv">

                    <web:descriptor key="mstrWeb.14646" desc = "To deploy a custom visualization plug-in to MicroStrategy Web, click “Upload Visualization Plug-in” and browse to where the visualization plug-in ZIP file is located." />
					<BR/>
					<BR/>
					<web:descriptor key="mstrWeb.14647" desc = "Custom visualization plug-ins may have been independently produced and distributed, and are deployed at your own risk. To find more plug-ins visit the MicroStrategy Custom Visualization Gallery." />
					</p>
                	<br>
                	<table cellpadding="2" border="0" cellspacing="0" width="100%">
		              <tr>
	                    <td valign="top" width="30%">
	                    	<div class="mstr-customvis-nm"><web:descriptor desc="Upload a custom visualization plug-in ZIP file:" key="mstrWeb.14604" /></div>
	                	</td>
	                    <td valign="top">
		                    <span class="mstr-customvis-button mstr-customvis">
				                <div class="mstr-customvis-dsc"><web:descriptor desc="Upload visualization plug-in" key="mstrWeb.14605"/></div>
				                <form id="import_form_visualization" class="mstrmojo-FileUploadBox" target="import_iframe_visualization" enctype="multipart/form-data" method="post" <web:taskProcessorName attribute="action"  type="admin"/> >
						            <input type="file" class="mstrmojo-FileUploadBox-file" size="30" name="myFile" onchange="document.getElementById('resultsDiv').style.display='block'; microstrategy.uploadVisualizationFile('import_form_visualization');" accept=".zip" title="">
						            <input type="hidden" name="fileFieldName" value="myFile">
						            <input type="hidden" name="taskId" value="importCustomVizZip">
						            <input type="hidden" name="sessionState" value = "<web:connectionValue property="sessionState"/>">
						            <input type="hidden" name="taskEnv" value="xhr"/>
					        	</form>
					        </span>  
						</td>
					  </tr>
	                </table>		      
                	<span class="mstr-customvis-lnk mstr-custom">
				        <div name="resultsDiv" id="resultsDiv" class="mstrPanelPortrait" style="display:none">
							<div class="mstrPanelTitleBar"><web:descriptor key="mstrWeb.5082" desc="Results:" /></div>
							<div class="mstrPanelBody">
				        		<iframe name="import_iframe_visualization"  width="100%" height="500" frameborder="0" src="about:blank"></iframe>    
				        	</div>
		                 </div>      
		            </span>        				    			
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>
