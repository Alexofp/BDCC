extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.SexOral

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer())
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
	
	print("Playing duo: "+str(animID))
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

	if(animID == "tease"):
		state_machine.travel("Sex_OralTease_1-loop")
		state_machine2.travel("Sex_OralTease_2-loop")
		#if(doll2.getState("mouth") in ["", null]):
		#	doll2.setTemporaryState("mouth", "open")
	if(animID == "sex"):
		state_machine.travel("Sex_Oral_1-loop")
		state_machine2.travel("Sex_Oral_2-loop")
		doll.clampPenisScale(0.95, 1.1)
		if(doll2.getState("mouth") in ["", null]):
			doll2.setTemporaryState("mouth", "open")
	if(animID == "fast"):
		state_machine.travel("Sex_OralFast_1-loop")
		state_machine2.travel("Sex_OralFast_2-loop")
		doll.clampPenisScale(0.95, 1.1)
		if(doll2.getState("mouth") in ["", null]):
			doll2.setTemporaryState("mouth", "open")
	if(animID == "start"):
		state_machine.travel("Sex_OralStart_1-loop")
		state_machine2.travel("Sex_OralStart_2-loop")
	if(animID == "lick"):
		state_machine.travel("Sex_OralPussy_1-loop")
		state_machine2.travel("Sex_OralPussy_2-loop")
	if(animID == "grind"):
		state_machine.travel("Sex_OralGrind_1-loop")
		state_machine2.travel("Sex_OralGrind_2-loop")

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
	return ["tease", "sex", "fast", "start", "lick", "grind"]

func getVarNpcs():
	return ["pc", "npc"]
