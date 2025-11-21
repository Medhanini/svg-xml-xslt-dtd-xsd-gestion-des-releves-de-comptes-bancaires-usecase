<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0">
    <xsl:template match="/">
    <html>
        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        </head>
        <body>
            <div class="max-w-xl mx-auto py-8 text-center border-1 rounded-xl">
                <h2>
                    RIB
                </h2>
                <h1 class="font-bold text-blue-500"><xsl:value-of select="releve/@RIB"/></h1>
                <h2 class="mt-2">
                    Date du relevé 
                </h2>
                <h1 class="font-bold text-blue-500"> <xsl:value-of select="releve/dateReleve"/></h1>
                <h2 class="mt-2">
                    Solde
                </h2>
                <h1 class="text-green-600"> <xsl:value-of select="releve/solde"/> MAD</h1>
                
                <xsl:for-each select="releve/operations">
                    <ul>
                        <li>
                            Date début:<strong><xsl:value-of select="@dateDebut"/></strong> 
                        </li>
                        <li>
                            Date Fin: <strong><xsl:value-of select="@dateFin"/></strong>
                        </li>
                    </ul>
                    <table class="mx-auto mt-4">
                        <thead>
                            <tr>
                                <th class="p-2 border-1">type</th>
                                <th class="p-2 border-1">date</th>
                                <th class="p-2 border-1">description</th>
                                <th class="p-2 border-1">montant</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="operation">
                            <tr>
                                <td class="p-2 border-1">
                                    <xsl:value-of select="@type"/>
                                </td>
                                <td class="p-2 border-1">
                                    <xsl:value-of select="@date"/>
                                </td>
                                <td class="p-2 border-1">
                                    <xsl:value-of select="@description"/>
                                </td>
                                <td class="p-2 border-1">
                                    <xsl:value-of select="@montant"/> MAD
                                </td>
                            </tr>
                            </xsl:for-each>
                            <tr>
                                <td >
                                    
                                </td>
                                <td >
                                    
                                </td>
                                <td class="p-2 border-1 bg-gray-100">
                                    Débit
                                </td>
                                <td class="p-2 border-1 text-red-500">
                                    <xsl:value-of select="sum(operation[@type='DEBIT']/@montant)"/> MAD
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    
                                </td>
                                <td >
                                    
                                </td>
                                <td class="p-2 border-1 bg-gray-100">
                                    Crédit
                                </td>
                                <td class="p-2 border-1 text-green-500">
                                    <xsl:value-of select="sum(operation[@type='CREDIT']/@montant)"/> MAD
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </xsl:for-each>
            </div>
        </body>
    </html>
    </xsl:template>
</xsl:stylesheet>