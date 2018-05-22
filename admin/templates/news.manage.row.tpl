
	<tr class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
		<td align="center" style="width:25px">
			<input type="checkbox" name="news[]" value="{{ NewsId|raw }}">
		</td>
		<td align="center" style="width:18px">
			<div class="NewsIcon"></div>
		</td>
		<td width="550" class="{{ SortedFieldTitleClass|raw }}">
			{{ Title|raw }}
		</td>
		<td style="width:250px" class="{{ SortedFieldDateClass|raw }}">
			{{ Date|raw }}
		</td>
		<td align="center" class="{{ SortedFieldVisibleClass|raw }}">
			{{ Visible|raw }}
		</td>
		<td>
			{{ EditNewsLink|raw }}&nbsp;&nbsp;&nbsp;
			<a title='{% lang 'PreviewNewsPost' %}' href="javascript:PreviewNews({{ NewsId|raw }})">{% lang 'PreviewNews' %}</a>
		</td>
	</tr>