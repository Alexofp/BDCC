extends Reference
class_name RestraintData

var level: int = 0
var tightness: float = 1.0
var lockStrength: float = 0.0 
var lockType: String = ""
var item: WeakRef
var npcDodgeDifficultyMod: float = 1.0
var npcAiScoreMod: float = 1.0
var restraintType = RestraintType.Generic

class ResponseData:

	var text: String
	var damage: float
	var lockDamage: float
	var lust: int
	var pain: int
	var stamina: int
	
	func _init(_text: String, _damage: float, _lockDamage: float, _lust: int, _pain: int, _stamina: int):
		text = _text
		damage = _damage
		lockDamage = _lockDamage
		lust = _lust
		pain = _pain
		stamina = _stamina

	func build():
		return {"text": text, "damage": damage, "lockDamage": lockDamage, "lust": lust, "pain": pain, "stamina": stamina}


func getItem():
	return item.get_ref()

func resetOnNewDay():
	tightness = 1.0

func resetOnNewTry():
	pass
	#tightness = 1.0

func onStruggleRemoval():
	tightness = 1.0

func onLockPicked():
	return

func getTightness():
	return tightness

func setLevel(newlevel):
	level = newlevel
	
func getLevel():
	return level

func getVisibleLevel(isBlind = false):
	if(isBlind && !canInspectWhileBlindfolded()):
		return "???"
	return str(level)

func canInspectWhileBlindfolded():
	return false

func canBeEasilyRemovedByDom():
	return canStruggle()

func getDodgeDifficulty():
	return 1.0 * Util.maxi(1, level) * npcDodgeDifficultyMod

func getFinalChanceToForceARestraint(_pc):
	var dodgeChance = _pc.getDodgeChance()
	var restraintDodgeDifficulty = getDodgeDifficulty()
	var finalSuccessChance = _pc.getRestraintResistance() * (1.0 / restraintDodgeDifficulty) * (1.0 - dodgeChance)

	return finalSuccessChance

func getLevelDamage():
	return 0.5 / pow(max(1.0, level), 0.8)

func getStatDamageMult(_pc):
	return (10.0 + pow(max(1.0,_pc.getStat(Stat.Strength)), 0.8)) / 10.0

func getAgilityDamageMult(_pc):
	return (10.0 + pow(max(1.0,_pc.getStat(Stat.Agility)), 0.8)) / 10.0

func getMixedDamageMult(_pc):
	return (10.0 + pow(max(1.0, _pc.getStat(Stat.Strength)/2.0 + _pc.getStat(Stat.Agility)/2.0 ), 0.8)) / 10.0


func calcDamage(_pc, mult = 1.0):
	if _pc.hasPerk(Perk.BDSMPerfectStreak):
		return mult * getLevelDamage() * (getStatDamageMult(_pc) + 0.5)
	return mult * getLevelDamage() * getStatDamageMult(_pc)

func calcLockDamage(_pc, mult = 1.0):
	return mult * getLevelDamage() * getStatDamageMult(_pc)

func calcPickDamage(_pc, mult = 1.0):
	return mult * getLevelDamage() * getAgilityDamageMult(_pc)

func calcCutDamage(_pc, mult = 1.0):
	return mult * getLevelDamage() * (getMixedDamageMult(_pc) + 1.0)

func canBreakLocked(_pc, _minigame):
	return _minigame > 0.8 

func calcLockedMult(_pc, _minigame):
	var mult = 0
	if _minigame > 0.8:
		mult = _minigame - 0.8
	return mult

func calcFatalMult(_pc, _minigame):
	return _minigame / 4.0

func calcRestraintMult(_pc, _minigame):
	if _pc.hasPerk(Perk.BDSMPerfectStreak):
		return 0.7
	return 0.4
	
func calcBlindMult(_pc, _minigame):
	if _pc.hasPerk(Perk.BDSMBlindfold):
		return 0.8
	return 0.6

func calcFatalCutPain(_pc, _minigame):
	return 5 + -_minigame * 5.0
	
func calcStruggleStamina(_pc, mult = 1.0):
	if _pc.hasPerk(Perk.BDSMBetterStruggling):
		return mult * (5 + level * 2) 
	return mult * (10 + level * 4)

func calcPickStamina(_pc, mult = 1.0):
	return mult * (5 + level * 2)

func calcCutStamina(_pc, mult = 1.0):
	if _pc.hasPerk(Perk.BDSMBetterStruggling):
		return mult * (5 + level * 2) 
	return mult * (5 + level * 3)
	 

