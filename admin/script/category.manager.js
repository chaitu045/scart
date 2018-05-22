var gnode;
var CategoryManager = {
	/**
	* Initialises the category manager
	*/
	init: function() {
		$(".ExpandLink").live('click', function() {
			// ExpandLink_categoryId
			var categoryId = $(this).attr('id').substr(11);

			CategoryManager.expandCategory(categoryId);
		});

		$(".CollapseLink").live('click', function() {
			// ExpandLink_categoryId
			var categoryId = $(this).attr('id').substr(11);

			CategoryManager.collapseCategory(categoryId);
		});

		$('#optionGo').bind('click', function() {
			CategoryManager.performBulkAction();
		});

		$('#indexDeleteButton').bind('click', function() {
			CategoryManager.processStep1();
		});

		$('#deleteAllToggle').bind('click', function() {
			CategoryManager.toggleDeleteBoxes(this.checked);
		});

		$('#cancelStep1').live('click', function() {
			$.iModal.close();
		});

		$('#continueStep1').live('click', function() {
			CategoryManager.processStep2();
		});

		$('#cancelStep2').live('click', function() {
			$.iModal.close();
		});

		$('#continueStep2').live('click', function() {
			CategoryManager.processStep3();
		});

		$('#reassignOption1').live('change', function() {
			$('#parentidSelect').attr("disabled", false);
		});

		$('#reassignOption2').live('change', function() {
			$('#parentidSelect').attr("disabled", true);
		});

		CategoryManager.makeSortableList($("#CategoryList"));
	},

	performBulkAction: function() {
		var selected = $('select[name="bulk"] :selected');

		switch(selected.attr('class'))
		{
			case 'delete':
				CategoryManager.processStep1();
				break;
			case 'mapcategories':
				CategoryManager.mapCategories(selected.val());
				break;
			case 'googleps':
				CategoryManager.mapGoogleTaxonomy();
				break;
			default:
				break;
		}
	},

	mapCategories: function(moduleid) {
		var count = $('#frmCategories input:checked').length;
		if (count <= 0) {
			alert(lang.chooseCategoryToUpdate);
			return;
		}

		$.iModal({
			type: 'inline',
			inline: '#categorySelectModal',
			width: 905,
			height: 900
		});

		var name = this.getShoppingComparisonName(moduleid);

		$('#ModalContainer').categorySelector({
			getCategoriesURL: 'index.php?ToDo=getShoppingComparisonCategories&mid='+moduleid,
			title: lang.categorySelectModalTitle.replace(':name', name),
			intro: lang.categorySelectModalIntro.replace(':name', name),
			messages: {
				'leafCategorySelected' : lang.categorySelectLeafCategorySelected,
				'chooseLeafCategory' : lang.categorySelectChooseLeafCategory
			},
			success: function(cat){
				CategoryManager.bulkUpdateCategoryMappings(moduleid, cat);
			},
			cancel: function(){
				$.iModal.close()
			}
		});

		return;
	},

	bulkUpdateCategoryMappings: function(moduleid, category) {
		$.iModal.close();

		$.post(
			'index.php?ToDo=mapShoppingComparisonCategories'
				+ '&mid=' + moduleid
				+ '&categoryid=' + category['id']
				+ '&path=' + escape(category['path']),

			$("#frmCategories").serialize(),

			function(res) {
				window.location.reload();
			},

			'json');
	},

	getShoppingComparisonName: function(moduleid) {
		if(CategoryManager.shoppingComparisonModules
		&& CategoryManager.shoppingComparisonModules[moduleid])
			return CategoryManager.shoppingComparisonModules[moduleid].name;
	},

	/**
	 * Selection popup for bulk updating categories/Google Taxonomy mappings
	 */
	mapGoogleTaxonomy: function() {

		var count = $('#frmCategories input:checked').length;
		if (count <= 0) {
			alert(lang.chooseCategoryToUpdate);
			return;
		}

		$.iModal({
			type: 'inline',
			inline: '#googleps-selector',
			width: 905,
			height: 900
		});

		$('#ModalContainer').categorySelector({
			getCategoriesURL: 'index.php?ToDo=getGooglePsCategories',
			title: lang.ChooseGooglePsCategory,
			intro: lang.ChooseGooglePsCategoryIntro,
			categoryid: 0,
			messages: {
				'leafCategorySelected' : lang.googleCategorySelectLeafCategorySelected,
				'chooseLeafCategory' : lang.categorySelectChooseLeafCategory
			},
			success: function(cat){
				$.iModal.close();
				CategoryManager.bulkUpdateGoogleProductSearch(cat);
			},
			cancel: function(){
				$.iModal.close()
			}
		});
	},

	/**
	 * Handle bulk updates to map categories to Google Product Search taxonomy.
	 */
	bulkUpdateGoogleProductSearch: function(cat) {

		$.post(
				'index.php?ToDo=getGooglePsBulkUpdate'
					+ '&categoryid=' + cat['id']
					+ '&path=' + escape(cat['path']),

				$("#frmCategories").serialize(),

				function(res, data) {
					window.location.reload();
				},

				'json');
	},

	makeSortableList: function(list) {
		CreateSortableList();
	},

	/**
	* Expands a parent category and displays the child categories
	*/
	expandCategory: function(categoryId) {
		// load the child categories
		$.ajax({
			url: 'remote.php?remoteSection=categories&w=getChildCategories&catId=' + categoryId,
			dataType: 'html',
			success: function(data) {
				var catRow = CategoryManager.getCategoryRow(categoryId);
				$(catRow).find('table').after(data);

				CategoryManager.makeSortableList(CategoryManager.getChildCategories(categoryId));

				// scroll to the category
				$(document).scrollTop($(catRow).offset().top - 100);
			}
		});

		$("#ExpandLink_" + categoryId).find('img').attr('src', 'images/minus.gif');
		$("#ExpandLink_" + categoryId).removeClass('ExpandLink').addClass('CollapseLink');
	},

	/**
	* Collapses the child category rows for the specified parent category
	*/
	collapseCategory: function(categoryId) {
		var childCats = CategoryManager.getChildCategories(categoryId);
		if ($(childCats).length == 1) {
			//$(childCats).hide();
			$(childCats).remove();
			$("#ExpandLink_" + categoryId).find('img').attr('src', 'images/plus.gif');
			$("#ExpandLink_" + categoryId).removeClass('CollapseLink').addClass('ExpandLink');
		}
	},

	/**
	* Returns the list item object that contains the specified category object
	*
	* @return object
	*/
	getCategoryRow: function(categoryId) {
		return $("#ele-" + categoryId);
	},

	/**
	* Returns the list object that contains the child categories for the specified category
	*
	* @return object
	*/
	getChildCategories: function(categoryId) {
		return $("#ChildCats_" + categoryId);
	},

	/**
	* Retrieves the parent category row for the given child row
	*/
	getParentCategoryRow: function(categoryId) {
		// is this row a root category? return false;
		if ($("#ele-" + categoryId).parent().attr('id') == 'CategoryList') {
			return false;
		}

		return $("#ele-" + categoryId).parents('li');
	},

	toggleCategoryVisibility: function(categoryId) {
		// determine if this category is visible
		var visible = false;
		var catRow = CategoryManager.getCategoryRow(categoryId);
		var toggleLink = $('#CatVisible_' + categoryId);
		var toggleImg = toggleLink.find('img');
		if (toggleImg.attr('src') == 'images/tick.gif') {
			visible = true;
		}

		var confirmMessage = lang.categoryVisibleConfirmation;
		if(visible) {
			confirmMessage = lang.categoryInvisibleConfirmation;
		}

		if(confirm(confirmMessage)) {
			$.ajax({
				url: 'remote.php?remoteSection=categories&w=toggleCategoryVisiblity&catId=' + categoryId,
				dataType: 'json',
				success: function(data) {
					if(!data.success) {
						display_error('CategoriesStatus', data.message);
					}
					else {
						display_success('CategoriesStatus', data.message);

						if (data.visible) {
							var newTitle = lang.clickToHideCategory;
							var newImg = 'images/tick.gif';
						}
						else {
							var newTitle = lang.clickToShowCategory;
							var newImg = 'images/cross.gif';
						}

						for (var x in data.affected) {
							var catid = data.affected[x];
							$("#CatVisible_" + catid).attr('title', newTitle).find('img').attr('src', newImg);
						}
					}
				}
			});
		}
	},

	toggleDeleteBoxes: function(status) {
		$('#frmCategories input[type=checkbox]').each(function () {
			this.checked = status;
		});
	},

	/**
	 * "Delete Selected" button clicked.
	 *    1. if no cat selected, show alert.
	 *    2. if zero product under cat, show confirm delete.
	 *    3. otherwise, show modal with new cat selector.
	 */
	processStep1: function() {
		var count = $('#frmCategories input:checked').length;
		if (count > 0) {
			$.post('index.php?ToDo=getReassignCategoryStep1Data', $("#frmCategories").serialize(), function(res) {
				var prodCount = Number(res.prodCount);
				if (prodCount == 0) {
					// Case 2.
					if(confirm(lang.confirmDeleteCategories)) {
						$("#frmCategories").submit();
					}
				} else {
					// Case 3.
					CategoryManager.showStep1Modal(res);
					CategoryManager.data = res;
				}
			}, 'json');
		} else {
			// Case 1.
			alert(lang.chooseCategoryToDelete);
		}
	},

	/**
	 * "Continue >>" button clicked, show summary modal (step 2).
	 */
	processStep2: function() {
		var data = CategoryManager.data;

		var categoryId = 0;
		if ($('#reassignOption1').attr('checked')) {
			var node = $("#parentidSelect").jstree('get_selected');
			var categoryId = node.data('id');
			if (!categoryId) {
				alert(lang.pleaseSelectReassignCategory);
				return;
			}
		}

		var param = {
			reassign: $('#reassignOption1').attr('checked'),
			parentCat: categoryId
		};
		$.post('index.php?ToDo=getReassignCategoryStep2Data', param, function(res) {
			data.catLineage = res;
			data.parentCat = param.parentCat;
			data.reassign = param.reassign;
			CategoryManager.showStep2Modal(data);
			CategoryManager.data = data;
		});
	},

	/**
	 * "Delete Selectd Categories" button clicked (step 3).
	 */
	processStep3: function() {
		var data = CategoryManager.data;
		var processCategory = true;
		var param = {
			reassign: data.reassign,
			categories: data.categories,
			parentCat: data.parentCat
		};

		$.iModal.close();
		$.iModal({
			type: 'inline',
			inline: '#progressModal',
			width: 450
		});
		CategoryManager.updateCatReassignProgress(0);
		CategoryManager.startCategoriesReassign(processCategory, 0);
	},

	/**
	 * Show the reassign categories progression modal.
	 */
	startCategoriesReassign: function(isProcessCat, totalProd) {
		var data = CategoryManager.data;
		$.ajax({
			url: 'remote.php',
			type: 'post',
			dataType: 'json',
			data: {
				w: 'continueReassignCategory',
				reassign: data.reassign,
				categories: data.categories,
				isProcessCat: isProcessCat,
				parentCat: data.parentCat,
				totalProd: totalProd
			},
			success: function(response) {
				if (response.success) {
					CategoryManager.updateCatReassignProgress(response.currentPercent);

					if (response.currentPercent >= 100) {
						$.iModal.close();
						window.location = 'index.php?ToDo=viewCategories';
						return;
					}
					CategoryManager.startCategoriesReassign(response.isProcessCat, response.totalProd);
				}
				else {
					window.location = 'index.php?ToDo=viewCategories';
					return;
				}
			}
		});
	},

	// update the progress bar of deletion process.
	updateCatReassignProgress: function(percentage) {
		$('#ProgressBarPercentage').css('width', percentage + "%");
		$('#ProgressPercent').html(Math.round(percentage) + "%");
		$.cookie('ISC_IdleTimer_LastEvent', new Date);
	},

	/**
	 * Show the reassign categories modal, with parent selector.
	 */
	showStep1Modal: function(data) {
		var intro = lang.reassignModalIntro.replace(':prodCount', Number(data.prodCount));
		$('#reassignCategoryModalIntro').html(intro);

		$.iModal({
			type: 'inline',
			inline: '#reassignModal',
			width: 650
		});

		$("#parentidSelect").jstree({
			json_data : {
				data: data.options,
				ajax: {
					url: "remote.php?remoteSection=categories&w=getChildCategoriesJSON&prefix=parentidSelect",
					data: function (n) {
						var selectedCategoryId = 0;
						if (n.attr) {
							selectedCategoryId = n.data('id');
						}

						return {selectedCategoryId : selectedCategoryId, categoryId: data.categories};
					},
					global: false
				}
			},
			ui: {
				select_limit: 1
			},
			themes: {
				theme: "interspire",
				url: config.ShopPath + '/javascript/jquery/plugins/jstree/themes/interspire/style.css'
			},
			plugins: [ "themes", "json_data", "ui" ]
		});

		$("#parentidSelect").bind("open_node.jstree", function(event, data) {
			// scroll the picker to the node when expanding it
			var x = data.rslt.obj.get(0).offsetTop;
			$("#parentidSelect").scrollTop(x);
		});
	},

	/**
	* Show the confirm modal, with summary and new parent lineage.
	*/
	showStep2Modal: function(data) {
		$.iModal.close();
		var intro = lang.confirmModalIntro.replace(':catCount', Number(data.catCount));
		intro = intro.replace(':prodCount', Number(data.prodCount));
		if (data.reassign == true) {
			intro = intro.replace(':action', 'moved to:');
			intro = intro.replace(':catLineage', '<ul><li style="list-style-type: none;">' + data.catLineage + '</li></ul>');
		} else {
			intro = intro.replace(':action', 'deleted');
			intro = intro.replace(':catLineage', '');
		}

		$('#confirmModalIntro').html(intro);
		$.iModal({
			type: 'inline',
			inline: '#confirmModal',
			width: 650
		});
	}
};

