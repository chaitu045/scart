{% import "macros/category.tpl" as category %}
<style type="text/css">
	@import url("Styles/iselector.css?{{ JSCacheToken }}");
	@import url("Styles/new.css?{{ JSCacheToken }}");
</style>
<script type="text/javascript" src="../javascript/iselector.js?{{ JSCacheToken }}"></script>
<script type="text/javascript" src="../javascript/jquery/plugins/jstree/jquery.jstree.js?{{ JSCacheToken }}"></script>
<script type="text/javascript">//<![CDATA[
var current_category = "0";

var ProductSelect = {
	selectedItems: new Array(),
	selectedItemsCSV: '',
	selectCallback: null,
	closeCallback: null,
	removeCallback: null,
	getSelectedCallback: null,
	resultSet: new Array(),

	OnClick: function(element) {
		if(element.selected == true) {
			ProductSelect.AddToSelect(element.value, element.firstChild.nodeValue);
		}
		else {
			ProductSelect.RemoveFromSelect(element.value);
		}
	},

	RemoveFromSelect: function(id) {
		if(ProductSelect.removeCallback === null) {
			alert('Callback not specified');
			return false;
		}

		ProductSelect.removeCallback('{{ ParentProductSelect|raw }}', '{{ ParentProductList|raw }}', id);
	},

	AddToSelect: function(id, name) {
		if(ProductSelect.selectCallback === null) {
			alert('Callback not specified');
			return false;
		}

		product = ProductSelect.resultSet[id];
		ProductSelect.selectCallback('{{ ParentProductSelect|raw }}', '{{ ParentProductList|raw }}', product, {{ ProductSelectSingle|raw }});
	},

	ButtonClose: function() {
		if(!window.opener) {
			self.parent.tb_remove();
		}
		else {
			window.opener.focus();
			if(ProductSelect.closeCallback) {
				ProductSelect.closeCallback('{{ ParentProductSelect|raw }}');
			}
			else if('{{ FocusOnClose|raw }}' != '') {
				window.opener.document.getElementById('{{ FocusOnClose|raw }}').focus();
			}
			window.close();
		}
	},

	GetSelectedItems: function() {
		ProductSelect.selectedItems = new Array();
		ProductSelect.selectedItemsCSV = '';

		if(ProductSelect.getSelectedCallback === null) {
			return;
		}

		ProductSelect.selectedItemsCSV = ProductSelect.getSelectedCallback('{{ ParentProductSelect|raw }}');
		ProductSelect.selectedItems = ProductSelect.selectedItemsCSV.split(',');
	},

	LoadLinks: function(id) {
		var searchParams = '';

		if($('#searchQuery').val() != '') {
			searchParams += '&searchQuery='+encodeURIComponent($('#searchQuery').val());
		}

		if(id) {
			searchParams += '&'+id;
		}

		$('#LoadingIndicator').show();
		// Fetch the results
		$.ajax({
			url: 'remote.php?w=popupProductSearch&'+searchParams,
			dataType: 'xml',
			success: ProductSelect.LinksLoaded,
			error: ProductSelect.LinksLoaded
		});
	},

	onSelectChange: function()
	{
		var element = document.getElementById('prodSelect').options[document.getElementById('prodSelect').selectedIndex];
		ProductSelect.OnClick(element);
	},

	LinksLoaded: function(xml) {
		var status = $('status', xml).text();
		ProductSelect.resultSet = new Array();
		if(status == 0) {
			var message = $('message', xml).text();
			$('#results').html('<div class="BigError">'+message+'</div>');
		}
		else {
			var results = $('results', xml).text();

			if({{ ProductSelectSingle|raw }} == 1) {
				$('#results').html('<select style="width: 320px;" size="11" name="products" id="prodSelect" onchange="ProductSelect.onSelectChange()"></select>');
			}
			else {
				$('#results').html('<select style="width: 316px; height: 166px;" multiple="multiple" name="products" id="prodSelect" class="ISSelectReplacement"></select>');
			}

			$('product', xml).each(function() {
				productId = $('productId', this).text();
				productName = $('productName', this).text();
				ProductSelect.resultSet[productId] = {
					id: productId,
					name: productName,
					price: $('productPrice', this).text(),
					type: $('productType', this).text(),
					code: $('productCode', this).text(),
					isConfigurable: $('productConfigurable', this).text()
				};
				$('<option>')
					.val(productId)
					.html(productName)
					.click(function() {
						ProductSelect.OnClick(this);
					})
					.attr('id', 'select_product_'+productId)
					.appendTo('#prodSelect')
				;
			});

			// Mark any selected items
			ProductSelect.GetSelectedItems();
			for(var i=0; i<ProductSelect.selectedItems.length;i++) {
				if($('#select_product_'+ProductSelect.selectedItems[i])) {
					$('#select_product_'+ProductSelect.selectedItems[i]).attr('selected', true);
				}
			}
			if({{ ProductSelectSingle|raw }} == 0) {
				ISSelectReplacement.replace_select(g('prodSelect'));
			}
		}
		// Hide loading indicator
		$('#LoadingIndicator').hide();
	}

};

