<form action="index.php?ToDo=testShippingProviderQuote" method="post" onsubmit="return ValidateForm(CheckQuoteForm)">
	<input type="hidden" name="methodId" value="{{ MethodId|raw }}" />
	<fieldset style="margin:10px">
		<legend>{% lang 'USPSShippingQuote' %}</legend>
		<table width="100%" style="background-color:#fff" class="Panel">
			<tr>
				<td style="padding-left:15px">
					&nbsp;
				</td>
				<td>
					<img style="margin-top:5px" src="{{ Image|raw }}" />
				</td>
			</tr>
			<tr>
				<td style="padding-left:15px">
					<span class="Required">*</span> {% lang 'DestinationCountry' %}:
				</td>
				<td>
					<select name="destinationCountry" id="destinationCountry" class="Field250" />
						{{ Countries|raw }}
					</select>
				</td>
			</tr>
			<tr>
				<td style="padding-left:15px">
					<span class="Required">*</span> {% lang 'DestinationZip' %}:
				</td>
				<td>
					<input name="destinationZip" id="destinationZip" class="Field50" />
				</td>
			</tr>
			<tr>
				<td style="padding-left:15px">
					<span class="Required">*</span> {% lang 'PackageWeight' %}:
				</td>
				<td>
					<input name="weight" id="weight" class="Field50"> {{ WeightMeasurement|raw }}
				</td>
			</tr>
			<tr>
				<td style="padding-left:15px">
					<span class="Required">*</span> {% lang 'PackageWidth' %}:
				</td>
				<td>
					<input name="width" id="width" class="Field50"> {{ LengthMeasurement|raw }}
				</td>
			</tr>
			<tr>
				<td style="padding-left:15px">
					<span class="Required">*</span> {% lang 'PackageLength' %}:
				</td>
				<td>
					<input name="length" id="length" class="Field50"> {{ LengthMeasurement|raw }}
				</td>
			</tr>
			<tr>
				<td style="padding-left:15px">
					<span class="Required">*</span> {% lang 'PackageHeight' %}:
				</td>
				<td>
					<input name="height" id="height" class="Field50"> {{ LengthMeasurement|raw }}
				</td>
			</tr>
			<tr>
				<td style="padding-left:15px">
					&nbsp;
				</td>
				<td class="PanelBottom">
					<input type="submit" class="FormButton" style="width:120px" value="{% lang 'GetShippingQuote' %}">
				</td>
			</tr>
		</table>
	</legend>
</form>

<script type="text/javascript">
	function CheckQuoteForm() {
		if(!$('#destinationZip').val()) {
			alert("{% lang 'EnterDestinationZip' %}");
			$('#destinationZip').focus();
			return false;
		}

		if(isNaN($('#weight').val()) || $('#weight').val() == "") {
			alert("{% lang 'EnterPackageWeight' %}");
			$('#weight').focus();
			$('#weight').select();
			return false;
		}

		if(isNaN($('#width').val()) || $('#width').val() == "") {
			alert("{% lang 'EnterPackageWidth' %}");
			$('#width').focus();
			$('#width').select();
			return false;
		}

		if(isNaN($('#length').val()) || $('#length').val() == "") {
			alert("{% lang 'EnterPackageLength' %}");
			$('#length').focus();
			$('#length').select();
			return false;
		}

		if(isNaN($('#height').val()) || $('#height').val() == "") {
			alert("{% lang 'EnterPackageHeight' %}");
			$('#height').focus();
			$('#height').select();
			return false;
		}

		return true;
	}
</script>
