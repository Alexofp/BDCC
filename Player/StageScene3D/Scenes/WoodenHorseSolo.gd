extends BaseStageScene3D

onready var animationTree = $AnimationTree
#onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
#onready var doll2 = $Doll3D2

func _init():
	id = StageScene.WoodenHorseSolo

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer())
	animationTree.active = true
	#animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer())
	#animationTree2.active = true

func updateSubAnims():
	pass
	#if(doll.getArmsCuffed()):
	#	animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
	#else:
	#	animationTree["parameters/CuffsBlend/blend_amount"] = 0.0

func playAnimation(animID, _args = {}):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	doll.prepareCharacter(firstDoll)

	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})

	updateSubAnims()
	
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]

	if(animID == "idle"):
		state_machine.travel("WoodenHorseIdle-loop")
	if(animID == "bent"):
		state_machine.travel("WoodenHorseBentIdle-loop")
	if(animID == "lightstruggle"):
		state_machine.travel("WoodenHorseStruggleLight-loop")
	if(animID == "struggle"):
		state_machine.travel("WoodenHorseStruggle-loop")

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]

	if(doll.getCharacterID() != firstDoll):
		return false
	return true

func getSupportedStates():
	return ["idle", "lightstruggle", "struggle"]

func getVarNpcs():
	return ["pc"]
