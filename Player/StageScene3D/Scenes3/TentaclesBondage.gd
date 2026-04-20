extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
#onready var doll2 = $Doll3D2
onready var tentacles = $Tentacles

func _init():
	id = StageScene.TentaclesBondage

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer3())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(tentacles.animation_player3)
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
		startCumInsideSolo(doll, 1.0)
		#startCumInside(doll2, doll)
		#startCumInside(doll, doll3)
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2:AnimationNodeStateMachinePlayback = animationTree2["parameters/StateMachine/playback"]

	if(animID == "start"):
		state_machine.travel("TentBondageStart_1-loop")
		state_machine2.travel("TentBondageStart_2-loop")
	if(animID == "bondage"):
		state_machine.travel("TentBondage_1-loop")
		state_machine2.travel("TentBondage_2-loop")
	if(animID == "kneel"):
		state_machine.travel("TentBondageKneel_1-loop")
		state_machine2.travel("TentBondageKneel_2-loop")
	if(animID == "tease"):
		state_machine.travel("TentBondageSexTease_1-loop")
		state_machine2.travel("TentBondageSexTease_2-loop")
	if(animID == "inside"):
		state_machine.travel("TentBondageSexInside_1-loop")
		state_machine2.travel("TentBondageSexInside_2-loop")
	if(animID == "sex"):
		state_machine.travel("TentBondageSex_1-loop")
		state_machine2.travel("TentBondageSex_2-loop")
	if(animID == "fast"):
		state_machine.travel("TentBondageSexFast_1-loop")
		state_machine2.travel("TentBondageSexFast_2-loop")
	if(animID == "stroke"):
		state_machine.travel("TentBondageStroke_1-loop")
		state_machine2.travel("TentBondageStroke_2-loop")
	if(animID == "strokefast"):
		state_machine.travel("TentBondageStrokeFast_1-loop")
		state_machine2.travel("TentBondageStrokeFast_2-loop")


func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]

	if(doll.getCharacterID() != firstDoll):
		return false
	return true

func getSupportedStates():
	return ["start", "bondage", "kneel", "tease", "inside", "sex", "fast", "stroke", "strokefast"]

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
