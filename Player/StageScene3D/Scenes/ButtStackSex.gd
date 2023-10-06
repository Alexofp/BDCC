extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var animationTree3 = $AnimationTree3
onready var doll = $Doll3D
onready var doll2 = $Doll3D2
onready var doll3 = $Doll3D3

func _init():
	id = StageScene.ButtStackSex

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer())
	animationTree2.active = true
	animationTree3.anim_player = animationTree3.get_path_to(doll3.getAnimPlayer())
	animationTree3.active = true
	
func updateSubAnims():
#	if(doll.getArmsCuffed()):
#		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
#	else:
#		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0
	
	if(doll2.getArmsCuffed()):
		animationTree2["parameters/CuffsBlend/blend_amount"] = 1.0
	else:
		animationTree2["parameters/CuffsBlend/blend_amount"] = 0.0

#	if(doll3.getArmsCuffed()):
#		animationTree3["parameters/CuffsBlend/blend_amount"] = 1.0
#	else:
#		animationTree3["parameters/CuffsBlend/blend_amount"] = 0.0

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
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]
	var state_machine3 = animationTree3["parameters/StateMachine/playback"]

	if(animID == "tease"):
		state_machine.travel("ButtStackSexTease_1-loop")
		state_machine2.travel("ButtStackSexTease_2-loop")
		state_machine3.travel("ButtStackSexTease_3-loop")
	if(animID == "insideup"):
		state_machine.travel("ButtStackSexUPInside_1-loop")
		state_machine2.travel("ButtStackSexUPInside_2-loop")
		state_machine3.travel("ButtStackSexUPInside_3-loop")
	if(animID == "sexup"):
		state_machine.travel("ButtStackSexUP_1-loop")
		state_machine2.travel("ButtStackSexUP_2-loop")
		state_machine3.travel("ButtStackSexUP_3-loop")
	if(animID == "fastup"):
		state_machine.travel("ButtStackSexUPFast_1-loop")
		state_machine2.travel("ButtStackSexUPFast_2-loop")
		state_machine3.travel("ButtStackSexUPFast_3-loop")
	if(animID == "insidedown"):
		state_machine.travel("ButtStackSexDOWNInside_1-loop")
		state_machine2.travel("ButtStackSexDOWNInside_2-loop")
		state_machine3.travel("ButtStackSexDOWNInside_3-loop")
	if(animID == "sexdown"):
		state_machine.travel("ButtStackSexDOWN_1-loop")
		state_machine2.travel("ButtStackSexDOWN_2-loop")
		state_machine3.travel("ButtStackSexDOWN_3-loop")
	if(animID == "fastdown"):
		state_machine.travel("ButtStackSexDOWNFast_1-loop")
		state_machine2.travel("ButtStackSexDOWNFast_2-loop")
		state_machine3.travel("ButtStackSexDOWNFast_3-loop")


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
	return ["tease", "insideup", "sexup", "fastup", "insidedown", "sexdown", "fastdown"]
