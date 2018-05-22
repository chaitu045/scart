<tr class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
	<td align="center" style="width:25px">
		<input type="checkbox" name="backup[]" class="DeleteBackup" value="{{ FileName|raw }}">
	</td>
	<td align="center" style="width:18px;">
		<img src='images/{{ BackupImage|raw }}.gif' title='{{ BackupType|raw }}'>
	</td>
	<td>
		{{ FileName|raw }}
	</td>
	<td align="right">
		{{ FileSize|raw }}
	</td>
	<td>
		{{ ModifiedTime|raw }}
	</td>
	<td>
		<a title='{{ DownloadOpen|raw }}' class='Action' href='{{ ViewLink|raw }}' target='_blank'>{{ DownloadOpen|raw }}</a>
	</td>
</tr>