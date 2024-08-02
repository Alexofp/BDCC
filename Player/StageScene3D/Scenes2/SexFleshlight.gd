extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.SexFleshlight

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
	
	updateSubAnims()
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(_args.has("socketPussy") && _args["socketPussy"]):
		doll2.attachTemporaryUnriggedPart("hand.L", "res://Inventory/UnriggedModels/Fleshlight/FleshlightAlt4Socket.tscn")
	elif(_args.has("customPussy")):
		doll2.attachTemporaryUnriggedPart("hand.L", _args["customPussy"])
	else:
		doll2.attachTemporaryUnriggedPart("hand.L", "res://Inventory/UnriggedModels/Fleshlight/FleshlightAlt4.tscn")
	doll.clampPenisScale(0.7, 1.2)
	if(animID == "tease"):
		state_machine.travel("SexFleshlightTease_1-loop")
		state_machine2.travel("SexFleshlightTease_2-loop")
	if(animID == "inside"):
		state_machine.travel("SexFleshlightInside_1-loop")
		state_machine2.travel("SexFleshlightInside_2-loop")
	if(animID == "sex"):
		state_machine.travel("SexFleshlight_1-loop")
		state_machine2.travel("SexFleshlight_2-loop")
	if(animID == "fast"):
		state_machine.travel("SexFleshlightFast_1-loop")
		state_machine2.travel("SexFleshlightFast_2-loop")

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

func getVarOptions():
	var options = .getVarOptions()
	
	options["socketPussy"] = {
		type = "bool",
	}
	
	return options
