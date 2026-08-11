extends Reference
class_name CombatAnimPlayer

const ID_PC := 0
const ID_NPC := 1

var queue:Array = []

const QUEUE_ATTACK := 0
const QUEUE_ATTACKREACTION := 1
const QUEUE_NOTBUSY := 2
const QUEUE_STATUSCHECK := 3
const QUEUE_ANIMRAW := 4

const ST_KNOCKEDDOWN := 1
const ST_DODGING := 2
const ST_BLOCKING := 4
const ST_DEFOCUSING := 8
const ST_DEFEATED := 16

var chars:Dictionary = {}

signal playAnim(_id, _anim, _args)

func _init():
	addChar(ID_PC)
	addChar(ID_NPC)

func addChar(_id:int):
	var theChar := CombatAnimPlayerChar.new()
	theChar.id = _id
	theChar.connect("playAnim", self, "onCharPlayAnim")
	chars[_id] = theChar

func playAnimRaw(_charID:int, _animStanding:String, _animKnockedDown:String = ""):
	queue.append([
		QUEUE_ANIMRAW, _charID, _animStanding, _animKnockedDown,
	])

func addAttackPayload(_attackID:String, _attackerID:int, _attackerStatus:int, _defenderStatus:int):
	playAttack(_attackID, _attackerID, _attackerStatus, _defenderStatus)
	playAttackReaction(_attackID, 1-_attackerID, _attackerStatus, _defenderStatus)
	addBarrierNotBusy()

func addStatusCheckPayload(_attackerStatus:int, _defenderStatus:int):
	queue.append([
		QUEUE_STATUSCHECK, 0, _attackerStatus,
	])
	queue.append([
		QUEUE_STATUSCHECK, 1, _defenderStatus,
	])
	addBarrierNotBusy()

func playAttack(_attackID:String, _attackerID:int, _attackerStatus:int, _defenderStatus:int):
	queue.append([
		QUEUE_ATTACK, _attackID, _attackerID, _attackerStatus, _defenderStatus,
	])

func playAttackReaction(_attackID:String, _receiver:int, _attackerStatus:int, _defenderStatus:int):
	queue.append([
		QUEUE_ATTACKREACTION, _attackID, _receiver, _attackerStatus, _defenderStatus,
	])

func addPayload(_payload:Array):
	queue.append_array(_payload)

func addBarrierNotBusy():
	queue.append([QUEUE_NOTBUSY])

func isAnyoneBusy() -> bool:
	for theCharID in chars:
		if(chars[theCharID].isBusy()):
			return true
	return false

