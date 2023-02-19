extends Reference
class_name FluidBase

var id = "error"

func getVisibleName():
	return "ERROR"

func canImpregnate():
	return false

func getMessyDescription(_pc, _amount):
	return null

func getMessyBuffs(_pc, _amount):
	return null

func getBellyBuffs(_pc, _amount):
	return null

func onSwallow(_pc, _amount):
	return null

func onGettingHitWith(_pc, _amount):
	return null

func getStatusEffectColor():
	return Color("#A001A0")

func getStatusEffectPicture():
	return "res://Images/StatusEffects/splurt.png"

func getCost(_amount) -> int:
	return 0

func buff(buffid, args = []):
	var buff: BuffBase = GlobalRegistry.createBuff(buffid)
	buff.initBuff(args)
	return buff
