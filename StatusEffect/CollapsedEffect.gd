extends StatusEffectBase

var canStandup = false

func _init():
	id = StatusEffect.Collapsed
	isBattleOnly = true

func getEffectName():
	return "Collapsed"

func getEffectDesc():
	var message = "You're on the ground. Can still fight but it's almost impossible to dodge physical attacks"
	if(!canStandup):
		message += "\n[color=red]Can't stand up right after you were knocked down[/color]"
	return message

func getEffectImage():
	return "res://Images/StatusEffects/down.png"

func getIconColor():
	return IconColorBlue

func getBuffs():
	return [
		buff(Buff.DodgeChanceBuff, [-90])
	]

func processBattleTurn():
	canStandup = true
	
func canStandUp():
	return canStandup
	
func saveData():
	return {
		"canStandup": canStandup,
	}
	
func loadData(_data):
	canStandup = SAVE.loadVar(_data, "canStandup", false)
