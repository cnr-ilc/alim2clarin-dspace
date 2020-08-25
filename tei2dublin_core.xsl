<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:t="http://www.tei-c.org/ns/1.0"
		xmlns:lookup="lookup"
		exclude-result-prefixes="t lookup">
  <xsl:param name="id"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" standalone="no" indent="yes"/> 
<!-- lookup table START -->
<lookup:table>
<row key="MB" value="Marina Buzzoni"/>
<row key="GCA" value="Gian Carlo Alessio"/>
<row key="AC" value="Angela Caracciolo Aricò"/>
<row key="EDA" value="Edoardo D’Angelo"/>
<row key="GDM" value="Giorgio Di Maria"/>
<row key="LC" value="Loredana Cirrito"/>
<row key="PM" value="Paolo Monella"/>
<row key="CF" value="Chiara Frison"/>
<row key="DL" value="Domenico Losappio"/>
<row key="PP" value="Pietro Pellegatta"/>
<row key="PT" value="Paola Tornè"/>
<row key="MC" value="Martin Camargo"/>
<row key="CC" value="Chiara Casali"/>
<row key="OK" value="Omar Khalaf"/>
<row key="RA" value="Roberta Assanti"/>
<row key="TDA" value="Teofilo De Angelis"/>
<row key="ML" value="Massimiliano Lanzillo"/>
<row key="LS" value="Lucilla Spetia"/>
<row key="AV" value="Amedeo Visconti"/>
<row key="GP" value="Giuseppe Pipitone"/>
<row key="MR" value="Marta Romano"/>
<row key="RRDT" value="Roberto Rosselli Del Turco"/>
<row key="SR" value="Salvo Russo"/>
<row key="FS" value="Francesco Stella"/>
<row key="EB" value="Elisabetta Bartoli"/>
<row key="EBr" value="Elisa Brunoni"/>
<row key="FV" value="Francesca Vaccaro"/>
<row key="ADP" value="Antonio De Prisco"/>
<row key="VA" value="Vittorio Ambrosini"/>
<row key="EF" value="Edoardo Ferrarini"/>
<row key="SM" value="Stefano Minozzi"/>
<row key="ES" value="Eugenio Stàltari"/>
<row key="SZ" value="Sara Zuppani"/>
<row key="FDD" value="Fulvio Delle Donne"/>
<row key="AB" value="Angela Brescia"/>
<row key="SC" value="Sara Crea"/>
<row key="PG" value="Paolo Garbini"/>
<row key="MP" value="Martina Pavoni"/>
<row key="MZ" value="Marino Zabbia"/>
</lookup:table>
<!-- lookup table STOP -->
  <xsl:template match="/">
    <dublin_core schema="dc">
      <dcvalue element="contributor" qualifier="author"><xsl:value-of select="t:TEI/t:teiHeader/t:fileDesc/t:titleStmt/t:author"/></dcvalue>
      <dcvalue element="title" qualifier="none" language="lat"><xsl:value-of select="t:TEI/t:teiHeader/t:fileDesc/t:titleStmt/t:title"/></dcvalue>
      <dcvalue element="type" qualifier="none" language="en_US">corpus</dcvalue>
      <dcvalue element="date" qualifier="issued"><xsl:value-of select="t:TEI/t:teiHeader/t:fileDesc/t:publicationStmt/t:date/@when"/></dcvalue>
      <dcvalue element="identifier" qualifier="uri" language="*">
	<xsl:value-of select="number($id)"/>
      </dcvalue>
      <dcvalue element="description" qualifier="none" language="it_IT">
	<xsl:for-each select="t:TEI/t:teiHeader/t:fileDesc/t:titleStmt/t:respStmt">
	  <xsl:variable name="key" select="t:name/@key"/>
	  <xsl:variable name="unabr" select="document('')//lookup:table/row[@key=$key]/@value"/>
	  <xsl:value-of select="replace(replace(replace(replace(t:resp,'Export','Esportazione'),'livello 0','livello ALIM2_0'),'livello 1','livello ALIM2_1'),'livello 2','ALIM2_2')"/><xsl:text> </xsl:text><xsl:choose><xsl:when test="not($unabr)"><xsl:value-of select="t:name"/></xsl:when><xsl:otherwise><xsl:value-of select="$unabr"/></xsl:otherwise></xsl:choose><xsl:text>&#xD;&#xA;</xsl:text>
	</xsl:for-each>
	<xsl:text>HomePage del progetto: http:&#x2F;&#x2F;it.alim.unisi.it&#x2F;il-progetto&#x2F;&#xD;</xsl:text>
	<xsl:text>Documentazione: http:&#x2F;&#x2F;alim.unisi.it&#x2F;documentazione</xsl:text>
      </dcvalue>
      <dcvalue element="language" qualifier="iso" language="en_US">lat</dcvalue>
      <dcvalue element="publisher" qualifier="none" language="it_IT">ALIM Archivio della Latinità Italiana del Medioevo</dcvalue>
      <dcvalue element="source" qualifier="uri" language="en_US">
	<xsl:text disable-output-escaping="yes"><![CDATA[http:&#x2F;&#x2F;it.alim.unisi.it]]></xsl:text>
      </dcvalue>
      <dcvalue element="subject" qualifier="none" language="en_US">Latin</dcvalue>
      <dcvalue element="subject" qualifier="none" language="en_US">Middle Ages</dcvalue>
      <xsl:for-each select="//t:profileDesc//t:keywords/t:term">
	<dcvalue element="subject" qualifier="none" language="it_IT">
	  <xsl:value-of select="."/>
	</dcvalue>
      </xsl:for-each>
      <dcvalue element="rights" qualifier="none" language="*">Creative&#x20;Commons&#x20;-&#x20;Attribution-NonCommercial-NoDerivatives&#x20;4.0&#x20;International&#x20;(CC&#x20;BY-NC-ND&#x20;4.0)</dcvalue>
      <dcvalue element="rights" qualifier="uri" language="*">http:&#x2F;&#x2F;creativecommons.org&#x2F;licenses&#x2F;by-nc-nd&#x2F;4.0&#x2F;</dcvalue>
      <dcvalue element="rights" qualifier="label" language="*">PUB</dcvalue>
    </dublin_core>
  </xsl:template>
</xsl:stylesheet>
