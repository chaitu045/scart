

	<tr id="tr{{ MessageId|raw }}" class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">

		<td width="25" align="center"><input type="checkbox" name="messages[]" value="{{ MessageId|raw }}"></td>

		<td width="25" align="center">

			<img src="images/message.gif">

		</td>

		<td width="25" align="center">

			<img src="images/messageflag.gif" style="display:{{ HideFlag|raw }}">&nbsp;

		</td>

		<td>

			<div style="margin-left:20px">{{ Subject|raw }}</div>

		</td>

		<td>

			{{ OrderMessage|raw }}

		</td>

		<td>

			{{ OrderFrom|raw }}

		</td>

		<td>

			{{ MessageDate|raw }}

		</td>

		<td nowrap>

			{{ MessageStatus|raw }}

		</td>

		<td>

			<a title="{% lang 'EditMessage' %}" href="{{ ShopPath|raw }}/admin/index.php?ToDo=editOrderMessage&amp;orderId={{ OrderId|raw }}&amp;messageId={{ MessageId|raw }}">{% lang 'Edit' %}</a>&nbsp;&nbsp;&nbsp;

			<a title="{% lang 'FlagMessage' %}" href="{{ ShopPath|raw }}/admin/index.php?ToDo=flagOrderMessage&amp;flagState={{ FlagState|raw }}&amp;orderId={{ OrderId|raw }}&amp;messageId={{ MessageId|raw }}">{{ FlagText|raw }}</a>

		</td>

	</tr>

