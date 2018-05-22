<div class="TemplateBox {{ TemplateInstalledClass|raw }} {{ CurrentTemplateClass|raw }} TemplateId_{{ TemplateId|raw }}">
	<div class="TemplateHeading">
			<span class="TemplateName">{{ TemplateName|raw }}</span> - <span class="TemplateColor">{{ TemplateColor|raw }}</span>
	</div>
	<a href="{{ TemplatePreviewFull|raw }}" class="TplPreviewImage" title="{% lang 'PreviewLargeImage' %}">
		<img class="TemplatePreviewThumb" src="{{ TemplatePreviewThumb|raw }}" alt="{{ TemplateName|raw }} - {{ TemplateColor|raw }}" />
	</a>
	<a href="#" class="ActivateLink" title="{{ TemplateName|raw }} - {{ TemplateColor|raw }}">{% lang 'ApplyThisTemplate' %}</a>
</div>