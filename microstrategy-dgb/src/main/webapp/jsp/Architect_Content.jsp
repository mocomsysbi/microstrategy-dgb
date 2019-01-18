<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%@ page import="com.microstrategy.web.app.beans.PageComponent" %>

<span id="pagePlaceholder"></span>  

<script type="text/javascript">
  // Create and start the app.
  mstrApp = new mstrmojo.architect.ArchitectApp(mstrmojo.hash.copy(mstrApp));
  mstrApp.start();
</script>