extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.SexOralTable

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer2())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer2())
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
	
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	if(_args.has("npcCum") && _args["npcCum"]):
		startCumPenis(doll2)
	
	updateSubAnims()
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(animID == "tease"):
		state_machine.travel("SexOralTableTease_1-loop")
		state_machine2.travel("SexOralTableTease_2-loop")
	if(animID == "suck"):
		state_machine.travel("SexOralTableSuck_1-loop")
		state_machine2.travel("SexOralTableSuck_2-loop")
		doll.clampPenisScale(0.95, 1.2)
		if(doll2.getState("mouth") in ["", null]):
			doll2.setTemporaryState("mouth", "open")
	if(animID == "suckfast"):
		state_machine.travel("SexOralTableSuckFast_1-loop")
		state_machine2.travel("SexOralTableSuckFast_2-loop")
		doll.clampPenisScale(0.95, 1.2)
		if(doll2.getState("mouth") in ["", null]):
			doll2.setTemporaryState("mouth", "open")
	if(animID == "suckinside"):
		state_machine.travel("SexOralTableSuckInside_1-loop")
		state_machine2.travel("SexOralTableSuckInside_2-loop")
		doll.clampPenisScale(0.95, 1.2)
		if(doll2.getState("mouth") in ["", null]):
			doll2.setTemporaryState("mouth", "open")
	if(animID == "stroke"):
		state_machine.travel("SexOralTableStroke_1-loop")
		state_machine2.travel("SexOralTableStroke_2-loop")
	if(animID == "peemale"):
		state_machine.travel("SexOralTablePeeMale_1-loop")
		state_machine2.travel("SexOralTablePeeMale_2-loop")
	if(animID == "peefem"):
		state_machine.travel("SexOralTablePeeFem_1-loop")
		state_machine2.travel("SexOralTablePeeFem_2-loop")
	if(animID == "rub"):
		state_machine.travel("SexOralTableRub_1-loop")
		state_machine2.travel("SexOralTableRub_2-loop")
	if(animID == "hover"):
		state_machine.travel("SexOralTableHover_1-loop")
		state_machine2.travel("SexOralTableHover_2-loop")
	if(animID == "lick"):
		state_machine.travel("SexOralTableLick_1-loop")
		state_machine2.travel("SexOralTableLick_2-loop")
	if(animID == "grind"):
		state_machine.travel("SexOralTableGrind_1-loop")
		state_machine2.travel("SexOralTableGrind_2-loop")
	if(animID == "grindfast"):
		state_machine.travel("SexOralTableGrindFast_1-loop")
		state_machine2.travel("SexOralTableGrindFast_2-loop")


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
	return ["tease", "suck", "suckfast", "suckinside", "stroke", "peemale", "peefem", "rub", "hover", "lick", "grind", "grindfast"]

func getVarNpcs():
	return ["pc", "npc"]
