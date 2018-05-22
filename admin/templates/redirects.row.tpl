<tr id="RedirectRow_{{ RedirectId|raw }}" class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
	<td align="center" style="width:25px">
		<input type="checkbox" name="redirects[]" value="{{ RedirectId|raw }}" id="RedirectCheckbox_{{ RedirectId|raw }}" class="RedirectCheckbox">
	</td>
	<td align="center" style="width:20px">
		<img src="images/redirects.png" alt="product" height="16" width="16" />
	</td>
	<td>
		<div style="width:100%;"><input id="oldUrl_{{ RedirectId|raw }}" name="oldUrl[{{ RedirectId|raw }}]" class='RedirectCurrentUrl inPlaceFieldDefault' value="{{ OldURL|raw }}" /></div>
	</td>

	<td style="width:80px;">
		<select id="RedirectType_{{ RedirectId|raw }}" class="RedirectType">
			<option value="auto" {{ RedirectTypeAutoSelected|raw }}>{% lang 'RedirectTypeAuto' %}</option>
			<option value="manual" {{ RedirectTypeManualSelected|raw }}>{% lang 'RedirectTypeManual' %}</option>
		</select>
	</td>
	<td>
		<div class="RedirectAutoURL" id="RedirectAutoURL_{{ RedirectId|raw }}" style="{{ RedirectTypeAutoDisplay|raw }}">
			<span id="RedirectAutoURL_Link_{{ RedirectId|raw }}" class="RedirectAutoURL_Link"><a href="{{ NewURL|raw }}" target="_blank">{{ NewURLTitle|raw }}</a></span>
			<a href="javascript:void(0);" class="linkerButton" id="linkerButton_{{ RedirectId|raw }}">{{ LinkerTitle|raw }}</a>
		</div>

		<div class="RedirectManualURL" id="RedirectManualURL_{{ RedirectId|raw }}"  style="width:100%; {{ RedirectTypeManualDisplay|raw }}"><input id="newUrl_{{ RedirectId|raw }}" name="newUrl[{{ RedirectId|raw }}]" class='inPlaceFieldDefault RedirectNewUrl' value="{{ NewURL|raw }}" /></div>
	</td>

	<td style="width:30px;">
		<div id="RedirectActions_{{ RedirectId|raw }}" style="{{ RedirectActionsDisplay|raw }}">
			<a title='{% lang 'Test' %}' class="Action TestLink" href='{{ RedirectTestLink|raw }}' target="_blank" id="TestLink_{{ RedirectId|raw }}" >{% lang 'Test' %}</a>&nbsp;<a title='{% lang 'Copy' %}' class="Action CopyLink" href='#' id="CopyLink_{{ RedirectId|raw }}" >{% lang 'Copy' %}</a>&nbsp;<a title='{% lang 'Delete' %}' class="Action DeleteLink" href='#' id="DeleteLink_{{ RedirectId|raw }}" >{% lang 'Delete' %}</a>
		</div>
	</td>
</tr>
