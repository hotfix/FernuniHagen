<?xml version = "1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
    <xsl:template match="bestellung">
        <html>
            <head>
                <title>
                    <xsl:text>Bestellnummer: </xsl:text>
                    <xsl:value-of select="./@bestellnummer"/>
                </title>
            </head>
            <body>
                <p>
                    <xsl:text>Kunde </xsl:text>
                    <xsl:value-of select="kunde"/>
                    <xsl:text>hat folgenden Altikel bestellt: </xsl:text>
                </p>
                <ul>
                    <xsl:for-each select="ware">
                        <li> <xsl:value-of select="beschreibung"/></li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>