extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var doll = $Doll3D

var savedAnim = ""

func _init():
	id = StageScene.Yoga2

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
	savedAnim = animID
	var state_machine = animationTree["parameters/StateMachine/playback"]
	if(animID == "plow"):
		state_machine.travel("YogaPlow-loop")
	else:
		Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
		
	if(doll.getCharacterID() != firstDoll):
		return false
	if(savedAnim != _actionID):
		return false
	return true

func getSupportedStates():
	return ["plow"]

func getVarNpcs():
	return ["pc"]
