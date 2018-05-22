<div style="font-weight: bold; font-size: 14px; padding-bottom: 5px;">{{ Name|raw }}</div>
<a href='{{ DefaultPreviewImageFull|raw }}' id="{{ PreviewIDURL|raw }}" class="thickbox">
	<img src='{{ DefaultPreviewImageSmall|raw }}' style='border: 0px' class="previewImage" />
</a>
<div style="padding-top:5px;padding-bottom:5px;">
{{ ColorList|raw }}
</div>
<input type="button" class="SmallButton" value="{{ ButtonText|raw }}" onclick="disableLoadingIndicator = true; DownloadTemplate('{{ TemplateId|raw }}', {{ PopupHeight|raw }}, {{ PopupWidth|raw }});" />
<br />