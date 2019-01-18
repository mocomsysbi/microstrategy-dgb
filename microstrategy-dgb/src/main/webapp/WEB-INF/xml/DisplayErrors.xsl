<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- Copyright 1996-2001 MicroStrategy Incorporated, All rights reserved. Confidential. -->

	<xsl:template match="customization">
		<!-- headers -->
		<xsl:element name="TR">
			<xsl:element name="TD">
				<xsl:attribute name="NOWRAP">1</xsl:attribute>
				<xsl:attribute name="CLASS">mstrAdminPropertiesHeader</xsl:attribute>
				<xsl:value-of select="timestamp" />
				<xsl:element name="A">
					<xsl:attribute name="HREF"><xsl:value-of select="eventTime"/></xsl:attribute>
					<xsl:element name="IMG">
                        <xsl:attribute name="src"><xsl:value-of select="img"/></xsl:attribute>
                        <xsl:attribute name="class"><xsl:value-of select="imgTime"/></xsl:attribute>
                        <xsl:attribute name="TITLE"><xsl:value-of select="tooltipTime"/></xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="TD">
				<xsl:attribute name="NOWRAP">1</xsl:attribute>
				<xsl:attribute name="CLASS">mstrAdminPropertiesHeader</xsl:attribute>
				<xsl:value-of select="userName" />
				<xsl:element name="A">
					<xsl:attribute name="HREF"><xsl:value-of select="eventUserName"/></xsl:attribute>
					<xsl:element name="IMG">
                        <xsl:attribute name="src"><xsl:value-of select="img"/></xsl:attribute>
                        <xsl:attribute name="class"><xsl:value-of select="imgUserName"/></xsl:attribute>
                        <xsl:attribute name="TITLE"><xsl:value-of select="tooltipUserName"/></xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="TD">
				<xsl:attribute name="NOWRAP">1</xsl:attribute>
				<xsl:attribute name="CLASS">mstrAdminPropertiesHeader</xsl:attribute>
				<xsl:value-of select="ip" />
				<xsl:element name="A">
					<xsl:attribute name="HREF"><xsl:value-of select="eventUserIP"/></xsl:attribute>
					<xsl:element name="IMG">
                        <xsl:attribute name="src"><xsl:value-of select="img"/></xsl:attribute>
                        <xsl:attribute name="class"><xsl:value-of select="imgUserIP"/></xsl:attribute>
                        <xsl:attribute name="TITLE"><xsl:value-of select="tooltipUserIP"/></xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="TD">
				<xsl:attribute name="NOWRAP">1</xsl:attribute>
				<xsl:attribute name="CLASS">mstrAdminPropertiesHeader</xsl:attribute>
				<xsl:value-of select="level" />
				<xsl:element name="A">
					<xsl:attribute name="HREF"><xsl:value-of select="eventLevel"/></xsl:attribute>
					<xsl:element name="IMG">
                        <xsl:attribute name="src"><xsl:value-of select="img"/></xsl:attribute>
                        <xsl:attribute name="class"><xsl:value-of select="imgLevel"/></xsl:attribute>
                        <xsl:attribute name="TITLE"><xsl:value-of select="tooltipLevel"/></xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="TD">
				<xsl:attribute name="NOWRAP">1</xsl:attribute>
				<xsl:attribute name="CLASS">mstrAdminPropertiesHeader</xsl:attribute>
				<xsl:value-of select="class" />
			</xsl:element>
			<xsl:element name="TD">
				<xsl:attribute name="NOWRAP">1</xsl:attribute>
				<xsl:attribute name="CLASS">mstrAdminPropertiesHeader</xsl:attribute>
				<xsl:value-of select="method" />
			</xsl:element>
			<xsl:element name="TD">
				<xsl:attribute name="NOWRAP">1</xsl:attribute>
				<xsl:attribute name="CLASS">mstrAdminPropertiesHeader</xsl:attribute>
				<xsl:value-of select="message" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="/">

		<TABLE CELLSPACING="0" CELLPADDING="2" WIDTH="100%" class="mstrAdminPropertiesLog">
		<!-- headers -->
		<xsl:apply-templates select="ERRORS/customization" />
		<!-- contents -->
		<xsl:for-each select="ERRORS/record">
			<TR>
			<xsl:element name="TD">
				<xsl:apply-templates select="timestamp"	/>&#160;
			</xsl:element>
			<xsl:element name="TD">
				<xsl:apply-templates select="userName" />&#160;
			</xsl:element>
			<xsl:element name="TD">
				<xsl:apply-templates select="clientID" />&#160;
			</xsl:element>
			<xsl:element name="TD">
				<xsl:apply-templates select="level"	/>&#160;
			</xsl:element>
			<xsl:element name="TD">
				<xsl:apply-templates select="class"	/>&#160;
			</xsl:element>
			<xsl:element name="TD">
				<xsl:apply-templates select="method" />&#160;
			</xsl:element>
			<xsl:element name="TD">
				<xsl:apply-templates select="message" />&#160;
			</xsl:element>
			</TR>
		</xsl:for-each>
		</TABLE>
	</xsl:template>
	<xsl:template match="timestamp">
		<xsl:value-of select="." />
	</xsl:template>
	<xsl:template match="userName">
		<xsl:value-of select="." />
	</xsl:template>
	<xsl:template match="clientID">
		<xsl:value-of select="." />
	</xsl:template>
	<xsl:template match="level">
		<xsl:value-of select="." />
	</xsl:template>
	<xsl:template match="message">
		<xsl:value-of select="." />
	</xsl:template>
	<xsl:template match="class">
		<xsl:value-of select="." />
	</xsl:template>
	<xsl:template match="method">
		<xsl:value-of select="." />
	</xsl:template>
</xsl:stylesheet>
