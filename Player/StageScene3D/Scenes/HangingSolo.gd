extends "res://Player/StageScene3D/BaseStageScene3D.gd"

onready var animationTree = $AnimationTree
onready var doll = $Doll3D

func _init():
	id = StageScene.HangingSolo

func _ready():
	animationTree.active = true
	
func updateSubAnims():
	pass
	
func playAnimation(_animID, _args = {}):
	#print("Playing: "+str(animID))
	if(_args.has("pc")):
		doll.prepareCharacter(_args["pc"])
	else:
		doll.prepareCharacter("pc")

	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	
	updateSubAnims()
	
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	
	#var state_machine = animationTree["parameters/AnimationNodeStateMachine/playback"]
	#if(!stateMachineTravel(doll, state_machine, animID)):
	#	Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))

func getSupportedStates():
	return ["idle"]
