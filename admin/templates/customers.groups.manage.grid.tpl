
			<tr class="Heading3" style="display: {{ DisplayGrid|raw }}">
				<td align="center" style="width:18px"><input type="checkbox" onclick="ToggleDeleteBoxes(this.checked)"></td>
				<td>&nbsp;</td>
				<td>
					{% lang 'CustomerGroupName' %} &nbsp;
					{{ SortLinksGroupName|raw }}
				</td>
				<td>
					{% lang 'Discount' %} &nbsp;
					{{ SortLinksDiscount|raw }}
				</td>
				<td>
					<span class="HelpText" onmouseout="HideQuickHelp(this);" onmouseover="ShowQuickHelp(this, '{% lang 'DiscountRules' %}', '{% lang 'DiscountRulesHelp' %}');">{% lang 'DiscountRules' %}</span> &nbsp;
					{{ SortLinksDiscountRules|raw }}
				</td>
				<td>
					{% lang 'CustomersInGroup' %} &nbsp;
					{{ SortLinksCustomersInGroup|raw }}
				</td>
				<td style="width:120px;">
					{% lang 'Action' %}
				</td>
			</tr>
			{{ CustomerGroupsGrid|raw }}
			<tr align="right">
				<td colspan="11" style="padding:6px 0px 6px 0px" class="PagingNav">
					{{ Nav|raw }}
				</td>
			</tr>
