extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var animationTree3 = $AnimationTree3
onready var animationTree4 = $AnimationTree4
onready var doll = $Doll3D
onready var doll2 = $Doll3D2
onready var doll3 = $Doll3D3
onready var doll4 = $Doll3D4

func _init():
	id = StageScene.SexGangbang

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer2())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer2())
	animationTree2.active = true
	animationTree3.anim_player = animationTree3.get_path_to(doll3.getAnimPlayer2())
	animationTree3.active = true
	animationTree4.anim_player = animationTree4.get_path_to(doll4.getAnimPlayer2())
	animationTree4.active = true
	
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

	if(doll4.getArmsCuffed()):
		animationTree4["parameters/CuffsBlend/blend_amount"] = 1.0
	else:
		animationTree4["parameters/CuffsBlend/blend_amount"] = 0.0

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
	var fourthDoll = "pc"
	if(_args.has("npc3")):
		fourthDoll = _args["npc3"]
	doll4.prepareCharacter(fourthDoll)
	
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
	
	if(_args.has("npc3BodyState")):
		doll4.applyBodyState(_args["npc3BodyState"])
	else:
		doll4.applyBodyState({})
	
	updateSubAnims()
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]
	var state_machine3 = animationTree3["parameters/StateMachine/playback"]
	var state_machine4 = animationTree4["parameters/StateMachine/playback"]

	if(_args.has("npcCum") && _args["npcCum"] && !(animID in ["tease"])):
		startCumInsideSolo(doll, getCumIntensity(doll2) + getCumIntensity(doll3))
		#startCumInside(doll, doll2)
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)

	if(animID != "tease"):
		doll4.clampPenisScale(0.95, 1.1)
		if(doll.getState("mouth") in ["", null]):
			doll.setTemporaryState("mouth", "open")

	if(animID == "tease"):
		state_machine.travel("SexGangTease_1-loop")
		state_machine2.travel("SexGangTease_2-loop")
		state_machine3.travel("SexGangTease_3-loop")
		state_machine4.travel("SexGangTease_4-loop")
	if(animID == "inside"):
		state_machine.travel("SexGangInside_1-loop")
		state_machine2.travel("SexGangInside_2-loop")
		state_machine3.travel("SexGangInside_3-loop")
		state_machine4.travel("SexGangInside_4-loop")
	if(animID == "sex"):
		state_machine.travel("SexGang_1-loop")
		state_machine2.travel("SexGang_2-loop")
		state_machine3.travel("SexGang_3-loop")
		state_machine4.travel("SexGang_4-loop")
	if(animID == "fast"):
		state_machine.travel("SexGangFast_1-loop")
		state_machine2.travel("SexGangFast_2-loop")
		state_machine3.travel("SexGangFast_3-loop")
		state_machine4.travel("SexGangFast_4-loop")



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
	var fourthDoll = "pc"
	if(_args.has("npc3")):
		fourthDoll = _args["npc3"]
		
	if(doll.getCharacterID() != firstDoll || doll2.getCharacterID() != secondDoll || doll3.getCharacterID() != thirdDoll || doll4.getCharacterID() != fourthDoll):
		return false
	return true

func getSupportedStates():
	return ["tease", "inside", "sex", "fast"]
