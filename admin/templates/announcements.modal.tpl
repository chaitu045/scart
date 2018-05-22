<div class="ModalTitle">
	What's New in Interspire Shopping Cart
</div>
<div class="ModalContent" id="announcementModal">
	<div class="announcements-left"><a href="#"><span>#</span></a></div>
	<div class="announcements-list">
		<div class="announcements-wrapper">
			{% for version in announcements %}
				{% include 'announcements/' ~ version ~ '.tpl' %}
			{% endfor %}
		</div>
	</div>
	<div class="announcements-right"><a href="#"><span>#</span></a></div>
	<div class="announcements-clear"></div>
</div>
<div class="ModalButtonRow">
	<div style="float:left;"><input type="checkbox" id="hideAnnouncementsCheckbox" /> <label for="hideAnnouncementsCheckbox">Hide until the next version</label></div>
	<div style="float:right;"><input type="button" id="hideAnnouncementsButton" value="{% lang 'Close' %}" class="SubmitButton" /></div>
	<div style="clear:both;"></div>
</div>
