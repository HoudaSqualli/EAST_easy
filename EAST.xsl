<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml" >
    
    
    <xsl:output method="xml" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="EAST"/>
    </xsl:template> 
    
    <xsl:template match="PARTIE">
        
        <h2>
            <xsl:value-of select="TITRE"/>
        </h2>
        <xsl:apply-templates/>
        
    </xsl:template>
    
    <xsl:template match="PAGE">
        
        <h3 style="text-align : center" >
            <xsl:value-of select="TITRE_PAGE"/>
        </h3>
        <xsl:variable name="nbpart"> 
            <xsl:value-of select="count(preceding::PAGE)+1"/>  
        </xsl:variable>
        <div class="slide" id="partie{$nbpart}">  
            <table class="bas" width="100%">
                <tr>
                    <td align="left" class="tiers">
                        <tt class="piedgauche">
                            <xsl:apply-templates select="../PIEDPAGE_GAUCHE"/>
                        </tt>
                    </td>
                    <td align="right" class="tiers">
                        <tt class="pieddroit">
                            <xsl:apply-templates select="../PIEDPAGE_DROITE"/>
                        </tt>
                    </td>
                </tr>
            </table>
        </div>
        
        
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="PARAGRAPHE">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    
</xsl:stylesheet>







  
