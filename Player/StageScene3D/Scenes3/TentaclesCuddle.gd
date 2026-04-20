extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
#onready var doll2 = $Doll3D2
onready var tentacles = $Tentacles

func _init():
	id = StageScene.TentaclesCuddle

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer3())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(tentacles.animation_player3)
	#animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer())
	animationTree2.active = true

func updateSubAnims():
	var breastScale = doll.breastScale
	animationTree2["parameters/StateMachine/TentCuddleBreasts_2-loop/BreastSize/blend_amount"] = breastScale*1.0
	
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
		startCumInsideSolo(doll, 1.0)
		#startCumInside(doll2, doll)
		#startCumInside(doll, doll3)
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2:AnimationNodeStateMachinePlayback = animationTree2["parameters/StateMachine/playback"]

	if(animID == "cuddle"):
		state_machine.travel("TentCuddle_1-loop")
		state_machine2.travel("TentCuddle_2-loop")
	if(animID == "breaststease"):
		state_machine.travel("TentCuddleBreastsTease_1-loop")
		state_machine2.travel("TentCuddleBreastsTease_2-loop")
	if(animID == "breasts"):
		state_machine.travel("TentCuddleBreasts_1-loop")
		state_machine2.travel("TentCuddleBreasts_2-loop")
	if(animID == "tease"):
		state_machine.travel("TentCuddleTease_1-loop")
		state_machine2.travel("TentCuddleTease_2-loop")
	if(animID == "inside"):
		state_machine.travel("TentCuddleInside_1-loop")
		state_machine2.travel("TentCuddleInside_2-loop")
	if(animID == "sex"):
		state_machine.travel("TentCuddleFuck_1-loop")
		state_machine2.travel("TentCuddleFuck_2-loop")
	if(animID == "fast"):
		state_machine.travel("TentCuddleFuckFast_1-loop")
		state_machine2.travel("TentCuddleFuckFast_2-loop")
	if(animID == "stroke"):
		state_machine.travel("TentCuddleStroke_1-loop")
		state_machine2.travel("TentCuddleStroke_2-loop")
	if(animID == "strokefast"):
		state_machine.travel("TentCuddleStrokeFast_1-loop")
		state_machine2.travel("TentCuddleStrokeFast_2-loop")


func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]

	if(doll.getCharacterID() != firstDoll):
		return false
	return true

func getSupportedStates():
	return ["cuddle", "breaststease", "breasts", "tease", "inside", "sex", "fast", "stroke", "strokefast"]

func getVarNpcs():
	return ["pc"]

func getVarOptions():
	var options = .getVarOptions()
	
	options["plant"] = {
		type = "bool",
	}
	options["cum"] = {
		type = "bool",
	}
	
	return options
