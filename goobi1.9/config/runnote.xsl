<?xml version="1.0" encoding="iso-8859-1"?>
<!--
 * This file is part of the Goobi Application - a Workflow tool for the support of mass digitization.
 * 
 * Visit the websites for more information. 
 *     		- http://www.goobi.org
 *     		- http://launchpad.net/goobi-production
 * 		    - http://gdz.sub.uni-goettingen.de
 * 			- http://www.intranda.com
 * 			- http://digiverso.com 
 * 
 * This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59
 * Temple Place, Suite 330, Boston, MA 02111-1307 USA
 * 
 * Linking this library statically or dynamically with other modules is making a combined work based on this library. Thus, the terms and conditions
 * of the GNU General Public License cover the whole combination. As a special exception, the copyright holders of this library give you permission to
 * link this library with independent modules to produce an executable, regardless of the license terms of these independent modules, and to copy and
 * distribute the resulting executable under terms of your choice, provided that you also meet, for each linked independent module, the terms and
 * conditions of the license of that module. An independent module is a module which is not derived from or based on this library. If you modify this
 * library, you may extend this exception to your version of the library, but you are not obliged to do so. If you do not wish to do so, delete this
 * exception statement from your version.
 -->

<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:goobi="http://www.goobi.org/logfile" exclude-result-prefixes="fo">
	<xsl:output method="xml" indent="yes" />

	<xsl:template match="goobi:process">
		
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

			<!-- general layout -->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A5-landscape"
					page-width="14.8cm" page-height="21.0cm" margin-left="1cm"
					margin-top="1cm" margin-right="1cm">
					<fo:region-body />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!-- // general layout -->

			<fo:page-sequence master-reference="A5-landscape">
				<fo:flow flow-name="xsl-region-body">

					<!-- title of process -->
					<fo:block text-align="center" font-family="sans-serif"
						font-weight="bold" font-size="16pt" margin-top="20pt">
						<xsl:value-of select="goobi:title" />
					</fo:block>
					<!-- // title of process -->

					<fo:block border-top-width="1pt" border-top-style="solid"
						border-top-color="black" margin-top="20pt" />

					<!-- table with all details -->
					<fo:block margin-top="20pt"  font-size="10pt" >
						<fo:table line-height="14pt">

							<fo:table-column column-width="4cm" />
							<fo:table-column column-width="9cm" />

							<fo:table-body>

								<!-- project -->
								<fo:table-row>
									<fo:table-cell>
										<fo:block>
											Projekt:
                  		</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="goobi:project" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<!-- // project -->

								<!-- PPN digital -->
								<fo:table-row>
									<fo:table-cell>
										<fo:block>
											PPN digital:
                  		</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="goobi:title" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<!-- // PPN digital -->

								<!-- goobi identifier -->
								<fo:table-row>
									<fo:table-cell>
										<fo:block>
											Goobi Identifier:
                  		</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="@processID" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<!-- // goobi identifier -->

								<!-- creation time -->
								<fo:table-row>
									<fo:table-cell>
										<fo:block>
											Anlegedatum:
                  		</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="goobi:time" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<!-- // creation time -->
								
								<!-- ruleset -->
								<fo:table-row>
									<fo:table-cell>
										<fo:block>
											Regelsatz:
                  		</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="goobi:ruleset" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<!-- // ruleset -->

									<!-- only Besteller Name here -->
									<!-- 
								<xsl:for-each select="goobi:properties/goobi:property">
									 <xsl:if test="@propertyIdentifier ='Besteller Name'">
											<fo:table-row>
												<fo:table-cell>
													<fo:block>
															Besteller:
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block>
													<xsl:value-of select="@value" />
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
									 </xsl:if>
								</xsl:for-each>
									 -->
									 <!-- // only Besteller Name here -->
								
							<!-- only signature here -->
								<xsl:for-each select="goobi:originals/goobi:original">
									<xsl:for-each select="goobi:properties/goobi:property">
									   <xsl:if test="@propertyIdentifier ='Signatur'">
											
											<xsl:variable name="barcodemessage2" select="@value" />
											
											<fo:table-row>
												<fo:table-cell>
													<fo:block>
															Signatur:
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block>
													<xsl:value-of select="@value" />
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
									    </xsl:if>
									 </xsl:for-each>
								</xsl:for-each>
									<!-- // only signature here -->
									
							</fo:table-body>
						</fo:table>
					</fo:block>
					<!-- // table with all details -->




			<fo:block border-top-width="1pt" border-top-style="solid"
						border-top-color="black" margin-top="20pt"  margin-bottom="20pt"/>
	
					<!-- Barcode generation for process title -->
					<xsl:variable name="barcodemessage1" select="goobi:title" />
					<fo:block text-align="center">
						<fo:instream-foreign-object>
							<barcode:barcode xmlns:barcode="http://barcode4j.krysalis.org/ns"
								message="{$barcodemessage1}">
								<barcode:code128>
									<barcode:module-width>0.21mm</barcode:module-width>
									<barcode:height>20mm</barcode:height>
								</barcode:code128>
							</barcode:barcode>
						</fo:instream-foreign-object>
					</fo:block>
					<!-- // Barcode generation for process title -->
					
								<fo:block border-top-width="1pt" border-top-style="solid"
						border-top-color="black" margin-top="10pt"  margin-bottom="20pt"/>
					
						<!-- Barcode generation for signature -->
						<xsl:variable name="barcodemessage2">
  							<xsl:for-each select="goobi:originals/goobi:original">
									<xsl:for-each select="goobi:properties/goobi:property">
									   <xsl:if test="@propertyIdentifier ='Signatur'">
													<xsl:value-of select="@value" />
									    </xsl:if>
									 </xsl:for-each>
								</xsl:for-each>
						</xsl:variable>
			
						 <xsl:if test="$barcodemessage2 !=''">
								<fo:block text-align="center" margin-top="20pt" >
										<fo:instream-foreign-object>
											<barcode:barcode xmlns:barcode="http://barcode4j.krysalis.org/ns"
												message="{$barcodemessage2}">
												<barcode:code128>
													<barcode:module-width>0.21mm</barcode:module-width>
													<barcode:height>20mm</barcode:height>
												</barcode:code128>
											</barcode:barcode>
										</fo:instream-foreign-object>
									</fo:block>
							</xsl:if>										
					<!-- // Barcode generation for signature -->

				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>