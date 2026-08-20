extends BaseStageScene3D

onready var combat_doll_instance = $CombatDollInstance
onready var combat_doll_instance_2 = $CombatDollInstance2
var animPlayer:CombatAnimPlayer = CombatAnimPlayer.new()

func _init():
	id = StageScene.Combat

func _ready():
	animPlayer.connect("playAnim", self, "onPlayAnim")
	animPlayer.connect("queueCompleted", self, "onQueueCompleted")
	
#	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayerCombat())
#	animationTree.active = true
#	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayerCombat())
#	animationTree2.active = true
	pass

func onQueueCompleted(_id:int):
	updateDollIdleWeapons(_id, true)

func updateDollIdleWeapons(_id:int, _doReprepare:bool = false):
	var theCombatDollInstance = combat_doll_instance if (_id == 0) else combat_doll_instance_2
	var _theDoll = theCombatDollInstance.getDoll()
	var theStance:int = theCombatDollInstance.getCombatStance()
	
	var hasStanceToWep:bool = CombatStance.STANCE_TO_WEAPONS.has(theStance)
	var hasStanceHard:bool = CombatStance.STANCE_TO_HARD.has(theStance)
	if(!hasStanceToWep && !hasStanceHard):
		return
	if(_doReprepare):
		theCombatDollInstance.reprepareCharacter()
	
	if(hasStanceToWep):
		var theWep:Array = CombatStance.STANCE_TO_WEAPONS[theStance]
		var _fists:bool = theWep[0]
		var _weaponLeft:String = theWep[1]
		var _weaponRight:String = theWep[2]
		if(_fists):
			_theDoll.setTemporaryState("hands", "fists")
		if(!_weaponLeft.empty()):
			_theDoll.attachTemporaryUnriggedPart("hand.L", _weaponLeft)
		if(!_weaponRight.empty()):
			_theDoll.attachTemporaryUnriggedPart("hand.R", _weaponRight)
	
	if(hasStanceHard):
		_theDoll.setCockTemporaryHard()

func onPlayAnim(_id:int, _anim:String, _fists:bool, _weaponLeft:String, _weaponRight:String, _hard:bool):
	var theCombatDollInstance = combat_doll_instance if (_id == 0) else combat_doll_instance_2
	var _theDoll = theCombatDollInstance.getDoll()
	
	theCombatDollInstance.reprepareCharacter()
	theCombatDollInstance.playAnimRaw(_anim)
	if(_fists):
		_theDoll.setTemporaryState("hands", "fists")
	if(!_weaponLeft.empty()):
		_theDoll.attachTemporaryUnriggedPart("hand.L", _weaponLeft)
	if(!_weaponRight.empty()):
		_theDoll.attachTemporaryUnriggedPart("hand.R", _weaponRight)
	if(_hard):
		_theDoll.setCockTemporaryHard()
		

func updateSubAnims():
	pass
#	if(doll.getArmsCuffed()):
#		animationTree["parameters/CuffsBlend/blend_amount"] = 1.0
#	else:
#		animationTree["parameters/CuffsBlend/blend_amount"] = 0.0
#
#	if(doll2.getArmsCuffed()):
#		animationTree2["parameters/CuffsBlend/blend_amount"] = 1.0
#	else:
#		animationTree2["parameters/CuffsBlend/blend_amount"] = 0.0

