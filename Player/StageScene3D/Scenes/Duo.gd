extends BaseStageScene3D

onready var animationTree = $AnimationTree
onready var animationTree2 = $AnimationTree2
onready var doll = $Doll3D
onready var doll2 = $Doll3D2

func _init():
	id = StageScene.Duo

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

# StageScene.Duo, "kneel", {npc="nova", pc="pc"}
func playAnimation(animID, _args = {}):
	print("Playing duo: "+str(animID))
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	doll.prepareCharacter(firstDoll)
	var secondDoll = "pc"
	if(_args.has("npc")):
		secondDoll = _args["npc"]
	doll2.prepareCharacter(secondDoll)
	#doll2.playAnimation("Standing-loop")
	
	#doll.forceSlotToBeVisible(BodypartSlot.Penis)
	
	if(animID == "sit"):
		$Chair.visible = true
	else:
		$Chair.visible = false
	
	updateSubAnims()
	
	var state_machine = animationTree["parameters/AnimationNodeStateMachine/playback"]
	if(!stateMachineTravel(doll, state_machine, animID)):
		printerr("Action "+str(animID)+" is not found for stage "+str(id))
	
	if(_args.has("npcAction")):
		var state_machine2 = animationTree2["parameters/AnimationNodeStateMachine/playback"]
		if(!stateMachineTravel(doll2, state_machine2, _args["npcAction"])):
			printerr("Action "+str(animID)+" is not found for stage "+str(id))
	else:
		var state_machine2 = animationTree2["parameters/AnimationNodeStateMachine/playback"]
		stateMachineTravel(doll2, state_machine2, "stand")

func stateMachineTravel(thedoll, state_machine, animID):
	if(animID == "walk"):
		if(!thedoll.getLegsCuffed()):
			state_machine.travel("Walk-loop")
		else:
			state_machine.travel("ShacklesWalk-loop")
	elif(animID == "stand"):
		state_machine.travel("Standing-loop")
	elif(animID == "kneel"):
		state_machine.travel("Kneeling-loop")
	elif(animID == "defeat"):
		state_machine.travel("Defeat")
	elif(animID == "sit"):
		state_machine.travel("Sitting-loop")
	elif(animID == "bite"):
		state_machine.travel("Bite")
	elif(animID == "block"):
		state_machine.travel("Block")
	elif(animID == "dodge"):
		state_machine.travel("Dodge")
	elif(animID == "hurt"):
		state_machine.travel("Hurt")
	elif(animID == "kick"):
		state_machine.travel("Kick")
	elif(animID == "punch"):
		state_machine.travel("Punch")
	elif(animID == "shove"):
		state_machine.travel("Shove")
	else:
		return false
	return true
