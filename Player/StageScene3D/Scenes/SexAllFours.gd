extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.SexAllFours

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer())
	animationTree2.active = true

func updateSubAnims():
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
	
	print("Playing duo: "+str(animID))
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
	
	if(_args.has("onlySub")):
		if(_args["onlySub"]):
			doll.visible = false
		else:
			doll.visible = true
	
	updateSubAnims()
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(animID == "tease"):
		state_machine.travel("Sex_DoggyTease_1-loop")
		state_machine2.travel("Sex_DoggyTease_2-loop")
	if(animID == "teaseflop"):
		state_machine.travel("Sex_DoggyFlopTease_1-loop")
		state_machine2.travel("Sex_DoggyFlopTease_2-loop")
	if(animID == "inside"):
		state_machine.travel("Sex_DoggyInside_1-loop")
		state_machine2.travel("Sex_DoggyInside_2-loop")
	if(animID == "insideflop"):
		state_machine.travel("Sex_DoggyFlopInside_1-loop")
		state_machine2.travel("Sex_DoggyFlopInside_2-loop")
	if(animID == "sex"):
		state_machine.travel("Sex_Doggy_1-loop")
		state_machine2.travel("Sex_Doggy_2-loop")
	if(animID == "sexflop"):
		state_machine.travel("Sex_DoggyFlop_1-loop")
		state_machine2.travel("Sex_DoggyFlop_2-loop")
	if(animID == "fast"):
		state_machine.travel("Sex_DoggyFast_1-loop")
		state_machine2.travel("Sex_DoggyFast_2-loop")
	if(animID == "fastflop"):
		state_machine.travel("Sex_DoggyFlopFast_1-loop")
		state_machine2.travel("Sex_DoggyFlopFast_2-loop")

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
	return ["tease", "inside", "sex", "fast", "teaseflop", "insideflop", "sexflop", "fastflop"]
