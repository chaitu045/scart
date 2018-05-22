<table>
	<tr>
		<td class="FieldLabel">
			&nbsp;&nbsp;&nbsp;{% lang 'DownloadDescription' %}:
		</td>
		<td>
			<input type="text" name="downloads[{{ DownloadId|raw }}][downdescription]" id="DownloadDescription" value="{{ DownloadDescription|raw }}" class="Field200" />
		</td>
	</tr>
	<tr>
		<td class="FieldLabel">
			&nbsp;&nbsp;&nbsp;{% lang 'ExpiresAfter' %}:
		</td>
		<td>
			<input type="text" name="downloads[{{ DownloadId|raw }}][downexpiresafter]" id="DownloadExpiresAfter" class="{{ DownloadExpires|raw }}" class="Field40" />
			<select name="downloads[{{ DownloadId|raw }}][downexpiresrange]" id="DownloadExpiresRange">
				<option value="days">{% lang 'RangeDays' %}</option>
				<option value="weeks" {{ RangWeeksSelected|raw }}>{% lang 'RangeWeeks' %}</option>
				<option value="months" {{ RangeMonthsSelected|raw }}>{% lang 'RangeMonths' %}</option>
				<option value="years" {{ RangeYearsSelected|raw }}>{% lang 'RangeYears' %}</option>
			</select>
			<img onmouseout="HideHelp('dlexpires');" onmouseover="ShowHelp('dlexpires', '{% lang 'ExpiresAfter' %}', '{% lang 'ExpiresAfterHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
			<div style="display:none" id="dlexpires"></div>
		</td>
	</tr>
	<tr>
		<td class="FieldLabel">
			&nbsp;&nbsp;&nbsp;{% lang 'MaximumDownloads' %}:
		</td>
		<td>
			<input type="text" name="downloads[{{ DownloadId|raw }}][downmaxdownloads]" id="DownloadMaxDownloads" class="Field40" />
			<img onmouseout="HideHelp('dldownloads');" onmouseover="ShowHelp('dldownloads', '{% lang 'MaximumDownloads' %}', '{% lang 'MaximumDownloadsHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
			<div style="display:none" id="dldownloads"></div>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<input type="button" value="{% lang 'SaveDownload' %}" onclick="saveDownload();" class="SaveButton SmallButton" style="width: 90px;" />
			<input type="button" value="{% lang 'CancelEdit' %}" onclick="cancelDownloadEdit();" class="CancelButton SmallButton" style="width: 60px" />
		</td>
	</tr>
</table>