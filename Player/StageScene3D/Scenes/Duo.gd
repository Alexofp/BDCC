extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.Duo

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
	var fullAnimID = animID
	if(animID is Array):
		animID = animID[0]
	
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
	
	if(animID == "sit"):
		$Chair.visible = true
	else:
		$Chair.visible = false
		
	if(_args.has("flipNPC") && _args["flipNPC"]):
		doll2.scale.x = abs(doll2.scale.x)
	else:
		doll2.scale.x = -abs(doll2.scale.x)
	
	if(animID in ["crawl", "allfours"] || (_args.has("further") && _args["further"])):
		doll.transform.origin.x = 2.5
	else:
		doll.transform.origin.x = 1.5
	
	updateSubAnims()
	
	var state_machine = animationTree["parameters/AnimationNodeStateMachine/playback"]
	if(!stateMachineTravel(doll, state_machine, fullAnimID)):
		Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))
	
	$Chair2.visible = false
	if(_args.has("npcAction")):
		var npcAnimID = _args["npcAction"]
		var fullNpcAnimID = npcAnimID
		if(npcAnimID is Array):
			npcAnimID = npcAnimID[0]
		
		if(npcAnimID == "sit"):
			$Chair2.visible = true
		
		var state_machine2 = animationTree2["parameters/AnimationNodeStateMachine/playback"]
		if(!stateMachineTravel(doll2, state_machine2, fullNpcAnimID)):
			Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))
	else:
		var state_machine2 = animationTree2["parameters/AnimationNodeStateMachine/playback"]
		stateMachineTravel(doll2, state_machine2, "stand")

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
	return getSupportedStatesSolo()

func getChainPoint(_pointID):
	if(_pointID == "farleft"):
		return $FarLeft
	if(_pointID == "farright"):
		return $FarRight
	return .getChainPoint(_pointID)