func processQueue(_dt:float):
	if(queue.empty()):
		return
	
	var theEntry:Array = queue.front()
	var theType:int = theEntry[0]
	
	if(theType == QUEUE_NOTBUSY):
		if(isAnyoneBusy()):
			return
	
	elif(theType == QUEUE_ANIMRAW): # Support for fists/weapons would be nice
		var theAttackerID:int = theEntry[1]
		var theChar:CombatAnimPlayerChar = chars[theAttackerID]
		var _isKnockedDown:bool = theChar.knockedDown
		if(!_isKnockedDown):
			var theAnim:String = theEntry[2]
			if(!theAnim.empty()):
				theChar.addAnim(theAnim)
		else:
			var theAnim:String = theEntry[3]
			if(!theAnim.empty()):
				theChar.addAnim(theAnim)
		
	elif(theType == QUEUE_STATUSCHECK):
		var theAttackerID:int = theEntry[1]
		var _theAttackerStatus:int = theEntry[2]
		var theChar:CombatAnimPlayerChar = chars[theAttackerID]
		var _shouldBeKnockedDown:bool = _theAttackerStatus & ST_KNOCKEDDOWN
		var _isKnockedDown:bool = theChar.knockedDown
		if(_isKnockedDown && !_shouldBeKnockedDown):
			theChar.addAnim("KnockedDownToStanding")
		if(!_isKnockedDown && _shouldBeKnockedDown):
			theChar.addAnim("StandingToKnockedDown")
		theChar.knockedDown = _shouldBeKnockedDown
	
	elif(theType == QUEUE_ATTACK):
		var theAttack:CombatAnimBase = GlobalRegistry.getCombatAnim(theEntry[1])
		if(!theAttack):
			queue.pop_front()
			return
		var theAttackerID:int = theEntry[2]
		var _theAttackerStatus:int = theEntry[3]
		var theChar:CombatAnimPlayerChar = chars[theAttackerID]
		
		var _shouldBeKnockedDown:bool = _theAttackerStatus & ST_KNOCKEDDOWN
		var _isKnockedDown:bool = theChar.knockedDown
		
		if(!_isKnockedDown):
			theChar.addAnim(theAttack.animName, [theAttack.fists, theAttack.weaponLeft, theAttack.weaponRight])
		else:
			theChar.addAnim(theAttack.animNameKnockedDown, [theAttack.fists, theAttack.weaponLeft, theAttack.weaponRight])
		
		if(_isKnockedDown && !_shouldBeKnockedDown):
			theChar.addAnim("KnockedDownToStanding")
		if(!_isKnockedDown && _shouldBeKnockedDown):
			theChar.addAnim("StandingToKnockedDown")
		
		theChar.knockedDown = _shouldBeKnockedDown
	
	elif(theType == QUEUE_ATTACKREACTION):
		var theAttack:CombatAnimBase = GlobalRegistry.getCombatAnim(theEntry[1])
		if(!theAttack):
			queue.pop_front()
			return
		
		var theTargetID:int = theEntry[2]
		var _theAttackerStatus:int = theEntry[3]
		var _theReceiverStatus:int = theEntry[4]
		var theChar:CombatAnimPlayerChar = chars[theTargetID]
		var _theAttackerChar:CombatAnimPlayerChar = chars[1-theTargetID]
		
		var _shouldBeKnockedDown:bool = _theReceiverStatus & ST_KNOCKEDDOWN
		var _shouldAttackerBeKnockedDown:bool = _theAttackerStatus & ST_KNOCKEDDOWN
		var _isKnockedDown:bool = theChar.knockedDown
		
		var theHitDelay:float = theAttack.hitDelay if !_shouldAttackerBeKnockedDown else theAttack.hitDelayKnockedDown
		
		if(_theReceiverStatus & ST_DODGING):
			# Don't need any delay here
			if(!_isKnockedDown):
				theChar.addAnim("Dodge")
		elif(_theReceiverStatus & ST_BLOCKING):
			# Somehow guess the delay?
			theChar.addWait(theHitDelay-0.3)
			if(!_isKnockedDown):
				theChar.addAnim("Block", [true])
			else:
				theChar.addAnim("KnockedDownBlocking", [true])
		
		elif(theAttack.hitReaction == theAttack.REACTION_HURT):
			theChar.addWait(theHitDelay)
			if(!_isKnockedDown):
				theChar.addAnim("Hurt")
			else:
				theChar.addAnim("KnockedDownGetHit")
			# ADD MORE HIT REACTIONS HERE IF YOU NEED THEM
		
		if(_isKnockedDown && !_shouldBeKnockedDown):
			theChar.addAnim("KnockedDownToStanding")
		if(!_isKnockedDown && _shouldBeKnockedDown):
			theChar.addAnim("StandingToKnockedDown")
		
		theChar.knockedDown = _shouldBeKnockedDown
		
	else: # Unknown
		assert(false, "BAD")
	queue.pop_front()
	
static func frames(_num:int) -> float:
	return float(_num)/24.0

func doProcess(_dt:float):
	processQueue(_dt)
	chars[0].doProcess(_dt)
	chars[1].doProcess(_dt)

func onCharPlayAnim(_id:int, _anim:String, _args:Array):
	var _argsLen:int = _args.size()
	var _fists:bool = _args[0] if _argsLen > 0 else false
	var _leftWeapon:String = _args[1] if _argsLen > 1 else ""
	var _rightWeapon:String = _args[2] if _argsLen > 2 else ""
	
	emit_signal("playAnim", _id, _anim, _fists, _leftWeapon, _rightWeapon)
