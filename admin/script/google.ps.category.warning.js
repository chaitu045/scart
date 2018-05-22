var GooglePsCategoryWarning = {
	displayInvalidGpsCatMappingText : function()
	{
		$.iModal({
			type: 'inline',
			inline: '#gpsCategoryWarning',
			width: 400
		});

		// Get all the missing google taxonomies.
		$.ajax({
			type: 'POST',
			url: 'remote.php',
			data: {
				remoteSection: 'googleps',
				w: 'getInvalidGoogleCategoryMapping'
			},
			success: function(data)	{
				if (data.length == 0) {
					$(".MessageBox").hide();
					$(".DashboardGoogleProductSearchWarning").hide();
					$(".displayMessageDialog").show();
				}
				else {
					$(".categoriesRemapDialog").show();
					$.each(data, function(key, value) {
						var uniqueRowId = "invalidCatId_" + value.id;
						var changeCategoryAction = "GooglePsCategoryWarning.mapGoogleTaxonomy(" + value.id + ");"
						$('.changeCategoryRow')
						.clone()
						.appendTo('#invalidCategoryRows')
						.attr("id", uniqueRowId)
						.removeClass("changeCategoryRow")
						.show();

						$("#" + uniqueRowId + " .categoryName").text(value.name);
						$("#" + uniqueRowId + " .changeCategoryLink").attr("onClick", changeCategoryAction);
					});
					$("#invalidCategoryRows").show();
				}
			}
		});
	},

	updateGoogleTaxonomy : function (oldTaxonomy, newTaxonomy) {
		$.ajax({
			type: 'POST',
			url: 'remote.php',
			data: {
				remoteSection: 'googleps',
				w: 'updateGoogleTaxonomyMapping',
				oldTaxonomy: oldTaxonomy,
				newTaxonomy: newTaxonomy
			}
		});
	},

	mapGoogleTaxonomy : function (oldTaxonomy)
	{
		$.iModal.close();
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
			messages: {
				'leafCategorySelected' : lang.googleCategorySelectLeafCategorySelected,
				'chooseLeafCategory' : lang.categorySelectChooseLeafCategory
			},
			success: function(newTaxonomy){
				$.iModal.close();
				GooglePsCategoryWarning.updateGoogleTaxonomy(oldTaxonomy, newTaxonomy['id']);
				$(".validGpsImage_" + oldTaxonomy).show();
				$(".inValidGpsImage_" + oldTaxonomy).hide();
				$("#gpsCategoryWarningLink").click();
			},
			cancel: function(){
				$.iModal.close();
			}
		});
	}
}

$(document).ready(function() {
	$("#gpsCategoryWarningLink").live("click", function() {
		$(".categoriesRemapDialog").hide();
		$(".displayMessageDialog").hide();
		GooglePsCategoryWarning.displayInvalidGpsCatMappingText();
	});

	$("#closeCatWarningModal").live("click", function(){
		$.iModal.close();
	});

});