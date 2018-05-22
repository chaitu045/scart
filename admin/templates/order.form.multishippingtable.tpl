{% import "macros/util.tpl" as util %}
{% import "macros/forms.tpl" as forms %}
{% import "macros/orderform.tpl" as orderform %}

{% if unallocatedItems|length %}
	<div class="shippingItemsGrid shippingUnallocatedGrid">
		{{ forms.startForm }}
			{{ forms.heading(lang.SelectProductsToAllocate) }}

			{{ forms.startRow }}
				<table class="gridTable">
					<thead>
						<tr>
							<th class="shippingItemsCheck"><input type="checkbox" /></th>
							<th>{% lang 'Product' %}</th>
							<th class="shippingItemsQuantity">{% lang 'UnallocatedQuantity' %}</th>
							<th class="shippingItemsAction">{% lang 'Action' %}</th>
						</tr>
					</thead>
					<tbody>
						{% for item in unallocatedItems %}
							<tr class="itemRow" id="shippingUnallocated_{{ item.id }}">
								<td class="shippingItemsCheck"><input type="checkbox" name="items[]" value="{{ item.id }}" /></td>
								<td>
									<div class="shippingItemsName">{{ item.name }}</div>
									{{ orderform.itemConfiguration(item) }}
								</td>
								<td class="shippingItemsQuantity">
									{{ item.quantity }}
								</td>
								<td class="shippingItemsAction">
									<a href="#" class="selectItemDestinationLink">{% lang 'SelectDestination' %}</a>
								</td>
							</tr>
						{% endfor %}
					</tbody>
				</table>
				<div class="shippingItemsGridControls">
					<img src="images/nodejoin.gif" alt="" />
					<input type="button" class="selectItemsDestinationLink" value="{% lang 'SelectDestinationForProducts' %}" />
				</div>
			{{ forms.endRow }}
		{{ forms.endForm }}
	</div>
{% endif %}

{% if allocatedItems|length %}
	<div class="shippingItemsGrid shippingDestinationGrid">
		{{ forms.startForm }}
			{{ forms.heading(lang.ShippingDestinations) }}

			{{ forms.startRow }}
				<table class="gridTable">
					<thead>
						<tr>
							<th>{% lang 'DestinationAndItems' %}</th>
							<th class="shippingDestinationMethod">{% lang 'Method' %}</th>
							<th class="shippingDestinationCost">{% lang 'ShippingCost' %}</th>
							<th class="shippingDestinationMethodAction">{% lang 'Action' %}</th>
						</tr>
					</thead>
					<tbody>
						{% for shippingAddress in shippingAddresses %}
							{% if shippingAddress.id != 'unallocated' %}
								<tr id="shippingDestination_{{ shippingAddress.id }}" class="shippingDestinationRow">
									<td>
										<div class="shippingDestinationAddressLine">
											{{ shippingAddress.line }}
										</div>
										<ul class="shippingDestinationItemList">
											{% for item in shippingAddress.items %}
												<li>
													{{ item.quantity }} x {{ item.name }}
													{{ orderform.itemConfiguration(item) }}
												</li>
											{% endfor %}
										</ul>
									</td>
									<td class="shippingDestinationMethod">{{ shippingAddress.shippingProvider }}</td>
									<td class="shippingDestinationCost">{{ shippingAddress.shippingCost(incTax)|formatPrice }}</td>
									<td class="shippingDestinationMethodAction">
										<a href="#" class="shippingDestinationChangeLink">{% lang 'Change' %}</a>
										<a href="#" class="shippingDestinationDeleteLink">{% lang 'Delete' %}</a>
									</td>
								</tr>
							{% endif %}
						{% endfor %}
					</tbody>
				</table>
			{{ forms.endRow }}
		{{ forms.endForm }}
	</div>
{% endif %}
