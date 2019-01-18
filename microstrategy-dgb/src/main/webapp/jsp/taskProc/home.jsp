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
	    <p>
	    This application can be used to examine the tasks that are registered
	    with this processor: both their names and their parameters.  This application
	    can also be used to create a URL for a task and then invoke it.
	    </p>
	    
	    <p>The following tasks are registered with the Task Processor:</p>
        
        <web:taskAdminTaskInfos emptyDatasetMsg="<p>No tasks are registered.</p>" />
    </div>
  </body>
</html>