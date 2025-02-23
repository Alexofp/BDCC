extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var doll = $Doll3D

func _init():
	id = StageScene.TFLook

func _ready():
	animationTree.active = true
	
func updateSubAnims():
	if(doll.getArmsCuffed()):
		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
	else:
		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0
	
func playAnimation(animID, _args = {}):
	if(_args.has("pc")):
		doll.prepareCharacter(_args["pc"])
	else:
		doll.prepareCharacter("pc")
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	
	#updateSubAnims()
	var state_machine = animationTree["parameters/StateMachine/playback"]
	if(animID == "start"):
		state_machine.travel("TFLookStart-loop")
	elif(animID == "breasts"):
		state_machine.travel("TFLookBreasts-loop")
	elif(animID == "crotch"):
		state_machine.travel("TFLookCrotch-loop")
	elif(animID == "hands"):
		state_machine.travel("TFLookHands-loop")
	elif(animID == "head"):
		state_machine.travel("TFLookHead-loop")
	else:
		Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
		
	if(doll.getCharacterID() != firstDoll):
		return false
	return true

func getSupportedStates():
	return ["start", "head", "hands", "crotch", "breasts"]

func getVarNpcs():
	return ["pc"]
