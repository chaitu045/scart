<tr class="GridRow" onmouseover="$(this).addClass('GrodRowOver');" onmouseout="$(this).removeClass('GridRowOver');">
	<td style="text-align: center;"><input type="checkbox" class="check" name="vendors[]" value="{{ VendorId|raw }}" /></td>
	<td><img src="images/vendor.gif" alt="" /></td>
	<td>{{ VendorName|raw }}</td>
	<td>{{ VendorUsers|raw }}</td>
	<td>
		<a href="index.php?ToDo=editVendor&amp;vendorId={{ VendorId|raw }}">{% lang 'Edit' %}</a>
		<a href="index.php?ToDo=viewUsers&amp;vendorId={{ VendorId|raw }}">{% lang 'ManageUsers' %}</a>
		<a href="index.php?ToDo=deleteVendors&amp;vendors[]={{ VendorId|raw }}" onclick="return ConfirmDeleteVendor();">{% lang 'Delete' %}</a>
	</td>
</tr>