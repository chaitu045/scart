{% import "macros/category.tpl" as category %}

{% lang 'PERCENTOFFITEMSINCATget' %}
<input name="var_amount" class="discountFirst Field20" id="amount" size="3" maxlength="3" value="{{ var_amount|raw }}"></input>
{% lang 'PERCENTOFFITEMSINCAToff' %}

{% lang 'PERCENTOFFITEMSINCATincart' %}

<div id="usedforcatdiv" style="padding-left:25px">
	<div id="var_catids" class="categoryPicker Field300"></div>
</div>

<script type="text/javascript" src="../javascript/jquery/plugins/jstree/jquery.jstree.js?{{ JSCacheToken }}"></script>
<script type="text/javascript">

		$(document).ready(function() {
			{{ category.categoryPicker("var_catids", CategoryOptions, true, selectedCategories) }}
		});
</script>