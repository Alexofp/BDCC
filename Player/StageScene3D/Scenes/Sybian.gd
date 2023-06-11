extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var doll = $Doll3D

func _init():
	id = StageScene.Sybian

func _ready():
	animationTree.active = true
	
func updateSubAnims():
	if(doll.getArmsCuffed()):
		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
	else:
		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0
	
func playAnimation(animID, _args = {}):
	print("Playing sybian: "+str(animID))
	if(_args.has("pc")):
		doll.prepareCharacter(_args["pc"])
	else:
		doll.prepareCharacter("pc")
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	
	if(_args.has("nosybian") && _args["nosybian"]):
		$Sybian.visible = false
		$Sprite3D.transform.origin.y = -0.276
	
	updateSubAnims()
	
	var state_machine = animationTree["parameters/AnimationNodeStateMachine/playback"]
	if(animID == "idle"):
		state_machine.travel("Idle")
	elif(animID == "ride"):
		state_machine.travel("Ride")
	else:
		Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))

func getSupportedStates():
	return ["idle", "ride"]
