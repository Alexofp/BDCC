extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.Sex69

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
	
	if(animID in ["MF", "MM", "MFfast", "MMfast", "MFinside", "MMinside"]):
		doll2.clampPenisScale(0.95, 1.2)
		if(doll.getState("mouth") in ["", null]):
			doll.setTemporaryState("mouth", "open")
	if(animID in ["FM", "MM", "FMfast", "MMfast", "FMinside", "MMinside"]):
		doll.clampPenisScale(0.95, 1.2)
		if(doll2.getState("mouth") in ["", null]):
			doll2.setTemporaryState("mouth", "open")
	
	if(animID == "tease"):
		state_machine.travel("Sex69Tease_1-loop")
		state_machine2.travel("Sex69Tease_2-loop")
	if(animID == "FM"):
		state_machine.travel("Sex69_1-loop")
		state_machine2.travel("Sex69_2-loop")
	if(animID == "MF"):
		state_machine.travel("Sex69MF_1-loop")
		state_machine2.travel("Sex69MF_2-loop")
	if(animID == "FF"):
		state_machine.travel("Sex69FF_1-loop")
		state_machine2.travel("Sex69FF_2-loop")
	if(animID == "MM"):
		state_machine.travel("Sex69MM_1-loop")
		state_machine2.travel("Sex69MM_2-loop")
	if(animID == "FMfast"):
		state_machine.travel("Sex69Fast_1-loop")
		state_machine2.travel("Sex69Fast_2-loop")
	if(animID == "MFfast"):
		state_machine.travel("Sex69MFFast_1-loop")
		state_machine2.travel("Sex69MFFast_2-loop")
	if(animID == "FFfast"):
		state_machine.travel("Sex69FFFast_1-loop")
		state_machine2.travel("Sex69FFFast_2-loop")
	if(animID == "MMfast"):
		state_machine.travel("Sex69MMFast_1-loop")
		state_machine2.travel("Sex69MMFast_2-loop")
	if(animID == "FMinside"):
		state_machine.travel("Sex69Inside_1-loop")
		state_machine2.travel("Sex69Inside_2-loop")
	if(animID == "MFinside"):
		state_machine.travel("Sex69MFInside_1-loop")
		state_machine2.travel("Sex69MFInside_2-loop")
	if(animID == "FFinside"):
		state_machine.travel("Sex69FFInside_1-loop")
		state_machine2.travel("Sex69FFInside_2-loop")
	if(animID == "MMinside"):
		state_machine.travel("Sex69MMInside_1-loop")
		state_machine2.travel("Sex69MMInside_2-loop")



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
	return ["tease", "FM", "MF", "FF", "MM", "FMfast", "MFfast", "FFfast", "MMfast", "FMinside", "MFinside", "FFinside", "MMinside"]

func getVarNpcs():
	return ["pc", "npc"]
