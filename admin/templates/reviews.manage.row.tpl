
	<tr class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
		<td align="center" style="width:18px"><input type="checkbox" name="reviews[]" value="{{ ReviewId|raw }}"></td>
		<td align="center" style="width:18px;">
			<img src='images/review.gif' width="20" height="20" />
		</td>
		<td class="{{ SortedFieldReviewClass|raw }}">
			{{ ReviewTitle|raw }}
		</td>
		<td class="{{ SortedFieldNameClass|raw }}">
			<a href="{{ ProdLink|raw }}" target="_blank">{{ ProdName|raw }}</a>
		</td>
		<td class="{{ SortedFieldRatingClass|raw }}">
			{{ Rating|raw }}
		</td>
		<td class="{{ SortedFieldByClass|raw }}">
			{{ PostedBy|raw }}
		</td>
		<td class="{{ SortedFieldDateClass|raw }}">
			{{ Date|raw }}
		</td>
		<td class="{{ SortedFieldStatusClass|raw }}">
			{{ Status|raw }}
		</td>
		<td>
			{{ PreviewLink|raw }}&nbsp;&nbsp;&nbsp;
			{{ EditLink|raw }}
		</td>
	</tr>