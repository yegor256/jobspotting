<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml" version="2.0">
  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:include href="/xsl/layout.xsl"/>
  <xsl:template match="page" mode="head">
    <title><xsl:value-of select="name"/></title>
  </xsl:template>
  <xsl:template match="page" mode="body">
    <h1>
      <xsl:value-of select="name"/>
    </h1>
    <xsl:apply-templates select="jobs/job" />
  </xsl:template>
  <xsl:template match="jobs/job">
    <p>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="uri"/>
        </xsl:attribute>
        <xsl:value-of select="title"/>
      </a>
    </p>
  </xsl:template>
</xsl:stylesheet>
