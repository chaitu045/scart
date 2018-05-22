<table class="GridPanel SortableGrid" cellspacing="0" cellpadding="0" border="0" id="IndexGrid" style="width:100%; margin-top:10px">
	<tr>
		<td colspan="{{ ColSpan|raw }}">
			<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;">
				<td nowrap="nowrap" style="padding-bottom: 10px; padding-left: 10px;">
					{{ DataSummary|raw }}
				</td>
				<td align="right" class="PagingNav" style="padding:6px 0px 6px 0px; width: 100%;">
					{{ Nav|raw }}
				</td>
			</table>
		</td>
	</tr>
	{{ GridData|raw }}
</table>