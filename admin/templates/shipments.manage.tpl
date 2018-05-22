<div class="BodyContainer">
	<table cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td class="Heading1">
			{% lang 'View' %}: <a href="#" style="color: #005FA3" id="ViewsMenuButton" class="PopDownMenu">{{ ViewName|raw }}
				<img width="8" height="5" src="images/arrow_blue.gif" border="0" />
			</a>
		</td>
	</tr>
	<tr>
		<td class="Intro" colspan="2">
			<p>{% lang 'ShipmentsIntro' %}</p>
			{{ Message|raw }}
		</td>
	</tr>
	<tr>
		<td class="Intro">
			<p>
				<input type="button" value="{% lang 'DeleteSelected' %}" onclick="return Shipments.DeleteSelected();" class="SmallButton" {{ DisableDelete|raw }} />
				<input type="button" value="{% lang 'ExportTheseShipments' %}" onclick="Shipments.Export()" class="SmallButton" {{ DisableExport|raw }} />
			</p>
		</td>
		<td class="SmallSearch" align="right">
			<form action="index.php?ToDo=viewShipments{{ SortURL|raw }}" method="get">
				<table style="{{ DisplaySearch|raw }}">
					<tr>
						<td class="text" nowrap align="right">
							<input name="ToDo" id="ToDo" type="hidden" value="viewShipments" />
							<input name="searchQuery" id="searchQuery" type="text" value="{{ Query|raw }}" id="SearchQuery" class="SearchBox" style="width:150px" />&nbsp;
							<input type="image" name="SearchButton" id="SearchButton" src="images/searchicon.gif" border="0"  style="padding-left: 10px; vertical-align: top;" />
						</td>
					</tr>
					<tr>
						<td nowrap="nowrap">
							<a href="index.php?ToDo=searchShipments">{% lang 'AdvancedSearch' %}</a>
							<span style="{{ HideClearResults|raw }}">
								| <a id="SearchClearButton" href="index.php?ToDo=viewShipments">{% lang 'ClearResults' %}</a>
							</span>
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	<tr style="{{ DisplayGrid|raw }}">
		<td colspan="2">
			<form method="post" id="shipmentsForm" action="index.php?ToDo=deleteShipments">
				<div class="GridContainer" id="GridContainer">
					{{ ShipmentDataGrid|raw }}
				</div>
			</form>
		</td>
	</tr>
	</table>
</div>

<!-- Begin Custom Views Menu -->
<div id="ViewsMenu" class="DropDownMenu DropShadow" style="display: none; width:200px">
	<ul>
		{{ CustomViews|raw }}
	</ul>
	<hr />
	<ul>
		<li>
			<a href="index.php?ToDo=createShipmentView" style="background-image:url('images/view_add.gif'); background-repeat:no-repeat; background-position:5px 5px; padding-left:28px">
				{% lang 'CreateANewView' %}
			</a>
		</li>
		<li style="{{ HideDeleteViewLink|raw }}">
			<a onclick="$('#ViewsMenu').hide(); Shipments.DeleteView('{{ CustomViewId|raw }}'); return false;" href="#" style="background-image:url('images/view_del.gif'); background-repeat:no-repeat; background-position:5px 5px; padding-left:28px">
				{% lang 'DeleteThisView' %}
			</a>
		</li>
	</ul>
</div>
<!-- End Custom Views Menu -->

<!-- Begin Export Shipments Box -->
<div id="exportBox" style="display: none">
	<div class="ModalTitle">
		{% lang 'Export' %} {{ ViewName|raw }}
	</div>
	<div class="ModalContent">
		<p>{% lang 'ExportThickBoxIntro' %}</p>
		<p>{% lang 'ChooseAFileFormat' %}</p>

		<table border="0">
			<tr>
				<td><img width="16" height="16" hspace="5" src="images/exportCsv.gif" /></td>
				<td><a onclick="$.modal.close()" href="index.php?ToDo=exportShipments&amp;format=csv{{ SortURL|raw }}" style="color:#005FA3; font-weight:bold">{% lang 'ExportCSV' %}</a></td>
			</tr>
			<tr>
				<td><img width="16" height="16" hspace="5" src="images/exportXml.gif" /></td>
				<td><a onclick="$.modal.close()" href="index.php?ToDo=exportShipments&amp;format=xml{{ SortURL|raw }}" style="color:#005FA3; font-weight:bold">{% lang 'ExportXML' %}</a></td>
			</tr>
		</table>
	</div>
	<div class="ModalButtonRow">
		<input type="button" class="Submit" value="{% lang 'Cancel' %}" onclick="$.modal.close()" />
	</div>
</div>
<!-- End Export Shipments Box -->

<script type="text/javascript" src="script/shipments.js?{{ JSCacheToken }}"></script>
<script type="text/javascript">
	lang.ConfirmDeleteCustomSearch = '{% lang 'ConfirmDeleteCustomSearch' %}';
	lang.ConfirmDeleteShipments = "{% lang 'ConfirmDeleteShipments' %}";
	lang.SelectOneMoreShipmentsDelete = "{% lang 'SelectOneMoreShipmentsDelete' %}";
</script>