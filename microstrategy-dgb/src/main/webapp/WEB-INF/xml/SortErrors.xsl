<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- Copyright 1996-2001 MicroStrategy Incorporated, All rights reserved. Confidential. -->
	<xsl:template match="record">
		<xsl:copy>
			<xsl:apply-templates select="@* | * | text()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="level">
		<xsl:copy>
			<xsl:apply-templates select="@* | * | text()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="timestamp">
		<xsl:copy>
			<xsl:apply-templates select="@* | * | text()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="class">
		<xsl:copy>
			<xsl:apply-templates select="@* | * | text()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="method">
		<xsl:copy>
			<xsl:apply-templates select="@* | * | text()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="message">
		<xsl:copy>
			<xsl:apply-templates select="@* | * | text()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="package">
		<xsl:copy>
			<xsl:apply-templates select="@* | * | text()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="thread">
		<xsl:copy>
			<xsl:apply-templates select="@* | * | text()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="userName">
		<xsl:copy>
			<xsl:apply-templates select="@* | * | text()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="clientID">
		<xsl:copy>
			<xsl:apply-templates select="@* | * | text()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="/">
		<ERRORS>
			<xsl:choose>
				<xsl:when test="/ERRORS/options[./sort = '0' or ./sort = '1']">
					<xsl:choose>
						<xsl:when test="/ERRORS/options[./Error = 'on' and ./Warning = 'on' and ./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '1']">
									<xsl:for-each select="ERRORS/record">
										<xsl:sort select="miliseconds" order="ascending" data-type="number" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record">
										<xsl:sort select="miliseconds" order="descending" data-type="number" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Error = 'on' and ./Warning = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '1']">
									<xsl:for-each select="ERRORS/record[./level = 'WARNING' or ./level = 'SEVERE']">
										<xsl:sort select="miliseconds" order="ascending" data-type="number" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'WARNING' or ./level = 'SEVERE']">
										<xsl:sort select="miliseconds" order="descending" data-type="number" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Error = 'on' and ./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '1']">
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE' or ./level = 'INFO']">
										<xsl:sort select="miliseconds" order="ascending" data-type="number" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE' or ./level = 'INFO']">
										<xsl:sort select="miliseconds" order="descending" data-type="number" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Warning = 'on' and ./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '1']">
									<xsl:for-each select="ERRORS/record[./level = 'WARNING' or ./level = 'INFO']">
										<xsl:sort select="miliseconds" order="ascending" data-type="number" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'WARNING' or ./level = 'INFO']">
										<xsl:sort select="miliseconds" order="descending" data-type="number" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Error = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '1']">
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE']">
										<xsl:sort select="miliseconds" order="ascending" data-type="number" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE']">
										<xsl:sort select="miliseconds" order="descending" data-type="number" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Warning = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '1']">
									<xsl:for-each select="ERRORS/record[./level = 'WARNING']">
										<xsl:sort select="miliseconds" order="ascending" data-type="number" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'WARNING']">
										<xsl:sort select="miliseconds" order="descending" data-type="number" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '1']">
									<xsl:for-each select="ERRORS/record[./level = 'INFO']">
										<xsl:sort select="miliseconds" order="ascending" data-type="number" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'INFO']">
										<xsl:sort select="miliseconds" order="descending" data-type="number" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="/ERRORS/options[./sort = '2' or ./sort = '4']">
					<xsl:choose>
						<xsl:when test="/ERRORS/options[./Error = 'on' and ./Warning = 'on' and ./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '2']">
									<xsl:for-each select="ERRORS/record">
										<xsl:sort select="level" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record">
										<xsl:sort select="level" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Error = 'on' and ./Warning = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '2']">
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE' or ./level = 'WARNING']">
										<xsl:sort select="level" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE' or ./level = 'WARNING']">
										<xsl:sort select="level" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Error = 'on' and ./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '2']">
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE' or ./level = 'INFO']">
										<xsl:sort select="level" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE' or ./level = 'INFO']">
										<xsl:sort select="level" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Warning = 'on' and ./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '2']">
									<xsl:for-each select="ERRORS/record[./level = 'INFO' or ./level = 'WARNING']">
										<xsl:sort select="level" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'INFO' or ./level = 'WARNING']">
										<xsl:sort select="level" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Error = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '2']">
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE']">
										<xsl:sort select="level" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE']">
										<xsl:sort select="level" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Warning = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '2']">
									<xsl:for-each select="ERRORS/record[./level = 'WARNING']">
										<xsl:sort select="level" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'WARNING']">
										<xsl:sort select="level" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '2']">
									<xsl:for-each select="ERRORS/record[./level = 'INFO']">
										<xsl:sort select="level" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'INFO']">
										<xsl:sort select="level" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="/ERRORS/options[./sort = '8' or ./sort = '16']">
					<xsl:choose>
						<xsl:when test="/ERRORS/options[./Error = 'on' and ./Warning = 'on' and ./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '8']">
									<xsl:for-each select="ERRORS/record">
										<xsl:sort select="userName" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record">
										<xsl:sort select="userName" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Error = 'on' and ./Warning = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '8']">
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE' or ./level = 'WARNING']">
										<xsl:sort select="userName" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE' or ./level = 'WARNING']">
										<xsl:sort select="userName" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Error = 'on' and ./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '8']">
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE' or ./level = 'INFO']">
										<xsl:sort select="userName" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE' or ./level = 'INFO']">
										<xsl:sort select="userName" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Warning = 'on' and ./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '8']">
									<xsl:for-each select="ERRORS/record[./level = 'INFO' or ./level = 'WARNING']">
										<xsl:sort select="userName" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'INFO' or ./level = 'WARNING']">
										<xsl:sort select="userName" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Error = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '8']">
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE']">
										<xsl:sort select="userName" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE']">
										<xsl:sort select="userName" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Warning = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '8']">
									<xsl:for-each select="ERRORS/record[./level = 'WARNING']">
										<xsl:sort select="userName" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'WARNING']">
										<xsl:sort select="userName" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '8']">
									<xsl:for-each select="ERRORS/record[./level = 'INFO']">
										<xsl:sort select="userName" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'INFO']">
										<xsl:sort select="userName" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="/ERRORS/options[./sort = '32' or ./sort = '64']">
					<xsl:choose>
						<xsl:when test="/ERRORS/options[./Error = 'on' and ./Warning = 'on' and ./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '32']">
									<xsl:for-each select="ERRORS/record">
										<xsl:sort select="clientID" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record">
										<xsl:sort select="clientID" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Error = 'on' and ./Warning = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '16']">
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE' or ./level = 'WARNING']">
										<xsl:sort select="clientID" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE' or ./level = 'WARNING']">
										<xsl:sort select="clientID" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Error = 'on' and ./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '16']">
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE' or ./level = 'INFO']">
										<xsl:sort select="clientID" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE' or ./level = 'INFO']">
										<xsl:sort select="clientID" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Warning = 'on' and ./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '16']">
									<xsl:for-each select="ERRORS/record[./level = 'INFO' or ./level = 'WARNING']">
										<xsl:sort select="clientID" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'INFO' or ./level = 'WARNING']">
										<xsl:sort select="clientID" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Error = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '16']">
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE']">
										<xsl:sort select="clientID" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'SEVERE']">
										<xsl:sort select="clientID" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Warning = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '16']">
									<xsl:for-each select="ERRORS/record[./level = 'WARNING']">
										<xsl:sort select="clientID" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'WARNING']">
										<xsl:sort select="clientID" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="/ERRORS/options[./Message = 'on']">
							<xsl:choose>
								<xsl:when test="/ERRORS/options[./sort = '16']">
									<xsl:for-each select="ERRORS/record[./level = 'INFO']">
										<xsl:sort select="clientID" order="descending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="ERRORS/record[./level = 'INFO']">
										<xsl:sort select="clientID" order="ascending" />
											<xsl:apply-templates select="." />
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</ERRORS>
	</xsl:template>
</xsl:stylesheet>
