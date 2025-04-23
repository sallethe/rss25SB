<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rss="http://univrouen.fr/rss25"
                xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/rss:feed">
        <html lang="en">
            <head>
                <title>TP3 - XML</title>
                <link rel="stylesheet" type="text/css" href="./rss25.css"/>
            </head>
            <body>
                <xsl:apply-templates select="/rss:feed" mode="header"/>
                <h2>Sommaire</h2>
                <xsl:apply-templates select="/rss:feed" mode="sommaire"/>
                <p>
                    <xsl:value-of select="count(rss:item)"/> sujets
                </p>
                <h2>Description Détaillée</h2>
                <xsl:apply-templates select="rss:item" mode="description"/>
                <h2>Résumé</h2>
                <xsl:apply-templates select="rss:item" mode="summary"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="/rss:feed" mode="header">
        <h1>TP3 - Flux RSS25</h1>
        <p>
            <xsl:call-template name="formatDate">
                <xsl:with-param name="input" select="fn:current-date()"/>
            </xsl:call-template>
        </p>
        <h2>Description</h2>
        <ul>
            <li>Contenu :
                <xsl:value-of select="rss:title"/>
            </li>
            <li>Publié le
                <xsl:value-of select="rss:pubDate"/>
            </li>
            <li>Copyright
                <xsl:value-of select="rss:copyright"/>
            </li>
        </ul>
    </xsl:template>
    <xsl:template match="rss:item" mode="description">
        <h3>
            <xsl:value-of select="rss:title"/>
        </h3>
        <p>
            <xsl:value-of select="rss:guid"/>
        </p>
        <xsl:if test="rss:image">
            <img>
                <xsl:attribute name="src">
                    <xsl:value-of select="rss:image/@href"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="rss:image/@alt"/>
                </xsl:attribute>
                <xsl:attribute name="type">
                    <xsl:value-of select="rss:image/@type"/>
                </xsl:attribute>
            </img>
        </xsl:if>
        <p>Catégorie
            :
            <xsl:value-of select="rss:category/@term"/>
        </p>
        <xsl:if test="rss:published">
            <p>Publié le
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="input" select="rss:published"/>
                </xsl:call-template>
            </p>
        </xsl:if>
        <xsl:if
                test="rss:updated">
            <p>Mis à jour le
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="input" select="rss:updated"/>
                </xsl:call-template>
            </p>
        </xsl:if>
        <xsl:if
                test="rss:author">
            <p>Auteur :
                <xsl:value-of
                        select="rss:author"/>
            </p>
        </xsl:if>
        <xsl:if test="rss:contributor">
            <p>Contributeurs :
                <xsl:value-of select="rss:contributor"/>
            </p>
        </xsl:if>
    </xsl:template>
    <xsl:template match="/rss:feed" mode="sommaire">
        <ol>
            <xsl:for-each select="rss:item">
                <li>
                    <xsl:value-of select="rss:title"/>
                </li>
            </xsl:for-each>
        </ol>
    </xsl:template>
    <xsl:template name="formatDate">
        <xsl:param name="input"/>

        <xsl:variable
                name="year" select="substring($input, 1, 4)"/>
        <xsl:variable name="month"
                      select="substring($input, 6, 2)"/>
        <xsl:variable name="day"
                      select="substring($input, 9, 2)"/>

        <xsl:value-of
                select="concat($day, '/', $month, '/', $year)"/>
    </xsl:template>
    <xsl:template match="/rss:feed" mode="summary">
        <table>
            <tr>
                <th>n°</th>
                <th>Titre</th>
                <th>Date</th>
                <th>Catégories</th>
                <th>Auteurs</th>
            </tr>
            <xsl:for-each select="rss:item">
                <tr>
                    <xsl:value-of select="concat(fn:position(), ' / ', fn:count(rss:item))"/>
                </tr>
                <tr>
                    <xsl:value-of select="rss:title"/>
                </tr>
                <tr>
                    <xsl:if test="rss:published">
                        <xsl:value-of select="rss:published"/>
                    </xsl:if>
                    <xsl:if test="rss:updated">
                        <xsl:value-of select="rss:updated"/>
                    </xsl:if>
                </tr>
                <tr>
                    <xsl:value-of select="rss:category/@term"/>
                </tr>
                <tr>
                    <xsl:value-of select="rss:author"/>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>