<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd " >
<html>
<head>
   <web:javascript type="domain" />
   <script>
		var mstr = parent.mstr;
		<web:taskContent key="layouts" />
		self.mstrResponse = {'data': <web:taskContent />};
		self.mstrResponse.statusCode = 200;
		mstr.http.Governor.onFrameProcLoad(self);
	</script>
</head>
<body> 

</body>
</html>