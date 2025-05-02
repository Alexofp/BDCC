extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var doll = $Doll3D

func _init():
	id = StageScene.MilkingStallSolo

func _ready():
	animationTree.active = true
	
#func updateSubAnims():
#	if(doll.getArmsCuffed()):
#		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
#	else:
#		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0
	
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
		state_machine.travel("MilkingSoloStart_1-loop")
	elif(animID == "milking"):
		state_machine.travel("MilkingSolo_1-loop")
	elif(animID == "fast"):
		state_machine.travel("MilkingSoloFast_1-loop")
	elif(animID == "cum"):
		state_machine.travel("MilkingSoloCum_1-loop")
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
	return ["start", "milking", "fast", "cum"]

func getVarNpcs():
	return ["pc"]

func getChainPoint(_pointID):
	if(_pointID == "toppipe"):
		return $TopPipe
	if(_pointID == "bottompipe"):
		return $BottomPipe
	if(_pointID == "milktank"):
		return $MilkTank
	return .getChainPoint(_pointID)
