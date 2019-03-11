<?xml version='1.0'?>

<!-- This file is part of the book                 -->
<!--                                               -->
<!--   Discrete Mathematics: an Open Introduction  -->
<!--                                               -->
<!-- Copyright (C) 2015-2018 Oscar Levin           -->
<!-- See the file COPYING for copying conditions.  -->

<!-- This will remove any elements marked as for instructors from an xml file -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    exclude-result-prefixes="xsl">

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
<!-- <xsl:strip-space elements="*"/> -->
<xsl:preserve-space elements="*" />

<!-- match and copy everything -->
<xsl:template match="node() | @*">
  <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
  </xsl:copy>
</xsl:template>

<!-- override copy of solutions with category instructor -->
<xsl:template match="exercise">
  <xsl:choose>
    <xsl:when test="webwork">
      <xsl:copy>
          <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
    </xsl:when>
    <xsl:otherwise>
      
      <exercise>
        <xsl:copy-of select="@*"/>
        <xsl:text>&#xa; &#9; &#9;</xsl:text>  
        <webwork>
          <xsl:apply-templates />
        </webwork>
        <xsl:text>&#xa; &#9;</xsl:text>  
      </exercise>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="exercise/statement">
  <statement>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates />
    <xsl:text>&#xa; &#9;</xsl:text>  
    <p><var form="essay" /></p>
    <xsl:text>&#xa; &#9;</xsl:text>  
  </statement>

</xsl:template>

</xsl:stylesheet>
