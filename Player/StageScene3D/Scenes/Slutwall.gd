extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var doll = $Doll3D

func _init():
	id = StageScene.Slutwall

func _ready():
	animationTree.active = true
	
func updateSubAnims():
	pass
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
	
	updateSubAnims()
	
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	if(animID == "idle"):
		state_machine.travel("Slutwall_idle-loop")
	else:
		Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))

func getSupportedStates():
	return ["idle"]
