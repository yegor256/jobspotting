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
    <form action="" method="post">
      <fieldset>
        <div class="form-group">
          <label for="sources" class="hidden-xs hidden-sm">
            <xsl:text>Sources</xsl:text>
          </label>
          <textarea name="sources" id="sources" rows="8" class="form-control">
            <xsl:value-of select="sources"/>
          </textarea>
        </div>
        <div class="form-group">
          <label><xsl:comment>for the submit button below</xsl:comment></label>
          <button type="submit" class="btn btn-primary">
            <xsl:text>Save</xsl:text>
          </button>
        </div>
      </fieldset>
    </form>
    <xsl:apply-templates select="offices/office" />
  </xsl:template>
  <xsl:template match="offices/office">
    <p>
      <xsl:value-of select="name"/>
      <xsl:text>: </xsl:text>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="link[@rel='see']/@href"/>
        </xsl:attribute>
        <xsl:value-of select="jobs"/>
      </a>
    </p>
  </xsl:template>
</xsl:stylesheet>
