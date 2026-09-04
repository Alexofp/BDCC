extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.Search

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer3())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer3())
	animationTree2.active = true

func updateSubAnims():
	if(true):
		return
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
		if(animID in ["inside", "sex", "fast"]):
			startCumInside(doll, doll2)
		else:
			startCumPenis(doll2)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(animID == "idle"):
		state_machine.travel("SearchIdle_1-loop")
		state_machine2.travel("SearchIdle_2-loop")
	if(animID == "butt"):
		state_machine.travel("SearchButt_1-loop")
		state_machine2.travel("SearchButt_2-loop")
	if(animID == "search"):
		state_machine.travel("Search_1-loop")
		state_machine2.travel("Search_2-loop")
	if(animID == "stroke"):
		state_machine.travel("SearchStroke_1-loop")
		state_machine2.travel("SearchStroke_2-loop")
	if(animID == "strokefast"):
		state_machine.travel("SearchStrokeFast_1-loop")
		state_machine2.travel("SearchStrokeFast_2-loop")
	if(animID == "rub"):
		state_machine.travel("SearchRub_1-loop")
		state_machine2.travel("SearchRub_2-loop")
	if(animID == "rubfast"):
		state_machine.travel("SearchRubFast_1-loop")
		state_machine2.travel("SearchRubFast_2-loop")
	if(animID == "lick"):
		state_machine.travel("SearchLick_1-loop")
		state_machine2.travel("SearchLick_2-loop")
	if(animID == "lickfast"):
		state_machine.travel("SearchLickFast_1-loop")
		state_machine2.travel("SearchLickFast_2-loop")
	if(animID == "standidle"):
		state_machine.travel("SearchStandIdle_1-loop")
		state_machine2.travel("SearchStandIdle_2-loop")
	if(animID == "stand"):
		state_machine.travel("SearchStand_1-loop")
		state_machine2.travel("SearchStand_2-loop")
	if(animID == "breasts"):
		state_machine.travel("SearchStandBreasts_1-loop")
		state_machine2.travel("SearchStandBreasts_2-loop")
	if(animID == "tease"):
		state_machine.travel("SearchSexTease_1-loop")
		state_machine2.travel("SearchSexTease_2-loop")
	if(animID == "inside"):
		state_machine.travel("SearchSexInside_1-loop")
		state_machine2.travel("SearchSexInside_2-loop")
	if(animID == "sex"):
		state_machine.travel("SearchSex_1-loop")
		state_machine2.travel("SearchSex_2-loop")
	if(animID == "fast"):
		state_machine.travel("SearchSexFast_1-loop")
		state_machine2.travel("SearchSexFast_2-loop")
		
	#"stand", "breasts", "tease", "inside", "sex", "fast"
	
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
	return ["idle", "butt", "search", "stroke", "strokefast", "rub", "rubfast", "lick", "lickfast", "stand", "standidle", "breasts", "tease", "inside", "sex", "fast"]

func getVarNpcs():
	return ["pc", "npc"]
