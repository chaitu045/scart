<tr class="GridRow" onmouseover="$(this).addClass('GrodRowOver');" onmouseout="$(this).removeClass('GridRowOver');">
	<td style="text-align: center;"><input type="checkbox" class="check" name="wrap[]" value="{{ WrapId|raw }}" /></td>
	<td><img src="images/giftwrap.gif" alt="" /></td>
	<td>{{ WrapName|raw }}</td>
	<td>{{ WrapPrice|raw }}</td>
	<td style="text-align: center;"><img src="images/{{ WrapVisibleImage|raw }}" alt="" /></td>
	<td>
		<a href="index.php?ToDo=editGiftWrap&amp;wrapId={{ WrapId|raw }}">{% lang 'Edit' %}</a>
		<a href="index.php?ToDo=deleteGiftWrap&amp;wrap[]={{ WrapId|raw }}" onclick="return ConfirmDeleteWrap();">{% lang 'Delete' %}</a>
	</td>
</tr>