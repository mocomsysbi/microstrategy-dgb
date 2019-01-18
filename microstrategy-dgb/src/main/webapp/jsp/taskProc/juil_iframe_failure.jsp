<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd " >
<html>
<head>
	<web:javascript type="domain" />
	<script>
		self.mstrResponse = { 
				'errorMessage':  '<web:taskErrorMessage encode="json" />',
				'statusCode':    <web:taskStatusCode />,
				<web:taskErrorCode propName="taskErrorCode" />
		};
		
		if(parent && parent.mstr && parent.mstr.http && parent.mstr.http.Governor){
			parent.mstr.http.Governor.onFrameProcLoad(self);
		}
	</script>
</head>
</body>
</html>
