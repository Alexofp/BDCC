extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
#onready var doll2 = $Doll3D2
onready var tentacles = $Tentacles

func _init():
	id = StageScene.TentaclesSex

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer())
	animationTree.active = true
	#animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer())
	animationTree2.active = true

func updateSubAnims():
	pass
#	if(doll.getArmsCuffed()):
#		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
#	else:
#		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0

# StageScene.Duo, "kneel", {npc="nova", pc="pc"}
func playAnimation(animID, _args = {}):
	#var fullAnimID = animID
	#if(animID is Array):
	#	animID = animID[0]
	
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	doll.prepareCharacter(firstDoll)

	#doll.forceSlotToBeVisible(BodypartSlot.Penis)
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})

	updateSubAnims()
	
	tentacles.setSceneOptions(_args)
	
	if(_args.has("cum") && _args["cum"] && !(animID in ["tease"])):
		#startCumInsideSolo(doll, getCumIntensity(doll2) + getCumIntensity(doll3))
		startCumInsideSolo(doll, 1.0)
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(animID == "tease"):
		state_machine.travel("TentaclesSexIdle_1-loop")
		state_machine2.travel("TentaclesSexIdle_2-loop")
	if(animID == "inside"):
		state_machine.travel("TentaclesSexInside_1-loop")
		state_machine2.travel("TentaclesSexInside_2-loop")
		if(doll.getState("mouth") in ["", null]):
			doll.setTemporaryState("mouth", "open")
	if(animID == "sex"):
		state_machine.travel("TentaclesSex_1-loop")
		state_machine2.travel("TentaclesSex_2-loop")
		if(doll.getState("mouth") in ["", null]):
			doll.setTemporaryState("mouth", "open")
	if(animID == "fast"):
		state_machine.travel("TentaclesSexFast_1-loop")
		state_machine2.travel("TentaclesSexFast_2-loop")
		if(doll.getState("mouth") in ["", null]):
			doll.setTemporaryState("mouth", "open")

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]

	if(doll.getCharacterID() != firstDoll):
		return false
	return true

func getSupportedStates():
	return ["tease", "inside", "sex", "fast"]

func getVarNpcs():
	return ["pc"]

func getVarOptions():
	var options = .getVarOptions()
	
	options["plant"] = {
		type = "bool",
	}
	
	return options
