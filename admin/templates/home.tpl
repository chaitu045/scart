<script language="javascript" type="text/javascript">//<![CDATA[
if (typeof lang == 'undefined') { lang = {}; }
lang.ConfirmCancel = "{% lang 'ConfirmCancel' %}";
//]]></script>
<div class="BodyContainer" style="margin-top: 0;">
	<div style="{{ HideGettingStarted|raw }}" class="DashboardGettingStarted">
		{{ GettingStarted|raw }}
	</div>
	<div style="{{ HideOverview|raw }}" class="DashboardCommonTasks">
		<div class="Heading1">{% lang 'Home' %}</div>
		{{ Messages|raw }}
		<div class="DashboardRightColumn">
			<div class="DashboardPanel DashboardPanelCurrentNotifications" style="{{ HideNotificationsList|raw }}">
				<div class="DashboardPanelContent">
					<h3>{% lang 'PendingItems' %}</h3>
					<ul>
						{{ NotificationsList|raw }}
					</ul>
				</div>
			</div>

			<div class="DashboardPanel DashboardPanelPerformanceIndicators" id="DashboardPanelPerformanceIndicators" style="{{ HideDashboardPerformanceIndcators|raw }}">
				<div class="DashboardPanelContent">
					<div class="DashboardPillMenu DashboardPerformanceIndicatorsPeriodButton">
						<div class="DashboardPillMenuStart"></div>
						<div class="DashboardPillMenuEnd"></div>
						<span class="Label">
							{% lang 'View' %}:
						</span>
						<span class="Buttons">
							<a href="#" class="{{ PerformanceIndicatorsActiveDay|raw }}" rel="period=day">{% lang 'Day' %}</a>
							<a href="#" class="{{ PerformanceIndicatorsActiveWeek|raw }}" rel="period=week">{% lang 'Week' %}</a>
							<a href="#" class="{{ PerformanceIndicatorsActiveMonth|raw }}" rel="period=month">{% lang 'Month' %}</a>
							<a href="#" class="{{ PerformanceIndicatorsActiveYear|raw }} Last" rel="period=year">{% lang 'Year' %}</a>
						</span>
					</div>
					<h3>{% lang 'StoreSnapshot' %}</h3>
					<div id="DashboardPerformanceIndicators">
						{{ PerformanceIndicatorsTable|raw }}
					</div>
				</div>
			</div>

			<div class="DashboardPanel DashboardPanelOrderBreakdown" style="{{ HideDashboardBreakdownGraph|raw }}">
				<div class="DashboardPanelContent">
					<span class="DashboardActionButton DashboardOrderBreakdownAllStatsButton">
						<a href="index.php?ToDo=viewStats">
							<span class="ButtonArrow"></span>
							<span class="ButtonText ButtonTextWithArrow">{% lang 'ViewAllStatistics' %}</span>
						</a>
					</span>
					<h3>{% lang 'OrderBreakDown' %} <small>({% lang 'Last7Days' %})</small></h3>
					<ul class="OrderBreakdownChart">
						{{ DashboardBreakdownGraph|raw }}
					</ul>
					<div class="OrderBreakdownChartKey">
						<div class="First">{{ GraphSeriesLabel0|raw }}</div>
						<div>{{ GraphSeriesLabel1|raw }}</div>
						<div>{{ GraphSeriesLabel2|raw }}</div>
						<div>{{ GraphSeriesLabel3|raw }}</div>
						<div class="Last">{{ GraphSeriesLabel4|raw }}</div>
					</div>
				</div>
			</div>
			<div class="DashboardPanel DashboardPanelHelpArticles" style="{{ HidePopularHelpArticles|raw }}">
				<div class="DashboardPanelContent" style="overflow: auto">
					<form action="{{ SearchKnowledgeBaseUrl|raw }}" method="post" class="DashboardHelpArticlesSearchForm" style="{{ HideSearchKnowledgeBase|raw }}">
						<input type="text" name="q" class="DashboardHelpSearchQuery DashboardHelpSearchHasImage" />
						<span class="DashboardActionButton">
							<a href="#">
								<span class="ButtonText">{% lang 'Go' %}</span>
							</a>
						</span>
					</form>
					<h3>{% lang 'PopularHelpArticles' %}</h3>
					<div class="HelpArticlesList">
						<img src="images/ajax-loader.gif" alt="" />
					</div>
					<span class="DashboardActionButton DashboardBrowseAllHelpArticlesButton">
						<a href="{{ ViewKnowledgeBaseLink|raw }}">
							<span class="ButtonArrow"></span>
							<span class="ButtonText ButtonTextWithArrow">{% lang 'ViewKnowledgeBase' %}</span>
						</a>
					</span>
				</div>
			</div>
		</div>
		<div class="DashboardLeftColumn">

			<div class="DashboardPanel DashboardPanelFeatured DashboardPanelOverview">
				<div class="DashboardPanelContent">
					<div class="DashboardWhatsNext">
						<a href="#" class="ToggleLink GettingStartedToggleLink" style="{{ HideToggleGettingStartedAtGlance|raw }}">{% lang 'SwitchToGettingStarted' %}</a>
						<h3>{% lang 'WhatsNext' %}</h3>
						<a href="index.php?ToDo=viewOrders" class="DashboardWhatsNextLink DashboardWhatsNextManageOrders" style="{{ HideManageOrdersLink|raw }}">
							<span>{% lang 'NextManageOrders' %}</span>
						</a>
						<a href="index.php?ToDo=addProduct" class="DashboardWhatsNextLink DashboardWhatsNextAddAProduct" style="{{ HideAddProductLink|raw }}">
							<span>{% lang 'NextAddAProduct' %}</span>
						</a>
						<br class="ClearLeft" />
					</div>
					<div class="DashboardAtAGlance" style="{{ HideAtAGlance|raw }}">
						<h3>{% lang 'YourStoreAtAGlance' %}</h3>
						<ul>
							{{ AtGlanceItems|raw }}
						</ul>
						<br class="ClearLeft" />
					</div>
				</div>
			</div>
			<div class="DashboardPanel DashboardPanelRecentOrders" style="{{ HideRecentOrders|raw }}">
				<div class="DashboardPanelContent">
					<span class="DashboardActionButton DashboardRecentOrdersAllButton">
						<a href="index.php?ToDo=viewOrders">
							<span class="ButtonArrow"></span>
							<span class="ButtonText ButtonTextWithArrow">{% lang 'ViewAllOrders' %}</span>
						</a>
					</span>
					<h3><span id="DashboardRecentOrdersTitle">{% lang 'RecentOrders' %}</span> {% lang 'LowerOn' %} {{ StoreName|raw }}</h3>
					<div class="DashboardFilterOptions" style="margin-top: 18px;">
						<div>
							{% lang 'Show' %}:
						</div>
						<ul class="DashboardRecentOrdersToggle">
							<li class="{{ RecentOrdersActiveRecentClass|raw }}"><a href="#" rel="status=recent">{% lang 'RecentOrders' %}</a></li>
							<li class="{{ RecentOrdersActivePendingClass|raw }}"><a href="#" rel="status=pending">{% lang 'PendingOrders' %}</a></li>
							<li class="{{ RecentOrdersActiveCompletedClass|raw }}"><a href="#" rel="status=completed">{% lang 'CompletedOrders' %}</a></li>
							<li class="{{ RecentOrdersActiveRefundedClass|raw }}"><a href="#" rel="status=refunded">{% lang 'RefundedOrders' %}</a></li>
						</ul>
						<br style="clear: left;" />
					</div>
					<ul style="clear: left" class="DashboardRecentOrderList">
						{{ RecentOrdersList|raw }}
					</ul>
				</div>
			</div>
		</div>
	</div>
	<br class="Clear" />
</div>
{% if displayAnnouncements %}
<script language="javascript" src="script/announcements.js?{{ JSCacheToken }}" />
{% endif %}

<script language="javascript" src="script/category.selector.js?{{ JSCacheToken }}"></script>
<script language="javascript" src="script/google.ps.category.warning.js?{{ JSCacheToken }}"></script>

<script language="javascript" type="text/javascript">//<![CDATA[
	lang.googleCategorySelectLeafCategorySelected = "{% jslang 'GoogleCategoryMappingLeafCategorySelected' %}";
	lang.categorySelectChooseLeafCategory = "{% jslang 'CategoryMappingChooseLeafCategory' %}";
	lang.ChooseGooglePsCategory = "{% jslang 'ChooseGooglePsCategory' %}";
	lang.ChooseGooglePsCategoryIntro = "{% jslang 'ChooseGooglePsCategoryIntro' %}";
//]]></script>

{% include 'googleps.category.warning.tpl' %}
{% include 'googleps.bulkedit.modal.tpl' %}
