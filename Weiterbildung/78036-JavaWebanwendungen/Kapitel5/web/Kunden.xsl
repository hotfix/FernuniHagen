<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html><head></head><body>
      <xsl:apply-templates />
    </body></html>
  </xsl:template>
  <xsl:template match="Kunde">
    <hr />
    <xsl:apply-templates />
  </xsl:template>
</xsl:stylesheet>
