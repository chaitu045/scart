									<tr id="download_{{ DownloadId|raw }}" class="GridRow DownloadGridRow" onmouseover="if(this.className != 'QuickView') { this.oldClass = this.className; this.className='GridRowOver'; }" onmouseout="if(this.className != 'QuickView') { this.className=this.oldClass }">
										<td align="center" style="width:25px">
											<img src="images/download.gif" />
										</td>
										<td class="FileName" style="width: 40%">
											{{ DownloadName|raw }}
										</td>
										<td class="FileSize" style="width: 100px;" align="right" nowrap="nowrap">
											{{ DownloadSize|raw }}
										</td>
										<td align="right" nowrap="nowrap">
											{{ NumDownloads|raw }}
										</td>
										<td class="MaxDownloads" style="width: 150px;" nowrap="nowrap">
											{{ MaxDownloads|raw }}
										</td>
										<td class="ExpiresAfter" style="width: 150px;" nowrap="nowrap">
											{{ ExpiresAfter|raw }}
										</td>
										<td style="width: 130px;" nowrap="nowrap">
											<a href="index.php?ToDo=downloadProductFile&amp;downloadid={{ DownloadId|raw }}" target="_blank">{% lang 'ViewDownload' %}</a>&nbsp;&nbsp;
											<a href="#" onclick="editDownload('{{ DownloadId|raw }}'); return false;">{% lang 'Edit' %}</a>&nbsp;&nbsp;<a href="#" onclick="return deleteDownload('{{ DownloadId|raw }}'); return false;">{% lang 'Delete' %}</a>
										</td>
									</tr>
									<tr id="download_edit_{{ DownloadId|raw }}" style="display: none;">
										<td>&nbsp;</td>
										<td class="QuickView" colspan="3"></td>
										<td colspan="3">&nbsp;</td>
									</tr>