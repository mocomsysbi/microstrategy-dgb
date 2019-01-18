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
        The current configuration of this processor is, as follows:
        </p>
        
        <web:taskAdminInitParams emptyDatasetMsg="<p>No initialization parameters were found.</p>" />
    </div>
  </body>
</html>