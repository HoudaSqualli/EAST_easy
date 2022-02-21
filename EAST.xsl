<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" >


    <xsl:output method="xml" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>


    <xsl:template match="/">
        <xsl:apply-templates select="EAST"/>
    </xsl:template>

    <xsl:template match="PARTIE">
  <xsl:variable name="nbpart"> <xsl:value-of select="count(preceding::PARTIE)+1"/>  </xsl:variable>
  <div class="slide" id="partie{$nbpart}">
    <table width="100%" height="60%">
    <tbody>
    <tr>
      <td>
        <xsl:choose>
          <xsl:when test="normalize-space(TITRE)!=''">
            <h1 class="titrepartie"><xsl:value-of select="TITRE"/></h1>
          </xsl:when>
          <xsl:otherwise>
            <h1 class="titrepartie">Partie <xsl:value-of select="position()"/></h1>
          </xsl:otherwise>
          </xsl:choose>
      </td>
    </tr>
    </tbody>
    </table>

    <table class="bas" width="100%">
      <tr>
        <td align="left" class="tiers"><tt class="piedgauche"><xsl:apply-templates select="../PIEDPAGE_GAUCHE"/></tt></td>
        <td align="center" class="tiers"><tt class="slidenumber"><xsl:value-of select="DATE_EXPOSE"/></tt></td>
        <td align="right" class="tiers"><tt class="pieddroit"><xsl:apply-templates select="../PIEDPAGE_DROIT"/></tt></td>
      </tr>
    </table>
  </div>

  <xsl:apply-templates select="SECTION"/>
</xsl:template>

<xsl:template name="sommaire">
  <div class="slide" id="sommaire">

    <ul class="accordion">
    <xsl:for-each select="PARTIE">
     
      <li class="elsommaire">
        <span>
        <xsl:choose>
          <xsl:when test="normalize-space(TITRE)!=''">
            <xsl:value-of select="TITRE"/>
          </xsl:when>
          <xsl:otherwise>
            Partie <xsl:value-of select="position()"/>
          </xsl:otherwise>
        </xsl:choose>

          <ul id="liste_sections">
          <xsl:for-each select="SECTION">
            <xsl:variable name="nbsec2">
              <xsl:choose>
                <xsl:when test="normalize-space(count(preceding::PAGE_TITRE))=0">
                  <xsl:value-of select="count(preceding::SECTION)+1"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="count(preceding::SECTION)+count(preceding::PAGE_TITRE)"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>

            <li class="elsommaire2">
              <span>
                <a href="#slide{$nbsec2}" class="linkitem">
                  <xsl:choose>
                    <xsl:when test="normalize-space(TITRE)!=''">
                      <xsl:value-of select="TITRE"/>
                    </xsl:when>
                    <xsl:otherwise>
                      Section<xsl:value-of select="position()"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </a>
              </span>
            </li>

          </xsl:for-each>
          </ul>
        </span>
      </li>
    </xsl:for-each>
    </ul>

    
  </div>
</xsl:template>

</xsl:stylesheet>







  