extends Reference
class_name CombatAnimPlayer

const ID_PC := 0
const ID_NPC := 1

var queue:Array = []

const QUEUE_ATTACK := 0
const QUEUE_ATTACKREACTION := 1
const QUEUE_NOTBUSY := 2

var chars:Dictionary = {}

signal playAnim(_id, _anim)

func _init():
	addChar(ID_PC)
	addChar(ID_NPC)

func addChar(_id:int):
	var theChar := CombatAnimPlayerChar.new()
	theChar.id = _id
	theChar.connect("playAnim", self, "onCharPlayAnim")
	chars[_id] = theChar

func playAttack(_attackID:String, _attackerID:int, _isKnockedDown:bool = false):
	queue.append([
		QUEUE_ATTACK, _attackID, _isKnockedDown
	])

func playAttackReaction(_attackID:String, _receiver:int, _isKnockedDown:bool = false, _isDodge:bool = false, _isDefeat:bool = false):
	queue.append([
		QUEUE_ATTACKREACTION, _attackID, _receiver, _isKnockedDown, _isDodge, _isDefeat,
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
	
	elif(theType == QUEUE_ATTACK):
		var theAttack:CombatAnimBase = GlobalRegistry.getCombatAnim(theEntry[1])
		if(!theAttack):
			queue.pop_front()
			return
		var theAttackerID:int = theEntry[2]
		var theChar:CombatAnimPlayerChar = chars[theAttackerID]
		
		var _shouldBeKnockedDown:bool = theEntry[3]
		var _isKnockedDown:bool = theChar.knockedDown
		
		if(!_isKnockedDown):
			theChar.addAnim(theAttack.animName)
			theChar.addWait(theAttack.animTime)
		else:
			theChar.addAnim(theAttack.animNameKnockedDown)
			theChar.addWait(theAttack.animTimeKnockedDown)
		
		if(_isKnockedDown && !_shouldBeKnockedDown):
			theChar.addAnim("KnockedDownToStanding")
			theChar.addWait(frames(40))
		if(!_isKnockedDown && _shouldBeKnockedDown):
			theChar.addAnim("StandingToKnockedDown")
			theChar.addWait(frames(40))
		
		theChar.knockedDown = _shouldBeKnockedDown
	
	elif(theType == QUEUE_ATTACKREACTION):
		var theAttack:CombatAnimBase = GlobalRegistry.getCombatAnim(theEntry[1])
		if(!theAttack):
			queue.pop_front()
			return
		
		var theTargetID:int = theEntry[2]
		var theChar:CombatAnimPlayerChar = chars[theTargetID]
		
		var _shouldBeKnockedDown:bool = theEntry[3]
		var _isKnockedDown:bool = theChar.knockedDown
		
		theChar.addWait(theAttack.hitDelay)
		if(!_isKnockedDown):
			theChar.addAnim("Hurt")
			theChar.addWait(frames(30))
		else:
			theChar.addAnim("KnockedDownGetHit")
			theChar.addWait(frames(30))
		
		if(_isKnockedDown && !_shouldBeKnockedDown):
			theChar.addAnim("KnockedDownToStanding")
			theChar.addWait(frames(40))
		if(!_isKnockedDown && _shouldBeKnockedDown):
			theChar.addAnim("StandingToKnockedDown")
			theChar.addWait(frames(40))
		
		theChar.knockedDown = _shouldBeKnockedDown
		
	else: # Unknown
		pass
	queue.pop_front()
	
static func frames(_num:int) -> float:
	return float(_num)/24.0

func doProcess(_dt:float):
	processQueue(_dt)
	chars[0].doProcess(_dt)
	chars[1].doProcess(_dt)

func onCharPlayAnim(_id:int, _anim:String):
	emit_signal("playAnim", _id, _anim)
