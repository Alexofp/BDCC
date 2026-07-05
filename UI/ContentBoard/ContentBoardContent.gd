extends ColorRect

signal onCardPressed(_id)

func triggerCardPress(_id:String):
	emit_signal("onCardPressed", _id)
