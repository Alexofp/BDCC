extends "res://Player/StageScene3D/BaseStageScene3D.gd"

onready var animationTree = $AnimationTree
onready var doll = $Doll3D

func _init():
	id = StageScene.Solo

func _ready():
	animationTree.active = true
	
func updateSubAnims():
	if(doll.getArmsCuffed()):
		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
	else:
		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0
	
func playAnimation(animID, _args = {}):
	var fullAnimID = animID
	if(animID is Array):
		animID = animID[0]
	print("Playing: "+str(animID))
	if(_args.has("pc")):
		doll.prepareCharacter(_args["pc"])
	else:
		doll.prepareCharacter("pc")

	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	
	if(animID == "sit"):
		$Chair.visible = true
	else:
		$Chair.visible = false
	
	updateSubAnims()
	
	if(animID == "custom"):
		animationTree.active = false
		
		doll.applyData(_args["anim"])
	else:
		animationTree.active = true
		
		var state_machine = animationTree["parameters/AnimationNodeStateMachine/playback"]
		if(!stateMachineTravel(doll, state_machine, fullAnimID)):
			Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))

func getSupportedStates():
	return getSupportedStatesSolo()

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
		
	if(doll.getCharacterID() != firstDoll):
		return false
	return true

func getChainPoint(_pointID):
	if(_pointID == "farleft"):
		return $FarLeft
	if(_pointID == "farright"):
		return $FarRight
	return .getChainPoint(_pointID)
