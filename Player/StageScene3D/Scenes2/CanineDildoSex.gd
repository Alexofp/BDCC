extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var dildo = $CanineDildo

func _init():
	id = StageScene.CanineDildoSex

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer2())
	animationTree.active = true
	#animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer2())
	animationTree2.active = true

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
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]
	
	if(_args.has("skipToHover") && _args["skipToHover"]): # Don't ask me
		state_machine.stop()
		state_machine2.stop()
		yield(get_tree(), "idle_frame")
		yield(get_tree(), "idle_frame")
		state_machine.start("CanineDildoRideHover_1-loop")
		state_machine2.start("CanineDildoRideHover_2-loop")
		yield(get_tree(), "idle_frame")
		yield(get_tree(), "idle_frame")
		#return
	
	if(_args.has("cum") && _args["cum"] && !(animID in ["tease"])):
		startCumInsideSolo(doll, 1.0, 2.0)
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)

	if(animID == "tease"):
		state_machine.travel("CanineDildoRideTease_1-loop")
		state_machine2.travel("CanineDildoRideTease_2-loop")
	if(animID == "hover"):
		state_machine.travel("CanineDildoRideHover_1-loop")
		state_machine2.travel("CanineDildoRideHover_2-loop")
	if(animID == "inside"):
		state_machine.travel("CanineDildoRideInside_1-loop")
		state_machine2.travel("CanineDildoRideInside_2-loop")
	if(animID == "sex"):
		state_machine.travel("CanineDildoRide_1-loop")
		state_machine2.travel("CanineDildoRide_2-loop")
	if(animID == "fast"):
		state_machine.travel("CanineDildoRideFast_1-loop")
		state_machine2.travel("CanineDildoRideFast_2-loop")
	if(animID == "knotinside"):
		state_machine.travel("CanineDildoRideKnotInside_1-loop")
		state_machine2.travel("CanineDildoRideKnotInside_2-loop")
	if(animID == "knot"):
		state_machine.travel("CanineDildoRideKnot_1-loop")
		state_machine2.travel("CanineDildoRideKnot_2-loop")
	if(animID == "knotfast"):
		state_machine.travel("CanineDildoRideKnotFast_1-loop")
		state_machine2.travel("CanineDildoRideKnotFast_2-loop")

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
		
	if(doll.getCharacterID() != firstDoll):
		return false
	return true

func getSupportedStates():
	return ["tease", "hover", "inside", "sex", "fast", "knotinside", "knot", "knotfast"]
