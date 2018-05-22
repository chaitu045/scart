<div style="font-weight: bold; font-size: 14px; padding-bottom: 5px;">{{ Name|raw }}</div>
<a href='{{ DefaultPreviewImageFull|raw }}?height=300&amp;width=300' id="{{ PreviewIDURL|raw }}" class="thickbox">
	<img src='{{ DefaultPreviewImageSmall|raw }}' style='border: 1px solid #CCCCCC;' width="200" height="80" id="{{ PreviewID|raw }}"></a><br/><br/>
	<input type="button" class="SmallButton" value="{{ ButtonText|raw }}" onclick="DownloadNewLogo('{{ LogoId|raw }}', {{ PopupWidth|raw }}, {{ PopupHeight|raw }});" />
<br/>
