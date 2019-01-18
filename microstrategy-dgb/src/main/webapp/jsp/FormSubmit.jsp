<html>
<body>
<!-- This page simply displays a form with a fake URL that is automatically submitted. 
It is used by the Visualizations Editor Plugin, which will listed for the URL and redirect to another page-->
<form id="fakeForm" action="fakeURL=true" method="get"></form>
<script language="javascript">
	document.getElementById("fakeForm").submit();
</script>
</body>
</html>