<table width="100%" cellspacing="0" cellpadding="0" class="DashboardPanel" style="display: {{ HideOrdersGraph|raw }}">
	<tr>
		<td class="Heading2">
			<div class="PanelHeader" id="HomeOrdersVisitorsTitle">{% lang 'OrdersAndVisitors7Days' %}</div>
		</td>
	</tr>
	<tr>
		<td class="PanelContent">
			<div id="flashcontent"></div>
			<script type="text/javascript">
				$(document).ready(function() {
					var so = new SWFObject("{{ ShopPath|raw }}/admin/includes/amcharts/amline/amline.swf", "amline", "98%", "430", "8", "#FFFFFF");
					so.addVariable("path", "{{ ShopPath|raw }}/admin//includes/amcharts/");
					so.addVariable("wmode", "transparent");
					so.addVariable("settings_file", escape("{{ ShopPath|raw }}/admin//includes/amcharts/overviewgeneral.xml"));
					so.addVariable("data_file", escape("{{ ShopPath|raw }}/admin//index.php?ToDo=overviewStatsData&from={{ FromStamp|raw }}&to={{ ToStamp|raw }}"));
					so.addVariable("preloader_color", "#000000");
					so.write("flashcontent");
				});
			</script>
		</td>
	</tr>
</table>