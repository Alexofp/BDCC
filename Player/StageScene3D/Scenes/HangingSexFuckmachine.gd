extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
#onready var doll2 = $Doll3D2

func _init():
	id = StageScene.HangingSexFuckmachine

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer())
	animationTree.active = true
	#animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer())
	animationTree2.active = true

func updateSubAnims():
	pass

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

	
	#doll.forceSlotToBeVisible(BodypartSlot.Penis)
	
	if(_args.has("cum") && _args["cum"] && !(animID in ["tease"])):
		#startCumInsideSolo(doll, getCumIntensity(doll2) + getCumIntensity(doll3))
		startCumInsideSolo(doll, 1.0)
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})

	
	updateSubAnims()
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(animID == "tease"):
		state_machine.travel("HangingIdle-loop")
		state_machine2.travel("Fuckmachine_idle-loop")
	if(animID == "sex"):
		state_machine.travel("HangingSex_1-loop")
		state_machine2.travel("Fuckmachine_sex-loop")
	if(animID == "fast"):
		state_machine.travel("HangingSexFast_1-loop")
		state_machine2.travel("Fuckmachine_sexFast-loop")

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]

	if(doll.getCharacterID() != firstDoll):
		return false
	return true

func getSupportedStates():
	return ["tease", "sex", "fast"]
