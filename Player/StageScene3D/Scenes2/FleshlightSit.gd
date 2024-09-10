extends BaseStageScene3D

onready var animationTree = $AnimationTree
#onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
#onready var dildo = $CanineDildo

func _init():
	id = StageScene.FleshlightSit

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer2())
	animationTree.active = true
	#animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer2())
	#animationTree2.active = true

func updateSubAnims():
	if(true):
		return
	if(doll.getArmsCuffed()):
		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
	else:
		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0
	
	#if(doll2.getArmsCuffed()):
	#	animationTree2["parameters/CuffsBlend/blend_amount"] = 1.0
	#else:
	#	animationTree2["parameters/CuffsBlend/blend_amount"] = 0.0

# StageScene.Duo, "kneel", {npc="nova", pc="pc"}
func playAnimation(animID, _args = {}):
	#var fullAnimID = animID
	#if(animID is Array):
	#	animID = animID[0]
	
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	doll.prepareCharacter(firstDoll)
	
	#var secondDoll = "pc"
	#if(_args.has("npc")):
	#	secondDoll = _args["npc"]
	#doll2.prepareCharacter(secondDoll)
	
	#doll.forceSlotToBeVisible(BodypartSlot.Penis)
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	
	#if(_args.has("npcBodyState")):
	#	doll2.applyBodyState(_args["npcBodyState"])
	#else:
	#	doll2.applyBodyState({})
	
	updateSubAnims()
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	#var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	doll.attachTemporaryUnriggedPart("hand.L", "res://Inventory/UnriggedModels/Fleshlight/FleshlightSitAnim.tscn")
	doll.clampPenisScale(0.7, 1.2)
	if(animID == "tease"):
		state_machine.travel("FleshlightSitTease-loop")
	if(animID == "inside"):
		state_machine.travel("FleshlightSitInside-loop")
	if(animID == "sex"):
		state_machine.travel("FleshlightSit-loop")
	if(animID == "fast"):
		state_machine.travel("FleshlightSitFast-loop")
	if(animID == "cum"):
		state_machine.travel("FleshlightSitCum-loop")
	if(animID == "standinside"):
		state_machine.travel("FleshlightSitStandInside-loop")
	if(animID == "standsex"):
		state_machine.travel("FleshlightSitStand-loop")
	if(animID == "standfast"):
		state_machine.travel("FleshlightSitStandFast-loop")

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
		
	if(doll.getCharacterID() != firstDoll):
		return false
	return true

func getSupportedStates():
	return ["tease", "inside", "sex", "fast", "cum", "standinside", "standsex", "standfast"]

func getVarNpcs():
	return ["pc"]
