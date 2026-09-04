extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.GropeBehind

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer3())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer3())
	animationTree2.active = true

func updateSubAnims():
	if(doll.getArmsCuffed()):
		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
	else:
		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0
	
	if(doll2.getArmsCuffed()):
		animationTree2["parameters/CuffsBlend/blend_amount"] = 1.0
	else:
		animationTree2["parameters/CuffsBlend/blend_amount"] = 0.0

# StageScene.Duo, "kneel", {npc="nova", pc="pc"}
func playAnimation(animID, _args = {}):
	#var fullAnimID = animID
	#if(animID is Array):
	#	animID = animID[0]
	
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	doll.prepareCharacter(firstDoll)
	var secondDoll = "pc"
	if(_args.has("npc")):
		secondDoll = _args["npc"]
	doll2.prepareCharacter(secondDoll)
	
	#doll.forceSlotToBeVisible(BodypartSlot.Penis)
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	
	if(_args.has("npcBodyState")):
		doll2.applyBodyState(_args["npcBodyState"])
	else:
		doll2.applyBodyState({})
	
	updateSubAnims()
	
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	if(_args.has("npcCum") && _args["npcCum"]):
		startCumPenis(doll2)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(animID == "idle"):
		state_machine.travel("GropeBehindIdle_1-loop")
		state_machine2.travel("GropeBehindIdle_2-loop")
	if(animID == "grope"):
		state_machine.travel("GropeBehind_1-loop")
		state_machine2.travel("GropeBehind_2-loop")
	if(animID == "gropefast"):
		state_machine.travel("GropeBehindFast_1-loop")
		state_machine2.travel("GropeBehindFast_2-loop")
	if(animID == "stroke"):
		state_machine.travel("GropeBehindStroke_1-loop")
		state_machine2.travel("GropeBehindStroke_2-loop")
	if(animID == "strokefast"):
		state_machine.travel("GropeBehindStrokeFast_1-loop")
		state_machine2.travel("GropeBehindStrokeFast_2-loop")
	if(animID == "rub"):
		state_machine.travel("GropeBehindRub_1-loop")
		state_machine2.travel("GropeBehindRub_2-loop")
	if(animID == "rubfast"):
		state_machine.travel("GropeBehindRubFast_1-loop")
		state_machine2.travel("GropeBehindRubFast_2-loop")
	if(animID == "orgasm"):
		state_machine.travel("GropeBehindOrgasm_1-loop")
		state_machine2.travel("GropeBehindOrgasm_2-loop")
	if(animID == "butt"):
		state_machine.travel("GropeBehindButt_1-loop")
		state_machine2.travel("GropeBehindButt_2-loop")
	if(animID == "neck"):
		state_machine.travel("GropeBehindIdleNeck_1-loop")
		state_machine2.travel("GropeBehindIdleNeck_2-loop")

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	var secondDoll = "pc"
	if(_args.has("npc")):
		secondDoll = _args["npc"]
		
	if(doll.getCharacterID() != firstDoll || doll2.getCharacterID() != secondDoll):
		return false
	return true

func getSupportedStates():
	return ["idle", "grope", "gropefast", "stroke", "strokefast", "rub", "rubfast", "orgasm", "butt", "neck"]

func getVarNpcs():
	return ["pc", "npc"]
