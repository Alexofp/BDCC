extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.WoodenHorseDuo

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer())
	animationTree2.active = true

func updateSubAnims():
	pass
	#if(doll.getArmsCuffed()):
	#	animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
	#else:
	#	animationTree["parameters/CuffsBlend/blend_amount"] = 0.0

func playAnimation(animID, _args = {}):
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
		startCumPenis(doll2)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(animID == "idle"):
		state_machine.travel("WoodenHorseIdle-loop")
	if(animID == "lightstruggle"):
		state_machine.travel("WoodenHorseStruggleLight-loop")
	if(animID == "struggle"):
		state_machine.travel("WoodenHorseStruggle-loop")

	if(_args.has("npcAction")):
		var npcAnimID = _args["npcAction"]

		if(npcAnimID == "idle"):
			state_machine2.travel("WoodenHorseIdle-loop")
		if(npcAnimID == "lightstruggle"):
			state_machine2.travel("WoodenHorseStruggleLight-loop")
		if(npcAnimID == "struggle"):
			state_machine2.travel("WoodenHorseStruggle-loop")
	else:
		state_machine2.travel("WoodenHorseIdle-loop")

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
	return ["idle", "lightstruggle", "struggle"]
