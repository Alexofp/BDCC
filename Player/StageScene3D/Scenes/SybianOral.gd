extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.SybianOral

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
	
	$Sybian/ChainRenderer.visible = (_args.has("chained") && _args["chained"])
	
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	if(_args.has("npcCum") && _args["npcCum"]):
		startCumPenis(doll2)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(animID == "idle"):
		state_machine.travel("SybianIdle-loop")
		state_machine2.travel("SybianBJTease_2-loop")
	if(animID == "ride"):
		state_machine.travel("SybianRide-loop")
		state_machine2.travel("SybianBJTease_2-loop 3")
	if(animID == "intense"):
		state_machine.travel("SybianIntense-loop")
		state_machine2.travel("SybianBJTease_2-loop 2")
	if(animID == "hump"):
		state_machine.travel("SybianHump-loop")
		state_machine2.travel("SybianBJTease_2-loop 4")
	if(animID == "humpfast"):
		state_machine.travel("SybianHumpFast-loop")
		state_machine2.travel("SybianBJTease_2-loop 5")
	if(animID == "hold"):
		state_machine.travel("SybianIntense-loop 2")
		state_machine2.travel("SybianBJHold_2-loop")
	if(animID == "stroke"):
		state_machine.travel("SybianIntense-loop 3")
		state_machine2.travel("SybianBJStroke_2-loop")
	if(animID == "blowjob"):
		state_machine.travel("SybianBJ_1-loop")
		state_machine2.travel("SybianBJ_2-loop")
		doll2.clampPenisScale(0.95, 1.1)
		if(doll.getState("mouth") in ["", null]):
			doll.setTemporaryState("mouth", "open")
	if(animID == "blowjobfast"):
		state_machine.travel("SybianBJFast_1-loop")
		state_machine2.travel("SybianBJFast_2-loop")
		doll2.clampPenisScale(0.95, 1.1)
		if(doll.getState("mouth") in ["", null]):
			doll.setTemporaryState("mouth", "open")
	if(animID == "lick"):
		state_machine.travel("SybianLick_1-loop")
		state_machine2.travel("SybianLick_2-loop")
	if(animID == "lickfast"):
		state_machine.travel("SybianLickFast_1-loop")
		state_machine2.travel("SybianLickFast_2-loop")

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
	return ["idle", "ride", "intense", "hump", "humpfast", "hold", "stroke", "blowjob", "blowjobfast", "lick", "lickfast"]

func getVarNpcs():
	return ["pc", "npc"]

func getVarOptions():
	var options = .getVarOptions()
	
	options["chained"] = {
		type = "bool",
	}
	
	return options