func calcStrugglePain(_pc, mult = 1.0):
	return mult * (1 + level)

func calcPickpain(_pc, mult = 1.0):
	return mult * (1 + level)

func calcCutPain(_pc, mult = 1.0):
	return mult * (1 + level)

	 
func calcStruggleLust(_pc, mult = 1.0):
	return mult * (1 + level)

func calcPickLust(_pc, mult = 1.0):
	return mult * (1 + level)

func calcCutLuist(_pc, mult = 1.0):
	return mult * (1 + level)
	 


func takeDamage(howMuch):
	tightness -= howMuch
	if tightness > 1.0:
		tightness = 1.0

func takeLockDamage(howMuch):
	lockStrength -= howMuch
	if lockStrength > 1.0:
		lockStrength = 1.0
	if lockStrength < 0:
		lockStrength = 0.0

func shouldBeRemoved():
	return tightness <= 0

func getRemoveMessage():
	return getItem().getVisibleName()+" slips off!"

func getLockpickedMessage():
	return "Lock on" + getItem().getVisibleName() + " sucessfuly picked!"

func canStruggle():
	return true

func failChance(_pc, chance):
	return RNG.chance(chance)

func luckChance(_pc, chance):
	return RNG.chance(chance)

func fatalFail(_minigame):
	return _minigame < 0.0

func scaleDamage(dam) -> int:
	return int(round(getLevel() / 3.0 * dam))

func shouldDoStruggleMinigame(_pc):
	return true

func canInstantEscape(_pc):
	if _pc.hasPerk(Perk.BDSMInstantEscape) && !isLocked() && level < RNG.randf_rangeDis(0, _pc.getLevel()):
		return RNG.chance(50)
	return false

func calculateAIScore(_pc):
	if(!shouldDoStruggleMinigame(_pc)):
		return 5.0 * npcDodgeDifficultyMod
	
	var result = 1.0
	if !_pc.isBlindfolded() || canInspectWhileBlindfolded():
		result = result * 2.0 / float(level)
	if tightness > 0.0:
		result /= tightness
	
	return result * npcDodgeDifficultyMod

### strugle, minigame score  0> sucess, <0 fatal fail ###  
func doStruggle(_pc, _minigame):
	var _handsFree = !_pc.hasBlockedHands()
	var _armsFree = !_pc.hasBoundArms()
	var _legsFree = !_pc.hasBoundLegs()
	var _canSee = !_pc.isBlindfolded()
	var _canBite = !_pc.isBitingBlocked()
	
	var globalMutt = 1.0;
	var responese = ResponseData.new("",  0.0, 0.0, calcStruggleLust(_pc, 0), calcStrugglePain(_pc, 0), calcStruggleStamina(_pc, 1))
	
	responese.text = "{user.youHe} struggle, trying to make the "+getItem().getVisibleName()+" slip off"
	
	if !_handsFree || !_armsFree:
		globalMutt *= calcRestraintMult(_pc, _minigame)
	if !_canSee:
		globalMutt *= calcBlindMult(_pc, _minigame)
	
	if _minigame < 0:
		responese.text += " but it seems like {user.youHe} just tightened it up more"
		var _mult = calcFatalMult(_pc, _minigame)
		responese.damage = calcDamage(_pc, _mult)
		responese.stamina = calcStruggleStamina(_pc, 2)

	elif _minigame == 0:
		responese.text += ", but without visible effect"

	elif _minigame > 0 && !isLocked():
		responese.damage = calcDamage(_pc, _minigame) * globalMutt

	elif _minigame > 0 && isLocked() && !canBreakLocked(_pc, _minigame):
		responese.text += ", but the lock is too strong"

	elif _minigame > 0 && isLocked() && canBreakLocked(_pc, _minigame):
		responese.text += ", but it would have been done better if only it was not locked"
		var _mult = calcLockedMult(_pc, _minigame)
		responese.damage = calcDamage(_pc, _mult) * globalMutt
		responese.lockDamage = calcLockDamage(_pc, _mult) * globalMutt
	
	return responese

