extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
#onready var doll2 = $Doll3D2

func _init():
	id = StageScene.BDSMMachineAltFuck

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
		
	if(_args.has("noDildos") && _args["noDildos"]):
		$BDSMMachine.setDildosVisible(false)

	updateSubAnims()
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(animID == "tease"):
		state_machine.travel("BDSMMachineAltFuckIdle_1-loop")
		state_machine2.travel("BDSMMachineAltFuckIdle_2-loop")
	if(animID == "inside"):
		state_machine.travel("BDSMMachineAltFuckInside_1-loop")
		state_machine2.travel("BDSMMachineAltFuckInside_2-loop")
	if(animID == "sex"):
		state_machine.travel("BDSMMachineAltFuck_1-loop")
		state_machine2.travel("BDSMMachineAltFuck_2-loop")
	if(animID == "fast"):
		state_machine.travel("BDSMMachineAltFuckFast_1-loop")
		state_machine2.travel("BDSMMachineAltFuckFast_2-loop")
	if(animID == "insidedouble"):
		state_machine.travel("BDSMMachineAltDoubleFuckInside_1-loop")
		state_machine2.travel("BDSMMachineAltDoubleFuckInside_2-loop")
	if(animID == "sexdouble"):
		state_machine.travel("BDSMMachineAltDoubleFuck_1-loop")
		state_machine2.travel("BDSMMachineAltDoubleFuck_2-loop")
	if(animID == "fastdouble"):
		state_machine.travel("BDSMMachineAltDoubleFuckFast_1-loop")
		state_machine2.travel("BDSMMachineAltDoubleFuckFast_2-loop")

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]

	if(doll.getCharacterID() != firstDoll):
		return false
	return true

func getSupportedStates():
	return ["tease", "inside", "sex", "fast", "insidedouble", "sexdouble", "fastdouble"]
