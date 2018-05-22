{% import "macros/util.tpl" as util %}
{% import "macros/forms.tpl" as formBuilder %}
{% import "macros/category.tpl" as category %}
<link rel="stylesheet" type="text/css" href="../javascript/jquery/themes/cupertino/ui.all.css?{{ JSCacheToken }}" />
<link rel="stylesheet" href="Styles/categories.css?{{ JSCacheToken }}" type="text/css" />
<script type="text/javascript" src="../javascript/jquery/plugins/jquery.htmlEncode.js?{{ JSCacheToken }}"></script>
<script type="text/javascript" src="script/category.selector.js?{{ JSCacheToken }}"></script>

<input type="hidden" name="youTubeVideos" id="youTubeVideos" value="{{ YouTubeVideos|raw }}">

<form enctype="multipart/form-data" action="index.php?ToDo={{ FormAction|raw }}" id="frmProduct" method="post">
<input type="hidden" name="productId" id="productId" value="{{ ProductId|raw }}">
<input type="hidden" name="productHash" id="productHash" value="{{ ProductHash|raw }}">
<input type="hidden" name="originalProductId" id="originalProductId" value="{{ OriginalProductId|raw }}">
<input id="currentTab" name="currentTab" value="0" type="hidden">
<input id="productVariationExisting" name="productVariationExisting" value="{{ ProductVariationExisting|raw }}" type="hidden">
<div id="youTubeData" style="display: none;"></div>
<div class="BodyContainer">
	<table cellSpacing="0" cellPadding="0" width="100%" style="margin-left: 4px; margin-top: 8px;">
	<tr>
		<td class="Heading1">{{ Title|raw }}</td>
	</tr>
	<tr>
		<td class="Intro">
			<p>{{ Intro|raw }}</p>
			<div id="MainMessage">
				{{ Message|raw }}
			</div>
			<p>
				<input type="submit" disabled="disabled" value="{% lang 'SaveAndExit' %}" class="FormButton" />
				<input type="submit" disabled="disabled" value="{{ SaveAndAddAnother|raw }}" onclick="SaveAndAddAnother()" class="FormButton" style="width:130px" />
				<input type="reset" value="{% lang 'Cancel' %}" class="FormButton" onclick="ConfirmCancel()" />
			</p>
		</td>
	</tr>
	<tr>
		<td>
			<ul id="tabnav">
				<li><a href="#" class="active" id="tab0" onclick="ShowTab(0)">{% lang 'Details' %}</a></li>
				<li style="display: {{ HideDigitalOptions|raw }}"><a href="#" id="tab2" class="ShowOnDigitalProduct" onclick="ShowTab(2)" style="display: none;">{% lang 'DigitalDownloads' %}</a></li>
				<li><a href="#" id="tab8" onclick="ShowTab(8)">{% lang 'ImagesVideos' %}</a></li>
				<li><a href="#" id="tab1" onclick="ShowTab(1)">{% lang 'EventDate' %}</a></li>
				<li style="display: {{ HideInventoryOptions|raw }}"><a href="#" id="tab3" class="HideOnDigitalProduct" onclick="ShowTab(3)">{% lang 'Inventory' %}</a></li>
				<li><a href="#" id="tab4" onclick="ShowTab(4)" class="HideOnDigitalProduct">{% lang 'Variations' %}</a></li>
				<li><a href="#" id="tab5" onclick="ShowTab(5)">{% lang 'ConfigurableCustomFields' %}</a></li>
				<li><a href="#" id="tab6" onclick="ShowTab(6)">{% lang 'OtherDetails' %}</a></li>
				<li><a href="#" id="tab7" onclick="ShowTab(7)">{% lang 'DiscountRules' %}</a></li>
				<li><a href="#" id="tab9" onclick="ShowTab(9)">{% lang 'GoogleWebsiteOptimizer' %}</a></li>
				<li><a href="#" id="tab10" onclick="ShowTab(10);">{% lang 'GoogleProductSearch' %}</a></li>
			</ul>
		</td>
	</tr>
	<tr>
		<td>
			<!-- Start product details -->
			<div id="div0" style="padding-top: 10px;">
				<div style="padding-bottom:5px">{% lang 'CatalogInformationIntro' %}</div>
				<table width="100%" class="Panel">
					<tr>
						<td class="Heading2" colspan="2">{% lang 'CatalogInformation' %}</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							<span class="Required">*</span>&nbsp;{% lang 'ProductType' %}:
						</td>
						<td>
							<div id="ProductType" class="Field" style="float:left">
								<div>
									<input {{ ProdType_1|raw }} id="ProductType_0" type="radio" name="prodtype" value="1" onclick="ToggleType(0)"/><label for="ProductType_0">{% lang 'PhysicalProduct' %}</label>
								</div>
								<div>
									<input {{ ProdType_2|raw }} id="ProductType_1" type="radio" name="prodtype" value="2" onclick="ToggleType(1)" /><label for="ProductType_1">{% lang 'DownloadableProduct' %}</label>
								</div>
							</div>
							<img onmouseout="HideHelp('d1');" onmouseover="ShowHelp('d1', '{% lang 'ProductType' %}', '{% lang 'ProductTypeHelp' %}')" src="images/help.gif" width="24" height="16" border="0" style="margin-top: 5px;" />
							<div style="display:none" id="d1"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							<span class="Required">*</span>&nbsp;{% lang 'ProductName' %}:
						</td>
						<td>
							<input type="text" id="prodName" name="prodName" class="Field400" value="{{ ProdName|raw }}">
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'ProductCodeSKU' %}:
						</td>
						<td>
							<input type="text" id="prodCode" name="prodCode" class="Field400" value="{{ ProdCode|raw }}">
							<img onmouseout="HideHelp('d2');" onmouseover="ShowHelp('d2', '{% lang 'ProductCodeSKU' %}', '{% lang 'ProductCodeSKUHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d2"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							<span class="Required">*</span>&nbsp;{% lang 'Categories' %}:<br />
							&nbsp;&nbsp;&nbsp;<span style="{{ HideCategoryCreation|raw }}">(<a href="#" onclick="CreateNewCategory(); return false;">{% lang 'CreateNew' %}</a>)</span>
						</td>
						<td>
							<div id="category" class="Field400 categoryPickerProduct">
							</div>

							{{ util.tooltip('Categories', 'ProductCategoriesHelp') }}
						</td>
					</tr>
					<tr style="{{ HideVendorOption|raw }}">
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'Vendor' %}:
						</td>
						<td>
							<span style="{{ HideVendorLabel|raw }}">{{ CurrentVendor|raw }}</span>
							<select name="vendor" id="vendor" class="Field400" style="{{ HideVendorSelect|raw }}" onchange="toggleVendorSettings($(this).val());">
								{{ VendorList|raw }}
							</select>
							<img style="{{ HideVendorSelect|raw }}" onmouseout="HideHelp('vendorhelp');" onmouseover="ShowHelp('vendorhelp', '{% lang 'Vendor' %}', '{% lang 'ProductVendorHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="vendorhelp"></div>
						</td>
					</tr>
				</table>
				<table width="100%" class="Panel">
					<tr>
					  <td class="Heading2" colspan=2>{% lang 'ProductDescription' %}</td>
					</tr>
					<tr>
						<td colspan="2">
							{{ WYSIWYG|raw }}
						</td>
					</tr>
				</table>
				<table width="100%" class="Panel">
					<tr>
						<td class="Heading2" colspan="2">{% lang 'ProductPriceOptions' %}</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							<span class="Required">*</span>&nbsp;{% lang 'PreorderAvailability' %}</td>
						</td>
						<td>
							<div><label><input type="radio" name="_prodorderable" id="_prodorderable_yes" value="yes" {% if _prodorderable == 'yes' %}checked="checked"{% endif %} /> {% lang 'ThisProductCanBePurchasedInMyOnlineStore' %}</label></div>

							<div><label><input type="radio" name="_prodorderable" id="_prodorderable_pre" value="pre" {% if _prodorderable == 'pre' %}checked="checked"{% endif %} /> {% lang 'ThisProductIsComingSoonButIWantToTakePreOrders' %}</label></div>
							<div class="_prodorderable_detail" id="_prodorderable_pre_detail" style="display:none;">
								<div>
									<img src="images/nodejoin.gif" alt="" style="vertical-align: middle;" /> {% lang 'Message' %}: <input type="text" name="prodpreordermessage" id="prodpreordermessage" class="Field300" value="{{ prodpreordermessage }}" maxlength="250" />
									<img onmouseout="HideHelp('PreorderMessageHelp');" onmouseover="ShowHelp('PreorderMessageHelp', '{% jslang 'PreorderMessage' %}?', '{% jslang 'PreorderMessageHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
									<div style="display:none" id="PreorderMessageHelp"></div>
								</div>
								<div>
									<img src="images/nodejoin.gif" alt="" style="vertical-align: middle;" /> {% lang 'ReleaseDate' %}: <input type="text" name="prodreleasedate" id="prodreleasedate" class="Field80" value="{{ prodreleasedate }}" />
									<input type="checkbox" name="prodreleasedateremove" id="prodreleasedateremove" {% if prodreleasedateremove %}checked="checked"{% endif %} /> <label for="prodreleasedateremove" />{% lang 'RemovePreOrderStatusOnThisDate' %}</label>
									<img onmouseout="HideHelp('PreorderRemoveDateHelp');" onmouseover="ShowHelp('PreorderRemoveDateHelp', '{% jslang 'RemovePreOrderStatusOnThisDate' %}?', '{% jslang 'PreorderRemoveDateHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
									<div style="display:none" id="PreorderRemoveDateHelp"></div>
								</div>
							</div>

							<div><label><input type="radio" name="_prodorderable" id="_prodorderable_no" value="no" {% if _prodorderable == 'no' %}checked="checked"{% endif %} /> {% lang 'ThisProductCannotBePurchasedInMyOnlineStore' %}</label></div>
							<div class="_prodorderable_detail" id="_prodorderable_no_detail" style="display:none;">
								<div>
									<img src="images/nodejoin.gif" alt="" style="vertical-align: middle;" />
									<input type="checkbox" name="prodHidePrices" id="prodHidePrices" value="1" {{ ProdHidePrice|raw }} onclick="ToggleCallForPricing()" />
									<label for="prodHidePrices">{% lang 'ProductCallForPricing' %}</label>
									<img onmouseout="HideHelp('prodhidepriceshelp');" onmouseover="ShowHelp('prodhidepriceshelp', '{% jslang 'ProductCallForPricing' %}?', '{% jslang 'ProductCallForPricingHelp' %}')" src="images/help.gif" width="24" height="16" border="0" />
									<div style="display:none" id="prodhidepriceshelp"></div>
								</div>
								<div id="prodCallForPricingLabelContainer" style="margin-left: 18px; display:none;">
									<img src="images/nodejoin.gif" alt="" style="vertical-align: middle;" /> <label for="prodCallForPricingLabel">{% lang 'ProductCallForPricingLabel' %}:</label> <input type="text" name="prodCallForPricingLabel" id="prodCallForPricingLabel" class="Field250" value="{{ ProdCallForPricingLabel|raw }}" />
								</div>
							</div>
						</td>
					</tr>
					<tr class="PriceVariations" id="MainPrice">
						<td class="FieldLabel">
							<span class="Required">*</span>&nbsp;{% lang 'Price' %}:
						</td>
						<td>
							{{ CurrencyTokenLeft|raw }} <input type="text" id="prodPrice" name="prodPrice" class="Field80" value="{{ ProdPrice|raw }}" style="text-align: right;" /> {{ CurrencyTokenRight|raw }}
							{% if enterPricesWithTax %}
								{{ lang.IncTax }}
							{% else %}
								{{ lang.ExTax }}
							{% endif %}
							<img onmouseout="HideHelp('d6');" onmouseover="ShowHelp('d6', '{% lang 'Price' %}', '{% lang 'PriceHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d6"></div>
							<a href="javascript:void(0)" class="ExpandLink" onclick="toggle_price_options()"><span id="more_price_options">{% lang 'MorePricingOptions' %} &raquo;</span></a>
						</td>
					</tr>
					<tr id="tr_costprice" style="display:none" class="PriceVariations">
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'CostPrice' %}:
						</td>
						<td>
							{{ CurrencyTokenLeft|raw }} <input type="text" id="prodCostPrice" name="prodCostPrice" class="Field80" value="{{ ProdCostPrice|raw }}" style="text-align: right;" /> {{ CurrencyTokenRight|raw }}
							<img onmouseout="HideHelp('d7');" onmouseover="ShowHelp('d7', '{% lang 'CostPrice' %}', '{% lang 'CostPriceHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d7"></div>
						</td>
					</tr>
					<tr id="tr_retailprice" style="display:none" class="PriceVariations">
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'RetailPrice' %}:
						</td>
						<td>
							{{ CurrencyTokenLeft|raw }} <input type="text" id="prodRetailPrice" name="prodRetailPrice" class="Field80" value="{{ ProdRetailPrice|raw }}" style="text-align: right;" /> {{ CurrencyTokenRight|raw }}
							<img onmouseout="HideHelp('d8');" onmouseover="ShowHelp('d8', '{% lang 'RetailPrice' %}', '{% lang 'RetailPriceHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d8"></div>
						</td>
					</tr>
					<tr id="tr_saleprice" style="display:none" class="PriceVariations">
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'SalePrice' %}:
						</td>
						<td>
							{{ CurrencyTokenLeft|raw }} <input type="text" id="prodSalePrice" name="prodSalePrice" class="Field80" value="{{ ProdSalePrice|raw }}" style="text-align: right;" /> {{ CurrencyTokenRight|raw }}
							<img onmouseout="HideHelp('d9');" onmouseover="ShowHelp('d9', '{% lang 'SalePrice' %}', '{% lang 'SalePriceHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d9"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							<span class="Required">*</span>&nbsp;{{ lang.ProductTaxClass }}:
						</td>
						<td>
							{{ formBuilder.select('tax_class_id', taxClasses, product.tax_class_id, {
								'class': 'Field250',
							}) }}
							{{ util.tooltip('ProductTaxClass', 'ProductTaxClassHelp') }}
						</td>
					</tr>
				</table>
				<table width="100%" class="Panel HideOnDigitalProduct" id="shipping_table">
					<tr>
					  <td class="Heading2" colspan=2>{% lang 'ShippingDetails' %}</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							<span class="Required">*</span>&nbsp;{% lang 'ProductWeight' %}:
						</td>
						<td>
							<input type="text" id="prodWeight" name="prodWeight" class="Field80" value="{{ ProdWeight|raw }}" style="text-align: right;" /> {{ WeightMeasurement|raw }}
							<img onmouseout="HideHelp('d14');" onmouseover="ShowHelp('d14', '{% lang 'ProductWeight' %}', '{{ ProductWeightHelp|raw }}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d14"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'ProductWidth' %}:
						</td>
						<td>
							<input type="text" id="prodWidth" name="prodWidth" class="Field80" value="{{ ProdWidth|raw }}" style="text-align: right;" /> {{ LengthMeasurement|raw }}
							<img onmouseout="HideHelp('d15');" onmouseover="ShowHelp('d15', '{% lang 'ProductWidth' %}', '{{ ProductWidthHelp|raw }}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d15"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'ProductHeight' %}:
						</td>
						<td>
							<input type="text" id="prodHeight" name="prodHeight" class="Field80" value="{{ ProdHeight|raw }}" style="text-align: right;" /> {{ LengthMeasurement|raw }}
							<img onmouseout="HideHelp('d16');" onmouseover="ShowHelp('d16', '{% lang 'ProductHeight' %}', '{{ ProductHeightHelp|raw }}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d16"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'ProductDepth' %}:
						</td>
						<td>
							<input type="text" id="prodDepth" name="prodDepth" class="Field80" value="{{ ProdDepth|raw }}" style="text-align: right;" /> {{ LengthMeasurement|raw }}
							<img onmouseout="HideHelp('d17');" onmouseover="ShowHelp('d17', '{% lang 'ProductDepth' %}', '{{ ProductDepthHelp|raw }}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d17"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'FixedShippingCost' %}:
						</td>
						<td>
							{{ CurrencyTokenLeft|raw }} <input type="text" id="prodFixedCost" name="prodFixedCost" class="Field80" style="width:70px; text-align: right;" value="{{ ProdFixedShippingCost|raw }}" onkeyup="document.getElementById('prodFreeShipping').checked=false"> {{ CurrencyTokenRight|raw }}
							<img onmouseout="HideHelp('d21');" onmouseover="ShowHelp('d21', '{% lang 'FixedShippingCost' %}', '{% lang 'FixedShippingCostHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d21"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'FreeShipping' %}:
						</td>
						<td>
							<input type="checkbox" id="prodFreeShipping" name="prodFreeShipping" value="1" {{ FreeShipping|raw }} onclick="if(this.checked) { document.getElementById('prodFixedCost').value='0'; }"> <label for="prodFreeShipping">{% lang 'YesFreeShipping' %}</label>
							<img onmouseout="HideHelp('d30');" onmouseover="ShowHelp('d30', '{% lang 'FreeShipping' %}', '{% lang 'FreeShippingProductHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d30"></div>
						</td>
					</tr>
				</table>
			</div> <!-- End product details -->

			<!-- Start event/delivery date -->
			<div id="div1" style="padding-top: 10px;">
				<div style="padding-bottom:5px">{% lang 'EventDateIntro' %}</div>
				  <table width="100%" class="Panel">
					<tr>
					  <td class="Heading2" colspan=2>{% lang 'EventDate' %}</td>
					</tr>
					<tr>
						<td class="FieldLabel">&nbsp;&nbsp;&nbsp;{% lang 'EventDateRequired' %}</td>
						<td>
							<label><input id="EventDateRequired" name="EventDateRequired" type="checkbox" {{ EventDateRequired|raw }} /> {% lang 'EventDateRequiredInfo' %}</label>
							<img onmouseout="HideHelp('ed1');" onmouseover="ShowHelp('ed1', '{% lang 'EventDateRequiredHelpHeader' %}', '{% lang 'EventDateRequiredHelp' %}')" src="images/help.gif" width="24" height="16" border="0" style="margin-top: 5px;" />
							<div style="display:none" id="ed1"></div>
						</td>
					</tr>
					<tr id="DateFieldNameTR">
						<td class="FieldLabel">
							<span class="Required">*</span>
							{% lang 'EventDateFieldName' %}
						</td>
						<td>
							<input id="EventDateFieldName" name="EventDateFieldName" value="{{ EventDateFieldName|raw }}" type="text" class="Field300" />
							<img onmouseout="HideHelp('ed2');" onmouseover="ShowHelp('ed2', '{% lang 'EventDateFieldNameHelpHeader' %}', '{% lang 'EventDateFieldNameHelp' %}')" src="images/help.gif" width="24" height="16" border="0" style="margin-top: 5px;" />
							<div style="display:none" id="ed2"></div>
						</td>
					</tr>
					<tr id="DateLimitTR">
						<td class="FieldLabel">&nbsp;&nbsp;&nbsp;{% lang 'EventDateLimit' %}
						</td>
						<td style="padding-bottom: 10px;">
							<label><input id="LimitDates" name="LimitDates" type="checkbox" {{ LimitDates|raw }} /> {% lang 'EventDateLimitInfo' %}</label>
							<select id="LimitDatesSelect" name="LimitDatesSelect">
								<option value="1" {{ LimitDateOption1|raw }}>{% lang 'EventDateLimitOption1' %}</option>
								<option value="2" {{ LimitDateOption2|raw }}>{% lang 'EventDateLimitOption2' %}</option>
								<option value="3" {{ LimitDateOption3|raw }}>{% lang 'EventDateLimitOption3' %}</option>
							</select>
							{% lang 'EventDateLimitInfo2' %}
							<img onmouseout="HideHelp('ed3');" onmouseover="ShowHelp('ed3', '{% lang 'EventDateLimitHelpHeader' %}', '{% lang 'EventDateLimitHelp' %}')" src="images/help.gif" width="24" height="16" border="0" style="margin-top: 5px;" />
							<div style="display:none" id="ed3"></div>
							<br/>
							<div id="LimitDates1">
								<img style="float: left;" src="images/nodejoin.gif"/>
								<span id=customDate7 style="float : left; display:block; margin-top:2px;">&nbsp;
								{% lang 'EventDateLimitOption1Info' %}
								<select name="Calendar1[From][Day]" class="" style="margin-bottom:3px">
									{{ OverviewFromDays|raw }}
								</select>
								<select name="Calendar1[From][Mth]" class="" style="margin-bottom:3px">
									{{ OverviewFromMonths|raw }}
								</select>
								<select name="Calendar1[From][Yr]" class="" style="margin-bottom:3px">
									{{ OverviewFromYears|raw }}
								</select>
								<span class=body>{% lang 'EventDateLimitOption1Info2' %}</span>
								<select name="Calendar1[To][Day]" class="" style="margin-bottom:3px">
									{{ OverviewToDays|raw }}
								</select>
								<select name="Calendar1[To][Mth]" class="" style="margin-bottom:3px">
									{{ OverviewToMonths|raw }}
								</select>
								<select name="Calendar1[To][Yr]" class="" style="margin-bottom:3px">
									{{ OverviewToYears|raw }}
								</select>
								</span>&nbsp;
							</div>
							<div id="LimitDates2">
								<img style="float: left;" src="images/nodejoin.gif"/>
								<span id=customDate7 style="float : left; display:block; margin-top:2px;">&nbsp;
								{% lang 'EventDateLimitOption2Info' %}
								<select name="Calendar2[From][Day]" class="" style="margin-bottom:3px">
									{{ OverviewFromDays|raw }}
								</select>
								<select name="Calendar2[From][Mth]" class="" style="margin-bottom:3px">
									{{ OverviewFromMonths|raw }}
								</select>
								<select name="Calendar2[From][Yr]" class="" style="margin-bottom:3px">
									{{ OverviewFromYears|raw }}
								</select>
								</span>&nbsp;
							</div>
							<div id="LimitDates3">
								<img style="float: left;" src="images/nodejoin.gif"/>
								<span id=customDate7 style="float : left; display:block; margin-top:2px;">&nbsp;
								{% lang 'EventDateLimitOption3Info' %}
								<select name="Calendar3[To][Day]" class="" style="margin-bottom:3px">
									{{ OverviewToDays|raw }}
								</select>
								<select name="Calendar3[To][Mth]" class="" style="margin-bottom:3px">
									{{ OverviewToMonths|raw }}
								</select>
								<select name="Calendar3[To][Yr]" class="" style="margin-bottom:3px">
									{{ OverviewToYears|raw }}
								</select>
								</span>&nbsp;
							</div>
						</td>
					</tr>
				 </table>
			</div> <!-- End event/delivery date -->

			<!-- Start download file -->
			<div id="div2" style="padding-top: 10px;">
				<div style="padding-bottom:5px">{% lang 'ProductDownloadIntro' %}</div>
				<div id="DownloadStatus"></div>
				  <table class="Panel">
					<tr id="ExistingDownloads" style="display: {{ DisplayDownloaadGrid|raw }};">
						<td style="padding-top: 5px;" colspan="2" >
							<table class="GridPanel" cellspacing="0" cellpadding="0" border="0" id="ExistingDownloadsGrid" style="width:100%;">
								<thead>
									<tr class="Heading3">
										<td align="center">&nbsp;</td>
										<td>{% lang 'FileName' %}</td>
										<td align="right" nowrap="nowrap">{% lang 'FileSize' %}</td>
										<td align="right"><span onmouseover="ShowQuickHelp(this, '{% lang 'Downloads' %}', '{% lang 'DownloadsHelp' %}');" onmouseout="HideQuickHelp(this);" class="HelpText">{% lang 'Downloads' %}</span></td>
										<td nowrap="nowrap">{% lang 'MaximumDownloads' %}</td>
										<td nowrap="nowrap">{% lang 'ExpiresAfterHeader' %}</td>
										<td>{% lang 'Action' %}</td>
									</tr>
								</thead>
								<tbody>
								{{ DownloadsGrid|raw }}
								</tbody>
							</table>
						</td>
					</tr>
					<tr id="DownloadUploadGap" style="display: {{ DisplayDownloadUploadGap|raw }}">
						<td class="Sep" colspan="2">&nbsp;</td>
					</tr>
					<tr style="display: {{ DisplayDownloadUploadHeading|raw }}">
						<td class="Heading2" id="DownloadUploadHeading" colspan="2">{% lang 'DigitalDownloadUploadHeading' %}</td>
					</tr>
					<tbody id="NewDownload" style="display: {{ DisplayNewDownload|raw }}">
						<tr>
							<td class="FieldLabel">
								&nbsp;&nbsp;&nbsp;{% lang 'DownloadDescription' %}:
							</td>
							<td>
								<input type="text" name="downdescription" id="DownloadDescription" class="Field200" />
							</td>
						</tr>
						<tr id="EditDownload" style="display: none;">
							<td class="FieldLabel">
								&nbsp;&nbsp;&nbsp;{% lang 'EditExistingDownload' %}:
							</td>
							<td id="EditDownloadFile">
							&nbsp;
							</td>
						</tr>
						<tr id="NewDownloadUpload">
							<td class="FieldLabel">
								<span class="Required">*</span>&nbsp;{% lang 'UploadNewDownload' %}:
							</td>
							<td>
								<input type="hidden" name="downloadid" id="CurrentDownloadId" value="" />
								<div id="StatusUploading" style="display: none;">
									<input type="button" class="SmallButton" disabled="disabled" value="{% lang 'SavingDownload' %}" />
								</div>
								<label><input id="ProductImportUseUpload" type="radio" name="useserver" value="0" checked="checked" onclick="ToggleSource();" /> {% lang 'ImportFileUpload' %} {% lang 'MaxUploadSize' %}</label>
								<div id="StatusNormal">
									<input type="file" class="Field" name="newdownload" id="NewDownloadFile" />
									<span id="EditDownloadButtons" style="display: none;">
										<input type="button" value="{% lang 'SaveDownload' %}" onclick="saveDownload();" class="SmallButton" style="width: 90px;" />
										<input type="button" value="{% lang 'CancelEdit' %}" onclick="cancelDownloadEdit();" class="SmallButton" style="width: 60px" />
									</span>
								</div>
								<span style="font-size: 11px; font-style: italic;">{% lang 'MaxUploadSize' %}</span>
								<div>
									<label><input id="ProductImportUseServer" type="radio" name="useserver" value="1" onclick="ToggleSource();" /> {% lang 'ImportProductFileServer' %}</label>
									<img onmouseout="HideHelp('i1');" onmouseover="ShowHelp('i1', '{% lang 'ImportProductFileServer' %}', '{% lang 'ImportProductFileServerDesc' %}')" src="images/help.gif" width="24" height="16" border="0">
									<div style="display: none;" id="i1"></div>
								</div>
								<div id="ProductImportServerField" style="margin-left: 25px; display: none;">
									<select name="serverfile" id="ServerFile" class="Field250">
										<option value="">{% lang 'ImportChooseFile' %}</option>
										{{ ServerFiles|raw }}
									</select>
								</div>
								<div id="ProductImportServerNoList" style="margin: 5px 0 0 25px; display: none; font-style: italic;" class="Field500">
									{% lang 'FieldNoServerFilesProductDownloads' %}
								</div>
								<br/>
							</td>
						</tr>
						<tr>
							<td class="FieldLabel">
								&nbsp;&nbsp;&nbsp;{% lang 'ExpiresAfter' %}:
							</td>
							<td>
								<input type="text" name="downexpiresafter" id="DownloadExpiresAfter" class="Field40" />
								<select name="downloadexpiresrange" id="DownloadExpiresRange">
									<option value="days">{% lang 'RangeDays' %}</option>
									<option value="weeks">{% lang 'RangeWeeks' %}</option>
									<option value="months">{% lang 'RangeMonths' %}</option>
									<option value="years">{% lang 'RangeYears' %}</option>
								</select>
								<img onmouseout="HideHelp('dlexpires');" onmouseover="ShowHelp('dlexpires', '{% lang 'ExpiresAfter' %}', '{% lang 'ExpiresAfterHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
								<div style="display:none" id="dlexpires"></div>
							</td>
						</tr>
						<tr>
							<td class="FieldLabel">
								&nbsp;&nbsp;&nbsp;{% lang 'MaximumDownloads' %}:
							</td>
							<td>
								<input type="text" name="downmaxdownloads" id="DownloadMaxDownloads" class="Field40" />
								<img onmouseout="HideHelp('dldownloads');" onmouseover="ShowHelp('dldownloads', '{% lang 'MaximumDownloads' %}', '{% lang 'MaximumDownloadsHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
								<div style="display:none" id="dldownloads"></div>
							</td>
						</tr>
						<tr>
							<td clas="FieldLabel">&nbsp;</td>
							<td>
								<input type="button" value="{% lang 'AttachFile' %}" onclick="attachFile();" class="FormButton Field120" />
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>

							</td>
						</tr>
					</tbody>
				  </table>
			</div> <!-- End download file -->

			<!-- Start inventory tracking -->
			<div id="div3" style="padding-top: 10px;">
				<div style="padding-bottom:5px">{% lang 'InventoryTrackingIntro' %}</div>
				  <table class="Panel" id="tabInventory">
					<tr>
					  <td class="Heading2" colspan=2>{% lang 'InventoryTracking' %}</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'TrackingMethod' %}:
						</td>
						<td>
							<input type="radio" id="prodInvTrack_0" name="prodInvTrack" value="0" onclick="ToggleProductInventoryOptions(false); toggleVariationInventoryColumns();" {{ InvTrack_0|raw }}> <label for="prodInvTrack_0">{% lang 'DoNotTrackInventory' %}</label>
							<img onmouseout="HideHelp('d23');" onmouseover="ShowHelp('d23', '{% lang 'TrackingMethod' %}', '{% lang 'TrackingMethodHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d23"></div><br />
							<input type="radio" id="prodInvTrack_1" name="prodInvTrack" value="1" onclick="ToggleProductInventoryOptions(true); toggleVariationInventoryColumns();" {{ InvTrack_1|raw }}> <label for="prodInvTrack_1">{% lang 'TrackInvForProduct' %}</label><br />
							<div id="divTrackProd" style="display: {{ HideProductInventoryOptions|raw }}; padding-left:30pt; padding-top:3pt; padding-bottom:3pt">
								<table border="0">
									<tr>
										<td>
											{% lang 'CurrentStockLevel' %}:
										</td>
										<td>
											<input type="text" id="prodCurrentInv" name="prodCurrentInv" class="Field50" value="{{ CurrentStockLevel|raw }}">
											<img onmouseout="HideHelp('d24');" onmouseover="ShowHelp('d24', '{% lang 'CurrentStockLevel' %}', '{% lang 'CurrentStockLevelHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
											<div style="display:none" id="d24"></div>
										</td>
									</tr>
									<tr>
										<td>
											{% lang 'LowStockLevel1' %}:
										</td>
										<td>
											<input type="text" id="prodLowInv" name="prodLowInv" class="Field50" value="{{ LowStockLevel|raw }}">
											<img onmouseout="HideHelp('d25');" onmouseover="ShowHelp('d25', '{% lang 'LowStockLevel' %}', '{% lang 'LowStockLevelHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
											<div style="display:none" id="d25"></div>
										</td>
									</tr>
									<tr>
								</table>
							</div>
							<input type="radio" id="prodInvTrack_2" name="prodInvTrack" value="2" onclick="ToggleProductInventoryOptions(false); toggleVariationInventoryColumns();" {{ InvTrack_2|raw }}> <label for="prodInvTrack_2">{% lang 'TrackInvForProductOpt' %}</label>
						</td>
					</tr>
				 </table>
			</div><!-- End inventory tracking -->

			<!-- Start product variations -->
			<div id="div4" style="padding-top: 10px;">
				<div style="padding-bottom:5px">{% lang 'ProductVariationsIntro' %}</div>
				  <table class="Panel" id="tabInventory">
					<tr>
					  <td class="Heading2" colspan=2>{% lang 'ProductVariationOptions' %}</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'ThisProduct' %}:
						</td>
						<td style="padding-bottom:10px">
							<input type="radio" name="useProdVariation" id="useProdVariationNo" value="0" {{ IsNoVariation|raw }} /> <label for="useProdVariationNo">{% lang 'ProductWillNotUseVariation' %}</label><br />
							<input type="radio" name="useProdVariation" id="useProdVariationYes" value="1" {{ IsYesVariation|raw }} {{ VariationDisabled|raw }} /> <label for="useProdVariationYes" id="variationLabel" style="color:{{ VariationColor|raw }}">{% lang 'ProductWillUseVariation' %}</label>
							<span style="display:{{ HideVariationList|raw }};" id="variationList">
								<select class="Field200" name="variationId" id="variationId">
									<option value="">{% lang 'ChooseAVariation' %}</option>
									{{ VariationOptions|raw }}
								</select>
								<div style="padding-left:20px">
									<input type="checkbox" name="prodOptionsRequired" id="prodOptionsRequired" {{ OptionsRequired|raw }} value="ON" /> <label for="prodOptionsRequired">{% lang 'ProductOptionRequired' %}</label>
									<img onmouseout="HideHelp('dforceopt');" onmouseover="ShowHelp('dforceopt', '{% lang 'ProductOptionRequiredTitle' %}', '{% lang 'ProductOptionRequiredHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
									<div style="display:none" id="dforceopt"></div>
								</div>
							</span>
						</td>
					</tr>
				</table>
				<div style="display:{{ HideVariationCombinationList|raw }}; margin-bottom:5px" class="GridContainer" id="variationCombinationsList">
					{{ VariationCombinationList|raw }}
				</div>
			</div><!-- End product variations -->

			<!-- Start custom fields -->
			<div id="div5" style="padding-top: 10px;">
				<div style="padding-bottom:5px">{% lang 'CustomFieldsIntro' %}</div>
				  <table class="Panel">
					<tr>
					  <td class="Heading2" colspan=2>{% lang 'CustomFields' %}</td>
					</tr>
				  </table>
				  <table class="Panel" id="CustomFieldsContainer">
				  <tbody>
					{{ CustomFields|raw }}
				  </tbody>
				  </table>
				  <div style="padding:10px 0px 10px 5px">{% lang 'ConfigurableFieldsIntro' %}</div>
					<table width="100%" class="Panel">
						<tr>
							<td class="Heading2" colspan="4">{% lang 'ConfigurableFields' %}</td>
						</tr>
					</table>
					<input type="hidden" id="FieldLastKey" value="{{ FieldLastKey|raw }}" />
					<table width="100%" class="Panel" id="ProductFieldsContainer">
						{{ ProductFields|raw }}
					</table>
			</div><!-- End custom fields -->

			<!-- Start related products -->
			<div id="div6" style="padding-top: 10px;">
				<div style="padding-bottom:5px">{% lang 'RelatedProductsIntro' %}</div>
				  <table width="100%" class="Panel">
					<tr>
					  <td class="Heading2" colspan=2>{% lang 'RelatedProducts' %}</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'RelatedProducts' %}:
						</td>
						<td>
							<input type="checkbox" id="prodRelatedAuto" name="prodRelatedAuto" value="1" onclick="toggle_related_auto(this.checked)" {{ IsProdRelatedAuto|raw }}> <label for="prodRelatedAuto">{% lang 'ProductRelatedOptionsAutomatically' %}</label>
							<img onmouseout="HideHelp('d34');" onmouseover="ShowHelp('d34', '{% lang 'RelatedProducts' %}', '{% lang 'RelatedProductsHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d34"></div>
							<blockquote id="relatedProductsBoxes">
								<div id="relCategory" class="Field400 categoryPicker">
								</div>
								<select size="10" id="relProducts" name="relProducts" onDblClick="AddRelatedProduct(this)" class="Field400">
								</select>
								<br />
								* <em>{% lang 'DoubleClickToAdd' %}</em><br />
								<select multiple size="5" id="related" name="prodRelatedProducts[]" onDblClick="RemoveRelatedProduct(this)" class="Field400">{{ RelatedProductOptions|raw }}</select><br />
								* <em>{% lang 'DoubleClickToRemove' %}</em><br />
							</blockquote>
						</td>
					</tr>
				 </table>
				 <br />
				<div style="padding-bottom:5px">{% lang 'OtherDetailsIntro' %}</div>
				<table width="100%" class="Panel">
					<tr>
						<td class="Heading2" colspan="2">{% lang 'OtherDetails' %}</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'ProductWarranty' %}:
						</td>
						<td>
							<textarea id="prodWarranty" name="prodWarranty" class="Field400" rows="5">{{ ProdWarranty|raw }}</textarea>
							<img onmouseout="HideHelp('d18');" onmouseover="ShowHelp('d18', '{% lang 'ProductWarranty' %}', '{% lang 'ProductWarrantyHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d18"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'TemplateLayoutFile' %}:
						</td>
						<td>
							<select name="prodlayoutfile" id="prodlayoutfile" class="Field400">
								{{ LayoutFiles|raw }}
							</select>
							<img onmouseout="HideHelp('templatelayout');" onmouseover="ShowHelp('templatelayout', '{% lang 'TemplateLayoutFile' %}', '{% lang 'ProductTemplateLayoutFileHelp1' %}{{ template|raw }}{% lang 'ProductTemplateLayoutFileHelp2' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="templatelayout"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'BrandName' %}:
						</td>
						<td>
							<select name="brandbox" id="brandbox" class="Field200">
								<option value="">{% lang 'ChooseAnExistingBrand' %}</option>
								{{ BrandNameOptions|raw }}
							</select>
							<span style="{{ HideAddBrandBox|raw }}">
								{% lang 'OrCreateANewBrand' %}:
								<input type="text" id="brandname" name="brandname" class="Field100" style="width:120px" value="{{ BrandName|raw }}">
							</span>
							<img onmouseout="HideHelp('d33');" onmouseover="ShowHelp('d33', '{% lang 'BrandName' %}', '{{ BrandNameProdHelp|raw }}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d33"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'ProductUPC' %}:
						</td>
						<td>
							<input type="text" id="prodUPC" name="prodUPC" class="Field400" value="{{ ProdUPC|raw }}">
							<img onmouseout="HideHelp('d28');" onmouseover="ShowHelp('d28', '{% lang 'ProductUPC' %}', '{% lang 'ProductUPCHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d28"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'SearchKeywords' %}:
						</td>
						<td>
							<input type="text" id="prodSearchKeywords" name="prodSearchKeywords" class="Field400" value="{{ ProdSearchKeywords|raw }}">
							<img onmouseout="HideHelp('d19');" onmouseover="ShowHelp('d19', '{% lang 'SearchKeywords' %}', '{% lang 'SearchKeywordsHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d19"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'ProductTags' %}:
						</td>
						<td>
							<input type="text" id="prodTags" name="prodTags" class="Field400" value="{{ ProdTags|raw }}">
							<img onmouseout="HideHelp('d19');" onmouseover="ShowHelp('d19', '{% lang 'ProductTags' %}', '{% lang 'ProductTagsHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d19"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'Availability' %}:
						</td>
						<td>
							<input type="text" id="prodAvailability" name="prodAvailability" class="Field400" value="{{ ProdAvailability|raw }}">
							<img onmouseout="HideHelp('d27');" onmouseover="ShowHelp('d27', '{% lang 'Availability' %}', '{% lang 'AvailabilityHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d27"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'Visible' %}:
						</td>
						<td>
							<input type="checkbox" id="prodVisible" name="prodVisible" value="1" {{ ProdVisible|raw }}> <label for="prodVisible">{% lang 'YesProductVisible' %}</label>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'FeaturedProduct' %}:
						</td>
						<td>
							<div style="{{ HideStoreFeatured|raw }}">
								<input type="checkbox" id="prodFeatured" name="prodFeatured" value="1" {{ ProdFeatured|raw }}> <label for="prodFeatured">{% lang 'YesProductFeatured' %}</label>
								<img onmouseout="HideHelp('d11');" onmouseover="ShowHelp('d11', '{% lang 'FeaturedProduct' %}', '{% lang 'FeaturedProductHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
								<div style="display:none" id="d11"></div>
							</div>
							<div style="{{ HideVendorFeatured|raw }}" id="vendorFeaturedToggle">
								<input type="checkbox" id="prodvendorfeatured" name="prodvendorfeatured" value="1" {{ ProdVendorFeatured|raw }}> <label for="prodvendorfeatured">{% lang 'YesProductVendorFeatured' %}</label>
								<img onmouseout="HideHelp('prodvendorfeaturedhelp');" onmouseover="ShowHelp('prodvendorfeaturedhelp', '{% lang 'VendorFeaturedProduct' %}', '{% lang 'VendorFeaturedProductHelp' %}')" src="images/help.gif" width="24" height="16" border="0" />
								<div style="display:none" id="prodvendorfeaturedhelp"></div>
							</div>
						</td>
					</tr>

					<tr class="HideOnDigitalProduct">
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'GiftWrapping' %}:
						</td>
						<td>
							<label><input type="radio" onclick="ToggleGiftWrapping(this.value)" name="prodwraptype" value="default" {{ WrappingOptionsDefaultChecked|raw }} /> {% lang 'ProductGiftWrappingDefault' %}</label>
							<img onmouseout="HideHelp('prodwrappinghelp');" onmouseover="ShowHelp('prodwrappinghelp', '{% lang 'GiftWrapping' %}', '{% lang 'GiftWrappingHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="prodwrappinghelp"></div><br />
							<label style="display: black;"><input type="radio" onclick="ToggleGiftWrapping(this.value)" name="prodwraptype" value="none" {{ WrappingOptionsNoneChecked|raw }} /> {% lang 'ProductGiftWrappingNone' %}</label>
							<label style="display: block;"><input type="radio" onclick="ToggleGiftWrapping(this.value)" name="prodwraptype" id="prodwraptype_custom" value="custom" {{ WrappingOptionsCustomChecked|raw }} /> {% lang 'ProductGiftWrappingCustom' %}</label>
							<div style="{{ HideGiftWrappingOptions|raw }}" id="GiftWrapOptions">
								<img src="images/nodejoin.gif" alt="" style="float: left; margin-right: 10px;" />
								<select name="prodwrapoptions[]" id="prodwrapoptions" multiple="multiple" size="10" class="Field300 ISSelectReplacement">
									{{ WrappingOptions|raw }}
								</select>
							</div>
						</td>
					</tr>

					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'SortOrder' %}:
						</td>
						<td>
							<input type="text" id="prodSortOrder" name="prodSortOrder" class="Field80" style="width:30px" value="{{ ProdSortOrder|raw }}">
							<img onmouseout="HideHelp('d20');" onmouseover="ShowHelp('d20', '{% lang 'SortOrder' %}', '{% lang 'SortOrderHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="d20"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							<span class="Required">*</span>&nbsp;{% lang 'ProductCondition' %}:
						</td>
						<td>
							<select name="prodCondition" id="prodCondition">
								<option value="New" {{ ProdConditionNewSelected|raw }}>{% lang 'ConditionNew' %}</option>
								<option value="Used" {{ ProdConditionUsedSelected|raw }}>{% lang 'ConditionUsed' %}</option>
								<option value="Refurbished" {{ ProdConditionRefurbishedSelected|raw }}>{% lang 'ConditionRefurbished' %}</option>
							</select>
							<img onmouseout="HideHelp('dcond');" onmouseover="ShowHelp('dcond', '{% lang 'ProductCondition' %}', '{% lang 'ProductConditionHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="dcond"></div>
							<label><input type="checkbox" name="prodShowCondition" id="prodShowCondition" value="1" {{ ProdShowCondition|raw }} />{% lang 'ShowConditionOnProduct' %}</label>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'ProductMinimumQuantity' %}:
						</td>
						<td>
							<input type="text" id="prodminqty" name="prodminqty" class="Field50" value="{{ prodminqty }}" />
							<img onmouseout="HideHelp('ProductMinimumQuantityHelp');" onmouseover="ShowHelp('ProductMinimumQuantityHelp', '{% lang 'ProductMinimumQuantity' %}', '{% lang 'ProductMinimumQuantityHelp' %}')" src="images/help.gif" width="24" height="16" border="0" />
							<div style="display:none" id="ProductMinimumQuantityHelp"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'ProductMaximumQuantity' %}:
						</td>
						<td>
							<input type="text" id="prodmaxqty" name="prodmaxqty" class="Field50" value="{{ prodmaxqty }}" />
							<img onmouseout="HideHelp('ProductMaximumQuantityHelp');" onmouseover="ShowHelp('ProductMaximumQuantityHelp', '{% lang 'ProductMaximumQuantity' %}', '{% lang 'ProductMaximumQuantityHelp' %}')" src="images/help.gif" width="24" height="16" border="0" />
							<div style="display:none" id="ProductMaximumQuantityHelp"></div>
						</td>
					</tr>
					<tr>
						<td class="Heading2" colspan="2">{% lang 'SearchEngineOptimization' %}</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'PageTitle' %}:
						</td>
						<td>
							<input type="text" id="prodPageTitle" name="prodPageTitle" class="Field400" value="{{ ProdPageTitle|raw }}" />
							<img onmouseout="HideHelp('pagetitlehelp');" onmouseover="ShowHelp('pagetitlehelp', '{% lang 'PageTitle' %}', '{% lang 'ProdPageTitleHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="pagetitlehelp"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'MetaKeywords' %}:
						</td>
						<td>
							<input type="text" id="prodMetaKeywords" name="prodMetaKeywords" class="Field400" value="{{ ProdMetaKeywords|raw }}" />
							<img onmouseout="HideHelp('metataghelp');" onmouseover="ShowHelp('metataghelp', '{% lang 'MetaKeywords' %}', '{% lang 'MetaKeywordsHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="metataghelp"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'MetaDescription' %}:
						</td>
						<td>
							<input type="text" id="prodMetaDesc" name="prodMetaDesc" class="Field400" value="{{ ProdMetaDesc|raw }}" />
							<img onmouseout="HideHelp('metadeschelp');" onmouseover="ShowHelp('metadeschelp', '{% lang 'MetaDescription' %}', '{% lang 'MetaDescriptionHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="metadeschelp"></div>
						</td>
					</tr>
						<tr>
						<td></td>
					</tr>
					<tr>
						<td class="Heading2" colspan="2">{{ lang.FacebookOpenGraphSettings }}</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{{ lang.ObjectType }}:
						</td>
						<td>
							{{ formBuilder.select('OpenGraphObjectType', openGraphTypes, openGraphSelectedType, {'class': 'Field100'}) }}
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{{ lang.Title }}:
						</td>
						<td>
							<label><input type="checkbox" name="OpenGraphUseProductName" id="OpenGraphUseProductName" value="1" {% if openGraphUseProductName %}checked="checked"{% endif %} />{{ lang.UseProductName }}</label>
							<div class="NodeJoin" {% if openGraphUseProductName %}style="display: none;"{% endif %}>
								<img src="images/nodejoin.gif" style="vertical-align: middle;" alt="" />
								<input type="text" class="Field350" name="OpenGraphTitle" id="OpenGraphTitle" value="{{ openGraphTitle }}" />
							</div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{{ lang.Description }}:
						</td>
						<td>
							<label><input type="checkbox" name="OpenGraphUseMetaDescription" id="OpenGraphUseMetaDescription" value="1" {% if openGraphUseMetaDescription %}checked="checked"{% endif %} />{{ lang.UseMetaDescription }}</label>
							<div class="NodeJoin" {% if openGraphUseMetaDescription %}style="display: none;"{% endif %}>
								<img src="images/nodejoin.gif" style="vertical-align: middle;" alt="" />
								<input type="text" class="Field350" name="OpenGraphDescription" id="OpenGraphDescription" value="{{ openGraphDescription }}" />
							</div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{{ lang.Image }}:
						</td>
						<td>
							<label><input type="radio" name="OpenGraphUseImage" value="1" {% if openGraphUseImage %}checked="checked"{% endif %} />{{ lang.UseThumbnailImage }}</label>
							<br />
							<label><input type="radio" name="OpenGraphUseImage" value="0" {% if openGraphUseImage == false %}checked="checked"{% endif %} />{{ lang.DontUseImage }}</label>
						</td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td class="Heading2" colspan="2">{% lang 'MYOBSettings' %}</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'MYOBAsset' %}:
						</td>
						<td>
							<input type="text" class="Field" id="prodMYOBAsset" name="prodMYOBAsset" maxlength="6" size="6" value="{{ ProdMYOBAsset|raw }}" />
							<img onmouseout="HideHelp('myobassethelp');" onmouseover="ShowHelp('myobassethelp', '{% lang 'MYOBAsset' %}', '{% lang 'MYOBAssetHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="myobassethelp"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'MYOBIncome' %}:
						</td>
						<td>
							<input type="text" class="Field" id="prodMYOBIncome" name="prodMYOBIncome" maxlength="6" size="6" value="{{ ProdMYOBIncome|raw }}" />
							<img onmouseout="HideHelp('myobincomehelp');" onmouseover="ShowHelp('myobincomehelp', '{% lang 'MYOBIncome' %}', '{% lang 'MYOBIncomeHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="myobincomehelp"></div>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'MYOBExpense' %}:
						</td>
						<td>
							<input type="text" class="Field" id="prodMYOBExpense" name="prodMYOBExpense" maxlength="6" size="6" value="{{ ProdMYOBExpense|raw }}" />
							<img onmouseout="HideHelp('myobexpensehelp');" onmouseover="ShowHelp('myobexpensehelp', '{% lang 'MYOBExpense' %}', '{% lang 'MYOBExpenseHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="myobexpensehelp"></div>
						</td>
					</tr>
					<tr>
						<td class="Heading2" colspan="2">{% lang 'PeachtreeSettings' %}</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'PeachtreeGL' %}:
						</td>
						<td>
							<input type="text" class="Field" id="prodPeachtreeGL" name="prodPeachtreeGL" maxlength="20" size="6" value="{{ ProdPeachtreeGL|raw }}" />
						</td>
					</tr>
					<tr>
						<td class="Heading2" colspan="2">{% lang 'ShoppingComparison' %}</td>
					</tr>
					<tr>
						<td colspan="2"><p class="Intro">{% lang 'ShoppingComparisonInstructions' %}</p></td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'ShoppingComparisonIncludeProductIn' %}
						</td>
						<td>
							<select name="comparisons[]" class="Field250 ISSelectReplacement" multiple="multiple" style="height: 108px;">
								{% for module in shoppingComparisonModules %}
								<option value="{{ module.getId() }}"{% if module.selected %} selected="selected"{% endif %}>{{ module.getName() }}</option>
								{% endfor %}
							</select>
							{{ tooltip.tooltip('shoppingComparisonToolTip', 'ShoppingComparisonProductToolTipTitle', 'ShoppingComparisonProductToolTipContent') }}
						</td>
					</tr>
					<tr>
						<td class="Heading2" colspan="2">{% lang 'GoogleCheckoutSettings' %}</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							&nbsp;&nbsp;&nbsp;{% lang 'DisableGoogleCheckout' %}:
						</td>
						<td>
							<input type="hidden" name="prodDisableGoogleCheckout" value="0"/>
							<input type="checkbox" name="prodDisableGoogleCheckout" id="prodDisableGoogleCheckout" value="1" {% if ProdDisableGoogleCheckout == 1 %}checked="checked"{% endif %} />
							<label for="prodDisableGoogleCheckout">{% lang 'YesDisableGoogleCheckout' %}</label>
							<img onmouseout="HideHelp('prodDisableGoogleCheckoutHelp');" onmouseover="ShowHelp('prodDisableGoogleCheckoutHelp', '{% jslang 'DisableGoogleCheckout' %}', '{% jslang 'DisableGoogleCheckoutHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
							<div style="display:none" id="prodDisableGoogleCheckoutHelp"></div>

						</td>
					</tr>
				</table>
			</div><!-- End related products -->

			<!-- Start discount rules -->
			<div id="div7" style="padding-top: 10px;">
				<div style="padding-bottom:5px">{% lang 'DiscountRulesIntro' %}</div>
				<div id="DiscountRulesWarning" class="MessageBox MessageBoxInfo" style="display: {{ HideDiscountRulesWarningBox|raw }};">{{ DiscountRulesWarningText|raw }}</div>
				<div id="DiscountRulesDisplay" style="display: {{ DiscountRulesWithWarning|raw }};">
					<table class="Panel">
						<tr>
						  <td class="Heading2" colspan=2>{% lang 'DiscountRules' %}</td>
						</tr>
					</table>
					<table class="Panel" id="DiscountRulesContainer">
					<tbody>
						{{ DiscountRules|raw }}
					</tbody>
					</table>
				</div>
			</div><!-- End discount rules -->
			<!-- Start images & videos -->
			<div id="div8" style="padding-top: 10px;">
				<table class="Panel">
				<tr>
					<td class="Heading2" colspan="2">{% lang 'ProductImages' %}</td>
				</tr>
				<tr>
					<td colspan="2">
						<div style="margin:10px 0 6px 10px;">{% lang 'ProductImagesIntroduction' %}</div>

						<div style="margin:11px 0 6px 6px;">
							<button class="Button" id="productImagesDeleteSelected" disabled="disabled">{% lang 'DeleteSelected' %}</button>
						</div>

						<table class="GridPanel productImagesTable" cellspacing="0">
							<tbody>
								<tr class="Heading3">
									<td class="productImageCheck" style="padding-left:5px;"><input type="checkbox" /></td>
									<td class="productImageThumbDisplay" style="width:{{ productImage_thumbnailWidth|raw }}px;">{% lang 'Image' %}</td>
									<td class="productImageDescription">{% lang 'Description' %}</td>
									<td class="productImageBaseThumb"><span class="HelpText" onmouseout="HideQuickHelp(this)" onmouseover="ShowQuickHelp(this, '{% jslang 'UseAsBaseThumbnail' %}', '{% jslang 'UseAsBaseThumbnailHelpText' %}')">{% lang 'UseAsBaseThumbnail' %}</span></td>
									<td class="productImageAction">{% lang 'Action' %}</td>
								</tr>
							<tbody>
						</table>

						<div class="productImagesListItem" id="productImagesListItemNew">
							<table cellspacing="0">
								<tbody>
									<tr class="GridRowNoOver">
										<td class="productImageCheck"><input type="checkbox" /></td>
										<td class="productImageThumbDisplay" style="width:{{ productImage_thumbnailWidth|raw }}px;">
											<div class="productImageNewPlaceholder" style="width:{{ productImage_thumbnailWidth|raw }}px; height:{{ productImage_thumbnailHeight|raw }}px;"><div style="line-height:{{ productImage_thumbnailHeight|raw }}px;"><span>{% lang 'NewImage' %}</span></div></div>
										</td>
										<td class="productImageDescription">
											<p>{% lang 'ProductImagesSelectUploadMethod' %}</p>
											<ul>
												<li><span id="productImageNewUploadPlaceholder"></span><a id="productImageNewUpload" class="ProductImageNewUpload" href="#">{% lang 'UploadAnImage' %}</a> <span class="SwfUploadAlternativeNotice" style="display:none;">{% lang 'ProductImagesBasicUploader' %}</span></li>
												<li><a id="productImageNewWeb" href="#">{% lang 'UseImageFromWeb' %}</a></li>
												<li><a id="productImageNewGallery" href="#">{% lang 'ChooseFromGallery' %}</a></li>
											</ul>
										</td>
										<td class="productImageBaseThumb">&nbsp;</td>
										<td class="productImageAction">&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</div>

						{{ productImagesList|raw }}

					</td>
				</tr>
				</table>
				<table class="Panel">
				<tr>
					<td class="Heading2" colspan="2">{% lang 'YouTubeVideos' %}</td>
				</tr>
				<tr>
					<td class="videoIntroRow" colspan="2">
						{% lang 'YouTubeVideosIntro' %}
					</td>
				</tr>

				<tr>
					<td class="videoControlRow" colspan="2">
						<input type="text" class="Field250 exampleSearchText SetOriginalValue" id="searchYouTube" name="searchYouTube" value="{% lang 'VideoTypeToSearch' %}" /> <input type="button" class="Button" value="{% lang 'VideoFindVideos' %}" id="findVideosButton" />
					</td>
				</tr>

				<tr>
					<td class="videoControlRow" colspan="2">
						<div id="youtubeContainer">
							<div id="youtubeLeftBox" class="youtubeVideoListBox">
								<ul id="youTubeSearchVideos" style="display: none;"></ul>
								<div id="useSearchVideos">{% lang 'VideoUseSearchField' %}</div>
								<div id="noSearchVideos" style="display: none;">{% lang 'VideoNoResults' %}</div>
							</div>
							<div id="youtubeJoinBox">
								<input type="button" value="&raquo;" style="width: 40px;" id="addYouTubeVideos" /><br /><br />
								<input type="button" value="&laquo;" style="width: 40px;" id="removeYouTubeVideos" />
							</div>
							<div id="youtubeRightBox" class="youtubeVideoListBox">
								<ul id="youTubeCurrentVideos" style="display: none;"></ul>
								<div id="noCurrentVideos">{% lang 'VideoClickToAdd' %}</div>
							</div>
						</div>
					</td>
				</tr>
				</table>
			</div><!-- End images & videos -->

			<!-- Start Google website optimizer -->
			<div id="div9">
				<p class="InfoTip" style="margin-bottom: 15px; margin-top: 15px;">{{ GoogleWebsiteOptimizerIntro|raw }}</p>

				<table width="100%" class="Panel" style="margin-top: 0; padding-top: 0;  {{ ShowEnableGoogleWebsiteOptimzer|raw }}">
					<tr>
						<td class="Heading2" colspan="2">{% lang 'GoogleWebsiteOptimizer' %}</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							{% lang 'EnableGoogleWebsiteOptimizer' %}?
						</td>
						<td>
							<input {{ DisableOptimizerCheckbox|raw }} type="checkbox" name="prodEnableOptimizer" id="prodEnableOptimizer" {{ CheckEnableOptimizer|raw }} onclick = "ToggleOptimizerConfigForm({{ SkipOptimizerConfirmMsg|raw }});" />
							<label for="prodEnableOptimizer">{% lang 'YesEnableGoogleWebsiteOptimizer' %}</label>
						</td>
					</tr>
				</table>
				{{ OptimizerConfigForm|raw }}
			</div>
			<!-- End Google website optimizer -->

			<!-- Start Google product search -->
			<div id="div10">
				<p class="InfoTip" style="margin-bottom: 15px; margin-top: 15px;">{% lang 'GoogleProductSearchIntro' %}</p>

				<table width="100%" class="Panel" style="margin-bottom: 0; padding-top: 0;">
					<tr>
						<td class="Heading2" colspan="2">{% lang 'GoogleProductSearch' %}</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							{% lang 'EnableGooglePsForProduct' %}:
						</td>
						<td>
							<input type="checkbox" id="enableGooglePsForProduct" name="enableGooglePsForProduct" value="1" {{ enableGooglePsForProduct|raw }}/>
							<label for="enableGooglePsForProduct">{% lang 'YesEnableGooglePsForProduct' %}</label>
						</td>
					</tr>
				</table>
				<table id="googlePsForm" width="100%" class="Panel" style="margin-bottom: 0; padding-top: 0;">
					<tr>
						<td class="FieldLabel">
							<span class="Required">*</span>&nbsp;{% lang 'GoogleProductCategory' %}:
						</td>
						<td>
							<img style="float: left; padding:5px 0 0 0;" src="images/nodejoin.gif">&nbsp;
							<select name="googleProductCategory" id="googleProductCategory" size="10" class="Field300">
							</select>
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							{% lang 'GTIN' %}:
						</td>
						<td style="padding:5px 0 0 27px;">
							<input type="text" id="global_trade_item_number" name="global_trade_item_number" class="Field400" value="{{ gpsMappedFields.global_trade_item_number|raw }}">
							<br />
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							{% lang 'MPN' %}:
						</td>
						<td style="padding:5px 0 0 27px;">
							<input type="text" id="manufacturer_part_number" name="manufacturer_part_number" class="Field400" value="{{ gpsMappedFields.manufacturer_part_number|raw }}">
							<br />
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							{% lang 'Gender' %}:
						</td>
						<td style="padding:5px 0 0 27px;">
							{{ formBuilder.select('gender', availableGenders, gpsMappedFields.gender, {'class': 'Field150'}) }}
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							{% lang 'AgeGroup' %}:
						</td>
						<td style="padding:5px 0 0 27px;">
							{{ formBuilder.select('ageGroup', availableAgeGroup, gpsMappedFields.age_group, {'class': 'Field170'}) }}
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							{% lang 'Color' %}:
						</td>
						<td style="padding:5px 0 0 27px;">
							<input type="text" id="color" name="color" class="Field400" value="{{ gpsMappedFields.color|raw }}">
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							{% lang 'Size' %}:
						</td>
						<td style="padding:5px 0 0 27px;">
							<input type="text" id="size" name="size" class="Field400" value="{{ gpsMappedFields.size|raw }}">
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							{% lang 'Material' %}:
						</td>
						<td style="padding:5px 0 0 27px;">
							<input type="text" id="material" name="material" class="Field400" value="{{ gpsMappedFields.material|raw }}">
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">
							{% lang 'Pattern' %}:
						</td>
						<td style="padding:5px 0 0 27px;">
							<input type="text" id="pattern" name="pattern" class="Field400" value="{{ gpsMappedFields.pattern|raw }}">
						</td>
					</tr>
				</table>
			</div>
			<!-- End Google product search -->

			<table border="0" cellspacing="0" cellpadding="2" width="100%" class="PanelPlain" id="SaveButtons">
				<tr>
					<td>
						<input type="submit" disabled="disabled" value="{% lang 'SaveAndExit' %}" class="FormButton" />
						<input type="submit" disabled="disabled" value="{{ SaveAndAddAnother|raw }}" onclick="SaveAndAddAnother();" class="FormButton" style="width:130px" />
						<input type="reset" value="{% lang 'Cancel' %}" class="FormButton" onclick="ConfirmCancel()" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	</table>
