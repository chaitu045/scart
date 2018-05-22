{% if idletime %}
<script type="text/javascript" src="../javascript/jquery/plugins/idletimer/cookie.js?{{ JSCacheToken }}"></script>
<script type="text/javascript" src="../javascript/jquery/plugins/idletimer/idletimer.js?{{ JSCacheToken }}"></script>
<script type="text/javascript">
(function($){
	$.idleTimer({{ idletime }}, {});
})(jQuery);
</script>
{% endif %}

