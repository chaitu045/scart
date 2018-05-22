			<tr class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
				<td width="1">
					<input type="checkbox" class="DeleteCheck" name="delete[]" value="{{ LogId|raw }}" />
				</td>
				<td width="1">
					<img src="images/log.gif" alt="" />
				</td>
				<td class="{{ SortedFieldNameClass|raw }}">
					{{ Username|raw }}
				</td>
				<td>
					{{ Action|raw }}
				</td>
				<td width="150" class="{{ SortedFieldDateClass|raw }}">
					{{ Date|raw }}
				</td>
				<td width="80" nowrap="nowrap" class="{{ SortedFieldIPClass|raw }}">
					{{ Ip|raw }}
				</td>
			</tr>