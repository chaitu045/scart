<form name="redirectform" action="{{ AuthURL|raw }}" method="POST">
<input type="hidden" name="PaReq" value="{{ PaReq|raw }}"/>
<input type="hidden" name="TermUrl" value="{{ TermUrl|raw }}"/>
<input type="hidden" name="MD" value="{{ MD|raw }}"/>
<NOSCRIPT>
<center><p>{% lang 'ProtxVspDirect3DRedirectInstruction' %}</p><input type="submit" value="Go"/></p></center>
</NOSCRIPT>
</form>
<script type="text/javascript">
//<![CDATA[
function SubmitForm() {
	document.redirectform.submit();
}

window.onload = SubmitForm;
//]]>
</script>
