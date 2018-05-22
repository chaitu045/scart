<form action="index.php?ToDo=testShippingProviderQuote" method="post" onsubmit="return ValidateForm(CheckQuoteForm)">

<input type="hidden" name="methodId" value="{{ MethodId|raw }}" />

<fieldset style="margin:10px">

<legend>{% lang 'RoyalMailShippingQuote' %}</legend>

<table width="100%" style="background-color:#fff" class="Panel">

	<tr>

		<td style="padding-left:15px">

			&nbsp;

		</td>

		<td>

			<img style="margin-top:5px" src="../modules/shipping/royalmail/images/{{ Image|raw }}" />

		</td>

	</tr>

	<tr>

		<td style="padding-left:15px">

			<span class="Required">*</span> {% lang 'RoyalMailDeliveryType' %}:

		</td>

		<td>

			<select name="delivery_type" id="delivery_type" class="Field250">

				{{ DeliveryTypes|raw }}

			</select>

		</td>

	</tr>

	<tr>

		<td style="padding-left:15px">

			<span class="Required">*</span> {% lang 'RoyalMailDestinationCountry' %}:

		</td>

		<td>

			<select name="delivery_country" id="delivery_country" class="Field250">

				{{ Countries|raw }}

			</select>

		</td>

	</tr>

	<tr>

		<td style="padding-left:15px">

			<span class="Required">*</span> {% lang 'RoyalMailDestinationPostcode' %}:

		</td>

		<td>

			<input name="delivery_postcode" id="delivery_postcode" class="Field50">

		</td>

	</tr>

	<tr>

		<td style="padding-left:15px">

			<span class="Required">*</span> {% lang 'RoyalMailWeight' %}:

		</td>

		<td>

			<input name="delivery_weight" id="delivery_weight" class="Field50">{{ WeightUnit|raw }}

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

</fieldset>



<script type="text/javascript">

	function CheckQuoteForm() {

		var delivery_postcode = document.getElementById("delivery_postcode");

		var delivery_weight = document.getElementById("delivery_weight");

		if(delivery_postcode.value == "") {

			alert("{% lang 'RoyalMailEnterDestinationPostcode' %}");

			delivery_postcode.focus();

			return false;

		}



		if(isNaN(delivery_weight.value) || delivery_weight.value == "") {

			alert("{% lang 'RoyalMailEnterValidWeight' %}");

			delivery_weight.focus();

			delivery_weight.select();

			return false;

		}




		return true;

	}



</script>