func playSmart(_indx:int, animID):#, _animTree:AnimationTree):
	var _args:Array = []
	if(animID is Array):
		_args = animID
		animID = animID[0]
	
	var thedoll = combat_doll_instance.getDoll() if _indx == 0 else combat_doll_instance_2.getDoll()
	
	#thedoll.attachTemporaryUnriggedPart("hand.R", "res://Inventory/UnriggedModels/BigWrench/BigWrench.tscn")
	if(animID == ""):
		pass
	elif(GlobalRegistry.combatAnims.has(animID)):
		animPlayer.playAnimRaw(_indx, animID, "", _args[1] if _args.size() > 1 else "")
	elif(animID == "walk"):
		if(!thedoll.getLegsCuffed()):
			animPlayer.playAnimRaw(_indx, "Walk-loop")
		else:
			animPlayer.playAnimRaw(_indx, "ShacklesWalk-loop")
	elif(animID == "jog"):
		animPlayer.playAnimRaw(_indx, "Jogging-loop")
	elif(animID == "stand"):
		animPlayer.playAnimRaw(_indx, "IDLE")
		#_animTree["parameters/StateMachine/IDLE/IDLE_PICK/current"] = 0
	elif(animID == "standCombat"):
		animPlayer.playAnimRaw(_indx, "IDLE")
		#_animTree["parameters/StateMachine/IDLE/IDLE_PICK/current"] = 1
		#if(_args.size() > 1): # Better way to do this?
		#	thedoll.attachTemporaryUnriggedPart("hand.R", _args[1])
	elif(animID == "kneel"):
		animPlayer.playAnimRaw(_indx, "Kneeling-loop")
	elif(animID == "defeat"):
		animPlayer.playAnimRaw(_indx, "Defeat")
	elif(animID == "knockedDownDefeat"):
		animPlayer.playAnimRaw(_indx, "KnockedDownDefeat")
	elif(animID == "sit"):
		animPlayer.playAnimRaw(_indx, "Sitting-loop")
	elif(animID == "bite"):
		animPlayer.playAnimRaw(_indx, "Bite")
	elif(animID == "block"):
		animPlayer.playAnimRaw(_indx, "Block", "", "", "", true)
	elif(animID == "dodge"):
		animPlayer.playAnimRaw(_indx, "Dodge")
	elif(animID == "hurt"):
		animPlayer.playAnimRaw(_indx, "Hurt")
	elif(animID == "kick"):
		animPlayer.playAnimRaw(_indx, "kick")
	elif(animID == "punch"):
		animPlayer.playAnimRaw(_indx, "punch", "", "", "", true)
	elif(animID == "allfours"):
		animPlayer.playAnimRaw(_indx, "AllFours-loop")
	elif(animID == "crawl"):
		animPlayer.playAnimRaw(_indx, "AllFoursCrawl-loop")
	elif(animID == "stunbaton"):
		animPlayer.playAnimRaw(_indx, "stunbaton", "", "", "", true)
		if(_args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.R", _args[1])
		else:
			thedoll.attachTemporaryUnriggedPart("hand.R", "res://Inventory/UnriggedModels/StunBaton/StunBaton.tscn")
	elif(animID == "throw"):
		animPlayer.playAnimRaw(_indx, "WeaponThrow", "", "", "", true)
		if(_args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.R", _args[1])
	elif(animID == "holdpistol"):
		animPlayer.playAnimRaw(_indx, "WeaponGunHold-loop", "", "", "", true)
		if(_args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.L", _args[1])
		else:
			thedoll.attachTemporaryUnriggedPart("hand.L", "res://Inventory/UnriggedModels/EnergyPistol/EnergyPistolBlue.tscn")
	elif(animID == "aimpistol"):
		animPlayer.playAnimRaw(_indx, "WeaponGunAim-loop", "", "", "", true)
		if(_args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.L", _args[1])
		else:
			thedoll.attachTemporaryUnriggedPart("hand.L", "res://Inventory/UnriggedModels/EnergyPistol/EnergyPistolBlue.tscn")
	elif(animID == "firepistol"):
		animPlayer.playAnimRaw(_indx, "WeaponGunShoot", "", "", "", true)
		if(_args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.L", _args[1])
		else:
			thedoll.attachTemporaryUnriggedPart("hand.L", "res://Inventory/UnriggedModels/EnergyPistol/EnergyPistolBlue.tscn")
	elif(animID == "shiv"):
		animPlayer.playAnimRaw(_indx, "WeaponShiv", "", "", "", true)
		if(_args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.R", _args[1])
		else:
			thedoll.attachTemporaryUnriggedPart("hand.R", "res://Inventory/UnriggedModels/Shiv/Shiv.tscn")
	elif(animID == "shove"):
		animPlayer.playAnimRaw(_indx, "shove")
	elif(animID == "struggle"):
		animPlayer.playAnimRaw(_indx, "StruggleGeneric-loop")
	elif(animID == "struggle_gag"):
		animPlayer.playAnimRaw(_indx, "StruggleGag-loop")
	elif(animID == "struggle_legs"):
		animPlayer.playAnimRaw(_indx, "StruggleLegs-loop")
	elif(animID == "hold_object"):
		animPlayer.playAnimRaw(_indx, "HoldObject-loop")
		if(_args.size() > 1):
			thedoll.attachTemporaryUnriggedPart("hand.L", _args[1])
	else:
		return false
	return true

# StageScene.Duo, "kneel", {npc="nova", pc="pc"}
func playAnimation(animID, _args = {}):
	var _fullAnimID = animID
	if(animID is Array):
		animID = animID[0]
	
	#print("Playing duo: "+str(animID))
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	combat_doll_instance.prepareCharacter(firstDoll)
	var secondDoll = "pc"
	if(_args.has("npc")):
		secondDoll = _args["npc"]
	combat_doll_instance_2.prepareCharacter(secondDoll)
	
	if(_args.has("pcStance")):
		combat_doll_instance.setCombatStance(_args["pcStance"])
	if(_args.has("npcStance")):
		combat_doll_instance_2.setCombatStance(_args["npcStance"])
	
	if(!animPlayer.isAnyoneBusy()):
		updateDollIdleWeapons(0)
		updateDollIdleWeapons(1)
	#doll.forceSlotToBeVisible(BodypartSlot.Penis)
	
	
	combat_doll_instance.playAnim(animID, _args["bodyState"] if _args.has("bodyState") else {})
	combat_doll_instance_2.playAnim(_args["npcAction"] if _args.has("npcAction") else "", _args["npcBodyState"] if _args.has("npcBodyState") else {})
	
	if(_args.has("payload")):
		animPlayer.addPayload(_args["payload"])
	if(_args.has("attack")):
		var theAttack:Array = _args["attack"]
		animPlayer.addAttackPayload(theAttack[0], theAttack[1], theAttack[2], theAttack[3], theAttack[4] if theAttack.size() > 4 else "")
	if(_args.has("statusUpdate")):
		var theAttack:Array = _args["statusUpdate"]
		animPlayer.addStatusCheckPayload(theAttack[0], theAttack[1])

	var didWePlayAnything:bool = false
	if(animID != ""):
		if(playSmart(0, animID)):
			didWePlayAnything = true
	if(_args.has("npcAction") && _args["npcAction"] != ""):
		if(playSmart(1, _args["npcAction"])):
			didWePlayAnything = true
	
	if(didWePlayAnything):
		animPlayer.addBarrierNotBusy()
#	if(_args.has("flipNPC") && _args["flipNPC"]):
#		doll2.scale.x = abs(doll2.scale.x)
#	else:
#		doll2.scale.x = -abs(doll2.scale.x)
		
#	if(_args.has("kidlatBox") && _args["kidlatBox"]):
#		$KidlatBox.visible = true
#	else:
#		$KidlatBox.visible = false
	
#	if(animID in ["crawl", "allfours"] || (_args.has("further") && _args["further"])):
#		doll.transform.origin.x = 2.5
#	else:
#		doll.transform.origin.x = 1.5
	
#	if(_args.has("pcCum") && _args["pcCum"]):
#		startCumPenis(doll)
#	if(_args.has("npcCum") && _args["npcCum"]):
#		startCumPenis(doll2)

func canTransitionTo(_actionID, _args = []):
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	var secondDoll = "pc"
	if(_args.has("npc")):
		secondDoll = _args["npc"]
		
	if(combat_doll_instance.getDoll().getCharacterID() != firstDoll || combat_doll_instance_2.getDoll().getCharacterID() != secondDoll):
		return false
	return true

func _process(_delta):
	animPlayer.doProcess(_delta)

func getSupportedStates():
	return getSupportedStatesCombat()

func getChainPoint(_pointID):
	if(_pointID == "farleft"):
		return $FarLeft
	if(_pointID == "farright"):
		return $FarRight
	if(_pointID == "above"):
		return $Above
	if(_pointID == "floor"):
		return $Floor
	return .getChainPoint(_pointID)

func getVarNpcs():
	return ["pc", "npc"]

func getSupportedStatesCombat():
	return ["stand", "standCombat", "walk", "jog", "kneel", "defeat", "sit", "bite", "block", "dodge", "hurt", "kick", "punch", "allfours", "crawl", "stunbaton", "throw", "holdpistol", "aimpistol", "firepistol", "shiv", "shove", "struggle", "struggle_gag", "struggle_legs"]

func getVarOptions():
	var options = .getVarOptions()
	
#	options["flipNPC"] = {
#		type = "bool",
#	}
#	options["further"] = {
#		type = "bool",
#	}
	options["npcAction"] = {
		type = "action",
		actions = getSupportedStatesCombat(),
	}
	
	return options
