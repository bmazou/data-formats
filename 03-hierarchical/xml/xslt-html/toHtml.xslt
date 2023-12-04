<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt; 
        </xsl:text>    
        <html lang="cs">
            <head>
                <title>
                    List nemocnic
                </title>
            </head>
            <body>
                <h1>Nemocnice</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="hospitals" match="Hospital" >
        <h2><xsl:value-of select="name/text()"/></h2>
        <dl>
            <dt>Adresa:</dt>
            <dd><xsl:value-of select="address/text()"/></dd>
            <xsl:if test="count(rooms/Room) > 0">
            <dt> Místnosti: </dt>
            <dd>
                <xsl:for-each select="rooms/Room">
                <xsl:value-of select="number/text()"/>, <xsl:value-of select="floor/text()"/>. patro <br/>
                - Doktor:
                <xsl:choose>
                    <xsl:when test="count(doctor) != 0">

                        <xsl:value-of select="doctor/firstName/text()"/><xsl:text> </xsl:text><xsl:value-of select="doctor/lastName/text()"/>
                        <xsl:if test="count(doctor/degrees/degree) > 0">
                        <xsl:text> </xsl:text>
                        <xsl:for-each select="doctor/degrees/degree"> 
                            <xsl:value-of select="text()"/><xsl:if test="position() != last()">, </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        
                    </xsl:when>
                    <xsl:otherwise> 
                    bez doktora 
                    </xsl:otherwise>
                </xsl:choose>
                <br/>
                </xsl:for-each>
            </dd>
            </xsl:if>
        </dl> 
    </xsl:template>

</xsl:stylesheet>