{% import "macros/util.tpl" as util %}
		<table class="GridPanel SortableGrid AutoExpand" cellspacing="0" cellpadding="0" border="0" id="IndexGrid" style="width:100%;">
			<tr align="right">
				<td colspan="12" style="padding:6px 0px 6px 0px" class="PagingNav">
					{{ util.paging(numOrders, perPage, currentPage, pageURL, true) }}
				</td>
			</tr>
			<tr class="Heading3">
				<td align="center"><input type="checkbox" onclick="ToggleDeleteBoxes(this.checked)"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td nowrap>
					{% lang 'OrderId' %} &nbsp;
					{{ SortLinksId|raw }}
				</td>
				<td colspan="{{ CustomerNameSpan|raw }}">
					{% lang 'Customer' %} &nbsp;
					{{ SortLinksCust|raw }}
				</td>
				<td nowrap>
					{% lang 'Date' %} &nbsp;
					{{ SortLinksDate|raw }}
				</td>
				<td>
					{% lang 'Status' %} &nbsp;
					{{ SortLinksStatus|raw }}
				</td>
				<td style="text-align: center; display: {{ HideOrderMessages|raw }}" nowrap>
					{% lang 'NewMessages' %} &nbsp;
					{{ SortLinksMessage|raw }}
				</td>
				<td style="width:80px; text-align: center;">
					{% lang 'Total' %} &nbsp;
					{{ SortLinksTotal|raw }}
				</td>
				<td>&nbsp;</td>
				<td style="display: {{ HideCountry|raw }}">
					&nbsp;
				</td>
				<td style="width:100px">
					{% lang 'Action' %}
				</td>
			</tr>
			{{ OrderGrid|raw }}
			{% if viewDeletedOrdersUrl %}
				<tr class="GridRow orderGridDeletedNotice">
					<td colspan="12">
						{% lang 'DeletedOrdersMatchedYourSearch' with {
							'viewDeletedOrdersUrl': viewDeletedOrdersUrl
						} %}
					</td>
				</tr>
			{% endif %}
			<tr align="right">
				<td colspan="12" style="padding:6px 0px 6px 0px" class="PagingNav">
					{{ util.paging(numOrders, perPage, currentPage, pageURL, true) }}
				</td>
			</tr>
		</table>
		<input type="hidden" id="CurrentPage" name="CurrentPage" value="{{ CurrentPage|raw }}" />
