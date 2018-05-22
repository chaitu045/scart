{% import "macros/util.tpl" as util %}
		<table class="GridPanel SortableGrid AutoExpand" cellspacing="0" cellpadding="0" border="0" id="IndexGrid" style="width:100%;">
				<tr>
					<td colspan="11">
						<table class="LetterSort" cellspacing="2" cellpadding="0" border="0">
							<tr>
								{% for letter in letters %}
									<td width="3%"><a class="SortLink {% if letter == activeLetter %}ActiveLetter{% endif %}" href="index.php?ToDo=viewCustomers&amp;{{ letterURL|http_build_query }}&amp;letter={{ letter }}">{{ letter }}</a></td>
								{% endfor %}
								<td width="3%"><a class="SortLink" href="index.php?ToDo=viewCustomers&amp;{{ letterURL|http_build_query }}">{% lang 'Clear' %}</a></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr align="right">
					<td colspan="11" style="padding:6px 0px 6px 0px" class="PagingNav">
						{{ util.paging(numCustomers, perPage, currentPage, pageURL, true) }}
					</td>
				</tr>
			<tr class="Heading3">
				<td align="center"><input type="checkbox" onclick="ToggleDeleteBoxes(this.checked)"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>
					{% lang 'CustName' %} &nbsp;
					{{ SortLinksName|raw }}
				</td>
				<td>
					{% lang 'Email' %} &nbsp;
					{{ SortLinksEmail|raw }}
				</td>
				<td>
					{% lang 'Phone' %} &nbsp;
					{{ SortLinksPhone|raw }}
				</td>
				<td style="display: {{ HideGroup|raw }}">
					{% lang 'CustomerGroup' %} &nbsp;
					{{ SortLinksGroup|raw }}
				</td>
				<td style="display: {{ HideStoreCredit|raw }}">
					{% lang 'StoreCredit' %} &nbsp;
					{{ SortLinksStoreCredit|raw }}
				</td>
				<td>
					{% lang 'CustDateCreated' %} &nbsp;
					{{ SortLinksDate|raw }}
				</td>
				<td>
					{% lang 'NumOrders' %} &nbsp;
					{{ SortLinksNumOrders|raw }}
				</td>
				<td>
					{% lang 'Action' %}
				</td>
			</tr>
			{{ CustomerGrid|raw }}
			<tr align="right">
				<td colspan="11" style="padding:6px 0px 6px 0px" class="PagingNav">
					{{ util.paging(numCustomers, perPage, currentPage, pageURL, true) }}
				</td>
			</tr>
		</table>