extends PanelContainer

onready var label = $Label

func setCategoryName(newname):
	label.text = newname
