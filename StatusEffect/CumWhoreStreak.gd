extends StatusEffectBase

var savedChars = {}
var streak = 0
var addedBuffs = {}

func addRandomBuff():
	var randomBuff = RNG.pick([
		"s", # Sexiness stat +1
		"v", # Agility stat +1
		"a", # Lust armor +5
		"b", # Defocus armor +10
		"p", # Lust damage +5%
		"c", # Dodge chance +1%
		"o", # Max pain +5
	])
	if(!addedBuffs.has(randomBuff)):
		addedBuffs[randomBuff] = 0
	addedBuffs[randomBuff] += 1

func _init():
	id = StatusEffect.CumWhoreStreak
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
	return "Cum Whore Streak"

func getEffectDesc():
	return "Your current streak: "+str(streak)+"\nTime left: "+Util.getTimeStringHumanReadable(turns)

func getEffectImage():
	return "res://Images/StatusEffects/lovedice.png"

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
#		"s", # Sexiness stat +1
#		"v", # Agility stat +1
#		"a", # Lust armor +5
#		"b", # Defocus armor +10
#		"p", # Lust damage +5%
#		"c", # Dodge chance +1%
#		"o", # Max pain +5
	
	var resultBuffs = []
	if(addedBuffs.has("s")):
		resultBuffs.append(buff(Buff.StatBuff, [Stat.Sexiness, int(addedBuffs["s"])]))
	if(addedBuffs.has("v")):
		resultBuffs.append(buff(Buff.StatBuff, [Stat.Agility, int(addedBuffs["v"])]))
	if(addedBuffs.has("a")):
		resultBuffs.append(buff(Buff.LustArmorBuff, [5 * int(addedBuffs["a"])]))
	if(addedBuffs.has("b")):
		resultBuffs.append(buff(Buff.DefocusArmorBuff, [10 * int(addedBuffs["b"])]))
	if(addedBuffs.has("p")):
		resultBuffs.append(buff(Buff.LustDamageBuff, [5 * int(addedBuffs["p"])]))
	if(addedBuffs.has("c")):
		resultBuffs.append(buff(Buff.DodgeChanceBuff, [1 * int(addedBuffs["c"])]))
	if(addedBuffs.has("o")):
		resultBuffs.append(buff(Buff.MaxPainBuff, [5 * int(addedBuffs["o"])]))
	
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
