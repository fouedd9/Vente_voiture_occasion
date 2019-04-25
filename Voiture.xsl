<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" doctype-public="XHTML"/>
    <xsl:template match="/">
        
        <html>
            <head>
                <title>XSL</title>
                <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
            </head>
            <body>
                
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Photo</th>
                            <th scope="col">annee</th>
                            <th scope="col">marque</th>
                            <th scope="col">modele</th>
                            <th scope="col">km</th>
                            <th scope="col">color</th>
                            <th scope="col">prix</th>
                            <th scope="col">ServiceCarOccas</th>
                            <th scope="col">SelectioncarOccas</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="voitures/voiture">
                            <xsl:sort select="kilometrage" data-type="number"/>
                            
                            <tr>
                               
                                <xsl:if test="(kilometrage &lt;20000)and (caroccas/@garantie='oui')">
                                    <xsl:attribute name="style">
                                        font-weight: bold;
                                    </xsl:attribute>
                                </xsl:if>
                                
                             
                                <td>
                                    <xsl:element name="image">
                                        <xsl:attribute name="src"><xsl:value-of select="photo"/></xsl:attribute>
                                    </xsl:element>                                
                                </td>
                                <td>
                                    <xsl:value-of select="@annee"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@marque"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@modele"/>
                                </td>
                                <td>
                                    <xsl:value-of select="kilometrage"/>
                                </td>
                                <td>
                                    <xsl:attribute name="bgcolor">
                                        <xsl:value-of select="couleur"/></xsl:attribute>
                                </td>
                                <td>
                                    <xsl:value-of select="prix"/>€
                                </td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="(caroccas/@garantie='oui')and(caroccas/@reprise='non')">Garantie</xsl:when>
                                        <xsl:when test="(caroccas/@garantie='non')and(caroccas/@reprise='oui')">Reprise</xsl:when>
                                        <xsl:when test="(caroccas/@garantie='oui')and(caroccas/@reprise='oui')">Garantie+Reprise</xsl:when>
                                        <xsl:otherwise> Aucun </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:value-of select="caroccas"/>
                                </td>
                                <td>
                                    <xsl:if test="(caroccas/@garantie='oui')">
                                        <img src="start-icon.jpg" width="20px"></img>
                                    </xsl:if>
                                    <xsl:if test="(caroccas/@reprise='oui')">
                                        <img src="start-icon.jpg" width="20px"></img>
                                    </xsl:if>
                                    <xsl:if test="(kilometrage &lt;20000)">
                                        <img src="start-icon.jpg" width="20px"></img>
                                    </xsl:if>
                                    <xsl:value-of select="SelectioncarOccas"/>
                                </td>
                                                 
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                
            </body>
        </html>
        
    </xsl:template>
</xsl:stylesheet>