### use lockpick tool, minigame score  0> sucess, <0 fatal fail ###
func doLockpick(_pc, _minigame):
	var _handsFree = !_pc.hasBlockedHands()
	var _armsFree = !_pc.hasBoundArms()
	var _legsFree = !_pc.hasBoundLegs()
	var _canSee = !_pc.isBlindfolded()
	var _canBite = !_pc.isBitingBlocked()
	
	var globalMutt = 1.0;
	var responese = ResponseData.new("",  0.0, 0.0, 0, 0, calcPickStamina(_pc, 1))
	
	responese.text = "You picking the lock, trying to unlock the " + getItem().getVisibleName()
	
	if !_handsFree || !_armsFree:
		globalMutt *= calcRestraintMult(_pc, _minigame)
	if !_canSee:
		globalMutt *= calcBlindMult(_pc, _minigame)
	
	if _minigame < 0:
		responese.text += " but it seems like {user.youHe} you've stuck the lock instead"
		responese.lockDamage = -1.0
		responese.stamina = calcPickStamina(_pc, 2)
		
	elif _minigame == 0:
		responese.text += ", but without visible effect"
		
	elif _minigame > 0:
		responese.text += ", and it seems to be working"
		responese.lockDamage = calcPickDamage(_pc, _minigame) * globalMutt
		
	return responese

### use cuting tool, minigame score  0> sucess, <0 fatal fail ###
func doCut(_pc, _minigame):	
	var _handsFree = !_pc.hasBlockedHands()
	var _armsFree = !_pc.hasBoundArms()
	var _legsFree = !_pc.hasBoundLegs()
	var _canSee = !_pc.isBlindfolded()
	var _canBite = !_pc.isBitingBlocked()
	
	var globalMutt = 1.0;
	var responese = ResponseData.new("",  0.0, 0.0, 0, calcCutPain(_pc, 1), calcCutStamina(_pc, 1))
	
	responese.text = "{user.youHe} looking for a good place to cut, trying to rid off the " + getItem().getVisibleName()
	
	if !_handsFree || !_armsFree:
		globalMutt *= calcRestraintMult(_pc, _minigame)
	if !_canSee:
		globalMutt *= calcBlindMult(_pc, _minigame)
	
	if _minigame < 0:
		responese.text += " but instead the bondage gear {user.youHe} hurt self"
		responese.pain += calcFatalCutPain(_pc, _minigame)
		
	elif _minigame == 0:
		responese.text += ", but without visible effect"
		
	elif _minigame > 0:
		var _mult = calcLockedMult(_pc, _minigame)
		responese.damage = calcCutDamage(_pc, _minigame) * globalMutt
	
	return responese


func processStruggleTurn(_pc, _isActivelyStruggling):
	return null#{"text": "TEST "+getItem().getVisibleName()}

func processLockpickTurn(_pc, _isActive):
	return null

func processCutTurn(_pc, _isActive):
	return null

func getVisibleTightness():
	if(tightness > 0.9):
		return "sits very tight"
	if(tightness > 0.8):
		return "sits tight"
	if(tightness > 0.7):
		return "sits kinda tight"
	if(tightness > 0.6):
		return "gives in a little bit"
	if(tightness > 0.5):
		return "gives some leeway"
	if(tightness > 0.4):
		return "quite a bit of leeway"
	if(tightness > 0.3):
		return "feels slightly loose"
	if(tightness > 0.2):
		return "kinda loose"
	if(tightness > 0.1):
		return "pretty loose"
	return "extremely loose"

func getVisibleLockStrength():
	if(lockStrength > 0.9):
		return "securely locked"
	if(tightness > 0.5):
		return "slightly loose"
	if(tightness > 0.2):
		return "somewhat damaged"
	return "almost unlocked"

func getTightnessPercentString():
	return str(round(tightness*100.0))+"%"

func getLockPercentString():
	return str(round(lockStrength*100.0))+"%"

func isLocked():
	return lockStrength > 0

func getLockType():
	return lockType

func canUnlockWithKey():
	return true

func canBeCut():
	return false

func canBeLocked():
	return canUnlockWithKey()

func lockIt(_type = "common", _strength = 1.0):
	lockType = _type
	lockStrength = _strength

func reLockIt(_strength = 1.0):
	lockStrength = _strength
	
func alwaysSavedWhenStruggledOutOf():
	return false

func alwaysBreaksWhenStruggledOutOf():
	return false

func getRestraintType():
	return restraintType

func getResistAnimation():
	return "struggle"

func saveData():
	var data = {}
	
	data["level"] = level
	data["tightness"] = tightness
	data["lockStrength"] = lockStrength
	data["lockType"] = lockType

	return data
	
func loadData(_data):
	level = SAVE.loadVar(_data, "level", 1)
	tightness = SAVE.loadVar(_data, "tightness", 1.0)
	lockStrength = SAVE.loadVar(_data, "lockStrength", 0.0)
	lockType = SAVE.loadVar(_data, "lockType", "")
