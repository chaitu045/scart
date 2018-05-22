{% lang 'XOFFFORREPEATCUSTOMERSIf' %}
{{ Qty0|raw }}
{% lang 'XOFFFORREPEATCUSTOMERSThen' %}
{{ CurrencyLeft|raw }}<input type="text" name="varn_amount" class="Field20" id="amount" size="3" value="{{ varn_amount|raw }}" />{{ CurrencyRight|raw }}
{% lang 'XOFFFORREPEATCUSTOMERSOff' %}

<script type="text/javascript">

$('#orders').val({{ var_orders|raw }});

</script>