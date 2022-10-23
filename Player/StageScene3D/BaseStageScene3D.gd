extends Spatial
class_name BaseStageScene3D

var id = "error"

func _init():
	id = "error"

func _ready():
	pass

func playAnimation(animID, _args = {}):
	print("Playing: "+str(animID))

func updateSubAnims():
	pass

func canTransitionTo(_actionID, _args = []):
	return true



func stateMachineTravel(thedoll, state_machine, animID):
	if(animID == ""):
		pass
	elif(animID == "walk"):
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
		thedoll.setTemporaryState("hands", "fists")
	elif(animID == "dodge"):
		state_machine.travel("Dodge")
	elif(animID == "hurt"):
		state_machine.travel("Hurt")
	elif(animID == "kick"):
		state_machine.travel("Kick")
	elif(animID == "punch"):
		state_machine.travel("Punch")
		thedoll.setTemporaryState("hands", "fists")
	elif(animID == "allfours"):
		state_machine.travel("AllFours-loop")
	elif(animID == "crawl"):
		state_machine.travel("AllFoursCrawl-loop")
	elif(animID == "stunbaton"):
		state_machine.travel("WeaponSwing")
		thedoll.attachTemporaryUnriggedPart("hand.R", "res://Inventory/UnriggedModels/StunBaton/StunBaton.tscn")
		thedoll.setTemporaryState("hands", "fists")
	elif(animID == "shiv"):
		state_machine.travel("WeaponShiv")
		thedoll.attachTemporaryUnriggedPart("hand.R", "res://Inventory/UnriggedModels/Shiv/Shiv.tscn")
		thedoll.setTemporaryState("hands", "fists")
	elif(animID == "shove"):
		state_machine.travel("Shove")
	else:
		return false
	return true
