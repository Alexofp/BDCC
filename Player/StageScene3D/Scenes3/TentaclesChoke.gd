extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
#onready var doll2 = $Doll3D2
onready var tentacles = $Tentacles

func _init():
	id = StageScene.TentaclesChoke

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

	if(animID == "tease"):
		state_machine.travel("TentChokeTease_1-loop")
		state_machine2.travel("TentChokeTease_2-loop")
	elif(animID == "choke"):
		state_machine.travel("TentChoke_1-loop")
		state_machine2.travel("TentChoke_2-loop")
	elif(animID == "chokefast"):
		state_machine.travel("TentChokeFast_1-loop")
		state_machine2.travel("TentChokeFast_2-loop")
	elif(animID == "sextease"):
		state_machine.travel("TentChokeSexTease_1-loop")
		state_machine2.travel("TentChokeSexTease_2-loop")
	elif(animID == "sexinside"):
		state_machine.travel("TentChokeSexInside_1-loop")
		state_machine2.travel("TentChokeSexInside_2-loop")
	elif(animID == "sex"):
		state_machine.travel("TentChokeSex_1-loop")
		state_machine2.travel("TentChokeSex_2-loop")
	elif(animID == "sexfast"):
		state_machine.travel("TentChokeSexFast_1-loop")
		state_machine2.travel("TentChokeSexFast_2-loop")


func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]

	if(doll.getCharacterID() != firstDoll):
		return false
	return true

func getSupportedStates():
	return ["tease", "choke", "chokefast", "sextease", "sexinside", "sex", "sexfast"]

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
