<script>
var MCSLearnMore = "{{ MCSLearnMore|raw }}";
var VSCLearnMore = "{{ VSCLearnMore|raw }}";
</script>
<div style="margin-left: 170px; width: 500px;">
<small>
{% lang 'PreAuthenticationMessage' %}
</small>
</div>
<div style="margin-left: 170px;">
<a href="#" target="view" onClick="ShowPopupHelp(MCSLearnMore, '{{ ShopPathSSL|raw }}', true); return false;"> <img src="{{ ModuleImagePath|raw }}/mcsc_learn_more.gif" alt="MasterCard SecureCode" border="0" /></a> &nbsp;<a href="#" target="view" onClick="ShowPopupHelp(VSCLearnMore, '{{ ShopPathSSL|raw }}', true); return false;"><img src="{{ ModuleImagePath|raw }}/vbv_learn_more.gif" alt="Verified by Visa" border="0"></a>
</div>
