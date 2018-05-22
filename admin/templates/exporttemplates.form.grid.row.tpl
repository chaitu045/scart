<li id="ele-{{ FieldID|raw }}" class="SortableRow{{ TypeName|raw }} SortableRow" style="margin-left: 0px;">
	<table class="GridPanel" cellspacing="0" cellpadding="0" border="0" style="width:100%;">
		<tr class="GridRow" id="row_{{ FieldID|raw }}" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
			<td align="center" style="width: {{ CheckColWidth|raw }}px; {{ CheckAlign|raw }}">
				{{ NodeJoin|raw }}
				<input type="checkbox" name="{{ FieldType|raw }}Field[{{ FieldID|raw }}]" id="{{ FieldID|raw }}" {{ FieldChecked|raw }} value="1" />
			</td>
			<td class="DragMouseDown sort-handle {{ FieldLabelClass|raw }}" style="width: 155px; {{ CheckAlign|raw }}" id="label_{{ FieldID|raw }}">
				{{ FieldLabel|raw }}:
			</td>
			<td id="headercol_{{ FieldID|raw }}">
				<input type="text" class="Field200 {{ FieldClass|raw }}" id="header_{{ FieldID|raw }}" name="{{ FieldType|raw }}Header[{{ FieldID|raw }}]" value="{{ FieldHeader|raw }}" maxlength="63" {{ FieldReadOnly|raw }}/>
				{{ FieldHelp|raw }}
				{{ SubFields|raw }}
			</td>
		</tr>
	</table>
</li>