extends StatusEffectBase

var ammo:int = 3

func _init():
	id = "MirriAmmo"
	isBattleOnly = true
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Ammo"

func getEffectDesc():
	return character.getName()+" has "+str(ammo)+" bullet"+("s" if ammo != 1 else "")+" left in "+character.hisHer()+" gun"

func getEffectImage():
	return "res://Images/StatusEffects/bullets.png"

func getIconColor():
	if(ammo <= 0):
		return IconColorRed
	return IconColorGreen

func combine(_args = []):
	pass

