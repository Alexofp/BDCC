extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

var isPat = false

func _init():
	id = StageScene.Grope

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer2())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer2())
	animationTree2.active = true

func updateSubAnims():
	#if(true):
	#	return
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
	
	#doll.forceSlotToBeVisible(BodypartSlot.Penis)
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	
	if(_args.has("npcBodyState")):
		doll2.applyBodyState(_args["npcBodyState"])
	else:
		doll2.applyBodyState({})
	
	if(_args.has("pcCum") && _args["pcCum"]):
		startCumPenis(doll)
	if(_args.has("npcCum") && _args["npcCum"]):
		startCumPenis(doll2)
	
	updateSubAnims()
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	isPat = false
	if(animID == "grope"):
		state_machine.travel("GropeFront_1-loop")
		state_machine2.travel("GropeFront_2-loop")
	if(animID == "gropefast"):
		state_machine.travel("GropeFrontFast_1-loop")
		state_machine2.travel("GropeFrontFast_2-loop")
	if(animID == "stroke"):
		state_machine.travel("GropeFront_1-loop 2")
		state_machine2.travel("GropeFrontStroke_2-loop")
	if(animID == "strokefast"):
		state_machine.travel("GropeFrontFast_1-loop 2")
		state_machine2.travel("GropeFrontStrokeFast_2-loop")
		
	if(animID == "tease"):
		state_machine.travel("GropeFrontTease_1-loop")
		state_machine2.travel("GropeFrontTease_2-loop")
		isPat = true
	if(animID == "pat"):
		state_machine.travel("GropeFrontPat_1-loop")
		state_machine2.travel("GropeFrontPat_2-loop")
		isPat = true
	if(animID == "watchrub"):
		state_machine.travel("GropeFrontSelfFem_1-loop")
		state_machine2.travel("GropeFrontSelfWatch_2-loop")
		isPat = true
	if(animID == "watchstroke"):
		state_machine.travel("GropeFrontSelfMale_1-loop")
		state_machine2.travel("GropeFrontSelfWatch_2-loop 2")
		isPat = true

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	var secondDoll = "pc"
	if(_args.has("npc")):
		secondDoll = _args["npc"]
		
	if(!isPat && _actionID in ["tease", "pat", "watchrub", "watchstroke"]):
		return false
	if(isPat && _actionID in ["grope", "gropefast", "stroke", "strokefast"]):
		return false
	if(doll.getCharacterID() != firstDoll || doll2.getCharacterID() != secondDoll):
		return false
	return true

func getSupportedStates():
	return ["grope", "gropefast", "stroke", "strokefast", "tease", "pat", "watchrub", "watchstroke"]
