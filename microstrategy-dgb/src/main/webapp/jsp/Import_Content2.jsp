<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%@ page import="com.microstrategy.web.app.beans.PageComponent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd " >

<div id="pagePlaceholder" ></div>

<script type="text/javascript">
  // TODO: We need to remove this dependency from the code.
  mstrmojo.App = mstrConfig;

  // Create and start the app.
  mstrApp = new mstrmojo.DI.DIApp(mstrmojo.hash.copy(mstrApp));
  mstrApp.start();

</script>
