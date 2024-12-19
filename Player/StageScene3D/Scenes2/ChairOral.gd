extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.ChairOral

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer2())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer2())
	animationTree2.active = true

func updateSubAnims():
	#if(true):
	#	return
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
		#startCumInsideSolo(doll, getCumIntensity(doll2) + getCumIntensity(doll3))
		startCumPenis(doll)
	if(_args.has("npcCum") && _args["npcCum"]):
		startCumPenis(doll2)
	
	updateSubAnims()
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(animID == "tease"):
		state_machine.travel("ChairOralTease_1-loop")
		state_machine2.travel("ChairOralTease_2-loop")
	if(animID == "suck"):
		state_machine.travel("ChairOralSuck_1-loop")
		state_machine2.travel("ChairOralSuck_2-loop")
		doll.clampPenisScale(0.95, 1.1)
		if(doll2.getState("mouth") in ["", null]):
			doll2.setTemporaryState("mouth", "open")
	if(animID == "suckfast"):
		state_machine.travel("ChairOralSuckFast_1-loop")
		state_machine2.travel("ChairOralSuckFast_2-loop")
		doll.clampPenisScale(0.95, 1.1)
		if(doll2.getState("mouth") in ["", null]):
			doll2.setTemporaryState("mouth", "open")
	if(animID == "suckinside"):
		state_machine.travel("ChairOralSuckInside_1-loop")
		state_machine2.travel("ChairOralSuckInside_2-loop")
		doll.clampPenisScale(0.95, 1.1)
		if(doll2.getState("mouth") in ["", null]):
			doll2.setTemporaryState("mouth", "open")
	if(animID == "stroke"):
		state_machine.travel("ChairOralStroke_1-loop")
		state_machine2.travel("ChairOralStroke_2-loop")
	if(animID == "rub"):
		state_machine.travel("ChairOralRub_1-loop")
		state_machine2.travel("ChairOralRub_2-loop")
	if(animID == "lick"):
		state_machine.travel("ChairOralLick_1-loop")
		state_machine2.travel("ChairOralLick_2-loop")
	if(animID == "lickfast"):
		state_machine.travel("ChairOralLickFast_1-loop")
		state_machine2.travel("ChairOralLickFast_2-loop")


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
	return ["tease", "suck", "suckfast", "suckinside", "stroke", "rub", "lick", "lickfast"]

func getVarNpcs():
	return ["pc", "npc"]
