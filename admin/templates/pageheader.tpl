<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html {% if rtl %}dir="rtl"{% endif %} xml:lang="{{ language }}" lang="{{ language }}">
<head>
	<title>{{ ControlPanelTitle|raw }}</title>
	<meta http-equiv="Content-Type" content="text/html; charset={{ CharacterSet }}" />
	<meta name="robots" content="noindex, nofollow" />
	<style type="text/css">
		@import url("Styles/styles.css?{{ JSCacheToken }}");
		@import url('Styles/new.css?{{ JSCacheToken }}');
		@import url('Styles/tabmenu.css?{{ JSCacheToken }}');
		@import url("Styles/iselector.css?{{ JSCacheToken }}");
		@import url('../javascript/jquery/plugins/imodal/imodal.css?{{ JSCacheToken }}');
		@import url('Styles/iconsearchbox.css?{{ JSCacheToken }}');
		@import url('Styles/thickbox.css?{{ JSCacheToken }}');
		{{ AdditionalStylesheets|raw }}
	</style>
	<link rel="SHORTCUT ICON" href="{{ FaviconPath }}" />
	<!--[if IE]>
	<style type="text/css">
		@import url("Styles/ie.css?{{ JSCacheToken }}");
	</style>
	<![endif]-->

	{{ RTLStyles|raw }}

	{% for script in headScripts %}
		<script type="text/javascript" src="{{ script }}?{{ JSCacheToken }}"></script>
	{% endfor %}

	<script type="text/javascript">
		$(document).ready(function() {
			$('.GridPanel input:checkbox').shiftcheckbox();
		});
		config.ProductName = '{{ ProductName|raw }}';
		config.ShopPath = '{{ ShopPath|raw }}';
		var ThousandsToken = '{{ ThousandsToken }}';
		var DecimalToken = '{{ DecimalToken }}';
		var DimensionsThousandsToken = '{{ DimensionsThousandsToken }}';
		var DimensionsDecimalToken = '{{ DimensionsDecimalToken }}';
		{{ DefineLanguageVars|raw }}
		var url = 'remote.php';
	</script>
</head>
<body>
	<div id="AjaxLoading"><img src="images/ajax-loader.gif" />&nbsp; {% lang 'LoadingPleaseWait' %}</div>
{{ WarningNotices|raw }}
<div class="OuterContainer">
	<div class="Header">
		<div class="logo">
			<a href="index.php">{{ AdminLogo|raw }}</a>
		</div>

		<div class="textlinks">
			{{ textLinks|raw }}
		</div>

		<div class="LoggedInAs">
			{{ CurrentlyLoggedInAs|raw }},
			<a href="index.php?ToDo=logOut" class="Logout">{% lang 'Logout' %}?</a>
		</div>
	</div>

	<div class="menuBar">


		<div class="ControlPanelSearchBar">
			<form method="post" action="index.php?ToDo=quickSearch">
				<input id="quicksearch" onfocus="$(this).addClass('QuickSearchFocused'); if(!$(this).data('custom')) { $(this).val(''); }" onblur="if($(this).val()) { $(this).data('custom', 1); return; } $(this).removeClass('QuickSearchFocused'); if(!$(this).val()) { $(this).val('{% lang 'QuickSearchValue' %}'); $(this).data('custom', 0); }" name="query" type="text" value="{% lang 'QuickSearchValue' %}" />
			</form>
		</div>
		{{ menuRow|raw }}
	</div>

	<div class="ContentContainer">

		<div id="PageBreadcrumb" class="Breadcrumb"  style="{{ HideBreadcrumb|raw }}">
			<ul>
				{{ BreadcrumbTrail|raw }}
			</ul>
		</div>

	<script type="text/javascript">//<!--
		// not in DOM ready, we want this to happen ASAP so the user doesn't see a colour flicker
		$('#PageBreadcrumb ul li:last').addClass('Last').prev('li').addClass('SecondLast');
	//--></script>

		{{ InfoTip|raw }}
