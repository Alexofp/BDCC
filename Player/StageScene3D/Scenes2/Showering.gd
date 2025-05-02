extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var doll = $Doll3D

var isHead:bool = false

func _init():
	id = StageScene.Showering

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
	isHead = false
	var state_machine = animationTree["parameters/StateMachine/playback"]
	if(animID == "body"):
		state_machine.travel("ShoweringBody_1-loop")
	elif(animID == "head"):
		state_machine.travel("Showering_1-loop")
		isHead = true
	elif(animID == "crotch"):
		state_machine.travel("ShoweringCrotch_1-loop")
	elif(animID == "stroke"):
		state_machine.travel("ShoweringStroke_1-loop")
	elif(animID == "rub"):
		state_machine.travel("ShoweringRub_1-loop")
	else:
		Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
		
	if(doll.getCharacterID() != firstDoll):
		return false
	if(isHead && _actionID != "head"):
		return false
	if(!isHead && _actionID == "head"):
		return false
	return true

func getSupportedStates():
	return ["body", "head", "crotch", "stroke", "rub"]

func getVarNpcs():
	return ["pc"]
