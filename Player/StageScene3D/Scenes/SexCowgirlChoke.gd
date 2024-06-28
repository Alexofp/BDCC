extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.SexCowgirlChoke

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer())
	animationTree2.active = true

func updateSubAnims(overrideFirstHands = false):
	if(doll.getArmsCuffed() || overrideFirstHands):
		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
	else:
		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0
	
	if(true):
		return
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
	
	var isUncon = (_args.has("uncon") && _args["uncon"])
	updateSubAnims()
	
	if(_args.has("pcCum") && _args["pcCum"]):
		#startCumInsideSolo(doll, getCumIntensity(doll2) + getCumIntensity(doll3))
		if(!(animID in ["tease", "teaseuncon"])):
			startCumInside(doll2, doll)
		else:
			startCumPenis(doll)
	if(_args.has("npcCum") && _args["npcCum"]):
		startCumPenis(doll2)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(!isUncon):
		if(animID == "tease"):
			state_machine.travel("Sex_CowgirlChokeTease_1-loop")
			state_machine2.travel("Sex_CowgirlChokeTease_2-loop")
		if(animID == "inside"):
			state_machine.travel("Sex_CowgirlChokeInside_1-loop")
			state_machine2.travel("Sex_CowgirlChokeInside_2-loop")
		if(animID == "sex"):
			state_machine.travel("Sex_CowgirlChoke_1-loop")
			state_machine2.travel("Sex_CowgirlChoke_2-loop")
		if(animID == "fast"):
			state_machine.travel("Sex_CowgirlChokeFast_1-loop")
			state_machine2.travel("Sex_CowgirlChokeFast_2-loop")
	if(animID == "teaseuncon" || (isUncon && animID == "tease")):
		state_machine.travel("Sex_CowgirlChokeTeaseUncon_1-loop")
		state_machine2.travel("Sex_CowgirlChokeTease_2-loop 2")
	if(animID == "insideuncon" || (isUncon && animID == "inside")):
		state_machine.travel("Sex_CowgirlChokeInsideUncon_1-loop")
		state_machine2.travel("Sex_CowgirlChokeInside_2-loop 2")
	if(animID == "sexuncon" || (isUncon && animID == "sex")):
		state_machine.travel("Sex_CowgirlChokeUncon_1-loop")
		state_machine2.travel("Sex_CowgirlChoke_2-loop 2")
	if(animID == "fastuncon" || (isUncon && animID == "fast")):
		state_machine.travel("Sex_CowgirlChokeFastUncon_1-loop")
		state_machine2.travel("Sex_CowgirlChokeFast_2-loop 2")

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
	return ["tease", "inside", "sex", "fast", "teaseuncon", "insideuncon", "sexuncon", "fastuncon"]
