<div id="gpsCategoryWarning" style="padding-top: 10px; display:none;">
	<div class="ModalTitle">
		{% lang 'InvalidGoogleProductCategoryTitle' %}
	</div>
	<div class="ModalContent">
		<div class="categoriesRemapDialog" style="display:none;">
			<div style="margin-top:0px;">
				{% lang 'RemapCategoryText' %}:
			</div>
			<div style="overflow-x:auto; max-height:100px;margin-top:5px;">
				<table id="invalidCategoryRows" style="display:none;" width="100%">
					<tr class="changeCategoryRow" style="display:none;">
						<td>
							<span class="categoryName"></span>
						</td>
						<td style="text-align:right;">
							<span>
								(<a href="#" class="changeCategoryLink">{% lang 'Update' %}</a>)
							</span>
						</td>
					</tr>

				</table>
			</div>
		</div>
		<div class="MessageBox MessageBoxSuccess displayMessageDialog" style="display:none;">
			{% lang 'AllCategoriesValid' %}
		</div>
	</div>
	<div class="ModalButtonRow">
		<div class="FloatLeft">
			<input type="button" id="closeCatWarningModal" class="close FormButton" value="{% lang 'Close' %}"/>
		</div>
	</div>
</div>