</div>
</form>

<script type="text/javascript" src="../javascript/jquery.growinguploader.js?{{ JSCacheToken }}"></script>
<script type="text/javascript" src="../javascript/jquery/plugins/ajax.file.upload.js?{{ JSCacheToken }}"></script>
<script type="text/javascript" src="script/multiuploaddialog.js?{{ JSCacheToken }}"></script>
<script type="text/javascript">//<![CDATA[
var shop = { config: { } };

shop.config.DiscountRulesEnabled = '{{ DiscountRulesEnabled|raw }}';
shop.config.NoCategoriesJS = '{{ NoCategoriesJS|raw }}';
shop.config.IsProdRelatedAuto = '{{ IsProdRelatedAuto|raw }}';
shop.config.CurrencyTokenLeft = '{{ CurrencyTokenLeft|raw }}';
shop.config.CurrencyTokenRight = '{{ CurrencyTokenRight|raw }}';
shop.config.AppPath = '{{ AppPath|raw }}';
shop.config.sessionid = '{{ sessionid|raw }}';
shop.config.maxUploadSize = '{{ maxUploadSize|raw }}';

lang.DiscountRulesNotEnabledWarning = '{% jslang 'DiscountRulesNotEnabledWarning' %}';
lang.DiscountRulesVariationWarning = '{% jslang 'DiscountRulesVariationWarning' %}';
lang.PleaseWaitRelated = '{% jslang 'PleaseWaitRelated' %}';
lang.NoProdsInCat = '{% jslang 'NoProdsInCat' %}';
lang.PleaseChooseAProduct = '{% jslang 'PleaseChooseAProduct' %}';
lang.ProdAlreadyInRelatedList = '{% jslang 'ProdAlreadyInRelatedList' %}';
lang.MoreImages = '{% jslang 'MoreImages' %}';
lang.LessImages = '{% jslang 'LessImages' %}';
lang.EnterProductFieldName = '{% jslang 'EnterProductFieldName' %}';
lang.EnterProductFieldFileType = '{% jslang 'EnterProductFieldFileType' %}';
lang.EnterProductFieldFileSize = '{% jslang 'EnterProductFieldFileSize' %}';
lang.EnterValidProductFieldFileSize = '{% jslang 'EnterValidProductFieldFileSize' %}';
lang.DiscountRulesQuantityMinRequired = '{% jslang 'DiscountRulesQuantityMinRequired' %}';
lang.DiscountRulesQuantityMinInvalid = '{% jslang 'DiscountRulesQuantityMinInvalid' %}';
lang.DiscountRulesQuantityMaxRequired = '{% jslang 'DiscountRulesQuantityMaxRequired' %}';
lang.DiscountRulesQuantityMaxInvalid = '{% jslang 'DiscountRulesQuantityMaxInvalid' %}';
lang.DiscountRulesTypeRequired = '{% jslang 'DiscountRulesTypeRequired' %}';
lang.DiscountRulesTypeInvalid = '{% jslang 'DiscountRulesTypeInvalid' %}';
lang.DiscountRulesAmountRequired = '{% jslang 'DiscountRulesAmountRequired' %}';
lang.DiscountRulesAmountInvalid = '{% jslang 'DiscountRulesAmountInvalid' %}';
lang.DiscountRulesAmountPriceInvalid = '{% jslang 'DiscountRulesAmountPriceInvalid' %}';
lang.DiscountRulesAmountPercentInvalid = '{% jslang 'DiscountRulesAmountPercentInvalid' %}';
lang.DiscountRulesAmountPercentIsFloat = '{% jslang 'DiscountRulesAmountPercentIsFloat' %}';
lang.DiscountRulesAmountFixedInvalid = '{% jslang 'DiscountRulesAmountFixedInvalid' %}';
lang.DiscountRulesQuantityMinHigher = '{% jslang 'DiscountRulesQuantityMinHigher' %}';
lang.DiscountRulesQuantityBothAstrix = '{% jslang 'DiscountRulesQuantityBothAstrix' %}';
lang.DiscountRulesQuantityMinPrevMaxAstrix = '{% jslang 'DiscountRulesQuantityMinPrevMaxAstrix' %}';
lang.DiscountRulesQuantityMinOverlap = '{% jslang 'DiscountRulesQuantityMinOverlap' %}';
lang.DiscountRulesQuantityMaxOverlap = '{% jslang 'DiscountRulesQuantityMaxOverlap' %}';
lang.EnterProdName = '{% jslang 'EnterProdName' %}';
lang.MustCreateCategoryFirst = '{% jslang 'MustCreateCategoryFirst' %}';
lang.ChooseCategory = '{% jslang 'ChooseCategory' %}';
lang.EnterPrice = '{% jslang 'EnterPrice' %}';
lang.EnterCostPrice = '{% jslang 'EnterCostPrice' %}';
lang.EnterRetailPrice = '{% jslang 'EnterRetailPrice' %}';
lang.EnterSalePrice = '{% jslang 'EnterSalePrice' %}';
lang.ChooseValidImage = '{% jslang 'ChooseValidImage' %}';
lang.EnterWeight = '{% jslang 'EnterWeight' %}';
lang.EnterWidth = '{% jslang 'EnterWidth' %}';
lang.EnterHeight = '{% jslang 'EnterHeight' %}';
lang.EnterDepth = '{% jslang 'EnterDepth' %}';
lang.EnterFixedShipping = '{% jslang 'EnterFixedShipping' %}';
lang.ProductHasNoDownloads = '{% jslang 'ProductHasNoDownloads' %}';
lang.EnterCurrentInventory = '{% jslang 'EnterCurrentInventory' %}';
lang.EnterLowInventory = '{% jslang 'EnterLowInventory' %}';
lang.ChooseProductVariation = '{% jslang 'ChooseProductVariation' %}';
lang.VariationChooseVariation = '{% jslang 'VariationChooseVariation' %}';
lang.VariationEnterValidPrice = '{% jslang 'VariationEnterValidPrice' %}';
lang.VariationEnterValidWeight = '{% jslang 'VariationEnterValidWeight' %}';
lang.VariationEnterValidImage = '{% jslang 'VariationEnterValidImage' %}';
lang.VariationEnterValidStockLevel = '{% jslang 'VariationEnterValidStockLevel' %}';
lang.VariationEnterValidLowStockLevel = '{% jslang 'VariationEnterValidLowStockLevel' %}';
lang.EnterCustomFieldName = '{% jslang 'EnterCustomFieldName' %}';
lang.SelectOneMoreWrapOptions = '{% jslang 'SelectOneMoreWrapOptions' %}';
lang.EnterSortOrder = '{% jslang 'EnterSortOrder' %}';
lang.EnterEventDateName = '{% jslang 'EnterEventDateName' %}';
lang.EnterEventDateRange = '{% jslang 'EnterEventDateRange' %}';
lang.AddProductWithEmptyDimensions = '{% jslang 'AddProductWithEmptyDimensions' %}';
lang.ConfirmCancelProduct = '{% lang 'ConfirmCancelProduct' %}';
lang.ChooseOptionValue = '{% jslang 'ChooseOptionValue' %}';
lang.MorePricingOptions = '{% jslang 'MorePricingOptions' %}';
lang.LessPricingOptions = '{% jslang 'LessPricingOptions' %}';
lang.ConfirmChangeDownloadEdit = '{% jslang 'ConfirmChangeDownloadEdit' %}';
lang.InvalidExpiresAfter = '{% jslang 'InvalidExpiresAfter' %}';
lang.InvalidMaxDownloads = '{% jslang 'InvalidMaxDownloads' %}';
lang.SavingDownload = '{% jslang 'SavingDownload' %}';
lang.UploadFailed2 = '{% jslang 'UploadFailed2' %}';
lang.SelectDownloadFile = '{% jslang 'SelectDownloadFile' %}';
lang.UploadingDownload = '{% jslang 'UploadingDownload' %}';
lang.ConfirmDeleteDownload = '{% jslang 'ConfirmDeleteDownload' %}';
lang.DigitalDownloadDeleted = '{% jslang 'DigitalDownloadDeleted' %}';
lang.NoParent = '{% jslang 'NoParent' %}';
lang.NoCategoryName = '{% jslang 'NoCategoryName' %}';
lang.ProductWillUseVariation = '{% jslang 'ProductWillUseVariation' %}';
lang.ProductWillUseVariationSemi = '{% jslang 'ProductWillUseVariationSemi' %}';
lang.ConfirmRemoveProdField = '{% jslang 'ConfirmRemoveProdField' %}';
lang.DiscountRulesForEachItem = '{% jslang 'DiscountRulesForEachItem' %}';
lang.DiscountRulesOffEachItem = '{% jslang 'DiscountRulesOffEachItem' %}';
lang.DiscountRulesField = '{% jslang 'DiscountRulesField' %}';
lang.Number0 = '{% jslang 'Number0' %}';
lang.Number1 = '{% jslang 'Number1' %}';
lang.Number2 = '{% jslang 'Number2' %}';
lang.Number3 = '{% jslang 'Number3' %}';
lang.Number4 = '{% jslang 'Number4' %}';
lang.Number5 = '{% jslang 'Number5' %}';
lang.Number6 = '{% jslang 'Number6' %}';
lang.Number7 = '{% jslang 'Number7' %}';
lang.Number8 = '{% jslang 'Number8' %}';
lang.Number9 = '{% jslang 'Number9' %}';
lang.VideoLoading = '{% jslang 'VideoLoading' %}';
lang.VideoPleaseEnterSearchTerm = '{% jslang 'VideoPleaseEnterSearchTerm' %}';
lang.ClickHereToAddADescription = '{% jslang 'ClickHereToAddADescription' %}';
lang.ConfirmDeleteProductImage = '{% jslang 'ConfirmDeleteProductImage' %}';
lang.ChooseProductImage = '{% jslang 'ChooseProductImage' %}';
lang.ProductImagesDeleted = '{% jslang 'ProductImagesDeleted' %}';
lang.ProductImagesDeletedErrors = '{% jslang 'ProductImagesDeletedErrors' %}';
lang.ProductImagesDeletedWarnings = '{% jslang 'ProductImagesDeletedWarnings' %}';
lang.ProductImage = '{% jslang 'ProductImage' %}';
lang.ProductImageAddedSuccessfully = '{% jslang 'ProductImageAddedSuccessfully' %}';
lang.ProductImagesAddedSuccessfully = '{% jslang 'ProductImagesAddedSuccessfully' %}';
lang.ProductImageUrlsFailed = '{% jslang 'ProductImageUrlsFailed' %}';
lang.Images = '{% jslang 'Images' %}';
lang.ProductImagesProcessing = '{% jslang 'ProductImagesProcessing' %}';
lang.ProductImagesUploadError = '{% jslang 'ProductImagesUploadError' %}';
lang.ProductImagesTransportError = '{% jslang 'ProductImagesTransportError' %}';
lang.ProductImagesUploadProgressStatus = '{% jslang 'ProductImagesUploadProgressStatus' %}';
lang.ProductImagesUploadProgressFile = '{% jslang 'ProductImagesUploadProgressFile' %}';
lang.ProductImagesSortOrderChanged = '{% jslang 'ProductImagesSortOrderChanged' %}';
lang.ImageFromGalleryViewLarger = '{% jslang 'ImageFromGalleryViewLarger' %}';
lang.ProductImagesNoSourceImageNoThumbnail = '{% jslang 'ProductImagesNoSourceImageNoThumbnail' %}';
lang.ProductImagesNotUploadedDueToErrors = '{% jslang 'ProductImagesNotUploadedDueToErrors' %}';
lang.ProductImagesAnyImageNotListedHere = '{% jslang 'ProductImagesAnyImageNotListedHere' %}';
lang.UploadAnImage = '{% jslang 'UploadAnImage' %}';
lang.ProductImagesNonFlashIntro = '{% jslang 'ProductImagesNonFlashIntro' %}';
lang.ProductImagesUploadImagesElipsis = '{% jslang 'ProductImagesUploadImagesElipsis' %}';
lang.CancelEdit = '{% jslang 'CancelEdit' %}';
lang.ProductImagesNonFlashRemove = '{% jslang 'ProductImagesNonFlashRemove' %}';
lang.ShowErrorMessage = '{% jslang 'ShowErrorMessage' %}';
lang.ProductImagesChooseAnImage = '{% jslang 'ProductImagesChooseAnImage' %}';
lang.PleaseChooseAReleaseDate = '{% jslang 'PleaseChooseAReleaseDate' %}';
lang.PleaseChooseAReleaseDateInTheFuture = '{% jslang 'PleaseChooseAReleaseDateInTheFuture' %}';
lang.ProductImageEdited = '{% jslang 'ProductImageEdited' %}';
lang.ProductMinimumError = '{% jslang 'ProductMinimumError' %}';
lang.ProductMaximumError = '{% jslang 'ProductMaximumError' %}';
lang.ProductMinimumMaximumError = '{% jslang 'ProductMinimumMaximumError' %}';
lang.sizeInvalid = '{% jslang 'EnterSize' %}';
lang.genderInvalid = '{% jslang 'EnterGender' %}';
lang.colorInvalid = '{% jslang 'EnterColor' %}';
lang.ageGroupInvalid = '{% jslang 'EnterAgeGroup' %}';
lang.chooseGooglePsCategoryIntro = "{% jslang 'ChooseGooglePsCategoryIntro' %}";
lang.chooseGooglePsCategory = "{% jslang 'ChooseGooglePsCategory' %}";
lang.categorySelectLeafCategorySelected = "{% jslang 'CategoryMappingLeafCategorySelected' %}";
lang.categorySelectChooseLeafCategory = "{% jslang 'CategoryMappingChooseLeafCategory' %}";
lang.mapCategoryText = "{% jslang 'MapCategoryText' %}";
lang.enterGoogleProductCategory = "{% jslang 'EnterGoogleProductCategory' %}";
//]]></script>
<script type="text/javascript" src="script/product.js?{{ JSCacheToken }}"></script>
<script type="text/javascript" src="script/product.youtube.js?{{ JSCacheToken }}"></script>
<script type="text/javascript" src="script/product.google.ps.js?{{ JSCacheToken }}"></script>
<script type="text/javascript" src="../javascript/jquery/plugins/jstree/jquery.jstree.js?{{ JSCacheToken }}"></script>
<script type="text/javascript">//<![CDATA[
$(document).ready(function() {

	$('#frmProduct').bind('submit', function () {
		return ValidateForm(CheckAddProductForm);
	});

	{{ OptionButtons|raw }}

	// Toggle the product type
	var f = g('ProductType_0');
	if(f.checked)
	{
		ToggleType(0);
	}
	else
	{
		ToggleType(1);
	}

	ToggleAllowPurchasing();
	ToggleCallForPricing();

	if(g('prodInvTrack_2').checked) {
		$('#prodOptionsRequired').attr('checked', true);
		$('#prodOptionsRequired').attr('disabled', true);
	}

	$('#prodInvTrack_2').click(function() {
		if(this.checked) {
			$('#prodOptionsRequired').attr('checked', true);
			$('#prodOptionsRequired').attr('disabled', true);
		}
	});

	$('#prodInvTrack_1').click(function() {
		$('#prodOptionsRequired').attr('checked', false);
		$('#prodOptionsRequired').attr('disabled', false);
	});

	$('#prodInvTrack_0').click(function() {
		$('#prodOptionsRequired').attr('checked', false);
		$('#prodOptionsRequired').attr('disabled', false);
	});

	{{ MoreImages|raw }}

	ShowTab({{ CurrentTab|raw }});

	// Are related products set to auto?
	if(shop.config.IsProdRelatedAuto == 'checked="checked"') {
		toggle_related_auto(true);
	}

	youtube.videos = '{{ YouTubeVideos|raw }}';
	youtube.init();

	$('input[type=submit]').attr('disabled', '');

	$('input[name=_prodorderable]').bind('click', function(){
		$('._prodorderable_detail').hide();
		if (this.checked) {
			$('#_prodorderable_' + $(this).val() + '_detail').show();
			if ($(this).val() == 'no' && $('#prodWeight').val() == '') {
				$('#prodWeight').val(0);
			}
		}
	});

	$('input[name=_prodorderable]:checked').trigger('click');

	$('#prodreleasedate').datepicker({
		showOn: 'both',
		buttonImage: 'images/calendar.gif',
		buttonImageOnly: true,
		minDate: new Date(),
		firstDay: 1,
		duration: '',
		dateFormat: 'mm/dd/yy'
	});

	$('#prodreleasedate').bind('keydown keyup keypress', function(event){
		switch (event.keyCode) {
			case 8: // backspace
			case 16: // shift
			case 17: // control
			case 18: // alt
			case 35: // end
			case 36: // home
			case 37: // left
			case 38: // up
			case 39: // right
			case 40: // down
			case 46: // delete
				return;
				break;
		}

		if ((event.shiftKey || event.metaKey) && event.keyCode == 88) {
			// cut
			return;
		}

		event.preventDefault();
	});

	$("#OpenGraphUseProductName").change(function() {
		if($(this).is(':checked')) {
			$(this).parent('label').nextAll('.NodeJoin:first').hide();
		}
		else {
			$(this).parent('label').nextAll('.NodeJoin:first').show();
		}
	});

	$("#OpenGraphUseMetaDescription").change(function() {
		if($(this).is(':checked')) {
			$(this).parent('label').nextAll('.NodeJoin:first').hide();
		}
		else {
			$(this).parent('label').nextAll('.NodeJoin:first').show();
		}
	});

	{{ category.categoryPicker("category", CategoryOptions, true, selectedCategories) }}

	{{ category.categoryPicker("relCategory", RelatedCategoryOptions, false) }}

	$("#relCategory").bind("select_node.jstree", function(event, data) {
		var categoryId = data.inst.get_selected().data("id");
		GetProducts(categoryId);
	});

	$('#category').bind('reload_nodes.jstree', function() {
		generateGooglePsCategory();
		$('#category').bind('check_node.jstree', function() { generateGooglePsCategory(); });
		$('#category').bind('uncheck_node.jstree', function() { generateGooglePsCategory(); });
	});

	$("#gpsTabShortCut").live("click", function() {
		$("#tab11").click();
		$("#googleProductCategory option:selected").click();
	});

});

