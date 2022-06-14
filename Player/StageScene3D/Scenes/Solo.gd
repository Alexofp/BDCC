extends "res://Player/StageScene3D/BaseStageScene3D.gd"

onready var animationTree = $AnimationTree

func _init():
	id = StageScene.Solo

func _ready():
	animationTree.active = true
	
func playAnimation(animID, _args = []):
	print("Playing: "+str(animID))
	$Doll3D.loadCharacter("pc")
	
	var state_machine = animationTree["parameters/playback"]
	if(animID == "walk"):
		state_machine.travel("Walk-loop")
	elif(animID == "stand"):
		state_machine.travel("Standing-loop")
	elif(animID == "kneel"):
		state_machine.travel("Kneeling-loop")
	else:
		printerr("Action "+str(animID)+" is not found for stage "+str(id))
