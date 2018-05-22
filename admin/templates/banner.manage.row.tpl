<tr class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
	<td align="center" style="width:25px">
		<input type="checkbox" name="banner[]" value="{{ BannerId|raw }}">
	</td>
	<td align="center" style="width:18px;">
		<img src='images/banner.gif'>
	</td>
	<td class="{{ SortedFieldNameClass|raw }}">
		{{ Name|raw }}
	</td>
	<td class="{{ SortedFieldLocationClass|raw }}">
		{{ Location|raw }}
	</td>
	<td class="{{ SortedFieldDateClass|raw }}">
		{{ Date|raw }}
	</td>
	<td align="center" class="{{ SortedFieldStatusClass|raw }}">
		{{ Visible|raw }}
	</td>
	<td>
		<a title='{% lang 'EditThisBanner' %}' class='Action' href='index.php?ToDo=editBanner&amp;bannerId={{ BannerId|raw }}'>{% lang 'Edit' %}</a>
	</td>
</tr>