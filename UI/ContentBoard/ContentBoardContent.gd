extends ColorRect

signal onCardPressed(_id, _panel)

func triggerCardPress(_id:String, _panel):
	emit_signal("onCardPressed", _id, _panel)
