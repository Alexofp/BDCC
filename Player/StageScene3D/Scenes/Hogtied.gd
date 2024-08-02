extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var doll = $Doll3D

func _init():
	id = StageScene.Hogtied

func _ready():
	animationTree.active = true
	
#func updateSubAnims():
#	if(doll.getArmsCuffed()):
#		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
#	else:
#		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0
	
func playAnimation(animID, _args = {}):
	print("Playing hogtied: "+str(animID))
	
	if(_args.has("pc")):
		doll.prepareCharacter(_args["pc"])
	else:
		doll.prepareCharacter("pc")
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	
	#updateSubAnims()
	
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	if(animID == "idle"):
		state_machine.travel("Hogtied-loop")
	else:
		Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))

func getSupportedStates():
	return ["idle"]

func getVarNpcs():
	return ["pc"]
