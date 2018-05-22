			<table class="GridPanel SortableGrid" cellspacing="0" cellpadding="0" border="0" id="IndexGrid" style="width:100%;">
				<tr align="right">
					<td colspan="9" style="padding:6px 0px 6px 0px" class="PagingNav">
						{{ Nav|raw }}
					</td>
				</tr>
			<tr class="Heading3">
				<td align="center" style="width:18px"><input type="checkbox" onclick="ToggleDeleteBoxes(this.checked)"></td>
				<td>&nbsp;</td>
				<td style="width:25%">
					{% lang 'ReviewTitle' %} &nbsp;
					{{ SortLinksReview|raw }}
				</td>
				<td>
					{% lang 'Product' %} &nbsp;
					{{ SortLinksName|raw }}
				</td>
				<td>

					{% lang 'Rating' %} &nbsp;
					{{ SortLinksRating|raw }}
				</td>
				<td>
					{% lang 'PostedBy' %} &nbsp;
					{{ SortLinksBy|raw }}
				</td>
				<td>
					{% lang 'Date' %} &nbsp;
					{{ SortLinksDate|raw }}
				</td>
				<td style="width:70px">
					{% lang 'Status' %} &nbsp;
					{{ SortLinksStatus|raw }}
				</td>
				<td style="width:80px">
					{% lang 'Action' %}
				</td>
			</tr>
			{{ ReviewGrid|raw }}
			<tr align="right">
				<td colspan="9" style="padding:6px 0px 6px 0px" class="PagingNav">
					{{ Nav|raw }}
				</td>
			</tr>
		</table>
		<a href="?searchQuery={{ Query|raw }}&amp;page={{ Page|raw }}{{ SortURL|raw }}" id="ReviewSortURL"></a>