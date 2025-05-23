extends Spatial
class_name BaseStageScene3D

var id = "error"
var currentAnim = ""
var dolls = []

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
	
	#thedoll.attachTemporaryUnriggedPart("hand.R", "res://Inventory/UnriggedModels/BigWrench/BigWrench.tscn")
	if(animID == ""):
		pass
	elif(animID == "walk"):
		if(!thedoll.getLegsCuffed()):
			state_machine.travel("Walk-loop")
		else:
			state_machine.travel("ShacklesWalk-loop")
	elif(animID == "jog"):
		state_machine.travel("Jogging-loop")
	elif(animID == "stand"):
		state_machine.travel("Standing-loop")
		if(args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.R", args[1])
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
	elif(animID == "throw"):
		state_machine.travel("WeaponThrow")
		if(args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.R", args[1])
		thedoll.setTemporaryState("hands", "fists")
	elif(animID == "holdpistol"):
		state_machine.travel("WeaponGunHold-loop")
		if(args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.L", args[1])
		else:
			thedoll.attachTemporaryUnriggedPart("hand.L", "res://Inventory/UnriggedModels/EnergyPistol/EnergyPistolBlue.tscn")
		thedoll.setTemporaryState("hands", "fists")
	elif(animID == "aimpistol"):
		state_machine.travel("WeaponGunAim-loop")
		if(args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.L", args[1])
		else:
			thedoll.attachTemporaryUnriggedPart("hand.L", "res://Inventory/UnriggedModels/EnergyPistol/EnergyPistolBlue.tscn")
		thedoll.setTemporaryState("hands", "fists")
	elif(animID == "firepistol"):
		state_machine.travel("WeaponGunShoot")
		if(args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.L", args[1])
		else:
			thedoll.attachTemporaryUnriggedPart("hand.L", "res://Inventory/UnriggedModels/EnergyPistol/EnergyPistolBlue.tscn")
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
	elif(animID == "hold_object"):
		state_machine.travel("HoldObject-loop")
		if(args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.L", args[1])
	else:
		return false
	return true


func stateMachineTravelPuppy(_thedoll, state_machine, animID):
	#var args = []
	if(animID is Array):
		#args = animID
		animID = animID[0]
	
	if(animID == ""):
		pass
	elif(animID == "stand"):
		state_machine.travel("PuppyIdle-loop")
	elif(animID == "walk"):
		state_machine.travel("PuppyWalk-loop")
	elif(animID == "sit"):
		state_machine.travel("PuppySit-loop")
	elif(animID == "paw"):
		state_machine.travel("PuppySitPaw-loop")
	elif(animID == "back"):
		state_machine.travel("PuppyOnBack-loop")
	elif(animID == "sad"):
		state_machine.travel("PuppyIdleSad-loop")
	else:
		return false
	
	return true

func getSupportedStates():
	return []

func getSupportedStatesPuppy():
	return ["stand", "walk", "sit", "paw", "back", "sad"]

func getSupportedStatesSolo():
	return ["stand", "walk", "jog", "kneel", "defeat", "sit", "bite", "block", "dodge", "hurt", "kick", "punch", "allfours", "crawl", "stunbaton", "throw", "holdpistol", "aimpistol", "firepistol", "shiv", "shove", "struggle", "struggle_gag", "struggle_legs"]

func addDoll(newdoll):
	dolls.append(newdoll)

func getDolls():
	return dolls

func getChainPoint(_pointID):
	return null

func getCumIntensity(theDoll:Doll3D, notCaged = false, noStrapon = true):
	var whoID = theDoll.savedCharacterID
	var character
	if(whoID is String):
		character = GlobalRegistry.getCharacter(whoID)
	else:
		character = whoID

	if(character != null && is_instance_valid(character) && (character is BaseCharacter)):
		if(character.hasPenis()):
			if(character.isWearingCondom()):
				return 0.0
			if(notCaged && character.isWearingChastityCage()):
				return 0.0
			if(noStrapon && character.isWearingStrapon()):
				return 0.0
			if(!OPTIONS.getCumShotsDependOnBallsVolume()):
				return 1.0
				
			var penis = character.getBodypart(BodypartSlot.Penis)
			var cumAmount = penis.getFluidProduction().getCapacity()
			
			var intensity = sqrt(cumAmount) / 20.0
			return intensity
	return 0.0

func isDollCaged(theDoll:Doll3D):
	var whoID = theDoll.savedCharacterID
	var character
	if(whoID is String):
		character = GlobalRegistry.getCharacter(whoID)
	else:
		character = whoID

	if(character != null && is_instance_valid(character) && (character is BaseCharacter)):
		if(character.isWearingChastityCage()):
			return true
		if(character.getWornPenisPump() != null):
			return true
	return false

func startCumInside(bottomDoll:Doll3D, topDoll:Doll3D, howOften:float = 2.5):
	startCumInsideSolo(bottomDoll, getCumIntensity(topDoll), howOften)

func startCumInsideSolo(bottomDoll:Doll3D, intensity:float = 1.0, howOften:float = 2.5):
	if(!OPTIONS.isVisibleCumShotsEnabled()):
		return
	if(intensity > 0.0):
		bottomDoll.startCumInside(intensity, howOften)

func startCumPenis(theDoll:Doll3D, howOften:float = 2.5, forceChastity=false):
	if(!OPTIONS.isVisibleCumShotsEnabled()):
		return
	var intensity = getCumIntensity(theDoll, false)
	if(intensity > 0.0):
		var isDollCaged = isDollCaged(theDoll)
		var isDollHard = (theDoll.getFinalState("cock") == "")
		if(isDollCaged || forceChastity):
			theDoll.startCumPenis(0.5, howOften, true)
		else:
			if(isDollHard && !theDoll.hiddenPartZones.has(BodypartSlot.Penis)):
				theDoll.startCumPenis(intensity, howOften, false)

func getVarNpcs():
	return ["pc"]

func getVarOptions():
	var result = {}
	for npcID in getVarNpcs():
		result[npcID] = {
			type = "character",
		}
	for npcID in getVarNpcs():
		result[("bodyState" if (npcID == "pc") else (npcID+"BodyState"))] = {
			type = "bodystate",
		}
		result[npcID+"Cum"] = {
			type = "bool",
		}
	
	return result
#
#	return {
#		"pc": {
#			type = "character",
#		},
#		"npc": {
#			type = "character",
#		},
#		"bodyState": {
#			type = "bodystate",
#		},
#		"npcBodyState": {
#			type = "bodystate",
#		},
#		"pcCum": {
#			type = "bool",
#		},
#		"npcCum": {
#			type = "bool",
#		},
#		"npcAction": {
#			type = "action",
#			actions = getSupportedStatesSolo(),
#		}
#	}
