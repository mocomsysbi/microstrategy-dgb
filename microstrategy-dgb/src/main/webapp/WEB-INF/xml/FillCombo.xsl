<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method='html' indent='yes' omit-xml-declaration='yes' />
<!-- Copyright 1996-2001 MicroStrategy Incorporated, All rights reserved. Confidential. -->
<xsl:template match="/"> 
	<xsl:for-each select="/mi/list_elements/element/display" >
		<xsl:element name="OPTION">
			<xsl:if test="./@selected[. != '']">
				<xsl:attribute name="SELECTED" />
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="./@key" /></xsl:attribute>
			<xsl:if test="./@style[. != '']">
				<xsl:attribute name="STYLE"><xsl:value-of select="./@style" /></xsl:attribute>
			</xsl:if>				
                        <xsl:value-of select="./@desc" />
			<!-- FROM BOYD: <xsl:eval no-entities="1">this.getAttribute("desc")</xsl:eval>-->
		</xsl:element>
	</xsl:for-each> 
</xsl:template> 
</xsl:stylesheet>
