extends Node2D

var id:String
var loc
var floorid

onready var move_tween = $MoveTween
onready var icon = $Icon

func moveToPos(thePos:Vector2):
	move_tween.interpolate_property(self, "position",
			global_position, thePos + Vector2(RNG.randi_range(-16, 16), RNG.randi_range(-16, 16)), 0.5,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	move_tween.start()

func setTexture(theTexture:Texture):
	icon.texture = theTexture

func setColor(theColor:Color):
	icon.self_modulate = theColor