function initQuickCategoryParentList() {
	{{ category.categoryPicker('QuickCatParent', false, false, 'QuickCatParent-0', false, true) }}
}

function generateGooglePsCategory()
{
	GooglePs.removeAllCategories();
	var nodes = $("#category").jstree('get_selected');
	nodes.each(function(index) {
		var node = $(this);
		var categoryId = node.data('id');
		if (categoryId) {
			var categoryPath = $('#category').jstree('get_path', node[0]);
			GooglePs.addCategory(categoryId, categoryPath);
		}
	});

	{% if gpsMappedFields.categoryid %}
		GooglePs.selectedCategoryId = {{ gpsMappedFields.categoryid|raw }};
	{% endif %}

	if ($("#googleProductCategory").val()) {
		GooglePs.selectedCategoryId = $("#googleProductCategory").val();
	}

	if (GooglePs.selectedCategoryId > 0) {
		if ($("#gpsOption_" + GooglePs.selectedCategoryId).length) {
			$("#gpsOption_" + GooglePs.selectedCategoryId).attr("selected", "selected");
		}
	} else {
		$("#enableGooglePsForProduct").attr("checked", false);
	}

	$("#enableGooglePsForProduct").attr("disabled", false);
	$("#enableGooglePsForProduct").change();
}

//]]></script>

