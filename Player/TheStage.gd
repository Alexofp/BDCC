extends Node2D
class_name TheStage

const Standing = "Standing"
const Kneeling = "Kneeling"
const SittingOnChair = "SittingOnChair"
const Shove = "Shove"

onready var playerDoll = $PlayerDoll
onready var puppets = [
	$MainPuppet,
	$Puppet2,
	$Puppet3,
]
onready var animationTree = $AnimationTree
onready var props = $Props

signal onBodypartMouseEntered(who, what)
signal onBodypartMouseExited(who, what)

# Called when the node enters the scene tree for the first time.
func _ready():
	for pup in puppets:
		pup.visible = false
	playerDoll.visible = true
	playerDoll.setTargetSkeleton(puppets[0])
	animationTree.active = true
		
func getPlayerDoll():
	return playerDoll

func transitionTo(state):
	var state_machine = animationTree["parameters/playback"]
	state_machine.travel(state)
	
	hideAllProps()
	
	if(state == SittingOnChair):
		showProp("Chair")

func showProp(propName):
	var prop = props.get_node_or_null(propName)
	if(prop == null):
		return
	
	prop.visible = true

func hideAllProps():
	if(props == null):
		return
	for prop in props.get_children():
		prop.visible = false

# I wanted to show the props only when their animation starts but this issue prevents that
# https://github.com/godotengine/godot/issues/28311
func _on_AnimationPlayer_animation_started(_anim_name):
	pass

func setTooltipsActive(a):
	playerDoll.setTooltipsActive(a)


func _on_PlayerDoll_onBodypartMouseEntered(who, what):
	emit_signal("onBodypartMouseEntered", who, what)


func _on_PlayerDoll_onBodypartMouseExited(who, what):
	emit_signal("onBodypartMouseExited", who, what)
