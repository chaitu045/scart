<div class="BodyContainer">
	<table cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td class="Heading1">{% lang 'VendorPayments' %}</td>
	</tr>
	<tr>
		<td class="Intro" colspan="2">
			<p>{% lang 'VendorPaymentsIntro' %}</p>
			{{ Message|raw }}
		</td>
	</tr>
	<tr>
		<td class="Intro">
			<p>
				<input type="button" value="{% lang 'AddVendorPayment' %}" onclick="window.location = 'index.php?ToDo=addVendorPayment';" class="SmallButton" {{ DisableAdd|raw }} />
				<input type="button" value="{% lang 'DeleteSelected' %}" onclick="return VendorPayments.DeleteSelected();" class="SmallButton" {{ DisableDelete|raw }} />
				<input type="button" value="{% lang 'ExportThesePayments' %}" onclick="VendorPayments.Export()" class="SmallButton" {{ DisableExport|raw }} />
			</p>
		</td>
		<td class="SmallSearch" align="right">
			<form action="index.php?ToDo=viewVendorPayments{{ SortURL|raw }}" method="post">
				<table style="{{ DisplaySearch|raw }}">
					<tr>
						<td class="text" nowrap="nowrap" align="right">
							<select name="vendorId">
								<option value="">{% lang 'ChooseAVendor' %}</option>
								{{ VendorList|raw }}
							&nbsp;
							<input type="image" name="SearchButton" id="SearchButton" src="images/searchicon.gif" border="0"  style="padding-left: 10px; vertical-align: top;" />
						</td>
					</tr>
					<tr>
						<td nowrap="nowrap">
							<span style="{{ HideClearResults|raw }}">
								<a id="SearchClearButton" href="index.php?ToDo=viewVendorPayments">{% lang 'ClearResults' %}</a>
							</span>
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	<tr style="{{ DisplayGrid|raw }}">
		<td colspan="2">
			<form method="post" id="paymentsForm" action="index.php?ToDo=deleteVendorPayments">
				<div class="GridContainer" id="GridContainer">
					{{ PaymentDataGrid|raw }}
				</div>
			</form>
		</td>
	</tr>
	</table>
</div>

<!-- Begin Export Vendor Payments Box -->
<div id="exportBox" style="display: none">
	<div class="ModalTitle">
		{% lang 'Export' %} {% lang 'VendorPayments' %}
	</div>
	<div class="ModalContent">
		<p>{% lang 'ExportThickBoxIntro' %}</p>
		<p>{% lang 'ChooseAFileFormat' %}</p>

		<table border="0">
			<tr>
				<td><img width="16" height="16" hspace="5" src="images/exportCsv.gif" /></td>
				<td><a onclick="$.modal.close()" href="index.php?ToDo=exportVendorPayments&amp;format=csv{{ SortURL|raw }}" style="color:#005FA3; font-weight:bold">{% lang 'ExportCSV' %}</a></td>
			</tr>
			<tr>
				<td><img width="16" height="16" hspace="5" src="images/exportXml.gif" /></td>
				<td><a onclick="$.modal.close()" href="index.php?ToDo=exportVendorPayments&amp;format=xml{{ SortURL|raw }}" style="color:#005FA3; font-weight:bold">{% lang 'ExportXML' %}</a></td>
			</tr>
		</table>
	</div>
	<div class="ModalButtonRow">
		<input type="button" class="Submit" value="{% lang 'Cancel' %}" onclick="$.modal.close()" />
	</div>
</div>
<!-- End Export Vendor Payments Box -->

<script type="text/javascript" src="script/vendor.payments.js?{{ JSCacheToken }}"></script>
<script type="text/javascript">
	lang.ConfirmDeleteVendorPayments = "{% lang 'ConfirmDeleteVendorPayments' %}";
	lang.SelectOneMoreVendorPaymentsDelete = "{% lang 'SelectOneMoreVendorPaymentsDelete' %}";
</script>