function doSearch() {
	ProductSelect.LoadLinks("category=" + current_category);
}

$(document).ready(function() {
	var searchTimer = 0;

	$("#searchQuery").keyup(function() {
		if (searchTimer) {
			clearTimeout(searchTimer);
		}

		var value = $.trim($(this).val());
		if (value.length < 3) {
			return;
		}

		searchTimer = setTimeout("doSearch()",700);
	});

	{{ category.categoryPicker("CategorySelect", categories, false) }}

	$("#CategorySelect")
		.bind("select_node.jstree", function(event, data) {
			// load the products for the selected category
			var categoryId = data.inst.get_selected().data("id");

			var loadString = "";

			if (categoryId) {
				loadString = "category=" + categoryId;
			}

			ProductSelect.LoadLinks(loadString);
		})
		.bind("open_node.jstree", function(event, data) {
			// scroll the picker to the node when expanding it
			var x = data.rslt.obj.get(0).offsetTop;
			$("#CategorySelect").scrollTop(x);
		});
});

{{ Callbacks|raw }}
//]]></script>
<form id="ProductSelect" style="margin: 0; padding: 0;" onsubmit="return false;">
	<table class="OuterPanel" style="position: relative;">
	  <tr>
		<td class="Heading1" id="tdHeading">{% lang 'SelectProducts' %}</td>
	  </tr>
	  <tr>
		<td class="Intro">
			<div id="LoadingIndicator" style="display: none; font-size: 11px; padding-bottom:10px; position:absolute; right: 10px; top:15px; ">
				<img src="images/ajax-loader.gif" align="left" />&nbsp; <div style="display:inline; background-color:#FCF5AA; padding:5px">{% lang 'LoadingPleaseWait' %}</div>
			</div>
			{% lang 'SelectProductsIntro' %}
		</td>
	  </tr>
	  <tr>
		<td>
			<table class="Panel">
			  <tr>
				<td class="Heading2">&nbsp;&nbsp; {% lang 'ProductSelectByCategory' %}</td>
			  </tr>
				<tr>
					<td>
					<div id="CategorySelect" class="categoryPickerPopup"></div>
					</td>
				</tr>
			</table>
			<table class="Panel">
				<tr>
					<td class='Heading2'>&nbsp;&nbsp;{% lang 'ProductSelectSearch' %}</td>
				</tr>
				<tr>
					<td><input type='text' name='searchQuery' id='searchQuery' class='Field250' style='width: 100%' /></td>
				</tr>
			</table>

			<input type='hidden' name='subCats' value='0' />
			<div id="results" class="ResultList">
			</div>
			<div id="ButtonRow" style="margin-top: 15px;">
				<input type="button" class="FormButton Field100" value="{% lang 'SelectAndClose' %}"  onclick="ProductSelect.ButtonClose();" />
			</div>
		</td>
	</tr>
	</table>
	<script type='text/javascript'>g('CategorySelect').previousItem = g('CategorySelect').firstChild; setTimeout(function() { ProductSelect.LoadLinks(); }, 10);</script>
</form>