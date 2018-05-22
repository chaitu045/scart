<tr class="GridRow" onmouseover="$(this).addClass('GridRowOver');" onmouseout="$(this).removeClass('GridRowOver');">
	<td style="text-align: center; width: 1px;"><input type="checkbox" name="pages[]" class="check" value="{{ PageId|raw }}" /></td>
	<td><img src="images/page.gif" alt="" /></td>
	<td>{{ PageTitle|raw }}</td>
	<td style="text-align: center;">{{ PageStatus|raw }}</td>
	<td style="width: 200px;">
		<a href="index.php?ToDo=editVendorPage&amp;vendorId={{ VendorId|raw }}&amp;pageId={{ PageId|raw }}">{% lang 'Edit' %}</a>
		<a href="index.php?ToDo=deleteVendorPages&amp;vendorId={{ VendorId|raw }}&amp;pages[]={{ PageId|raw }}" onclick="return ConfirmDelete();">{% lang 'Delete' %}</a>
	</td>
</tr>