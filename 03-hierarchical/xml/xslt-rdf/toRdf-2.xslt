<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
<xsl:output method="text" encoding="UTF-8" />
<xsl:template match="Hospitals">
@prefix foaf: &lt;https://xmls.com/foaf/0.1/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix ex: &lt;http://example.org/vocabulary/&gt; .
@prefix ex2: &lt;https://example.org/resource/&gt; .
<xsl:apply-templates/>

</xsl:template>
<xsl:template match="Hospital">
    <xsl:variable name="hospitalNumber" select="position() div 2"/>
    <xsl:variable name="hospitalIRI" select="concat('ex2:hos', $hospitalNumber)"/>
&lt;<xsl:value-of select="$hospitalIRI"/>&gt; a ex:Hospital ;
    ex:name &quot;<xsl:value-of select="name/text()"/>&quot;@<xsl:value-of select="name/@xml:lang"/> ; 
    ex:address &quot;<xsl:value-of select="address/text()"/>&quot;@<xsl:value-of select="address/@xml:lang"/> .
    <xsl:for-each select="rooms/Room">
        <xsl:variable name="roomIRI" select="concat('ex2:room', (($hospitalNumber - 1) * 2) + position())"/>
&lt;<xsl:value-of select="$roomIRI"/>&gt; a ex:Room ;
    ex:number <xsl:value-of select="number"/> ;
    ex:floor <xsl:value-of select="floor"/> . 

<xsl:if test="count(doctor) != 0">
        <xsl:variable name="doctorName" select="lower-case(doctor/firstName/text())"/>
        <xsl:variable name="doctorIRI" select="concat('ex2:', $doctorName)"/>
&lt;<xsl:value-of select="$doctorIRI"/>&gt; a ex:Doctor ;
    foaf:firstName &quot;<xsl:value-of select="doctor/firstName/text()"/>&quot;@<xsl:value-of select="doctor/firstName/@xml:lang"/> ;
    foaf:familyName &quot;<xsl:value-of select="doctor/lastName/text()"/>&quot;@<xsl:value-of select="doctor/lastName/@xml:lang"/> ;
    ex:degree<xsl:for-each select="doctor/degrees/degree"><xsl:choose><xsl:when test="position() != last()"> &quot;<xsl:value-of select="text()"/>&quot;@<xsl:value-of select="@xml:lang"/>,</xsl:when><xsl:otherwise> &quot;<xsl:value-of select="text()"/>&quot;@<xsl:value-of select="@xml:lang"/> . </xsl:otherwise></xsl:choose></xsl:for-each>
    <xsl:text>
    &#xa;</xsl:text>

<xsl:value-of select="$doctorIRI"/> ex:residence <xsl:value-of select="$roomIRI"/> .
</xsl:if>
<xsl:value-of select="$roomIRI"/> ex:location <xsl:value-of select="$hospitalIRI"/> .
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
