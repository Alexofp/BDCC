extends Reference
class_name RestraintData

var level: int = 0
var tightness: float = 1.0
var item: WeakRef
var npcDodgeDifficultyMod: float = 1.0
var npcAiScoreMod: float = 1.0
var restraintType = RestraintType.Generic
var aiWontResist:bool = false

var smartLock:SmartLockBase

func getItem():
	return item.get_ref()

func resetOnNewDay():
	tightness = 1.0

func resetOnNewTry():
	pass
	#tightness = 1.0

func onStruggleRemoval():
	tightness = 1.0
	if(smartLock != null):
		smartLock = null

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
	return 1.0 / pow(max(1.0, level), 0.8)

func getStatDamageMult(_pc):
	return 1.0 + _pc.getStat(Stat.Strength) / 20.0

func calcDamage(_pc, _minigame:MinigameResult, mult = 1.0):
	var levelDamage:float = getLevelDamage()
	var statDamageMult:float = getStatDamageMult(_pc)
	
	return mult * levelDamage * statDamageMult * RNG.randf_range(0.8, 1.0) * _minigame.score

func takeDamage(howMuch):
	tightness -= howMuch
	if tightness > 1.0:
		tightness = 1.0

func shouldBeRemoved():
	return tightness <= 0

func getRemoveMessage():
	return getItem().getVisibleName()+" slips off!"

func canStruggle():
	return true

func canStruggleFinal():
	if(smartLock != null):
		if(!smartLock.canStruggle()):
			return false
	return canStruggle()

func hasSmartLock() -> bool:
	return smartLock != null

func getSmartLock() -> SmartLockBase:
	return smartLock

func setSmartLock(theLock:SmartLockBase):
	smartLock = theLock
	smartLock.setRestraintData(self)

func failChance(_pc, chance):
	return RNG.chance(chance)

func failChanceLowScore(_pc, chance, _minigame:MinigameResult):
	if(_minigame.failedHard):
		return true
	if(_minigame.score <= 0.2):
		
		chance *= sqrt(max(1.0, float(level)))
		
		if(chance > 95):
			chance = 95
		
		return RNG.chance(chance)
	return false

func luckChance(_pc, chance):
	return RNG.chance(chance)

func luckChanceHighScore(_pc, chance, _minigame:MinigameResult):
	if(_minigame.score < 0.9):
		chance *= _minigame.score * 0.5
	return RNG.chance(chance)

func fatalFail(_minigame):
	return _minigame < 0.0

func scaleDamage(dam) -> int:
	return int(round(getLevel() / 3.0 * dam))

func shouldDoStruggleMinigame(_pc):
	return true

func calculateAIScore(_pc):
	if(aiWontResist):
		return 0.0
	if(!shouldDoStruggleMinigame(_pc)):
		return 5.0 * npcDodgeDifficultyMod
	
	var result = 1.0
	if(!_pc.isBlindfolded() || canInspectWhileBlindfolded()):
		result = result * 2.0 / float(level)
	if(tightness > 0.0):
		result /= tightness
	
	return result * npcDodgeDifficultyMod

func doStruggle(_pc, _minigame:MinigameResult):
	var _handsFree = !_pc.hasBlockedHands()
	var _armsFree = !_pc.hasBoundArms()
	var _legsFree = !_pc.hasBoundLegs()
	var _canSee = !_pc.isBlindfolded()
	var _canBite = !_pc.isBitingBlocked()
	
	var text = "error?"
	var lust = 0
	var pain = 0
	var damage = 0
	var stamina = 0
	
	text = "{user.name} struggles, trying to make the "+getItem().getVisibleName()+" slip off"
	damage = calcDamage(_pc, _minigame)
	stamina = 10
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func processStruggleTurn(_pc, _isActivelyStruggling):
	return null#{"text": "TEST "+getItem().getVisibleName()}

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

func getTightnessPercentString():
	return str(round(tightness*100.0))+"%"

func canUnlockWithKey():
	return true
	
func alwaysSavedWhenStruggledOutOf():
	return false

func alwaysBreaksWhenStruggledOutOf():
	return false

func getRestraintType():
	return restraintType

func getResistAnimation():
	return "struggle"

func handleSexEvent(sexEvent:SexEvent):
	if(smartLock != null):
		smartLock.handleSexEvent(sexEvent)

func onSexEnded(_contex = {}):
	if(smartLock != null):
		smartLock.onSexEnded(_contex)

func saveData():
	var data = {}
	
	data["level"] = level
	data["tightness"] = tightness
	data["aiWontResist"] = aiWontResist
	
	if(smartLock != null):
		data["smartLock"] = {
			id = smartLock.id,
			data = smartLock.saveData(),
		}

	return data
	
func loadData(_data):
	level = SAVE.loadVar(_data, "level", 1)
	tightness = SAVE.loadVar(_data, "tightness", 1.0)
	if(_data.has("aiWontResist")):
		aiWontResist = SAVE.loadVar(_data, "aiWontResist", false)
	loadSmartLock(_data)

func loadSmartLock(_data):
	smartLock = null
	if(_data.has("smartLock")):
		var smartLockData = SAVE.loadVar(_data, "smartLock", {})
		var smartLockID = SAVE.loadVar(smartLockData, "id", "")
		
		var theLock = SmartLock.create(smartLockID)
		if(theLock != null):
			smartLock = theLock
			smartLock.setRestraintData(self)
			smartLock.loadData(SAVE.loadVar(smartLockData, "data", {}))
