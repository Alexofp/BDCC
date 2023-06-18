extends Control

onready var colorPicker = $ColorPicker

func setCurrentColor(theColor):
	if(theColor == null):
		theColor = Color.white
	colorPicker.color = theColor

func getCurrentColor():
	return colorPicker.color
