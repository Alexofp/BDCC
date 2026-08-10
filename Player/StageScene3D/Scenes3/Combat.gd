extends BaseStageScene3D

onready var combat_doll_instance = $CombatDollInstance
onready var combat_doll_instance_2 = $CombatDollInstance2
var animPlayer:CombatAnimPlayer = CombatAnimPlayer.new()

func _init():
	id = StageScene.Combat

func _ready():
	animPlayer.connect("playAnim", self, "onPlayAnim")
	
#	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayerCombat())
#	animationTree.active = true
#	animationTree2.anim_player = animationTree2.get_path_to(doll2.getAnimPlayerCombat())
#	animationTree2.active = true
	pass

func onPlayAnim(_id:int, _anim:String):
	if(_id == 0):
		combat_doll_instance.playAnimRaw(_anim)
	elif(_id == 1):
		combat_doll_instance_2.playAnimRaw(_anim)

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

func stateMachineTravelCombat(thedoll, state_machine:AnimationNodeStateMachinePlayback, animID, _animTree:AnimationTree):
	var args:Array = []
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
		state_machine.travel("IDLE")
		_animTree["parameters/StateMachine/IDLE/IDLE_PICK/current"] = 0
	elif(animID == "standCombat"):
		state_machine.travel("IDLE")
		_animTree["parameters/StateMachine/IDLE/IDLE_PICK/current"] = 1
		#if(args.size() > 1): # Better way to do this?
		#	thedoll.attachTemporaryUnriggedPart("hand.R", args[1])
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

# StageScene.Duo, "kneel", {npc="nova", pc="pc"}
func playAnimation(animID, _args = {}):
	#var fullAnimID = animID
	#if(animID is Array):
	#	animID = animID[0]
	
	#print("Playing duo: "+str(animID))
	var firstDoll = "pc"
	if(_args.has("pc")):
		firstDoll = _args["pc"]
	combat_doll_instance.prepareCharacter(firstDoll)
	var secondDoll = "pc"
	if(_args.has("npc")):
		secondDoll = _args["npc"]
	combat_doll_instance_2.prepareCharacter(secondDoll)
	
	#doll.forceSlotToBeVisible(BodypartSlot.Penis)
	
	
	combat_doll_instance.playAnim(animID, _args["bodyState"] if _args.has("bodyState") else {})
	combat_doll_instance_2.playAnim(_args["npcAction"] if _args.has("npcAction") else "", _args["npcBodyState"] if _args.has("npcBodyState") else {})
	
	if(_args.has("payload")):
		animPlayer.addPayload(_args["payload"])
		#var theAttack:Array = _args["attack"]
		#animPlayer.playAttack(theAttack[0], theAttack[1], theAttack[2], theAttack[3])
	
	
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
