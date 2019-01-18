<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<html>
  <body>
	<div class="mstrPanelPortrait">
	<div class="mstrPanelTitleBar">Run Time Diagnostics</div>
	<div class="mstrPanelBody">
	
	<TABLE CELLSPACING="0" CELLPADDING="0"  CLASS="mstrAdminProperties"  >
		<TR>
			<TD WIDTH="100%"  CLASS="mstrAdminPropertiesValue"  >
				<table cellpadding="0" border="0" cellspacing="0">
					<tr>
						<td valign="top">
							<p>
								This page displays the run-time diagnostics of MicroStrategy Web.  This allows Admin users to get information about the run-time enviornment settings like MicroStrategy Settings, JVM Memory and System Properties.
							</p>
							<web:runTimeDiagnostics/>
						</td>
					</tr>
				</table>
			</TD>
		</TR>
	</TABLE>
	</div>
	</div>
  </body>
</html>
