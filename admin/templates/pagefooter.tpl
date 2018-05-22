		{{ GettingStartedStep|raw }}
	</div>
	<div class="PageFooter" style="text-align: right;">
		{{ DebugDetails|raw }}
		{{ AdminCopyright|raw }}
	</div>
</div>

{% for script in bodyScripts %}
	<script type="text/javascript" src="{{ script }}?{{ JSCacheToken }}"></script>
{% endfor %}

{{ taskManagerScript|raw }}
{% include 'idletimer.javascript.tpl' %}
</body>
</html>
