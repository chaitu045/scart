<form action="index.php?ToDo={{ FormAction|raw }}" method="post" onsubmit="return ValidateForm(CheckMethodForm)">
	<input type="hidden" name="methodId" id="methodId" value="{{ MethodId|raw }}" />
	<input type="hidden" name="zoneId" id="zoneId" value="{{ ZoneId|raw }}" />
	<input type="hidden" name="currentTab" value="{{ CurrentTab|raw }}" id="currentTab" />
	<div class="BodyContainer">
		<table class="OuterPanel">
			<tr>
				<td class="Heading1">{{ Title|raw }}</td>
			</tr>

			<tr>
				<td class="Intro">
					<p>{{ Intro|raw }}</p>
					{{ Message|raw }}
					<p>
						<input type="submit" name="SubmitButton1" value="{% lang 'Save' %}" class="FormButton" />&nbsp;
						<input type="button" name="CancelButton1" value="{% lang 'Cancel' %}" class="FormButton" onclick="ConfirmCancel()" />
					</p>
				</td>
			</tr>

			<tr>
				<td>
					<table width="100%" class="Panel">
						<tr>
							<td class="Heading2" colspan="2">{% lang 'ShippingMethodSettings' %}</td>
						</tr>

						<tr>
							<td class="FieldLabel">
								<span class="Required">*</span> {% lang 'ShippingMethod' %}:
							</td>
							<td>
								<div>{{ MethodBasedOn|raw }}</div>
								<div style="{{ HideModuleSelect|raw }}">
									<select name="methodmodule" id="methodmodule" class="Field200" size="10" onchange="UpdateModule($(this).val());">
										{{ ShippingProviders|raw }}
									</select>
									<img onmouseout="HideHelp('methodmodule');" onmouseover="ShowHelp('methodmodule', '{% lang 'ShippingMethod' %}', '{% lang 'ShippingMethodHelp' %}')" src="images/help.gif" alt="" border="0" />
									<div style="display:none" id="methodmodule"></div>
								</div>
							</td>
						</tr>

						<tr>
							<td class="FieldLabel">
								<span class="Required">*</span> {% lang 'DisplayName' %}:
							</td>
							<td>
								<input type="text" onkeypress="updateUsingDefault();" name="methodname" id="methodname" class="Field200" value="{{ MethodName|raw }}" />
								<img onmouseout="HideHelp('methodnamehelp');" onmouseover="ShowHelp('methodnamehelp', '{% lang 'DisplayName' %}', '{% lang 'ShippingMethodDisplayNameHelp' %}')" src="images/help.gif" alt="" border="0" />
								<div style="display:none" id="methodnamehelp"></div>
							</td>
						</tr>

						<tr id="HandlingSettings" style="{{ HideHandlingFee|raw }}">
							<td class="FieldLabel">
								<span class="Required">&nbsp;</span> {% lang 'HandlingFee' %}:
							</td>
							<td>
								{{ LeftCurrencyToken|raw }}
								<input type="text" name="methodhandlingfee" id="methodhandlingfee" class="Field50" value="{{ HandlingFee|raw }}" />
								{{ RightCurrencyToken|raw }}
							</td>
						</tr>
						<tr>
							<td class="FieldLabel">
								<span class="Required">*</span> {% lang 'EnableShippingMethod' %}?
							</td>
							<td>
								<label><input type="checkbox" name="methodenabled" id="methodenbled" {{ MethodEnabledCheck|raw }} /> {% lang 'YesEnableShippingMethod' %}</label>
								<img onmouseout="HideHelp('enabledhelp');" onmouseover="ShowHelp('enabledhelp', '{% lang 'EnableShippingMethod' %}?', '{% lang 'EnableShippingMethodHelp' %}')" src="images/help.gif" alt="" border="0" />
								<div style="display:none" id="enabledhelp"></div>
							</td>
						</tr>
					</table>
					<br />
					<table width="100%" class="Panel" id="chooseMethodFirst" style="{{ HideChooseMethod|raw }}">
						<tr>
							<td class="Heading2" colspan="2">{% lang 'ShippingSettings' %}</td>
						</tr>

						<tr>
							<td colspan="2">
								<p class="MessageBox MessageBoxInfo">{% lang 'ChooseShippingMethodFirst' %}</p>
							</td>
						</tr>
					</table>
					<div id="shippingMethodSettings">
						{{ ShippingModuleProperties|raw }}
					</div>
					<table border="0" cellspacing="0" cellpadding="2" width="100%" class="PanelPlain">
						<tr>
							<td class="FieldLabel">&nbsp;</td>
							<td>
								<input type="submit" name="SubmitButton1" value="{% lang 'Save' %}" class="FormButton" />&nbsp;
								<input type="button" name="CancelButton1" value="{% lang 'Cancel' %}" class="FormButton" onclick="ConfirmCancel()" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</form>
<script type="text/javascript">
	var usingDefault = 1;

	function updateUsingDefault()
	{
		usingDefault = 0;
	}

	function ConfirmCancel()
	{
		if(confirm('{% lang 'ConfirmCancel' %}')) {
			window.location = 'index.php?ToDo=editShippingZone&zoneId={{ ZoneId|raw }}&currentTab=1';
		}
	}

function CheckMethodForm()
{
	if(!$('#methodId').val() && !$('#methodmodule').val()) {
		alert('{% lang 'SelectShippingMethod' %}');
		$('#methodmodule').focus();
		return false;
	}

	if(!$('#methodname').val()) {
		alert('{% lang 'EnterShippingMethodName' %}');
		$('#methodname').focus();
		return false;
	}

	if($('#HandlingSettings').css('display') != 'none') {
		if(isNaN(priceFormat($('#methodhandlingfee')))) {
			alert('{% lang 'EnterValidHandlingFee' %}');
			$('#methodhandlingfee').select();
			return;
		}
	}

	if(typeof(ShipperValidation) != 'undefined' && ShipperValidation() == false) {
		return false;
	}

	return true;
}

{{ ShippingProviderErrors|raw }}

function UpdateModule(module) {
	if(module == '' || module == null) {
		$('#chooseMethodFirst').show();
		$('#shippingMethodSettings *').remove();
		return;
	}

	// Is there a reason why this zone cannot be enabled?
	if(typeof(eval('providerErrors.'+module)) != 'undefined') {
		var errors = eval('providerErrors.'+module);
		alert(errors);
		$('#methodmodule').val('');
		return false;
	}

	$.ajax({
		url: 'remote.php',
		method: 'post',
		data: 'w=GetShippingModuleProperties&module='+module,
		success: function(data) {
			$('#shippingMethodSettings').html(data);
			$('#chooseMethodFirst').hide();
			ISSelectReplacement.on_load();
			if(usingDefault == 1) {
				$('#methodname').val($('#shippingMethodSettings #moduleName').html());
			}
		}
	});
}
</script>