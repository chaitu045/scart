<tr style="{{ HideProperty|raw }}" class="{{ PropertyClass|raw }}">

	<td class="FieldLabel" nowrap>
		{{ Required|raw }} <label for="StoreName">{{ PropertyName|raw }}</label>
		<div style="{{ HideSelectAllLinks|raw }}">
			&nbsp;&nbsp;&nbsp;(<a onclick="SelectAll('{{ FieldId|raw }}'); return false;" href="#">{% lang 'SelectAll' %}</a> / <a  onclick="UnselectAll('{{ FieldId|raw }}'); return false;" href="#">{% lang 'UnselectAll' %}</a>)
	</td>
	<td class="{{ PanelBottom|raw }}">
		{{ PropertyBox|raw }}
		{{ HelpTip|raw }}
	</td>
</tr>

