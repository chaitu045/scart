<div id="ModalTitle">
	{% lang 'GiftWrappingFor' %} {{ ProductQuantity|raw }} x {{ ProductName|raw }}
</div>
<div id="ModalContent" style="min-height: 100px; max-height: 400px; overflow: auto;">
	<table cellspacing="5" cellpadding="0" border="0" width="100%">
		<tr>
			<td class="FieldLabel">{% lang 'GiftWrapping' %}:</td>
			<td style="padding: 4px;">{{ WrapName|raw }} ({{ WrapPrice|raw }})</td>
		</tr>
		<tr style="{{ HideWrapMessage|raw }}">
			<td class="FieldLabel">{% lang 'GiftMessage' %}:</td>
			<td style="padding: 4px;">{{ WrapMessage|raw }}</td>
		</tr>
	</table>
</div>
<div id="ModalButtonRow">
		<input type="button" class="Submit" value="{% lang 'Close' %}" onclick="$.modal.close();" />
</div>