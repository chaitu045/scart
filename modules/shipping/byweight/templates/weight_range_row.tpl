
<div id="" class="WeightRanges">
	{% lang 'ByWeightRowStart' %} <input type="text" name="shipping_byweight[lower_{{ POS|raw }}]" value="{{ LOWER_VAL|raw }}" id="lower_{{ POS|raw }}" class="Field50 WeightRange LowerRange">
	{{ WeightMeasurement|raw }} {% lang 'ByWeightRowMiddle' %} <input type="text" name="shipping_byweight[upper_{{ POS|raw }}]" value="{{ UPPER_VAL|raw }}" id="upper_{{ POS|raw }}" class="Field50 WeightRange UpperRange">
	{{ WeightMeasurement|raw }} {% lang 'ByWeightRowEnd' %}
	{{ CurrencyTokenLeft|raw }} <input type="text" name="shipping_byweight[cost_{{ POS|raw }}]" value="{{ COST_VAL|raw }}" id="cost_{{ POS|raw }}" class="Field50 WeightRange RangeCost"> {{ CurrencyTokenRight|raw }}
	<a href="#" onclick="AddWeightRange(this.parentNode); return false;" class="add">Add</a>
	<a href="#" onclick="RemoveWeightRange(this.parentNode); return false;" class="remove">Remove</a>
</div>
