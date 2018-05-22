			<table class="GridPanel SortableGrid" cellspacing="0" cellpadding="0" border="0" id="IndexGrid" style="width:100%;">
				<tr align="right">
					<td colspan="9" class="PagingNav" style="padding:6px 0px 6px 0px">
						{{ Nav|raw }}
					</td>
				</tr>
			<tr class="Heading3">
				<td align="center"><input type="checkbox" onclick="ToggleDeleteBoxes(this.checked)"></td>
				<td>&nbsp;</td>
				<td>
					{% lang 'BrandName' %} &nbsp;
					{{ SortLinksBrand|raw }}
				</td>
				<td>
					{% lang 'Products' %} &nbsp;
					{{ SortLinksProducts|raw }}
				</td>
				<td style="width:100px;">
					{% lang 'Action' %}
				</td>
			</tr>
			{{ BrandGrid|raw }}
			<tr align="right">
				<td colspan="9" class="PagingNav" style="padding:6px 0px 6px 0px">
					{{ Nav|raw }}
				</td>
			</tr>
		</table>