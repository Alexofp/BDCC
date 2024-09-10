extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.RopesSex

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
	
	if(firstDoll is String):
		var theChar = GlobalRegistry.getCharacter(firstDoll)
		if(theChar != null):
			var ropeColor:Color = theChar.getRopeHarnessColor()
			var ropes = [$Ropes/CurveRenderer,$Ropes/CurveRenderer2,$Ropes/CurveRenderer3,$Ropes/CurveRenderer4,$Ropes/CurveRenderer5]
			var ropeMat = preload("res://Player/Player3D/Chains/RopeMaterial.tres")
			ropeMat = ropeMat.duplicate()
			ropeMat.albedo_color = ropeColor
			for rope in ropes:
				var theRope:CurveRenderer = rope
				theRope.material_override = ropeMat
	
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

	doll.setTemporaryState("ropeharness", "hanged")
	
	if(_args.has("npcCum") && _args["npcCum"]):
		if(!(animID in ["tease"])):
			startCumInside(doll, doll2)
		else:
			startCumPenis(doll2)
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)

	if(animID == "tease"):
		state_machine.travel("RopesSexTease_1-loop")
		state_machine2.travel("RopesSexTease_2-loop")
	if(animID == "inside"):
		state_machine.travel("RopesSexInside_1-loop")
		state_machine2.travel("RopesSexInside_2-loop")
	if(animID == "sex"):
		state_machine.travel("RopesSex_1-loop")
		state_machine2.travel("RopesSex_2-loop")
	if(animID == "fast"):
		state_machine.travel("RopesSexFast_1-loop")
		state_machine2.travel("RopesSexFast_2-loop")
		if(doll.getState("mouth") in ["", null]):
			doll.setTemporaryState("mouth", "open")
	if(animID == "lick"):
		state_machine.travel("RopesSexLick_1-loop")
		state_machine2.travel("RopesSexLick_2-loop")
	if(animID == "lickstroke"):
		state_machine.travel("RopesSexLickStroke_1-loop")
		state_machine2.travel("RopesSexLickStroke_2-loop")


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
	return ["tease", "inside", "sex", "fast", "lick", "lickstroke"]

func getVarNpcs():
	return ["pc", "npc"]
