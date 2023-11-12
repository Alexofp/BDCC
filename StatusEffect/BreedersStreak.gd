extends StatusEffectBase

var savedChars = {}
var streak = 0
var addedBuffs = {}

func addRandomBuff():
	var randomBuff = RNG.pick([
		"s", # Str stat +1
		"v", # Vitality stat +1
		"a", # Physical armor +5
		"b", # Blocking armor +10
		"p", # Physical damage +5%
		"c", # Cum production +10%
		"o", # Balls volume +10%
	])
	if(!addedBuffs.has(randomBuff)):
		addedBuffs[randomBuff] = 0
	addedBuffs[randomBuff] += 1

func _init():
	id = StatusEffect.BreedersStreak
	isBattleOnly = false

func initArgs(_args = []):
	if(_args.size() > 0):
		var newCharID = _args[0]
		if(!savedChars.has(newCharID)):
			savedChars[newCharID] = true
			turns = 6*60*60
			streak += 1
			addRandomBuff()

func processTime(_secondsPassed: int):
	turns -= _secondsPassed
	if(turns <= 0):
		stop()

func getEffectName():
	return "Breeder's Streak"

func getEffectDesc():
	return "Your current streak: "+str(streak)+"\nTime left: "+Util.getTimeStringHumanReadable(turns)

func getEffectImage():
	return "res://Images/StatusEffects/badge.png"

func getIconColor():
	return IconColorGreen

func combine(_args = []):
	if(_args.size() > 0):
		var newCharID = _args[0]
		if(!savedChars.has(newCharID)):
			savedChars[newCharID] = true
			turns = 6*60*60
			streak += 1
			addRandomBuff()

func getBuffs():
#		"s", # Str stat +1
#		"v", # Vitality stat +1
#		"a", # Physical armor +5
#		"b", # Blocking armor +10
#		"p", # Physical damage +5%
#		"c", # Cum production +10%
#		"o", # Balls volume +10%
	
	var resultBuffs = []
	if(addedBuffs.has("s")):
		resultBuffs.append(buff(Buff.StatBuff, [Stat.Strength, int(addedBuffs["s"])]))
	if(addedBuffs.has("v")):
		resultBuffs.append(buff(Buff.StatBuff, [Stat.Vitality, int(addedBuffs["v"])]))
	if(addedBuffs.has("a")):
		resultBuffs.append(buff(Buff.PhysicalArmorBuff, [5 * int(addedBuffs["a"])]))
	if(addedBuffs.has("b")):
		resultBuffs.append(buff(Buff.BlockArmorBuff, [10 * int(addedBuffs["b"])]))
	if(addedBuffs.has("p")):
		resultBuffs.append(buff(Buff.PhysicalDamageBuff, [5 * int(addedBuffs["p"])]))
	if(addedBuffs.has("c")):
		resultBuffs.append(buff(Buff.PenisCumProductionBuff, [10 * int(addedBuffs["c"])]))
	if(addedBuffs.has("o")):
		resultBuffs.append(buff(Buff.PenisBallsVolumeBuff, [10 * int(addedBuffs["o"])]))
	
	return resultBuffs

func saveData():
	return {
		"turns": turns,
		"savedChars": savedChars,
		"streak": streak,
		"addedBuffs": addedBuffs,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 60*60)
	savedChars = SAVE.loadVar(_data, "savedChars", {})
	streak = SAVE.loadVar(_data, "streak", 0)
	addedBuffs = SAVE.loadVar(_data, "addedBuffs", {})
