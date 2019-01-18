<%@ page errorPage="/jsp/JSP_Error.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd " >
<html>
  <head>
    <web:taskAdminTitle />
    <link rel="stylesheet" type="text/css" href="../style/taskProc/styles.css" />
  </head>
  <body>
    <web:taskAdminNavBar />

	<div class="content">
		<form METHOD="POST" ACTION="#">
		    <p>
		    This page allows you to examine the parameters for all registered tasks.
		    </p>
	
			<p>
				<label for="taskSelect">Task ID:</label>
				<web:taskAdminSelectTaskID selectName="taskSelect" onchange="javascript:submit();" 
										   emptyMsg="<p>No Tasks are defined.</p>" />
			</p>
			
			<web:taskAdminParamInfos selectedTaskParamName="taskSelect"
									 emptyDatasetMsg="<p>No parameters exist for this task.</p>"  />
	    </form>
    </div>
  </body>
</html>