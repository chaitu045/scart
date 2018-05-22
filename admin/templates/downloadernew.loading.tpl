<center><fieldset>
	<legend id="legendText">{{ DownloadPleaseWait|raw }}</legend>
	<div id="contentDiv">
		<img src="images/loadingAnimation.gif" >
	</div>
</fieldset></center>
<script type="text/javascript">// <![CDATA[
window.setTimeout(function() {
	$.ajax({
		url: 'remote.php',
		data: 'w=downloadtemplatefile&template={{ TemplateId|raw }}',
		type: 'POST',
		dataType: 'xml',
		success: function(data) {
			tb_remove();
			if($('status', data).text() == 1) {
				window.location = 'index.php?ToDo=changeTemplate&template={{ TemplateId|raw }}&color={{ TemplateColor|raw }}'
			}
			else {
				alert($('message', data).text());
			}
		}
	});
}, 1000);
//]]></script>
