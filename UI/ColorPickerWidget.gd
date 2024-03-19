extends Control

onready var colorPicker = $ColorPicker
signal color_changed(color)

func setCurrentColor(theColor):
	if(theColor == null):
		theColor = Color.white
	colorPicker.color = theColor

func getCurrentColor():
	return colorPicker.color


func _on_ColorPicker_color_changed(color):
	emit_signal("color_changed", color)

func getData():
	return getCurrentColor()
