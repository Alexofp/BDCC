extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var doll = $Doll3D

var savedAnim = ""

func _init():
	id = StageScene.Yoga

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
	
	#updateSubAnims()
	savedAnim = animID
	var state_machine = animationTree["parameters/StateMachine/playback"]
	if(animID == "catcow"):
		state_machine.travel("YogaCatCow-loop")
	elif(animID == "dog"):
		state_machine.travel("YogaDownwardFacingDog-loop")
	elif(animID == "camel"):
		state_machine.travel("YogaCamel-loop")
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
	return ["catcow", "dog", "camel"]
