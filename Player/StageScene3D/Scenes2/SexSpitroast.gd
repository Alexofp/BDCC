extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var animationTree3 = $AnimationTree3
onready var doll = $Doll3D
onready var doll2 = $Doll3D2
onready var doll3 = $Doll3D3

func _init():
	id = StageScene.SexSpitroast

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer2())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer2())
	animationTree2.active = true
	animationTree3.anim_player = animationTree3.get_path_to(doll3.getAnimPlayer2())
	animationTree3.active = true
	
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

	if(doll3.getArmsCuffed()):
		animationTree3["parameters/CuffsBlend/blend_amount"] = 1.0
	else:
		animationTree3["parameters/CuffsBlend/blend_amount"] = 0.0

# StageScene.Duo, "kneel", {npc="nova", pc="pc"}
func playAnimation(animID, _args = {}):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	doll.prepareCharacter(firstDoll)
	var secondDoll = "pc"
	if(_args.has("npc")):
		secondDoll = _args["npc"]
	doll2.prepareCharacter(secondDoll)
	var thirdDoll = "pc"
	if(_args.has("npc2")):
		thirdDoll = _args["npc2"]
	doll3.prepareCharacter(thirdDoll)
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	
	if(_args.has("npcBodyState")):
		doll2.applyBodyState(_args["npcBodyState"])
	else:
		doll2.applyBodyState({})
	
	if(_args.has("npc2BodyState")):
		doll3.applyBodyState(_args["npc2BodyState"])
	else:
		doll3.applyBodyState({})
	
	updateSubAnims()
	
	if(_args.has("pcCum") && _args["pcCum"]):
		#startCumInsideSolo(doll, getCumIntensity(doll2) + getCumIntensity(doll3))
		if(!(animID in ["tease"])):
			startCumInside(doll2, doll)
		else:
			startCumPenis(doll)
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]
	var state_machine3 = animationTree3["parameters/StateMachine/playback"]

	if(animID == "tease"):
		state_machine.travel("SexSpitroastTease_1-loop")
		state_machine2.travel("SexSpitroastTease_2-loop")
		state_machine3.travel("SexSpitroastTease_3-loop")
	if(animID == "inside"):
		state_machine.travel("SexSpitroastInside_1-loop")
		state_machine2.travel("SexSpitroastInside_2-loop")
		state_machine3.travel("SexSpitroastInside_3-loop")
		doll3.clampPenisScale(0.95, 1.1)
		if(doll.getState("mouth") in ["", null]):
			doll.setTemporaryState("mouth", "open")
	if(animID == "sex"):
		state_machine.travel("SexSpitroast_1-loop")
		state_machine2.travel("SexSpitroast_2-loop")
		state_machine3.travel("SexSpitroast_3-loop")
		doll3.clampPenisScale(0.95, 1.1)
		if(doll.getState("mouth") in ["", null]):
			doll.setTemporaryState("mouth", "open")
	if(animID == "fast"):
		state_machine.travel("SexSpitroastFast_1-loop")
		state_machine2.travel("SexSpitroastFast_2-loop")
		state_machine3.travel("SexSpitroastFast_3-loop")
		doll3.clampPenisScale(0.95, 1.1)
		if(doll.getState("mouth") in ["", null]):
			doll.setTemporaryState("mouth", "open")



func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	var secondDoll = "pc"
	if(_args.has("npc")):
		secondDoll = _args["npc"]
	var thirdDoll = "pc"
	if(_args.has("npc2")):
		thirdDoll = _args["npc2"]
		
	if(doll.getCharacterID() != firstDoll || doll2.getCharacterID() != secondDoll || doll3.getCharacterID() != thirdDoll):
		return false
	return true

func getSupportedStates():
	return ["tease", "inside", "sex", "fast"]
