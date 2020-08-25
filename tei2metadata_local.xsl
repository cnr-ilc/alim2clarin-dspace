<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:t="http://www.tei-c.org/ns/1.0"
		exclude-result-prefixes="t">
  <xsl:param name="id"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" standalone="no" indent="yes"/> 
  <xsl:template match="/">
    <dublin_core schema="local">
      <dcvalue element="hidden" qualifier="none" language="en_US">false</dcvalue>
      <dcvalue element="hasMetadata" qualifier="none" language="en_US">false</dcvalue>
      <dcvalue element="has" qualifier="files" language="*">no</dcvalue>
      <dcvalue element="branding" qualifier="none">ALIM</dcvalue>
      <dcvalue element="demo" qualifier="uri" language="en_US"><xsl:text disable-output-escaping="yes"><![CDATA[http:&#x2F;&#x2F;it.alim.unisi.it&#x2F;dl&#x2F;resource&#x2F;]]></xsl:text><xsl:value-of select="number($id)"/></dcvalue>
      <dcvalue element="contact" qualifier="person">Edoardo@@D’Angelo@@progettoalim@protonmail.com@@ALIM&#x20;Archivio&#x20;della&#x20;Latinità&#x20;Italiana&#x20;del&#x20;Medioevo</dcvalue>
      <xsl:for-each select="//t:fileDesc/t:extent/t:measure">
      <dcvalue element="size" qualifier="info"><xsl:value-of select="@quantity"/>@@<xsl:value-of select="@unit"/></dcvalue>
      </xsl:for-each>
      <dcvalue element="files" qualifier="size" language="*">0</dcvalue>
      <dcvalue element="files" qualifier="count" language="*">0</dcvalue>
    </dublin_core>
  </xsl:template>

</xsl:stylesheet>
