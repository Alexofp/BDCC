extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
#onready var doll2 = $Doll3D2

func _init():
	id = StageScene.BDSMMachineFuck

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer())
	animationTree.active = true
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
	
	if(_args.has("noDildos") && _args["noDildos"]):
		$BDSMMachine.setDildosVisible(false)
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(animID == "tease"):
		state_machine.travel("BDSMMachineIdle_1-loop")
		state_machine2.travel("BDSMMachineIdle_2-loop")
	if(animID == "wand"):
		state_machine.travel("BDSMMachineWand_1-loop")
		state_machine2.travel("BDSMMachineWand_2-loop")
	if(animID == "inside"):
		state_machine.travel("BDSMMachineFuckInside_1-loop")
		state_machine2.travel("BDSMMachineFuckInside_2-loop")
	if(animID == "sex"):
		state_machine.travel("BDSMMachineFuck_1-loop")
		state_machine2.travel("BDSMMachineFuck_2-loop")
	if(animID == "fast"):
		state_machine.travel("BDSMMachineFuckFast_1-loop")
		state_machine2.travel("BDSMMachineFuckFast_2-loop")
	if(animID == "insidedouble"):
		state_machine.travel("BDSMMachineDoubleFuckInside_1-loop")
		state_machine2.travel("BDSMMachineDoubleFuckInside_2-loop")
	if(animID == "sexdouble"):
		state_machine.travel("BDSMMachineDoubleFuck_1-loop")
		state_machine2.travel("BDSMMachineDoubleFuck_2-loop")
	if(animID == "fastdouble"):
		state_machine.travel("BDSMMachineDoubleFuckFast_1-loop")
		state_machine2.travel("BDSMMachineDoubleFuckFast_2-loop")

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]

	if(doll.getCharacterID() != firstDoll):
		return false
	return true

func getSupportedStates():
	return ["tease", "wand", "inside", "sex", "fast", "insidedouble", "sexdouble", "fastdouble"]
