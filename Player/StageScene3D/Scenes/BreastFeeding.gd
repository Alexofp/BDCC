extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

var altState = ""

func _init():
	id = StageScene.BreastFeeding

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

	var breastScale = doll2.breastScale + doll.headLength / 2.0
	animationTree["parameters/StateMachine/Feeding/BreastSize/blend_amount"] = breastScale
	animationTree["parameters/StateMachine/FeedingAlt/BreastSize/blend_amount"] = breastScale
	animationTree2["parameters/StateMachine/Feeding/BreastSize/blend_amount"] = breastScale
	animationTree2["parameters/StateMachine/FeedingAlt/BreastSize/blend_amount"] = breastScale

# StageScene.Duo, "kneel", {npc="nova", pc="pc"}
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
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	if(animID == "tease"):
		state_machine.travel("BreastFeedingTease_1-loop")
		state_machine2.travel("BreastFeedingTease_2-loop")
		altState = "t"
	if(animID == "feed"):
		state_machine.travel("Feeding")
		state_machine2.travel("Feeding")
		altState = "t"
	if(animID == "teasealt"):
		state_machine.travel("BreastFeedingAltTease_1-loop")
		state_machine2.travel("BreastFeedingAltTease_2-loop")
		altState = "alt"
	if(animID == "feedalt"):
		state_machine.travel("FeedingAlt")
		state_machine2.travel("FeedingAlt")
		altState = "alt"


func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	var secondDoll = "pc"
	if(_args.has("npc")):
		secondDoll = _args["npc"]
		
	if(doll.getCharacterID() != firstDoll || doll2.getCharacterID() != secondDoll):
		return false
	if(_actionID in ["tease", "feed"] && altState == "alt"):
		return false
	if(_actionID in ["teasealt", "feedalt"] && altState == "t"):
		return false
	return true

func getSupportedStates():
	return ["tease", "feed", "teasealt", "feedalt"]
