<%@ page errorPage="/jsp/JSP_Error.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd " >
<html>
  <head>
    <web:taskAdminTitle />
    <link rel="stylesheet" type="text/css" href="../style/taskProc/styles.css" />
    <script src="../javascript/taskProc/builder.js"></script>
  </head>
  <body>
	<web:taskAdminNavBar />    

	<div class="content">
		<form METHOD="POST" ACTION="#">
		    <p>
			    This page enables you to create a URL request for any of the registered Tasks (using any Envelope) and
			    submit it to invoke the Task.
		    </p>
	
			<p>
				<label for="taskSelect">Task ID:</label>
				<web:taskAdminSelectTaskID selectName="taskSelect" onchange="javascript:submit();" 
										   emptyMsg="<p>No Tasks are defined.</p>" />
				&nbsp;&nbsp;				
				<label for="envSelect">Task Envelope:</label>
				<web:taskAdminSelectTaskEnv selectName="taskEnv" onchange="javascript:submit();" />
				&nbsp;&nbsp;
				<label for="contentSelect">Task Content Type:</label>
				<web:taskAdminSelectTaskContentType selectName="taskContentType" />
			</p>
			
	    	<web:taskAdminParamInputTable selectedTaskParamName="taskSelect" emptyDatasetMsg="<p>No parameters exist for this task.</p>" />
	    	
			<h2>
		      	<input class="button" type="submit" name="action" value="Update URL">
		    	<label for="urlText">Generated URL:</label>
		    </h2>
		    <p>
		      	<textarea name="urlText" id="urlText" rows="3" wrap="soft">
<web:taskAdminTaskURL selectedTaskParamName="taskSelect" selectedTaskEnvParamName="taskEnv" selectedTaskContentTypeParamName="taskContentType" baseURL="true" htmlEncode="true" />
		      	</textarea>
		    </p>
		    
		    <h2>
		      	<input class="button" type="button" name="action" value="Invoke URL" onclick="javascript:invokeTask(document.getElementById('urlText').value, function(){ processReadyStateChange('innerTA', 'popupViewerSpan'); });">
		    	<label for="innerTA">Task Response:</label>
		    	<span style="display: none" id="popupViewerSpan">[ <a href="javascript:createPopupViewerFromTextArea('innerTA');">PopupViewer</a> ]</span>
		    </h2>

		    <div style="display: none" id="myDiv">
		    	<textarea style="width: 100%" name="innerTA" id="innerTA" rows="10">
		    	</textarea>
		    </div> 
	    </form>
    </div>
  </body>
</html>