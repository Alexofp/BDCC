extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var animationTree3 = $AnimationTree3
onready var doll = $Doll3D
onready var doll2 = $Doll3D2
onready var doll3 = $Doll3D3

func _init():
	id = StageScene.SexDoubleDown

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
	
	if(_args.has("npcCum") && _args["npcCum"]):
		startCumPenis(doll2)
		#startCumInsideSolo(doll, getCumIntensity(doll2) + getCumIntensity(doll3))

	if(_args.has("pcCum") && _args["pcCum"]):
		if(!(animID in ["tease"])):
			startCumInside(doll, doll2)
		else:
			startCumPenis(doll)
	if(_args.has("npc2Cum") && _args["npc2Cum"]):
		startCumPenis(doll3)
			
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]
	var state_machine3 = animationTree3["parameters/StateMachine/playback"]

	if(animID == "tease"):
		state_machine.travel("SexDoubleDownTease_1-loop")
		state_machine2.travel("SexDoubleDownTease_2-loop")
		state_machine3.travel("SexDoubleDownTease_3-loop")
	if(animID == "inside"):
		state_machine.travel("SexDoubleDownInside_1-loop")
		state_machine2.travel("SexDoubleDownInside_2-loop")
		state_machine3.travel("SexDoubleDownInside_3-loop")
	if(animID == "sex"):
		state_machine.travel("SexDoubleDown_1-loop")
		state_machine2.travel("SexDoubleDown_2-loop")
		state_machine3.travel("SexDoubleDown_3-loop")
	if(animID == "fast"):
		state_machine.travel("SexDoubleDownFast_1-loop")
		state_machine2.travel("SexDoubleDownFast_2-loop")
		state_machine3.travel("SexDoubleDownFast_3-loop")
	if(animID == "teasenohand"):
		state_machine.travel("SexDoubleDownTease_1-loop 2")
		state_machine2.travel("SexDoubleDownTeaseNoHands_2-loop")
		state_machine3.travel("SexDoubleDownTeaseNoHands_3-loop")
	if(animID == "sexnohand"):
		state_machine.travel("SexDoubleDown_1-loop 2")
		state_machine2.travel("SexDoubleDownNoHand_2-loop")
		state_machine3.travel("SexDoubleDown_3-loop 2")
	if(animID == "sexhands"):
		state_machine.travel("SexDoubleDown_1-loop 3")
		state_machine2.travel("SexDoubleDownHands_2-loop")
		state_machine3.travel("SexDoubleDownHands_3-loop")


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
	return ["tease", "teasenohand", "inside", "sex", "sexnohand", "sexhands", "fast"]

func getVarNpcs():
	return ["pc", "npc", "npc2"]
