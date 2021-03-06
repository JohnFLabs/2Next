<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="doc-info">
		<fieldset class="fieldset">
			<xsl:if test="$editmode != 'edit'">
				<xsl:attribute name="disabled">disabled</xsl:attribute>
			</xsl:if>
			<legend class="legend">
				<xsl:value-of select="//captions/additional/@caption" />
			</legend>
			<ol class="fieldset-container">
				<li class="control-group">
					<label class="control-label">
						<xsl:value-of select="//captions/info_status_doc/@caption" />
					</label>
					<span class="controls">
						<xsl:choose>
							<xsl:when test="document/@status='new'">
								<xsl:value-of select="//captions/newdoc/@caption" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//captions/saved/@caption" />
							</xsl:otherwise>
						</xsl:choose>
					</span>
				</li>
				<li class="control-group">
					<label class="control-label">
						<xsl:value-of select="//captions/info_permissions/@caption" />
					</label>
					<span class="controls">
						<xsl:choose>
							<xsl:when test="document/@editmode='view'">
								<xsl:value-of select="document/captions/readonly/@caption" />
							</xsl:when>
							<xsl:when test="document/@editmode='readonly'">
								<xsl:value-of select="document/captions/readonly/@caption" />
							</xsl:when>
							<xsl:when test="document/@editmode='edit'">
								<xsl:value-of select="document/captions/editing/@caption" />
							</xsl:when>
							<xsl:when test="document/@editmode='noaccess'">
								<xsl:value-of select="document/captions/readonly/@caption" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="document/captions/modenotdefined/@caption" />
							</xsl:otherwise>
						</xsl:choose>
					</span>
				</li>
				<xsl:if test="document/@status!='new'">
					<li class="control-group">
						<label class="control-label">
							<xsl:value-of select="//captions/info_read/@caption" />
						</label>
						<span class="controls">
							<script type="text/javascript">
								usersWhichReadInTable(<xsl:value-of select="concat('this,', document/@doctype, ',', document/@docid)" />);
							</script>
							<table class="users-which-read" id="userswhichreadtbl">
								<tr>
									<th>
										<xsl:value-of select="document/captions/info_readers/@caption" />
									</th>
									<th>
										<xsl:value-of select="document/captions/info_read_time/@caption" />
									</th>
								</tr>
							</table>
						</span>
					</li>
					<li class="control-group">
						<label class="control-label">
							<xsl:value-of select="document/captions/info_ds/@caption" />
						</label>
						<span class="controls">
							<xsl:choose>
								<xsl:when test="document/@sign = '0'">
									<xsl:value-of select="document/captions/documentnotsigned/@caption" />
								</xsl:when>
								<xsl:when test="document/@sign = '1'">
									<xsl:value-of select="document/captions/signistrue/@caption" />
								</xsl:when>
								<xsl:when test="document/@sign = '2'">
									<xsl:value-of select="document/captions/signisfalse/@caption" />
								</xsl:when>
								<xsl:when test="document/@sign = '3'">
									<xsl:value-of select="document/captions/invalidkey/@caption" />
								</xsl:when>
								<xsl:when test="document/@sign = '4'">
									<xsl:value-of select="document/captions/algorithmnotfound/@caption" />
								</xsl:when>
								<xsl:when test="document/@sign = '5'">
									<xsl:value-of select="document/captions/fillmechanismnotfound/@caption" />
								</xsl:when>
								<xsl:when test="document/@sign = '6'">
									<xsl:value-of select="document/captions/invalidcharkey/@caption" />
								</xsl:when>
								<xsl:when test="document/@sign = '7'">
									<xsl:value-of select="document/captions/invalidparalgo/@caption" />
								</xsl:when>
								<xsl:when test="document/@sign = '8'">
									<xsl:value-of select="document/captions/totalexceptionkey/@caption" />
								</xsl:when>
								<xsl:when test="document/@sign = '10'">
									<xsl:value-of select="document/captions/filecertnotfound/@caption" />
								</xsl:when>
								<xsl:when test="document/@sign = '11'">
									<xsl:value-of select="document/captions/onefilenotfound4sign/@caption" />
								</xsl:when>
								<xsl:otherwise>
									<!-- -->
								</xsl:otherwise>
							</xsl:choose>
						</span>
					</li>
				</xsl:if>
			</ol>
		</fieldset>
	</xsl:template>

</xsl:stylesheet>
