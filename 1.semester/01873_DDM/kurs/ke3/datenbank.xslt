<?xml version="1.0" encoding="iso-8859-1"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/> 
  <xsl:template match="/resources/buecher"> 
    <html> 
      <head> 
        <title><xsl:value-of select="local-name(/*)"/></title> 
      </head> 
      <body> 
        <h1><xsl:value-of select="local-name(/*)"/></h1> 
        <ul> 
          <xsl:for-each select="buch"> 
            <li> 
              <xsl:value-of select="title"/> / <xsl:value-of select="autor"/> / <xsl:value-of select="verlag"/> 
              <br/>
              <xsl:text>ISBN:</xsl:text>
              <xsl:value-of select="@isbn"></xsl:value-of> 
            </li> 
          </xsl:for-each> 
        </ul> 
      </body> 
    </html> 
  </xsl:template> 
</xsl:stylesheet>