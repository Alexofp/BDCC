extends Control

onready var textEdit = $TextEdit

func setText(theText):
	textEdit.text = theText

func getText():
	return textEdit.text
