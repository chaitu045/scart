(function($){
	// announcements logic

	var initialiseAnnouncementsModal = function () {
		$(function(){
			var modal = $('#announcementModal'),
				container = modal.find('.announcements-list')
				list = container.find('.announcement'),
				width = container.width(),
				wrapper = container.find('.announcements-wrapper'),
				prev = modal.find('.announcements-left a'),
				next = modal.find('.announcements-right a'),
				animating = false;

			modal.find('.announcements-left, .announcements-right').disableSelection();

			var totalWidth = 0;
			list.each(function(){
				totalWidth += $(this).width();
			});

			wrapper.width(totalWidth);

			var goPrevious = function () {
				if (animating) {
					return;
				}

				animating = true;

				if (parseInt(wrapper.css('left'), 10) + width >= 0) {
					prev.hide();
				}

				wrapper.animate({
					left: '+=' + width
				}, 300, undefined, function(){
					animating = false;
				});

				next.show();
			};

			var goNext = function () {
				if (animating) {
					return;
				}

				animating = true;

				if (parseInt(wrapper.css('left'), 10) - (width * 2) <= 0 - totalWidth) {
					next.hide();
				}

				wrapper.animate({
					left: '-=' + width
				}, 300, undefined, function(){
					animating = false;
				});

				prev.show();
			};

			prev.click(function(event){
					event.preventDefault();
					goPrevious();
				});

			next.click(function(event){
					event.preventDefault();
					goNext();
				});

			prev.hide();

			if (totalWidth <= width) {
				next.hide();
			}

			$('#hideAnnouncementsButton').click(function(event){
				event.preventDefault();

				$.post('remote.php', {
					remoteSection: 'dashboard',
					w: 'closeAnnouncementsModal',
					hide: $('#hideAnnouncementsCheckbox').is(':checked') ? 1 : 0
				});

				$.iModal.close();
			});
		});
	};

	$.iModal({
		close: false,
		type: 'ajax',
		width: 636,
		url: 'remote.php?remoteSection=dashboard&w=announcementsModal',
		onShow: function(){
			initialiseAnnouncementsModal();
		}
	});
})(jQuery);
