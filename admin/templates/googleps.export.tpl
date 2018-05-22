{% extends "ajax.export.tpl" %}

{% block intro %}
	<div id="froogleExportStep1">
		<p><strong>{% lang 'GoogleProductSearchTargetCountry' %}</strong></p>
		<div id="froogleExportStep1Warning" class="MessageBox MessageBoxInfo">{% lang 'GoogleProductSearchTargetCountryWarning' %}</div>
		<p><select id="googleProductSearchCountry" data-url-template="{{ ExportUrl }}" class="Field200">
			<option value="">-- {% lang 'ChooseACountry' %} --</option>
			{% for cc, country in countries %}
				<option value="{{ cc }}">{{ country }}</option>
			{% endfor %}
		</select></p>
	</div>
	<div id="froogleExportStep2" style="display:none;">
		<p>
			<strong>{% lang 'GoogleProductSearchTargetCountry' %}:</strong>
			<span id="froogleExportTargetCountry"></span> (<a href="#" class="onClickChangeFroogleTargetCountry">change</a>)
		</p>
		{{ parent() }}
	</div>
	<script language="javascript" type="text/javascript">//<![CDATA[
		$(function(){
			$('.onClickChangeFroogleTargetCountry').click(function(event){
				event.preventDefault();
				$('#googleProductSearchCountry').val('').change();
			});

			$('#googleProductSearchCountry').change(function(){
				var $this = $(this),
					value = $this.val(),
					text = $this.find('option:selected').text(),
					warning = $('#froogleExportStep1Warning'),
					step1 = $('#froogleExportStep1')
					step2 = $('#froogleExportStep2'),
					urlTemplate = $('#ajaxExportUrl').val();

				if (!value) {
					step2.hide(300);
					step1.fadeIn(300);
					return;
				}

				step1.hide();
				step2.fadeIn(300);
				var url = urlTemplate.replace(/:country_code/gi, value);

				$('#ajaxExportUrl').val(url);
				$('#froogleExportTargetCountry').text(text);
			});
		});
	//]]></script>
{% endblock %}

{% block getAjaxExportFrameUrl %}
	return 'index.php?ToDo=AjaxExport&exportsess={{ ExportSessionId|raw }}&action=Export&cc=' + $('#googleProductSearchCountry').val();
{% endblock %}
