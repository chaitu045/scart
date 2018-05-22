
<script type="text/javascript" charset="utf-8">

	function AddTotalRange(node)
	{
		var newNode = $(node).clone();
		var newVal = $(newNode).find('input:eq(1)').val();

		$(newNode).find('input:first').val(newVal);
		$(newNode).find('input:gt(0)').val('');

		var oldName = $('.TotalRanges:last input:first').attr('name');
		var oldParts = oldName.replace(/^.*_/, '');
		var oldParts = oldParts.replace(/\]/, '');
		var newNum = parseInt(oldParts)+1;

		$(newNode).find('input').each(function() {
			parts = $(this).attr('name').split(/[_|\[|\]]/);
			$(this).attr('name', parts[0] + '_' + parts[1] + '[' + parts[2] + '_' + newNum + ']');
			$(this).attr('id', parts[2] + '_' + newNum);
		});

		$(node.parentNode).append(newNode);

		ShowCorrectLinks();
	}

	function RemoveTotalRange(node)
	{
		if (ConfirmRemove(node)) {
			$(node).remove();
			ShowCorrectLinks();
		}
	}
	function ShowCorrectLinks()
	{
		$('.TotalRanges:first a.remove').hide();
		$('.TotalRanges:gt(0) a.remove').show();
	}

	function ConfirmRemove(node)
	{
		var canRemove = true;
		$(node).find('input').each(function() {
			if ($(this).val() != '') {
				if (confirm("{% lang 'ConfirmRemoveTotalRange' %}")) {
					canRemove = true;
				} else {
					canRemove = false;
				}
				return false;
			}
		});

		return canRemove;
	}

	$(document).ready(function () {
		ShowCorrectLinks();
		$('#shipping_bytotal_includetax').closest('tr').hide();
		$('.TotalRanges > :input').live('blur', function() {
			checkHideTaxOpt();
		});
		checkHideTaxOpt();
	});

	function checkHideTaxOpt() {
		var hideTaxOption = false;
		var showTaxOption = false;
		$('.TotalRanges').each(function() {
			$(this).children(':input').each(function() {
				if($.trim($(this).val()) == '') {
					hideTaxOption = true;
				} else {
					showTaxOption = true;
				}
			});
		});
		if (!hideTaxOption) {
			$('#shipping_bytotal_includetax').closest('tr').show();
			$('#shipping_bytotal_includetax').attr('disabled', false);
		}
		if (!showTaxOption) {
			$('#shipping_bytotal_includetax').closest('tr').hide();
			$('#shipping_bytotal_includetax').attr('disabled', true);
		}
	}
</script>

