extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.PuppySexCowgirl

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer3())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer3())
	animationTree2.active = true

func updateSubAnims():
	if(doll.getArmsCuffed()):
		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
	else:
		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0
	
#	if(doll2.getArmsCuffed()):
#		animationTree2["parameters/CuffsBlend/blend_amount"] = 1.0
#	else:
#		animationTree2["parameters/CuffsBlend/blend_amount"] = 0.0

# StageScene.Duo, "kneel", {npc="nova", pc="pc"}
func playAnimation(animID, _args = {}):
	
	doll2.setCustomParts({
		"PuppyGear": "res://Inventory/RiggedModels/PuppyRestraints/PuppyRestraints.tscn",
	})
	
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	doll.prepareCharacter(firstDoll)
	var secondDoll = "pc"
	if(_args.has("npc")):
		secondDoll = _args["npc"]
	doll2.prepareCharacter(secondDoll)
	
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
		if(!(animID in ["tease"])):
			startCumInside(doll, doll2)
		else:
			startCumPenis(doll2)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(animID == "tease"):
		state_machine.travel("PuppySexCowgirlTease_1-loop")
		state_machine2.travel("PuppySexCowgirlTease_2-loop")
	if(animID == "inside"):
		state_machine.travel("PuppySexCowgirlInside_1-loop")
		state_machine2.travel("PuppySexCowgirlInside_2-loop")
	if(animID == "sex"):
		state_machine.travel("PuppySexCowgirl_1-loop")
		state_machine2.travel("PuppySexCowgirl_2-loop")
	if(animID == "fast"):
		state_machine.travel("PuppySexCowgirlFast_1-loop")
		state_machine2.travel("PuppySexCowgirlFast_2-loop")

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
	return ["tease", "inside", "sex", "fast"]

func getVarNpcs():
	return ["pc", "npc"]
