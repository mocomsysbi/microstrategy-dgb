<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<html>
<style type="text/css">
.purged {
    color:#ff0000;
}
table.mstrAdminProperties > tbody > tr > td {
    border-bottom: 1px solid #ccc;
}
table.mstrAdminProperties > tbody > tr > td:first-child {
    vertical-align: top;
}
.purgeCachesPageCaches {
    padding: 5px;
    width: 600px;
}
.purgeCachesPageCachesTable {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
}
.purgeCachesPageCachesTable th {
    border-bottom: 2px solid #ccc;
    padding: 5px;
    text-align: left;
}
.purgeCachesPageCachesTable th:first-child {
    width: 10%
}
.purgeCachesPageCachesTable th:first-child + th {
    width: 70%
}
.purgeCachesPageCachesTable td {
    border-top: 1px solid #ccc;
    padding: 5px;
}
.purgeCachesPageCachesTable > tbody > tr:hover > td {
    background-color: #f5f5f5;
}
</style>
<script language="JavaScript">
function toggle(source) {
    checkboxes = document.getElementsByName('cache');
    for (var i = 0, len = checkboxes.length; i < len; i++) {
        checkboxes[i].checked = source.checked;
    }
}
</script>
<body>

<form method="POST">
    <div class="mstrPanelPortrait">
        <div class="mstrPanelTitleBar"><span class="mstrPanelTitle">Purge Caches</span></div>
        <div class="mstrPanelBody">
            <table cellpadding="0" cellspacing="0" class="mstrAdminProperties">
                <tr>
                    <td colspan="2">
                        <p>This page allows Admin users to purge system level caches immediately rather than waiting for the cache timeouts.</p>
                        <p>If Java ResourceBundle Cache checkbox is selected, Java's internal ResourceBundle cache will be purged.
                           This will force the property files in the classpath to be reread.</p> 
                        <p>All the system level caches in the MicroStrategy Web application are listed on Web Caches. 
                           If checkbox in the list is selected, the selected cache will be purged. This will force the cache to be recreated to pickup
                           new changes from the MicroStrategy Servers (Intelligence Server, Narrowcast Server or Web Server) instead of waiting for the caches to timeout.
                           Web Caches list does not include session (user) level caches, since logging out and in again would refresh these caches.</p>  
                        <p><input type="submit" class="mstrSubmitButton" name="submit" value="Purge"/></p>
                    </td>
                </tr>
                <web:purgeCaches/>
          </table>
        </div>
    </div>
</form>
</body>
</html>