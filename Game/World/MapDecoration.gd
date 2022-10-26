extends Node2D
class_name MapDecoration

func _ready():
	if(OPTIONS.shouldShowMapArt()):
		visible = true
	else:
		visible = false
