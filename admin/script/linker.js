var StoreLinker = {
	path: '',
	mode: 'tinymce',
	selectedItem: "",
	timeout: '',
	currentItemId: 0,

	init: function () {
		StoreLinker.setPath();

		StoreLinker.load_categories();
	},

	setPath: function() {
		StoreLinker.path = config.ShopPath + '/admin';
	},

	load_list: function (list, dataType, mdata) {
		if (jQuery.trim($("#" + list).html()) != "") {
			return;
		}

		$.ajax({
			type: 'get',
			url: StoreLinker.path + '/remote.php?remoteSection=linker&w=search&d=' + dataType,
			data: mdata,
			global: false,
			success: function(data) {
				var result_list = document.createElement('UL');
				$("#" + list).append(result_list);

				$(data).find('result').each(function(i){
					var newItem = document.createElement('li');
					newItem.index = i;
					newItem.onclick =  function(e) {
						StoreLinker.select_item(this);
					}
					newItem.innerHTML = "<img src=\"" + StoreLinker.path + "/" + $(this).attr('icon') + "\" style=\"vertical-align: middle\" />&nbsp;" + $(this).attr('title');
					newItem.title = $(this).attr('title');
					newItem.id = $(this).attr('id');
					if ($(this).attr('catid') != undefined) {
						newItem.id = list +  "_" + $(this).attr('catid');
					}
					newItem.insertable = $(this).text();
					result_list.appendChild(newItem);
					if ($(this).attr('padding') != undefined) {
						newItem.style.paddingLeft = $(this).attr('padding') + 'px';
					}
				});
			}
		});
	},

	load_categories: function() {
		// load category data
		$("#ProductByCategoryList, #CategoryList").jstree({
			"json_data" : {
				"ajax" : {
					"url" : config.ShopPath + "/admin/remote.php?remoteSection=categories&w=getChildCategoriesJSON",
					"data" : function (n) {
						var selectedCategoryId = 0;
						if (n.attr) {
							selectedCategoryId = n.data('id');
						}

						var data = {
							selectedCategoryId: selectedCategoryId,
							includeLink: 1
						};

						return data;
					},
					global: false
				}
			},
			"ui" : {
				"select_limit" : 1
			},
			"themes" : {
				"theme" : "interspire",
				"url" : config.ShopPath + "/javascript/jquery/plugins/jstree/themes/interspire/style.css"
			},
			"plugins" : [ "themes", "json_data", "ui" ]
		});

		// binding for selecting a 'Link to Product' category item
		$("#ProductByCategoryList")
			.bind("select_node.jstree", function(event, data) {
				$("#ProductByKeywordList").html('');

				// load the products for the selected category
				var categoryId = data.inst.get_selected().data("id");

				StoreLinker.load_list('ProductByKeywordList', 'products', 'category=' + categoryId);
			})
			.bind("open_node.jstree", function(event, data) {
				// scroll the picker to the node when expanding it
				var x = data.rslt.obj.get(0).offsetTop;
				$("#ProductByCategoryList").scrollTop(x);
			});

		// binding for selecting a 'Link to Category' item
		$("#CategoryList")
			.bind("select_node.jstree", function(event, data) {
				var node = data.inst.get_selected();

				// store selected item
				StoreLinker.selectedItem = {
					'href': node.data('link'),
					'title': node.attr('title'),
					'id': node.data('id'),
					'datatype': 'category'
				};
			})
			.bind("open_node.jstree", function(event, data) {
				// scroll the picker to the node when expanding it
				var x = data.rslt.obj.get(0).offsetTop;
				$("#CategoryList").scrollTop(x);
			});
	},

	select_item: function (element) {
		$(element).siblings(".selected").removeClass("selected");
		$(element).addClass("selected");

		var parentListId = $(element).parents("div").attr("id");
		var dataType = 'product';
		var id = $(element).attr('id');

		switch(parentListId) {
			case 'BrandList':
				dataType = 'brand';
				break;
			case 'PageList':
				dataType = 'page';
				break;
		}

		StoreLinker.selectedItem = {
			'href': element.insertable,
			'title': $(element).attr('title'),
			'id': id,
			'datatype': dataType
		};
	},

	insertLink: function () {
		if (StoreLinker.selectedItem == "") {
			return;
		}

		var title = '';

		// is text selected?
		if (tinyMCE.activeEditor.selection.getContent()) {
			// delete the selection
			title = tinyMCE.activeEditor.selection.getContent();
			tinyMCE.activeEditor.selection.setContent('');
		}
		else {
			title = StoreLinker.selectedItem.title;
		}

		// Insert the link to the editor
		tinyMCEPopup.editor.execCommand('mceInsertContent', false, '<a href="' + StoreLinker.selectedItem.href + '">' + title + '</a>');

		tinyMCEPopup.close();
	},

	setSearchTimeout: function () {
		if (StoreLinker.timeout) {
			clearTimeout(StoreLinker.timeout);
		}

		StoreLinker.timeout = setTimeout("StoreLinker.searchProducts()", 1000);
	},

	searchProducts: function () {
		if ($("#productName").val() != "" && $("#productName").val().length > 2) {
			$("#ProductByKeywordList").html("");
			// load products by search term
			StoreLinker.load_list('ProductByKeywordList', 'products', 'searchQuery=' + $("#productName").val());

		}
		else {
			$("#ProductByKeywordList").html(lang.Linker_enter_terms);
		}
	},

	openModal: function (id, tabs) {
		StoreLinker.currentItemId = id;
		StoreLinker._openModal(StoreLinker.onModalClose, tabs);
	},

	_openModal: function(onBeforeCloseFunction, tabs) {
		var options = {
			type: 'ajax',
			url: 'remote.php?remoteSection=linker&w=loadLinker',
			onShow: function() {
				StoreLinker.init();
			},
			onBeforeClose: onBeforeCloseFunction,
			top: '10px'
		};

		if (typeof tabs != 'undefined') {
			options.url += '&tabs=' + encodeURIComponent(tabs);
		}

		$.iModal(options);
	},

	onModalClose: function () {
		var id = StoreLinker.currentItemId;
		if(typeof  StoreLinker.selectedItem.id == 'undefined') {
			return;
		}

		$('#RedirectType_' + id).val('auto');

		var postData = {
			'redirectid': id,
			'newid': StoreLinker.selectedItem.id,
			'datatype': StoreLinker.selectedItem.datatype
		};

		$.ajax({
			type: 'POST',
			url: 'remote.php?remoteSection=redirects&w=savelinkbyid',
			data: postData,
			dataType: 'json',
			success: function(json) {
				if(!json.success) {
					alert(json.message);
					return;
				}

				if(typeof json.tmpredirectid != 'undefined') {
					Redirects.updateRowId(json.tmpredirectid, json.redirectid);
				}

				$('#RedirectAutoURL_Link_' + json.redirectid).show().html('<a href="' + json.url + '" target="_blank">' + json.title + '</a>');
				$('#linkerButton_' + json.redirectid).html(lang.ChangeLink);
			}
		});
	},

	ShowTab: function(T, prefix)
	{

		if(typeof prefix == 'undefined') {
			prefix = 'linker_';
		}

		if(T==='' || $('#' + prefix + 'div_'+T).length <= 0 || $('#' + prefix + 'tab_'+T).length <= 0) {
			return false;
		}

		var activeTab = $('#' + prefix + 'tabnav .active');
		var tabName = activeTab.attr('id').replace(prefix + 'tab_', '');
		activeTab.removeClass('active');
		$('#' + prefix + 'div_'+tabName).hide();
		$('#' + prefix + 'div_'+T).show();
		$('#' + prefix + 'tab_'+T).addClass('active');
		$('#' + prefix + 'currentTab').val(T);
	}
}
