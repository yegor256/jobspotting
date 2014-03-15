<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml" version="2.0">
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
    <xsl:apply-templates select="page"/>
  </xsl:template>
  <xsl:template match="page">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="description" content="circles"/>
        <meta name="keywords" content="twitter circles"/>
        <meta name="author" content="curiost.com"/>
        <link rel="icon" type="image/gif" href="http://img.curiost.com/favicon.gif"/>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <xsl:apply-template select="." mode="head"/>
      </head>
      <body>
        <div class="container-fluid" style="margin-top: 1em;">
          <a href="/">
            <img src="http://img.curiost.com/logo.png" style="width:60px; height:60px;"/>
          </a>
          <xsl:apply-templates select="." mode="body"/>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
