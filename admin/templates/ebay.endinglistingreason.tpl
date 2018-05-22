<div class="EndingItemReasonBox ISSelect" style="width:468px;height:134px;">
	<ul>
		{% for key in endReasons|keys %}
		<li>
			<label for="endReasons_{{ key|raw }}">
				<input type="radio" name="endReasons" id="endReasons_{{ key|raw }}" value="{{ key|raw }}" />
				{{ endReasons[key] }}
			</label>
		</li>
		{% endfor %}
	</ul>
</div>