{% include 'category.select.modal.tpl' %}

<div style="display:none;" id="UseImageFromWebDialog">
	<div class="ModalTitle">{% lang 'UseImageFromWebDialogTitle' %}</div>
	<div class="ModalContent">
		<input type="text" class="Field100pct UseImageFromWebDialogImageUrl" name="imageurl[]" value="http://" /><br />
		<input type="text" class="Field100pct UseImageFromWebDialogImageUrl" name="imageurl[]" value="http://" /><br />
		<input type="text" class="Field100pct UseImageFromWebDialogImageUrl" name="imageurl[]" value="http://" /><br />
		<input type="text" class="Field100pct UseImageFromWebDialogImageUrl" name="imageurl[]" value="http://" /><br />
		<input type="text" class="Field100pct UseImageFromWebDialogImageUrl" name="imageurl[]" value="http://" /><br />
	</div>
	<div class="ModalButtonRow">
		<div class="FloatLeft">
			<img src="images/loading.gif" alt="" style="vertical-align: middle; display: none;" class="LoadingIndicator" />
			<input type="button" class="CloseButton FormButton" value="{% lang 'Close' %}" onclick="$.modal.close();return false;" />
		</div>
		<input type="button" class="Submit" value="{% lang 'UseImages' %}" onclick="ProductImages.useImageFromWebDialogSubmit();return false;" />
	</div>
