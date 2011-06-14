$(document).ready ->
	$("textarea.html").each((index, el)->
		$(el).editor({path: '/assets/contrib/imperavi/'})
	)
	$("code .code").each((index, el)->
		CodeMirror.fromTextArea(el, {mode: "application/xml", lineNumbers:true})
	)