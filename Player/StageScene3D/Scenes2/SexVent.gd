extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.SexVent

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
	
	updateSubAnims()
	
	if(_args.has("npcCum") && _args["npcCum"]):
		#startCumInsideSolo(doll, getCumIntensity(doll2) + getCumIntensity(doll3))
		if(!(animID in ["tease", "finger", "lick", "stroke"])):
			startCumInside(doll, doll2)
		else:
			startCumPenis(doll2)
		
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(animID == "tease"):
		state_machine.travel("SexVentTease_1-loop")
		state_machine2.travel("SexVentTease_2-loop")
	if(animID == "inside"):
		state_machine.travel("SexVentInside_1-loop")
		state_machine2.travel("SexVentInside_2-loop")
	if(animID == "sex"):
		state_machine.travel("SexVent_1-loop")
		state_machine2.travel("SexVent_2-loop")
	if(animID == "fast"):
		state_machine.travel("SexVentFast_1-loop")
		state_machine2.travel("SexVentFast_2-loop")
	if(animID == "finger"):
		state_machine.travel("SexVentFinger_1-loop")
		state_machine2.travel("SexVentFinger_2-loop")
	if(animID == "lick"):
		state_machine.travel("SexVentFinger_1-loop 2")
		state_machine2.travel("SexVentLick_2-loop")
	if(animID == "stroke"):
		state_machine.travel("SexVentFinger_1-loop 3")
		state_machine2.travel("SexVentStroke_2-loop")

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
	return ["tease", "inside", "sex", "fast", "finger", "lick", "stroke"]
