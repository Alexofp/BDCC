extends StatusEffectBase

var rage:float = 0.0
var savedPain:int = 0
var savedLust:int = 0

func _init():
	id = "LuxeRage"
	isBattleOnly = true
	
func initArgs(_args = []):
	pass
	
func addRage(howMuch:float):
	rage += howMuch
	if(rage < 0.0):
		rage = 0.0
	
func resetRage():
	rage = 0.0
	
func processBattleTurn():
	var newPain:int = character.getPain()
	var newLust:int = character.getLust()
	
	if(newPain > savedPain):
		addRage((newPain - savedPain) / 200.0)
	if(newLust > savedLust):
		addRage((newLust - savedLust) / 200.0)
	
	savedPain = newPain
	savedLust = newLust
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Luxe's Rage"

func getEffectDesc():
	var theText:String = "Rage: "+str(Util.roundF(rage*100.0, 1))+"%"
	if(rage >= 0.5):
		theText = "[color=red]"+theText+"[/color]"
	theText += "\n\nLuxe gets more enraged when he takes damage or misses his attack. The more enraged he is, the more damage he takes. But high rage also unlocks different attacks for him."
	
	return theText

func getEffectImage():
	if(rage >= 50):
		return "res://Images/StatusEffects/wildfires.png"
	return "res://Images/StatusEffects/fire-iris.png"

func getIconColor():
	if(rage >= 50):
		return IconColorRed
	return IconColorWhite

func combine(_args = []):
	pass

func getBuffs():
	if(rage >= 0.5):
		return [
			buff(Buff.PhysicalArmorBuff, [round(-100.0 * rage)]),
			buff(Buff.LustArmorBuff, [round(-100.0 * rage)]),
			buff(Buff.PhysicalDamageBuff, [round(20.0 * rage)]),
		]
	return [
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Collapsed, 100.0]),
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Stunned, 100.0]),
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Bleeding, 100.0]),
	]

func saveData():
	return {
		"rage": rage,
		"savedPain": savedPain,
		"savedLust": savedLust,
	}
	
func loadData(_data):
	rage = SAVE.loadVar(_data, "rage", 0)
	savedPain = SAVE.loadVar(_data, "savedPain", 0)
	savedLust = SAVE.loadVar(_data, "savedLust", 0)
