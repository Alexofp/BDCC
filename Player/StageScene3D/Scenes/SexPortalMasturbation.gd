extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var animationTree3 = $AnimationTree3
onready var doll = $Doll3D
onready var doll2 = $Doll3D2
onready var doll3 = $Doll3D3

func _init():
	id = StageScene.SexPortalMasturbation

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer())
	animationTree2.active = true
	animationTree3.anim_player = animationTree3.get_path_to(doll3.getAnimPlayer())
	animationTree3.active = true

func updateSubAnims():
	#var headLen = doll.headLength# + doll2.headLength
	#headLen = clamp(headLen, 0.0, 1.0)
	#animationTree["parameters/StateMachine/Lick/Blend2/blend_amount"] = headLen
	#animationTree["parameters/StateMachine/LickFast/Blend2/blend_amount"] = headLen
	
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
	var thirdDoll = secondDoll
	if(_args.has("npc2")):
		thirdDoll = _args["npc2"]
	doll3.prepareCharacter(thirdDoll)
	
	#doll.forceSlotToBeVisible(BodypartSlot.Penis)
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	
	if(_args.has("npcBodyState")):
		doll2.applyBodyState(_args["npcBodyState"])
		if(_args.has("npc2BodyState")):
			doll3.applyBodyState(_args["npc2BodyState"])
		else:
			doll3.applyBodyState(_args["npcBodyState"])
	else:
		doll2.applyBodyState({})
		if(_args.has("npc2BodyState")):
			doll3.applyBodyState(_args["npc2BodyState"])
		else:
			doll3.applyBodyState({})
	
	if(_args.has("onlyLeft") && _args["onlyLeft"]):
		doll.visible = false
		doll2.visible = true
		doll3.visible = false
		$Sprite3D3.visible = false
		transform.origin.x = 1.662
	elif(_args.has("onlyRight") && _args["onlyRight"]):
		doll.visible = true
		doll2.visible = false
		doll3.visible = true
		$Sprite3D3.visible = false
		transform.origin.x = -1.662
	else:
		doll.visible = true
		doll2.visible = true
		doll3.visible = true
		$Sprite3D3.visible = true
		transform.origin.x = 0.0
	
	updateSubAnims()
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]
	var state_machine3 = animationTree3["parameters/StateMachine/playback"]
	
	#if(animID in ["tease", "lick", "lickfast"]):
	#	doll.attachTemporaryUnriggedPart("hand.R", "res://Inventory/UnriggedModels/Fleshlight/FleshlightAlt.tscn")
	#if(animID in ["hold", "suck", "suckfast"]):
	#	doll.attachTemporaryUnriggedPart("hand.R", "res://Inventory/UnriggedModels/Fleshlight/FleshlightAlt2.tscn")
	doll3.clampPenisScale(0.95, 1.2)
	#doll3.visible = false
	if(animID == "tease"):
		state_machine.travel("PortalSexMasturbationTease_1-loop")
		state_machine2.travel("PortalSexTease_2-loop")
		state_machine3.travel("PortalSexMasturbationTease_3-loop")
	if(animID == "inside"):
		state_machine.travel("PortalSexMasturbationInside_1-loop")
		state_machine2.travel("PortalSexInside_2-loop")
		state_machine3.travel("PortalSexMasturbationInside_3-loop")
	if(animID == "sex"):
		state_machine.travel("PortalSexMasturbation_1-loop")
		state_machine2.travel("PortalSexSquirm_2-loop")
		state_machine3.travel("PortalSexMasturbation_3-loop")
	if(animID == "fast"):
		state_machine.travel("PortalSexMasturbationFast_1-loop")
		state_machine2.travel("PortalSexSquirmFast_2-loop")
		state_machine3.travel("PortalSexMasturbationFast_3-loop")


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
	return ["tease", "inside", "sex", "fast"]

func getVarNpcs():
	return ["pc", "npc", "npc2"]

func getVarOptions():
	var options = .getVarOptions()
	
	options["onlyLeft"] = {
		type = "bool",
	}
	options["onlyRight"] = {
		type = "bool",
	}
	
	return options
