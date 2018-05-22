;(function($){

GooglePs = {
	selectedCategoryId: 0,
	requiredFields: [],
	addCategory: function(categoryId, path)
	{
		var formattedPath = path.toString().replace(",", " > ");
		$("#googleProductCategory")
		.append($("<option></option>")
		.attr("value", categoryId)
		.attr("class", "gpsOption")
		.attr("id", "gpsOption_" + categoryId)
		.text(formattedPath));

		if (GooglePs.selectedCategoryId == categoryId) {
			$("#gpsOption_" + GooglePs.selectedCategoryId).attr("selected", "selected");
		} else {
			$("#gpsOption_" + GooglePs.selectedCategoryId).attr("selected", "");
		}
	},
	removeAllCategories: function()
	{
		$("#googleProductCategory").html("");
	},

	validateGooglePsFields: function(callBack, callBackValue) {
		if ($("#enableGooglePsForProduct").attr("checked")) {
			if (!$("#googleProductCategory").val()) {
				alert (lang.enterGoogleProductCategory);
				if(callBack) {
					callBack(callBackValue);
				}
				$("#googleProductCategory").focus();
				$("#googleProductCategory").select();
				return false;
			}
		}
		return true;
	},

	saveGooglePsCategory: function(bcCategoryId, gpsCategoryId)
	{
		$.ajax({
			type: 'POST',
			url: 'remote.php',
			data: {
				remoteSection: 'googleps',
				w: 'saveGooglePsCategory',
				bcCatId: bcCategoryId,
				googlePsCatId: gpsCategoryId
			}
		});
	},

	displayNewCategoryAssignmentDialog: function(categoryId)
	{
		$.iModal({
			type: 'inline',
			inline: '#categorySelectModal',
			width: 905,
			height: 900,
			onClose: function() {
				$('#googleProductCategory :selected').attr('selected', false);
				$.iModal.close();
			}
		});

		$('#ModalContainer').categorySelector({
			getCategoriesURL: 'index.php?ToDo=getGooglePsCategories',
			title: lang.chooseGooglePsCategory,
			intro: lang.chooseGooglePsCategoryIntro,
			categoryid: 0,
			messages: {
				'leafCategorySelected' : lang.categorySelectLeafCategorySelected,
				'chooseLeafCategory' : lang.categorySelectChooseLeafCategory
			},
			success: function(cat){
				$.iModal.close();
				GooglePs.saveGooglePsCategory(categoryId, cat['id']);
			},
			cancel: function(){
				$.iModal.close();
				$('#googleProductCategory :selected').attr('selected', false);
			}
		});
	}
};

$(function(){
	$(".gpsOption").live("click", function() {
		GooglePs.selectedCategoryId = $(this).val();
		// Determine if the category already assigned to google category?
			$.ajax({
				type: 'POST',
				url: 'remote.php',
				data: {
					remoteSection: 'googleps',
					w: 'isCategoryAssigned',
					categoryId: GooglePs.selectedCategoryId
				},
				success: function(response) {
					if (!response.result) {
						if(confirm(lang.mapCategoryText)) {
							GooglePs.displayNewCategoryAssignmentDialog(GooglePs.selectedCategoryId)
						} else {
							// set selection to none
							$('#googleProductCategory :selected').attr('selected', false);
						}
					}
				}
			});
	});

	$("#enableGooglePsForProduct").live('change', function() {
		if ($(this).attr('checked')) {
			$("#googlePsForm").show();
		}
		else {
			$("#googlePsForm").hide();
		}

		if (!$(".gpsOption").length) {
			$("#googlePsForm").hide();
			$(this).attr('disabled', 'disabled');
		} else {
			$(this).attr('disabled', false);
		}
	});
});

})(jQuery);
