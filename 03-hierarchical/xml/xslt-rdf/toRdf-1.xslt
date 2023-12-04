<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
<xsl:output method="text" encoding="UTF-8" />
<xsl:template match="Patients">
@prefix foaf: &lt;https://xmls.com/foaf/0.1/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix ex: &lt;http://example.org/vocabulary/&gt; .
@prefix ex2: &lt;https://example.org/resource/&gt; .
<xsl:apply-templates/>
</xsl:template>
<xsl:template match="Patient">
    <xsl:variable name="patientName" select="lower-case(firstName/text())"/>
    <xsl:variable name="patientIRI" select="concat('ex2:', $patientName)"/>
&lt;<xsl:value-of select="$patientIRI"/>&gt; a ex:Patient;
    foaf:firstName &quot;<xsl:value-of select="firstName/text()"/>&quot;@<xsl:value-of select="firstName/@xml:lang"/> ;
    foaf:familyName &quot;<xsl:value-of select="lastName/text()"/>&quot;@<xsl:value-of select="lastName/@xml:lang"/> ;
    ex:nationalIdNumber <xsl:value-of select="nationalIdNumber/text()"/> .
    <xsl:for-each select="appointments/Appointment">
        <xsl:variable name="AppointmentIRI" select="concat('ex2:app', nof)"/>
&lt;<xsl:value-of select="$AppointmentIRI"/>&gt; a ex:Appointment;
    ex:Reason &quot;<xsl:value-of select="reason/text()"/>&quot;@<xsl:value-of select="reason/@xml:lang"/> ;
    xsd:dateTime &quot;<xsl:value-of select="time"/>&quot;^^xsd:dateTime .
        <xsl:variable name="doctorName" select="lower-case(doctor/firstName/text())"/>
        <xsl:variable name="doctorIRI" select="concat('ex2:', $doctorName)"/>
&lt;<xsl:value-of select="$doctorIRI"/>&gt; a ex:Doctor;
    foaf:firstName &quot;<xsl:value-of select="doctor/firstName/text()"/>&quot;@<xsl:value-of select="doctor/firstName/@xml:lang"/> ;
    foaf:familyName &quot;<xsl:value-of select="doctor/lastName/text()"/>&quot;@<xsl:value-of select="doctor/lastName/@xml:lang"/> ;
    ex:degree<xsl:for-each select="doctor/degrees/degree"><xsl:choose><xsl:when test="position() != last()"> &quot;<xsl:value-of select="text()"/>&quot;@<xsl:value-of select="@xml:lang"/>,</xsl:when><xsl:otherwise> &quot;<xsl:value-of select="text()"/>&quot;@<xsl:value-of select="@xml:lang"/> . </xsl:otherwise></xsl:choose></xsl:for-each>
    <xsl:text>
    &#xa;</xsl:text>
<xsl:value-of select="$AppointmentIRI"/> ex:patient <xsl:value-of select="$patientIRI"/> ;
    ex:doctor <xsl:value-of select="$doctorIRI"/> .
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
