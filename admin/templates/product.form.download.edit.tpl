<table>
	<tr>
		<td class="FieldLabel">
			&nbsp;&nbsp;&nbsp;{% lang 'DownloadDescription' %}:
		</td>
		<td>
			<input type="text" name="downloads[{{ DownloadId|raw }}][downdescription]" id="DownloadDescription{{ DownloadId|raw }}" value="{{ DownloadDescription|raw }}" class="Field200" />
		</td>
	</tr>
	<tr>
		<td class="FieldLabel">
			&nbsp;&nbsp;&nbsp;{% lang 'ExpiresAfter' %}:
		</td>
		<td>
			<input type="text" name="downloads[{{ DownloadId|raw }}][downexpiresafter]" id="DownloadExpiresAfter{{ DownloadId|raw }}" value="{{ ExpiresAfter|raw }}" class="Field40" />
			<select name="downloads[{{ DownloadId|raw }}][downexpiresrange]" id="DownloadExpiresRange{{ DownloadId|raw }}">
				<option value="days">{% lang 'RangeDays' %}</option>
				<option value="weeks" {{ RangWeeksSelected|raw }}>{% lang 'RangeWeeks' %}</option>
				<option value="months" {{ RangeMonthsSelected|raw }}>{% lang 'RangeMonths' %}</option>
				<option value="years" {{ RangeYearsSelected|raw }}>{% lang 'RangeYears' %}</option>
			</select>
			<img onmouseout="HideHelp('dlexpires{{ DownloadId|raw }}');" onmouseover="ShowHelp('dlexpires{{ DownloadId|raw }}', '{% lang 'ExpiresAfter' %}', '{% lang 'ExpiresAfterHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
			<div style="display:none" id="dlexpires{{ DownloadId|raw }}"></div>
		</td>
	</tr>
	<tr>
		<td class="FieldLabel">
			&nbsp;&nbsp;&nbsp;{% lang 'MaximumDownloads' %}:
		</td>
		<td>
			<input type="text" name="downloads[{{ DownloadId|raw }}][downmaxdownloads]" id="DownloadMaxDownloads{{ DownloadId|raw }}" class="Field40" value="{{ MaxDownloads|raw }}" />
			<img onmouseout="HideHelp('dldownloads{{ DownloadId|raw }}');" onmouseover="ShowHelp('dldownloads{{ DownloadId|raw }}', '{% lang 'MaximumDownloads' %}', '{% lang 'MaximumDownloadsHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
			<div style="display:none" id="dldownloads{{ DownloadId|raw }}"></div>
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