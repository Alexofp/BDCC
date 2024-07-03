extends Reference
class_name CodeContex

signal onPrint(text)

func doPrint(text):
	emit_signal("onPrint", text)
	print(text)
