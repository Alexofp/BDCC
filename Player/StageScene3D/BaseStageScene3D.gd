extends Spatial
class_name BaseStageScene3D

var id = "error"
var currentAnim = ""

func _init():
	id = "error"

func _ready():
	pass

func playAnimationFinal(animID, _args = {}):
	playAnimation(animID, _args)
	currentAnim = animID

func playAnimation(animID, _args = {}):
	print("Playing: "+str(animID))

func updateSubAnims():
	pass

func canTransitionTo(_actionID, _args = []):
	return true



func stateMachineTravel(thedoll, state_machine, animID):
	var args = []
	if(animID is Array):
		args = animID
		animID = animID[0]
	
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
		if(args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.R", args[1])
		else:
			thedoll.attachTemporaryUnriggedPart("hand.R", "res://Inventory/UnriggedModels/StunBaton/StunBaton.tscn")
		thedoll.setTemporaryState("hands", "fists")
	elif(animID == "shiv"):
		state_machine.travel("WeaponShiv")
		if(args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.R", args[1])
		else:
			thedoll.attachTemporaryUnriggedPart("hand.R", "res://Inventory/UnriggedModels/Shiv/Shiv.tscn")
		thedoll.setTemporaryState("hands", "fists")
	elif(animID == "shove"):
		state_machine.travel("Shove")
	elif(animID == "struggle"):
		state_machine.travel("StruggleGeneric-loop")
	elif(animID == "struggle_gag"):
		state_machine.travel("StruggleGag-loop")
	elif(animID == "struggle_legs"):
		state_machine.travel("StruggleLegs-loop")
	else:
		return false
	return true
