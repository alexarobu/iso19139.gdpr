<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gts="http://www.isotc211.org/2005/gts"
                xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmx="http://www.isotc211.org/2005/gmx"
                xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:GDPR="http://GDPR"
                xmlns:gml="http://www.opengis.net/gml" xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:gn="http://www.fao.org/geonetwork"
                xmlns:gn-fn-metadata="http://geonetwork-opensource.org/xsl/functions/metadata"
                xmlns:gn-fn-iso19139="http://geonetwork-opensource.org/xsl/functions/profiles/iso19139"
                xmlns:saxon="http://saxon.sf.net/" extension-element-prefixes="saxon"
                exclude-result-prefixes="#all">

  <!--
    Load the schema configuration for the editor.
    Same configuration as ISO19139 here.
      -->
  <xsl:template name="get-GDPR-configuration">
    <xsl:copy-of select="document('config-editor.xml')"/>
  </xsl:template>


  <!-- Dispatch to the current profile mode -->
  <xsl:template name="dispatch-GDPR">
    <xsl:param name="base" as="node()"/>
    <xsl:param name="overrideLabel" as="xs:string" required="no" select="''"/>
    <xsl:param name="refToDelete" as="node()?" required="no"/>

    <xsl:apply-templates mode="mode-iso19139" select="$base">
      <xsl:with-param name="overrideLabel" select="$overrideLabel"/>
      <xsl:with-param name="refToDelete" select="$refToDelete"/>
    </xsl:apply-templates>
  </xsl:template>


  <!-- The following templates usually delegates all to iso19139. -->
  <xsl:template name="evaluate-GDPR">
    <xsl:param name="base" as="node()"/>
    <xsl:param name="in"/>

    <xsl:call-template name="evaluate-iso19139">
      <xsl:with-param name="base" select="$base"/>
      <xsl:with-param name="in" select="$in"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="evaluate-GDPR-boolean">
    <xsl:param name="base" as="node()"/>
    <xsl:param name="in"/>

    <xsl:call-template name="evaluate-iso19139-boolean">
      <xsl:with-param name="base" select="$base"/>
      <xsl:with-param name="in" select="$in"/>
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="get-GDPR-is-service">
    <xsl:call-template name="get-iso19139-is-service">
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="get-GDPR-language">
    <xsl:call-template name="get-iso19139-language">
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="get-GDPR-other-languages-as-json">
    <xsl:call-template name="get-iso19139-other-languages-as-json">
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="get-GDPR-other-languages">
    <xsl:call-template name="get-iso19139-other-languages">
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="get-GDPR-extents-as-json">
    <xsl:call-template name="get-iso19139-extents-as-json">
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="get-GDPR-online-source-config">
    <xsl:call-template name="get-iso19139-online-source-config">
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>