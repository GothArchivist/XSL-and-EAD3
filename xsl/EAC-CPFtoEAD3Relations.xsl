<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:eac-cpf="urn:isbn:1-931666-33-4" xmlns:xlink="http://www.w3.org/1999/xlink"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>   
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <xsl:apply-templates select="eac-cpf:eac-cpf/eac-cpf:cpfDescription/eac-cpf:relations"/>
    </xsl:template>
    <xsl:template match="eac-cpf:eac-cpf/eac-cpf:cpfDescription/eac-cpf:relations">
        <relations>
        <xsl:apply-templates/>
        </relations>
    </xsl:template>
<!-- tried a simpler way of doing attributes, but it didn't pan out. I'd very much like to see someone redo it. -->  
    
    <xsl:template match="eac-cpf:cpfRelation | eac-cpf:resourceRelation | eac-cpf:functionRelation">
        <relation>
            <xsl:if test="self::eac-cpf:cpfRelation">
            <xsl:attribute name="relationtype">cpfrelation</xsl:attribute>
            </xsl:if>
            <xsl:if test="self::eac-cpf:resourceRelation">
                <xsl:attribute name="relationtype">resourcerelation</xsl:attribute>
            </xsl:if>
            <xsl:if test="self::eac-cpf:functionRelation">
                <xsl:attribute name="relationtype">functionrelation</xsl:attribute>
            </xsl:if>
            <xsl:if test="@xlink:actuate">
                <xsl:attribute name="actuate">
                    <xsl:value-of select="lower-case(@xlink:actuate)"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@xlink:arcrole">
                <xsl:attribute name="linkarcrole">
                    <xsl:value-of select="@xlink:arcrole"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@xlink:href">
                <xsl:attribute name="href">
                    <xsl:value-of select="@xlink:href"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@xlink:role">
                <xsl:attribute name="linkrole">
                    <xsl:value-of select="@xlink:role"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@xlink:show">
                <xsl:attribute name="show">
                    <xsl:value-of select="@xlink:show"/>
                </xsl:attribute>    
            </xsl:if>
            <xsl:if test="@xlink:title">
                <xsl:attribute name="linktitle">
                    <xsl:value-of select="@xlink:title"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@xml:id">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@xml:lang">
                <xsl:attribute name="lang">
                    <xsl:value-of select="@xml:lang"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="eac-cpf:relationEntry"/>
            <xsl:apply-templates select="eac-cpf:objectXMLWrap"/>
            <xsl:apply-templates select="eac-cpf:date"/>
            <xsl:apply-templates select="eac-cpf:dateRange"/>
            <xsl:apply-templates select="eac-cpf:dateSet"/>
            <xsl:apply-templates select="eac-cpf:placeEntry"/>
            <xsl:apply-templates select="eac-cpf:descriptiveNote"/>
        </relation>
    </xsl:template>
    
   
<!--element templates -->     
    <xsl:template match="eac-cpf:date">
    <datesingle>
        <xsl:if test="@localType">
            <xsl:attribute name="localtype">
                <xsl:value-of select="@localType"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@notAfter">
            <xsl:attribute name="notafter">
                <xsl:value-of select="@notAfter"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@notBefore">
            <xsl:attribute name="notbefore">
                <xsl:value-of select="@notBefore"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@standardDate">
            <xsl:attribute name="standarddate">
                <xsl:value-of select="@standardDate"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@xml:id">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
                <xsl:value-of select="@xml:lang"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates/>
    </datesingle>
</xsl:template>
    
    <xsl:template match="eac-cpf:dateRange">
    <daterange>
        <xsl:if test="@localType">
            <xsl:attribute name="localtype">
                <xsl:value-of select="@localType"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@xml:id">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
                <xsl:value-of select="@xml:lang"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates/>
    </daterange>
</xsl:template>
    
    <xsl:template match="eac-cpf:dateSet">
    <dateset>
        <xsl:if test="@xml:id">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
                <xsl:value-of select="@xml:lang"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates/>
    </dateset>
</xsl:template>

    <xsl:template match="eac-cpf:descriptiveNote">
    <descriptivenote>
        <xsl:if test="@xml:id">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
                <xsl:value-of select="@xml:lang"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates/>
    </descriptivenote>
</xsl:template>

    <xsl:template match="eac-cpf:fromDate">
    <fromdate>
        <xsl:if test="@notAfter">
            <xsl:attribute name="notafter">
                <xsl:value-of select="@notAfter"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@notBefore">
            <xsl:attribute name="notbefore">
                <xsl:value-of select="@notBefore"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@standardDate">
            <xsl:attribute name="standarddate">
                <xsl:value-of select="@standardDate"/>
            </xsl:attribute>
        </xsl:if>        
        <xsl:if test="@xml:id">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
                <xsl:value-of select="@xml:lang"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates/>
    </fromdate>
</xsl:template>

    <xsl:template match="eac-cpf:objectXMLWrap">
    <objectxmlwrap>
        <xsl:if test="@xml:id">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates/>
    </objectxmlwrap>
</xsl:template>

    <xsl:template match="eac-cpf:p">
    <p>
        <xsl:if test="@xml:id">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
                <xsl:value-of select="@xml:lang"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates/>
    </p>
</xsl:template>
    
    <xsl:template match="eac-cpf:placeEntry">
    <geogname>
        <xsl:if test="@localType">
            <xsl:attribute name="localtype">
                <xsl:value-of select="@localType"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@scriptCode">
            <xsl:attribute name="script">
                <xsl:value-of select="@scriptCode"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@vocabularySource">
            <xsl:attribute name="source">
                <xsl:value-of select="@vocabularySource"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@xml:id">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
                <xsl:value-of select="@xml:lang"/>
            </xsl:attribute>
        </xsl:if>
        <part>
        <xsl:apply-templates/>
        </part>
    </geogname>
</xsl:template>
   
    <xsl:template match="eac-cpf:relationEntry">
    <relationentry>
        <xsl:if test="@localType">
            <xsl:attribute name="localtype">
                <xsl:value-of select="@localType"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@scriptCode">
            <xsl:attribute name="script">
                <xsl:value-of select="@scriptCode"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@transliteration">
            <xsl:attribute name="transliteration">
                <xsl:value-of select="@transliteration"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@xml:id">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
                <xsl:value-of select="@xml:lang"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates/>
    </relationentry>
</xsl:template>
    
    <xsl:template match="eac-cpf:toDate">
    <todate>
        <xsl:if test="@notAfter">
            <xsl:attribute name="notafter">
                <xsl:value-of select="@notAfter"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@notBefore">
            <xsl:attribute name="notbefore">
                <xsl:value-of select="@notBefore"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@standardDate">
            <xsl:attribute name="standarddate">
                <xsl:value-of select="@standardDate"/>
            </xsl:attribute>
        </xsl:if>        
        <xsl:if test="@xml:id">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
                <xsl:value-of select="@xml:lang"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates/>
    </todate>
</xsl:template>
</xsl:stylesheet>
