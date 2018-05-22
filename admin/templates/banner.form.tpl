{% import "macros/category.tpl" as category %}
	<form action="index.php?ToDo={{ FormAction|raw }}" id="frmBanner" method="post">
	<input type="hidden" name="bannerId" value="{{ BannerId|raw }}">
	<div class="BodyContainer">
	<table class="OuterPanel">
	  <tr>
		<td class="Heading1" id="tdHeading">{{ Title|raw }}</td>
		</tr>
		<tr>
		<td class="Intro">
			<p>{% lang 'BannerIntro' %}</p>
			{{ Message|raw }}
			<p><input type="submit" name="SubmitButton1" value="{% lang 'Save' %}" class="FormButton">&nbsp; <input type="button" name="CancelButton1" value="{% lang 'Cancel' %}" class="FormButton" onclick="ConfirmCancel()"></p>
		</td>
	  </tr>
		<tr>
			<td>
			  <table class="Panel">
				<tr>
				  <td class="Heading2" colspan=2>{% lang 'NewBannerDetails' %}</td>
				</tr>
				<tr>
					<td class="FieldLabel">
						<span class="Required">*</span>&nbsp;{% lang 'BannerName' %}:
					</td>
					<td>
						<input type="text" id="bannername" name="bannername" class="Field400" value="{{ BannerName|raw }}">
						<img onmouseout="HideHelp('d1');" onmouseover="ShowHelp('d1', '{% lang 'BannerName' %}', '{% lang 'BannerNameHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
						<div style="display:none" id="d1"></div>
					</td>
				</tr>
				<tr>
					<td class="FieldLabel">
						<span class="Required">*</span>&nbsp;{% lang 'BannerContent' %}:
					</td>
					<td>
						{{ WYSIWYG|raw }}
						<img onmouseout="HideHelp('d2');" onmouseover="ShowHelp('d2', '{% lang 'BannerContent' %}', '{% lang 'BannerContentHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
						<div style="display:none" id="d2"></div>
					</td>
				</tr>
				<tr>
					<td class="FieldLabel">
						<span class="Required">*</span>&nbsp;{% lang 'BannerPage' %}:
					</td>
					<td>
						<input type="radio" name="bannerpage" id="bannerpage1" value="home_page" {{ IsHomePage|raw }} /> <label for="bannerpage1">{% lang 'BannerHomePage' %}</label>
						<img onmouseout="HideHelp('d3');" onmouseover="ShowHelp('d3', '{% lang 'BannerPage' %}', '{% lang 'BannerPageHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
						<div style="display:none" id="d3"></div>
						<br />
						<input type="radio" name="bannerpage" id="bannerpage2" value="category_page" {{ IsCategory|raw }} /> <label for="bannerpage2">{% lang 'BannerCategoryPage' %}</label><br />
							<div id="page_category" style="padding-left:25px">
								<div id="bannerCategories" class="categoryPicker Field200"></div>
								<input type="hidden" name="bannercat" id="bannercat" value="{{ bannerCategory }}" />
							</div>
						<input type="radio" name="bannerpage" id="bannerpage3" value="brand_page" {{ IsBrand|raw }} /> <label for="bannerpage3">{% lang 'BannerBrandPage' %}</label><br />
							<div id="page_brand" style="padding-left:25px">
								<select name="bannerbrand" id="bannerbrand" class="Field200">
									<option value="">{% lang 'ChooseABrand' %}</option>
									{{ BrandOptions|raw }}
								</select>
							</div>
						<input type="radio" name="bannerpage" id="bannerpage4" value="search_page" {{ IsSearch|raw }} /> <label for="bannerpage4">{% lang 'BannerSearchPage' %}</label><br />
					</td>
				</tr>
				<tr>
					<td class="FieldLabel">
						&nbsp;&nbsp;&nbsp;{% lang 'BannerDateRange' %}:
					</td>
					<td>
						<input type="radio" id="bannerdate1" name="bannerdate" value="always" {{ IsAlwaysDate|raw }}> <label for="bannerdate1">{% lang 'BannerDisplayAlways' %}</label>
						<img onmouseout="HideHelp('d4');" onmouseover="ShowHelp('d4', '{% lang 'BannerDateRange' %}', '{% lang 'BannerDateRangeHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
						<div style="display:none" id="d4"></div>
						<br />
						<input type="radio" id="bannerdate2" name="bannerdate" value="custom" {{ IsCustomDate|raw }}> <label for="bannerdate2">{% lang 'BannerDisplayBetween' %}</label>
					</td>
				</tr>
				<tr id="trCustomDate" style="display:none">
					<td class="FieldLabel">
						&nbsp;
					</td>
					<td style="padding-left:25px">
						<table border="0">
							<tr>
								<td>
									{% lang 'BannerFrom' %}:
								</td>
								<td>
									<select name="from_day" id="from_day" class="Field70">
										{{ FromDayOptions|raw }}
									</select>
									<select name="from_month" id="from_month" class="Field70">
										{{ FromMonthOptions|raw }}
									</select>
									<select name="from_year" id="from_year" class="Field70">
										{{ FromYearOptions|raw }}
									</select>
								</td>
							</tr>
							<tr>
								<td align="right">
									{% lang 'BannerTo' %}:
								</td>
								<td>
									<select name="to_day" id="to_day" class="Field70">
										{{ ToDayOptions|raw }}
									</select>
									<select name="to_month" id="to_month" class="Field70">
										{{ ToMonthOptions|raw }}
									</select>
									<select name="to_year" id="to_year" class="Field70">
										{{ ToYearOptions|raw }}
									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="FieldLabel">
						&nbsp;&nbsp;&nbsp;{% lang 'Visible' %}:
					</td>
					<td>
						<input type="checkbox" id="bannerstatus" name="bannerstatus" value="ON" {{ Visible|raw }}> <label for="bannerstatus">{% lang 'YesBannerVisible' %}</label>
					</td>
				</tr>
				<tr>
					<td class="FieldLabel">
						<span class="Required">*</span>&nbsp;{% lang 'BannerLocation' %}:
					</td>
					<td>
						<select name="bannerloc" id="bannerloc" class="Field150">
							<option value="">{% lang 'ChooseALocation' %}</option>
							<option value="top" {{ IsLocationTop|raw }}>{% lang 'TopOfPage' %}</option>
							<option value="bottom" {{ IsLocationBottom|raw }}>{% lang 'BottomOfPage' %}</option>
						</select>
						<img onmouseout="HideHelp('d5');" onmouseover="ShowHelp('d5', '{% lang 'BannerLocation' %}', '{% lang 'BannerLocationHelp' %}')" src="images/help.gif" width="24" height="16" border="0">
						<div style="display:none" id="d5"></div>
					</td>
				</tr>
				<tr>
					<td class="Gap">&nbsp;</td>
					<td class="Gap"><input type="submit" name="SubmitButton1" value="{% lang 'Save' %}" class="FormButton">&nbsp; <input type="button" name="CancelButton1" value="{% lang 'Cancel' %}" class="FormButton" onclick="ConfirmCancel()">
					</td>
				</tr>
				<tr><td class="Gap"></td></tr>
				<tr><td class="Gap"></td></tr>
				<tr><td class="Sep" colspan="2"></td></tr>
			 </table>
			</td>
		</tr>
	</table>

	</div>
	</form>

	<script type="text/javascript" src="../javascript/jquery/plugins/jstree/jquery.jstree.js?{{ JSCacheToken }}"></script>
	<script type="text/javascript">//<![CDATA[

		var selected_page = '';

		function ConfirmCancel() {
			if(confirm("{% lang 'ConfirmCancelBanner' %}"))
				document.location.href = "index.php?ToDo=viewBanners";
		}

		function CheckBannerForm() {
			return false;
		}

		function ToggleDate(DateType) {
			if(DateType == "custom") {
				$("#trCustomDate").css("display", "");
			}
			else {
				$("#trCustomDate").css("display", "none");
			}
		}

		// Hide the location options on page load
		$(document).ready(function() {
			$('#page_category').css('display', 'none');
			$('#page_brand').css('display', 'none');

			// Do we need to show the custom date range?
			{{ ShowCustomDate|raw }}

			// Do we need to show the category dropdown?
			{{ ShowCategory|raw }}

			{{ category.categoryPicker("bannerCategories", CategoryOptions, false, 'category-' ~ bannerCategory) }}

			$("#bannerCategories").bind("select_node.jstree", function(event, data) {
				var categoryId = data.rslt.obj.data("id");
				$("#bannercat").val(categoryId);
			});

			// Do we need to show the brand dropdown?
			{{ ShowBrand|raw }}

			{{ SelectedJS|raw }}
		});

		$('#bannerpage1').click(function() {
			$('#page_category').css('display', 'none');
			$('#page_brand').css('display', 'none');
		});

		$('#bannerpage2').click(function() {
			$('#page_category').css('display', '');
			$('#bannercat').focus();
			$('#page_brand').css('display', 'none');
		});

		$('#bannerpage3').click(function() {
			$('#page_brand').css('display', '');
			$('#bannerbrand').focus();
			$('#page_category').css('display', 'none');
		});

		$('#bannerpage4').click(function() {
			$('#page_category').css('display', 'none');
			$('#page_brand').css('display', 'none');
		});

		$('#bannerdate1').click(function() {
			$('#trCustomDate').css('display', 'none');
		});

		$('#bannerdate2').click(function() {
			$('#trCustomDate').css('display', '');
		});

		// Save the page type when it's changed
		$('#bannerpage1').click(function() {
			selected_page = $('#bannerpage1').val();
		});

		$('#bannerpage2').click(function() {
			selected_page = $('#bannerpage2').val();
		});

		$('#bannerpage3').click(function() {
			selected_page = $('#bannerpage3').val();
		});

		$('#bannerpage4').click(function() {
			selected_page = $('#bannerpage4').val();
		});

		// Check the form when it's submitted
		$('#frmBanner').submit(function() {
			if($('#bannername').val() == '') {
				alert('{% lang 'EnterBannerName' %}');
				$('#bannername').focus();
				$('#bannername').select();
				return false;
			}

			switch(selected_page) {
				case 'category_page': {
					if($('#bannercat').val() == '') {
						alert('{% lang 'BannerChooseCat' %}');
						$('#bannercat').focus();
						return false;
					}
					break;
				}
				case 'brand_page': {
					if($('#bannerbrand :selected').val() == '') {
						alert('{% lang 'BannerChooseBrand' %}');
						$('#bannerbrand').focus();
						return false;
					}
					break;
				}
				case '': {
					alert('{% lang 'ChooseBannerShow' %}');
					return false;

				}
			}

			if($('#bannerloc :selected').val() == '') {
				alert('{% lang 'ChooseBannerLocation' %}');
				$('#bannerloc').focus();
				return false;
			}
		});

	//]]></script>
