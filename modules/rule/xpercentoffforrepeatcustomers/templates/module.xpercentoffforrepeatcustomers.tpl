{% lang 'XPERCENTOFFFORREPEATCUSTOMERSIf' %}
{{ Qty0|raw }}
{% lang 'XPERCENTOFFFORREPEATCUSTOMERSThen' %}
<input name="var_amount" class="Field20" id="amount" size="3" maxlength="6" value="{{ var_amount|raw }}"></input>%
{% lang 'XPERCENTOFFFORREPEATCUSTOMERSOff' %}

<script type="text/javascript">

$('#orders').val({{ var_orders|raw }});

</script>