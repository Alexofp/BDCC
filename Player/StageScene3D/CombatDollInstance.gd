extends Spatial

onready var doll = $Doll3D
onready var animationTree = $AnimationTree
onready var chair = $Chair
var savedChar

func _ready():
	animationTree.anim_player = animationTree.get_path_to(doll.getAnimPlayerCombat())
	animationTree.active = true

func prepareCharacter(_char):
	doll.prepareCharacter(_char)
	savedChar = _char

func reprepareCharacter():
	if(!savedChar):
		return
	doll.prepareCharacter(savedChar)

func getDoll():
	return doll

func playAnimRaw(animID:String, _instant:bool = false):
	var state_machine:AnimationNodeStateMachinePlayback = animationTree["parameters/StateMachine/playback"]
	if(_instant):
		state_machine.start(animID)
	else:
		state_machine.travel(animID)

func playAnim(animID, _bodyState:Dictionary):
	var fullAnimID = animID
	if(animID is Array):
		animID = animID[0]
	
	doll.applyBodyState(_bodyState)
	chair.visible = (animID == "sit")
	
	animationTree["parameters/CuffsBlend/blend_amount"] = float(doll.getArmsCuffed())

	var state_machine = animationTree["parameters/StateMachine/playback"]
	if(!stateMachineTravelCombat(doll, state_machine, fullAnimID, animationTree)):
		Log.printerr("Action "+str(animID)+" is not found for combat doll instance")

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
