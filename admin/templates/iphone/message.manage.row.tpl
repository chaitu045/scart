<li class="group">{{ Subject|raw }}</li>
<li>
	{{ OrderMessage|raw }}
	<div style="color:gray; font-size:11px">
		{% lang 'From' %} {{ OrderFrom|raw }} {% lang 'OnWord' %} {{ MessageDate|raw }}
	</div>
</li>
