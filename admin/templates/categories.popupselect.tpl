{% import "macros/category.tpl" as category %}
<style type="text/css">
	@import url("Styles/new.css?{{ JSCacheToken }}");
</style>
<script type="text/javascript" src="../javascript/jquery/plugins/jstree/jquery.jstree.js?{{ JSCacheToken }}"></script>
<script type="text/javascript">//<![CDATA[

var CategorySelect = {
	onSelectCallback: {{ onSelectCallback|raw }},

	callbackArgs: {{ callbackArgs|raw }},

	SelectItem: function(inst, node) {
		if (CategorySelect.onSelectCallback === null) {
			return;
		}

		var categoryId = node.data("id");
		var catPath = node.attr('title');


		while (node = inst._get_parent(node)) {
			if (node == -1) {
				break;
			}
			catPath = node.attr('title') + ' > ' + catPath;
		}

		CategorySelect.onSelectCallback(CategorySelect.callbackArgs, categoryId, catPath);
	},

	ButtonClose: function() {
		if(!window.opener) {
			self.parent.tb_remove();
		}
		else {
			window.opener.focus();

			window.close();
		}
	}
};

$(document).ready(function() {
	{{ category.categoryPicker("CategorySelect", categories, false) }}

	$("#CategorySelect")
		.bind("select_node.jstree", function(event, data) {
			// load the products for the selected category
			var node = data.rslt.obj;

			CategorySelect.SelectItem(data.inst, node);
		})
		.bind("open_node.jstree", function(event, data) {
			// scroll the picker to the node when expanding it
			var x = data.rslt.obj.get(0).offsetTop;
			$("#CategorySelect").scrollTop(x);
		});
});

//]]></script>
<form style="margin: 0; padding: 0;" onsubmit="return false;">
	<table class="OuterPanel">
	  <tr>
		<td class="Heading1" id="tdHeading">{% lang 'SelectCategory' %}</td>
	  </tr>
	  <tr>
		<td class="Intro">
			<div id="LoadingIndicator" style="display: none; font-size: 11px; padding-bottom:10px; position:absolute; right: 10px; top:15px; ">
				<img src="images/ajax-loader.gif" align="left" />&nbsp; <div style="display:inline; background-color:#FCF5AA; padding:5px">{% lang 'LoadingPleaseWait' %}</div>
			</div>
			{% lang 'SelectCategoryIntro' %}
		</td>
	  </tr>
	  <tr>
		<td>
			<div id="CategorySelect" class="categoryPicker" style="height: 200px;"></div>

			<div id="ButtonRow" style="margin-top: 15px;">
				<input type="button" class="FormButton Field100" value="{% lang 'Select' %}"  onclick="CategorySelect.ButtonClose();" />
			</div>
		</td>
	</tr>
	</table>
</form>