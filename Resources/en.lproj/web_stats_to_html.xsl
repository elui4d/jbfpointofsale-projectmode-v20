<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Server Statistics</title>
        <style>
          body {
          margin: 0px;
          padding: 0px;
          font: 90% "Lucida Grande", Lucida, Verdana, sans-serif;
          }
          div#header {
          background-color: #2c4b79;
          padding: 15px 15px 15px 20px;
          margin: 0px;
          }
          div#content{
          padding: 20px;
          }
          h2 {
          color: #fff;
          font-size: 1.3em;
          margin: 0;
          padding: 0;
          }
          p {
          padding: 0px;
          margin: 0px;
          }
          table {
          border: 1px solid #d2d2d2;
          border-spacing: 0px;
          border-collapse: collapse;
          border-bottom-color: #d2d2d2;
          width: 800px;
          background-color: #f7f7f7;
          }
          table th {
          text-align: center;
          background-color: #2c4b79;
          color: #f7f7f7;
          border-right : 1px solid #d2d2d2;
          border-bottom: 1px solid #d2d2d2;
          padding: 2px 10px 3px;
          font-style: normal;
          font-weight: normal;
          font-size: 0.9em;
          }
          table td {
          padding-right: 10px;
          padding-left: 10px;
          border-right: 1px solid #d2d2d2;
          }
        </style>
      </head>
      <body>
        <div id="header"><h2>Server Statistics</h2></div>
        <div id="content">
          <table>
            <xsl:for-each select="cacheManagerStatistics">
              <tr>
                <td>Cache Current Size</td>
                <td><xsl:variable name="currentSize" select="@currentSize"/><xsl:value-of select="$currentSize"/></td>
              </tr>
              <tr>
                <td>Cache Max Size</td>
                <td><xsl:variable name="maxSize" select="@maxSize"/><xsl:value-of select="$maxSize"/></td>
              </tr>
              <tr>
                <td>Cached Object Max Size</td>
                <td><xsl:variable name="objectMaxSize" select="@objectMaxSize"/><xsl:value-of select="$objectMaxSize"/></td>
              </tr>
              <tr>
                <td>Cache Use</td>
                <td><xsl:variable name="cacheUsage" select="@cacheUsage"/><xsl:value-of select="$cacheUsage"/> %</td>
              </tr>
              <tr>
                <td>Cached Objects</td>
                <td><xsl:variable name="nbCachedObjects" select="@nbCachedObjects"/><xsl:value-of select="$nbCachedObjects"/></td>
              </tr>
              <xsl:if test="cacheManagerStatistics/nbFilteredCachedObjects &gt; 0">
              <tr>
                <td>Filtered Objects</td>
                <td><xsl:variable name="nbFilteredCachedObjects" select="@nbFilteredCachedObjects"/><xsl:value-of select="$nbFilteredCachedObjects"/></td>
              </tr>
              </xsl:if>
            </xsl:for-each>
          </table>
          <br />
          <xsl:if test="count(cacheManagerStatistics/cachedObjects) &gt; 0">
            <table>
              <tr>
                <th align="left">URL</th>
                <th align="left">Loads</th>
                <th align="left">Size</th>
                <th align="left">Content-Type</th>
              </tr>
              <xsl:for-each select="cacheManagerStatistics/cachedObjects">
                <tr>
                  <td><xsl:variable name="url" select="@url"/><xsl:value-of select="$url"/></td>
                  <td><xsl:variable name="nbLoads" select="@nbLoads"/><xsl:value-of select="$nbLoads"/></td>
                  <td><xsl:variable name="dataSize" select="@dataSize"/><xsl:value-of select="$dataSize"/></td>
                  <td><xsl:variable name="mimeType" select="@mimeType"/><xsl:value-of select="$mimeType"/></td>
                </tr>
              </xsl:for-each>
            </table>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>