</div><!-- end #UseImageFromWebDialog --><!-- located here to be outside of posted product info -->

<div id="QuickCategoryCreation" style="display: none;">
	<div class="ModalTitle">{% lang 'CreateACategory' %}</div>
	<div class="ModalContent">
		<table class="Panel" width="100%">
			<tr>
				<td><strong>{% lang 'CatName' %}:</strong></td>
			</tr>
			<tr>
				<td><input id="QuickCatName" type="text" name="catname" value=""  class="Field250" style="width: 100%;" /></td>
			</tr>
		</table>
		<div style="height: 4px; font-size: 1px;"></div>
		<table class="Panel" width="100%">
			<tr>
				<td><strong>{% lang 'CatParentCategory' %}:</strong></td>
			</tr>
			<tr>
				<td>
					<div id="QuickCatParent" class="categoryPickerLinker"></div>
				</td>
			</tr>
		</table>
	</div>
	<div class="ModalButtonRow">
		<div class="FloatLeft">
			<img src="images/loading.gif" alt="" style="vertical-align: middle; display: none;" class="LoadingIndicator" />
			<input type="button" class="CloseButton FormButton" value="{% lang 'Cancel' %}" onclick="$.modal.close();" />
		</div>
		<input type="button" class="Submit" value="{% lang 'Save' %}" onclick="SaveQuickCategory()" />
	</div>
</div>

<div id="AddProductWithEmptyDimensions" style="display: none;">
<div class="ModalTitle">{% lang 'ConfirmProductDimension' %}</div>
	<div class="ModalContent">
		{% lang 'AddProductWithEmptyDimensions' %}<br /><br />
		<input type="checkbox" value="{% lang 'DontShowDimensionsCheck' %}" id="DontShowDimensionsCheck" name="DontShowDimensionsCheck" /> <label for="DontShowDimensionsCheck">{% lang 'DontShowDimensionsAgain' %}</label>
	</div>
	<div class="ModalButtonRow">
		<div class="FloatLeft">
			<input type="button" class="CloseButton FormButton" value="{% lang 'Cancel' %}" onclick="$.modal.close();" />
		</div>
		<input type="button" class="Submit" value="{% lang 'Continue' %}" onclick="CheckedDimensionsContinue()" />
	</div>
</div>
