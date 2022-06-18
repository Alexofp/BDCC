extends "res://Player/StageScene3D/BaseStageScene3D.gd"

onready var animationTree = $AnimationTree
onready var doll = $Doll3D

func _init():
	id = StageScene.Solo

func _ready():
	animationTree.active = true
	
func playAnimation(animID, _args = []):
	print("Playing: "+str(animID))
	doll.prepareCharacter("pc")
	#doll.forceSlotToBeVisible(BodypartSlot.Penis)
	
	if(animID == "sit"):
		$Chair.visible = true
	else:
		$Chair.visible = false
	
	var state_machine = animationTree["parameters/playback"]
	if(animID == "walk"):
		state_machine.travel("Walk-loop")
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
		printerr("Action "+str(animID)+" is not found for stage "+str(id))