$(document).ready(function() {
	CategoryManager.init();
});

var updatingSortables = false;
var updateTimeout = null;
var dragId = '';
var oldDepth = 0;
var oldParent = 0;
function CreateSortableList() {
	$('#CategoryList').nestedSortable({
		forcePlaceholderSize: true,
		handle: '.sort-handle',
		items: 'li',
		opacity: .8,
		tabSize: 20,
		tolerance: 'pointer',
		toleranceElement: '> table',
		listClass: 'SortableList CategoryList',
		placeholder: 'SortableRowHelper',
		update: function(event, ui) {
			var serialized = $(this).sortable("serialize");
			$.ajax({
				url: 'remote.php?w=updateCategoryOrders',
				type: 'POST',
				dataType: 'xml',
				data: serialized,
				success: function(response) {
					var status = $('status', response).text();
					var message = $('message', response).text();
					if(status == 0) {
						display_error('CategoriesStatus', message);
					}
					else {
						display_success('CategoriesStatus', message);
					}

					// get the new depth
					var node = $("#ele-" + dragId);
					var newDepth = $(node).parents('ul .CategoryList').length;
					var parentRow = CategoryManager.getParentCategoryRow(dragId);

					if (parentRow != false) {
						var newParent = $(parentRow).attr('id').substr(4);

						// if we're moving the item down the tree, then remove this item and expand the new parent category which will contain the dropped item
						if (newDepth >= oldDepth && oldParent != newParent && $("#ele-" + dragId).siblings().length == 0) {
							// ensure the parent has a +/- expand link
							parentRow.find('.ExpandCollapseLink').first().show();

							// remove the element as it's now going to be loaded into the new parent's expanded list
							$("#ele-" + dragId).parent('.CategoryList').remove();

							// load up the new parent
							CategoryManager.expandCategory(newParent);
						}
					}

					// does the old parent have no items left? hide the link
					if (oldParent) {
						var childCats = CategoryManager.getChildCategories(oldParent);
						if (childCats.length == 0 || childCats.find('li').length == 0) {
							var oldParentRow = CategoryManager.getCategoryRow(oldParent);
							oldParentRow.find('.ExpandCollapseLink').hide();
						}
					}
				}
			});
		},
		start: function(event, ui) {
			// get the id of the dropped row
			dragId = ui.item.attr('id').substr(4);
			oldDepth = ui.item.parents('ul .CategoryList').length;
			var parentRow = CategoryManager.getParentCategoryRow(dragId);
			if (parentRow != false) {
				oldParent = parentRow.attr('id').substr(4);
			}
			else {
				oldParent = 0;
			}
		}
	});
}