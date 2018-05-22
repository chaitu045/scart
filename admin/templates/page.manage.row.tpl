				<li id="ele-{{ PageId|raw }}" class="{{ SortableClass|raw }}">
					<table class="GridPanel" cellspacing="0" cellpadding="0" border="0" style="width:100%;">
						<tr class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
							<td width="1">
								<input type="checkbox" name="page[]" value="{{ PageId|raw }}" />
							</td>
							<td width="150" style="{{ HideVendorColumn|raw }}">
								{{ VendorName|raw }}
							</td>
							<td class="{{ SortableDragClass|raw }} {{ SortedFieldTitleClass|raw }}">
								{{ Title|raw }}
							</td>
							<td width="120" class="HideOnDrag {{ SortedFieldTypeClass|raw }}">{{ Type|raw }}</td>
							<td width="80" class="HideOnDrag {{ SortedFieldVisibleClass|raw }}" align="center">{{ Visible|raw }}</td>
							<td width="80" class="HideOnDrag">
								{{ PreviewPageLink|raw }}&nbsp;&nbsp;&nbsp;
								{{ EditPageLink|raw }}
							</td>
						</tr>
					</table>
					{{ SubPages|raw }}
				</li>