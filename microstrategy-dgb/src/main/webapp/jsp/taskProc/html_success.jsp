<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd " >
<html>
<head>
	<web:javascript type="domain" />
	<script language="Javascript">
		var mstrTaskResponse = new Object();
		mstrTaskResponse.statusCode = <web:taskStatusCode />;		
	</script>
</head>
<body>
<div id="content">
<web:taskContent />
</div>
</body>
</html>