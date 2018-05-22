			<tr id="tr{{ LogId|raw }}" class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
				<td width="1">
					<input type="checkbox" class="DeleteCheck" name="delete[]" value="{{ LogId|raw }}" />
				</td>
				<td width="1">
					<img src="images/log_{{ SeverityClass }}.gif" alt="" />
				</td>
				<td width="80" class="{{ SeverityClass }}">
					{{ Severity }}
				</td>
				<td align="center" style="width:15px">
					{{ ExpandLink|raw }}
				</td>
				<td class="{{ SortedFieldTypeClass|raw }}">
					{{ Type }}
				</td>
				<td class="{{ SortedFieldModuleClass|raw }}">
					{{ Module }}
				</td>
				<td class="{{ SortedFieldSummaryClass|raw }}">
					{{ Summary }}
				</td>
				<td width="150" class="{{ SortedFieldDateClass|raw }}">
					{{ Date }}
				</td>
			</tr>
			<tr id="trQ{{ LogId|raw }}" style="display:none">
				<td colspan="3">
					&nbsp;
				</td>
				<td colspan="4" id="tdQ{{ LogId|raw }}" class="QuickView">
				</td>
				<td colspan="2">&nbsp;</td>
			</tr>
