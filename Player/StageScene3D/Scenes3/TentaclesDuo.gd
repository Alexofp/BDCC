extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
#onready var doll2 = $Doll3D2
onready var tentacles = $Tentacles

func _init():
	id = StageScene.TentaclesDuo

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(tentacles.animation_player3)
	#animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer())
	animationTree2.active = true

func updateSubAnims():
	pass
#	if(doll.getArmsCuffed()):
#		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
#	else:
#		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0

# StageScene.Duo, "kneel", {npc="nova", pc="pc"}
func playAnimation(animID, _args = {}):
	#var fullAnimID = animID
	#if(animID is Array):
	#	animID = animID[0]
	
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	doll.prepareCharacter(firstDoll)

	#doll.forceSlotToBeVisible(BodypartSlot.Penis)
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})

	updateSubAnims()
	
	tentacles.setSceneOptions(_args)
	
	if(_args.has("cum") && _args["cum"] && !(animID in ["tease"])):
		startCumInsideSolo(doll, 1.0)
		#startCumInside(doll2, doll)
		#startCumInside(doll, doll3)
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	
	var finalScale:float = 1.0
	if(_args.has("tentaclesScale")):
		var theScale:float = _args["tentaclesScale"]
		tentacles.scale = Vector3(theScale, theScale, theScale)
		finalScale = theScale
	elif(_args.has("tentaclesSizeSmall") && _args["tentaclesSizeSmall"]):
		var theScale:float = 0.7
		tentacles.scale = Vector3(theScale, theScale, theScale)
		finalScale = theScale
	elif(_args.has("tentaclesSizeTiny") && _args["tentaclesSizeTiny"]):
		var theScale:float = 0.5
		tentacles.scale = Vector3(theScale, theScale, theScale)
		finalScale = theScale
	else:
		var DefaultSCALE:float = 1.0
		tentacles.scale = Vector3(DefaultSCALE, DefaultSCALE, DefaultSCALE)
		finalScale = DefaultSCALE
	
	#_args["onlyTentacles"] = true
	if(_args.has("onlyTentacles") && _args["onlyTentacles"]):
		doll.visible = false
		tentacles.position.x = -2.0 + 2.0 - finalScale*2.0
	else:
		doll.visible = true
		tentacles.position.x = 0.0
	
	var state_machine = animationTree["parameters/AnimationNodeStateMachine/playback"]
	var state_machine2:AnimationNodeStateMachinePlayback = animationTree2["parameters/StateMachine/playback"]

	#_args["instantSleep"] = true
	if(_args.has("instantSleep") && _args["instantSleep"]):
		yield(get_tree(), "idle_frame")
		yield(get_tree(), "idle_frame")
		state_machine2.start("TentSleep-loop")
		yield(get_tree(), "idle_frame")
		yield(get_tree(), "idle_frame")

	if(animID == "idle"):
		state_machine2.travel("TentIdle-loop")
	if(animID == "sleep"):
		state_machine2.travel("TentSleep-loop")
	if(animID == "glare"):
		state_machine2.travel("TentGlare-loop")
	if(animID == "dance"):
		state_machine2.travel("TentDance-loop")
	if(animID == "danceFast"):
		state_machine2.travel("TentDanceFast-loop")
	if(animID == "poke"):
		state_machine2.travel("TentPoke-loop")
	if(animID == "eat"):
		state_machine2.travel("TentEat-loop")
	if(animID == "whip"):
		state_machine2.travel("TentWhip")
	if(animID == "whip2"):
		state_machine2.travel("TentWhip2")
		
		
	#if(animID == "inside"):
	#	state_machine.travel("TentaclesNear_1-loop")
	#	state_machine2.travel("TentaclesNear_2-loop")

	#$Chair2.visible = false
	if(_args.has("npcAction")):
		var npcAnimID = _args["npcAction"]
		var fullNpcAnimID = npcAnimID
		if(npcAnimID is Array):
			npcAnimID = npcAnimID[0]
		
		#if(npcAnimID == "sit"):
			#$Chair2.visible = true
		
		if(!stateMachineTravel(doll, state_machine, fullNpcAnimID)):
			Log.printerr("Action "+str(animID)+" is not found for stage "+str(id))
	else:
		stateMachineTravel(doll, state_machine, "stand")

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]

	if(doll.getCharacterID() != firstDoll):
		return false
	return true

func getSupportedStates():
	return ["idle", "sleep", "glare", "dance", "danceFast", "poke", "eat", "whip", "whip2"]

func getVarNpcs():
	return ["pc"]

func getVarOptions():
	var options = .getVarOptions()
	
	options["plant"] = {
		type = "bool",
	}
	options["tentaclesLess"] = {
		type = "bool",
	}
	options["instantSleep"] = {
		type = "bool",
	}
	options["tentaclesSizeSmall"] = {
		type = "bool",
	}
	options["tentaclesSizeTiny"] = {
		type = "bool",
	}
	options["onlyTentacles"] = {
		type = "bool",
	}
	
	return options
