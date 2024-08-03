extends Node2D

var pawn
var id
var loc
var floorid

onready var move_tween = $MoveTween

func moveToPos(thePos:Vector2):
	move_tween.interpolate_property(self, "position",
			global_position, thePos + Vector2(RNG.randi_range(-16, 16), RNG.randi_range(-16, 16)), 0.5,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	move_tween.start()
