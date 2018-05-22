<form name="redirectform" method="POST" action="{{ AuthURL|raw }}">
<input type=hidden name="PaReq" value="{{ Payload|raw }}">
<input type=hidden name="TermUrl" value="{{ TermUrl|raw }}">
<input type=hidden name="MD" value="{{ MD|raw }}">

<NOSCRIPT>
<center><p>{% lang 'PayPalRedirectInstruction' %}</p><input type="submit" value="Go"/></p></center>
</NOSCRIPT>
</form>


<script type="text/javascript">
document.write("<center><p>{% lang 'PayPalWaitToBeRedirected' %}</p></center>");
//<![CDATA[
function SubmitForm() {
	document.redirectform.submit();
}

window.onload = SubmitForm;
//]]>
</script>