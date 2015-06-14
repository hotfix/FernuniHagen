<?xml version = "1.0" ?>
<xsl:transform version = "1.0" xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match = "buch">
        <html>
            <head>
                <title>KE4-Aufgabe 4.1 </title>
            </head>
            <body>
                <xsl:apply-templates select = "Inhalt" />
            </body>
        </html>
    </xsl:template>

    <xsl:template match = "Inhalt">
            <xsl:apply-templates select = "Kapitel" />

    </xsl:template>
    <xsl:template match = "Kapitel">
        <xsl:apply-templates select = "@Nummer" />
<br></br>
        <xsl:apply-templates select = "Unterkapitel" />

    </xsl:template>
    <xsl:template match = "Unterkapitel">
        <xsl:apply-templates select = "@Nummer" />
        <br></br>
    </xsl:template>
</xsl:transform>