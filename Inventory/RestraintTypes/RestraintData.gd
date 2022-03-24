extends Reference
class_name RestraintData

var level: int = 0
var tightness: float = 1.0
var item

func resetOnNewDay():
	tightness = 1.0

func resetOnNewTry():
	pass
	#tightness = 1.0

func onStruggleRemoval():
	tightness = 1.0

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

func getLevelDamage():
	return 0.5 / pow(max(1.0, level), 0.5)

func getStatDamageMult():
	return 1.0 + GM.pc.getStat(Stat.Strength) / 50.0

func calcDamage(mult = 1.0):
	return mult * getLevelDamage() * getStatDamageMult() * RNG.randf_range(0.8, 1.0)

func takeDamage(howMuch):
	tightness -= howMuch

func shouldBeRemoved():
	return tightness <= 0

func getRemoveMessage():
	return item.getVisibleName()+" slips off!"

func canStruggle():
	return true

func failChance(chance):
	return RNG.chance(chance)

func doStruggle(_pc):
	var _handsFree = !_pc.hasBlockedHands()
	var _armsFree = !_pc.hasBoundArms()
	var _legsFree = !_pc.hasBoundLegs()
	var _canSee = !_pc.isBlindfolded()
	var _canBite = !_pc.isGagged()
	
	var text = "error?"
	var lust = 0
	var pain = 0
	var damage = 0
	var stamina = 0
	
	text = "You struggle, trying to make the "+item.getVisibleName()+" slip off"
	damage = calcDamage()
	stamina = 10
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func processStruggleTurn():
	return null#{"text": "TEST "+item.getVisibleName()}

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

func saveData():
	var data = {}
	
	data["level"] = level
	data["tightness"] = tightness

	return data
	
func loadData(_data):
	level = SAVE.loadVar(_data, "level", 1)
	tightness = SAVE.loadVar(_data, "tightness", 1.0)
