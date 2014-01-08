<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all" version="2.0">

	<xsl:template match="/tei:TEI">
		<xsl:param name="doc"/>
		<xsl:param name="facsimile"/>
		<xsl:text>[</xsl:text>
		<xsl:for-each select="descendant::tei:facsimile[@xml:id=$facsimile]/tei:surface">
			<xsl:variable name="id" select="parent::tei:facsimile/@xml:id"/>
			<xsl:text>{"src":"map://openlayers/something","text":"test","shapes":[{"type":"rect","geometry":{"x":</xsl:text>
			<xsl:value-of select="number(@ulx)"/>
			<xsl:text>,"width":</xsl:text>
			<xsl:value-of select="number(@lrx) -  number(@ulx)"/>
			<xsl:text>,"y":</xsl:text>
			<xsl:value-of select="number(@uly)"/>
			<xsl:text>,"height":</xsl:text>
			<xsl:value-of select="number(@uly) -  number(@lry)"/>
			<xsl:text>}}],"context":"</xsl:text>
			<xsl:value-of select="concat(doc('input:request')/request/request-uri, '?doc=', $doc, '&amp;id=', $id)"/>
			<xsl:text>"}</xsl:text>
			<xsl:if test="not(position()=last())">
				<xsl:text>,</xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>]</xsl:text>
	</xsl:template>
</xsl:stylesheet>
