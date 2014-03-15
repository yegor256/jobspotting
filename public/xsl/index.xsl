<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml" version="2.0">
  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:include href="/xsl/layout.xsl"/>
  <xsl:template match="page" mode="head">
    <title>areas</title>
  </xsl:template>
  <xsl:template match="page" mode="body">
    <h1>
      <xsl:text>Job-spotting areas:</xsl:text>
    </h1>
    <div class="row" style="margin-bottom: 1em;">
      <div class="col-12 col-sm-6 col-lg-4">
        <form action="" method="post">
          <fieldset>
            <div class="input-group">
              <input name="name" type="text" class="form-control" placeholder="Unique name of an area"/>
              <span class="input-group-btn">
                <button type="submit" class="btn btn-primary">
                  <xsl:text>Create</xsl:text>
                </button>
              </span>
            </div>
          </fieldset>
        </form>
      </div>
    </div>
    <xsl:apply-templates select="areas/area" />
  </xsl:template>
  <xsl:template match="areas/area">
    <p>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="link[@rel='see']/@href"/>
        </xsl:attribute>
        <xsl:value-of select="name"/>
      </a>
      <xsl:text> (</xsl:text>
      <xsl:value-of select="total"/>
      <xsl:text>)</xsl:text>
    </p>
  </xsl:template>
</xsl:stylesheet>
