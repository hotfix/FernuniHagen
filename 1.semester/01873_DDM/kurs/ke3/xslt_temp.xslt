<?xml version = "1.0"?> 
<xsl:transform version = "1.0" xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"> 
  <xsl:template match = "buch"> 
    <xsl:apply-templates select = "titel" /> 
    <xsl:apply-templates select = "Inhalt" /> 
  </xsl:template> 
  <xsl:template match = "Inhalt"> 
    <xsl:apply-templates select = "Kapitel" /> 
  </xsl:template> 
  <xsl:template match = "Kapitel"> 
    <xsl:apply-templates select = "Unterkapitel" /> 
  </xsl:template> 
  
</xsl:transform>