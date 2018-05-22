
<div id="" class="TotalRanges">
	{% lang 'ByTotalRowStart' %} {{ CurrencyTokenLeft|raw }} <input type="text" name="shipping_bytotal[lower_{{ POS|raw }}]" value="{{ LOWER_VAL|raw }}" id="lower_{{ POS|raw }}" class="Field50 TotalRange LowerRange"> {{ CurrencyTokenRight|raw }}
	{{ TotalMeasurement|raw }} {% lang 'ByTotalRowMiddle' %} {{ CurrencyTokenLeft|raw }} <input type="text" name="shipping_bytotal[upper_{{ POS|raw }}]" value="{{ UPPER_VAL|raw }}" id="upper_{{ POS|raw }}" class="Field50 TotalRange UpperRange"> {{ CurrencyTokenRight|raw }}
	{{ TotalMeasurement|raw }} {% lang 'ByTotalRowEnd' %}
	{{ CurrencyTokenLeft|raw }} <input type="text" name="shipping_bytotal[cost_{{ POS|raw }}]" value="{{ COST_VAL|raw }}" id="cost_{{ POS|raw }}" class="Field50 TotalRange RangeCost"> {{ CurrencyTokenRight|raw }}
	<a href="#" onclick="AddTotalRange(this.parentNode); return false;" class="add">Add</a>
	<a href="#" onclick="RemoveTotalRange(this.parentNode); return false;" class="remove">Remove</a>
</div>
