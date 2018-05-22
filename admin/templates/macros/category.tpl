{% macro categoryPicker(elementId, data, checkboxes, selected, categoryId, getNoParentNode) %}
	$("#{{ elementId }}").jstree({
		json_data: {
			{% if data %}
			data: [
				{{ data|raw }}
			],
			{% endif %}
			ajax: {
				url: "remote.php?remoteSection=categories&w=getChildCategoriesJSON",
				data: function (n) {
					var selectedCategoryId = 0;
					if (n.attr) {
						selectedCategoryId = n.data('id');
					}

					var data = {
						{% if categoryId %}categoryId: {{ categoryId }},{% endif %}
						selectedCategoryId: selectedCategoryId,
						prefix: '{{ elementId }}',
						noParentNode: {{ getNoParentNode|default(0) }}
					};

					return data;
				},
				global: false
			}
		},
		ui: {
			{% if selected %}initially_select: [ '{{ selected|raw }}' ],{% endif %}
			select_limit: 1
		},
		themes: {
			theme: "interspire",
			url: config.ShopPath + '/javascript/jquery/plugins/jstree/themes/interspire/style.css'
		},
		{% if checkboxes %}
		checkbox: {
			two_state: true,
			override_ui: true,
			real_checkboxes: true,
			real_checkboxes_names: function(n) {
				return ["{{ elementId }}[]", n.data('id')];
			}
		},
		{% endif %}
		plugins: [ "themes", "json_data", "ui"{% if checkboxes %}, "checkbox"{% endif %} ]
	});
{% endmacro %}
