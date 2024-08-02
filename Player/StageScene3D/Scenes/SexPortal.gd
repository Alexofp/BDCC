extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.SexPortal

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayer())
	animationTree.active = true
	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayer())
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
	
	#doll.forceSlotToBeVisible(BodypartSlot.Penis)
	
	if(_args.has("bodyState")):
		doll.applyBodyState(_args["bodyState"])
	else:
		doll.applyBodyState({})
	
	if(_args.has("npcBodyState")):
		doll2.applyBodyState(_args["npcBodyState"])
	else:
		doll2.applyBodyState({})
	
	if(_args.has("onlyLeft") && _args["onlyLeft"]):
		doll.visible = false
		doll2.visible = true
		if(animID == "fast"):
			$Sprite3D3.visible = true
		else:
			$Sprite3D3.visible = false
		transform.origin.x = 1.662
	elif(_args.has("onlyRight") && _args["onlyRight"]):
		doll.visible = true
		doll2.visible = false
		$Sprite3D3.visible = false
		transform.origin.x = -1.662
	else:
		doll.visible = true
		doll2.visible = true
		$Sprite3D3.visible = true
		transform.origin.x = 0.0
	
	updateSubAnims()
	
	var state_machine = animationTree["parameters/StateMachine/playback"]
	var state_machine2 = animationTree2["parameters/StateMachine/playback"]

	doll.attachTemporaryUnriggedPart("hand.R", "res://Inventory/UnriggedModels/Fleshlight/Fleshlight.tscn")
	doll.clampPenisScale(0.7, 1.2)
	if(animID == "tease"):
		state_machine.travel("PortalSexTease_1-loop")
		state_machine2.travel("PortalSexTease_2-loop")
	if(animID == "inside"):
		state_machine.travel("PortalSexInside_1-loop")
		state_machine2.travel("PortalSexInside_2-loop")
	if(animID == "sex"):
		state_machine.travel("PortalSex_1-loop")
		state_machine2.travel("PortalSex_2-loop")
	if(animID == "fast"):
		state_machine.travel("PortalSexFast_1-loop")
		state_machine2.travel("PortalSexFast_2-loop")

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
	return ["pc", "npc"]

func getVarOptions():
	var options = .getVarOptions()
	
	options["onlyLeft"] = {
		type = "bool",
	}
	options["onlyRight"] = {
		type = "bool",
	}
	
	return options
