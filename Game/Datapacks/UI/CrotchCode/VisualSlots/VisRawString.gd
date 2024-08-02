extends LineEdit

var id

signal onValueChanged(id, newVal)

func setValue(theValue):
	text = theValue

func _on_VisRawString_text_changed(_new_text):
	emit_signal("onValueChanged", id, _new_text)
