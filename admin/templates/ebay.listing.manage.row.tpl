	<tr class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
		<td align="center">
			<input class="ItemCheckBox" type="checkbox" name="listings[]" value="{{ EbayItemId|raw }}">
		</td>
		<td>
			<img width="16" height="16" alt="product" src="images/ebay.gif">
		</td>
		<td class="ItemTitle">{{ Item|raw }}</td>
		<td>
			{{ DateListed|raw }}
		</td>
		<td class="{{ SortedFieldTypeClass|raw }}">
			{{ Type|raw }}
		</td>
		<td class="{{ SortedFieldStatusClass|raw }}">
		{% if Status == 'Pending' %}
			<span onmouseover="ShowQuickHelp(this, '{{ Status|raw }}', '{% lang 'PendingStatusHelp' %}');" onmouseout="HideQuickHelp(this);" class="OrangeHelpText">{{ Status|raw }}</span>
		{% else %}
			{{ Status|raw }}
		{% endif %}
		</td>
		<td class="{{ SortedFieldQuantityRemainingClass|raw }}" align="center">
			{{ QuantityRemaining|raw }}
		</td>
		<td class="{{ SortedFieldBidCountClass|raw }}">
			{{ BidCount|raw }}
		</td>
		<td class="{{ SortedFieldCurrentPriceClass|raw }}" align="right">
			{{ CurrentPrice|raw }}
		</td>
		<td class="{{ SortedFieldBinPriceClass|raw }}" align="right">
			{{ BinPrice|raw }}
		</td>
		<td class="{{ SortedFieldOrderNumberClass|raw }}" align="center">
			{% if OrderNumber%}
				<a id="OrderLink" href="index.php?ToDo=viewOrders&ebayItemId={{ EbayItemId|raw }}">{{ OrderNumber|raw }}</a>
			{% else %}
				{% lang 'NA' %}
			{% endif %}
		</td>
		<td>
			<a id="RemoveListing" class="removeListing" title="{% lang 'RemoveListingRef' %}" href="index.php?ToDo=deleteLocalEbayListing&listings={{ EbayItemId|raw }}">{% lang 'Remove' %}</a>
			<a id="CancelListing"  class="cancelListing" title="{% lang 'EndListingFromEbayRef' %}" href="#">{% lang 'EndListing' %}</a>
		</td>
	</tr>
