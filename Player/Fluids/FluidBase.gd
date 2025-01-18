extends Reference
class_name FluidBase

var id = "error"

func getVisibleName():
	return "ERROR"

# Used when you write {pc.cum}
func getLewdName():
	return getVisibleName().to_lower()

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

func getCumOverlayColor():
	return Color.white

func getStatusEffectPicture():
	return "res://Images/StatusEffects/splurt.png"

func getCost(_amount) -> int:
	return 0

func canStoreInFluidTank() -> bool:
	return true

func getFluidTankLimitMod() -> float:
	if(!canStoreInFluidTank()):
		return 0.0
	return 1.0

func buff(buffid, args = []):
	var buff: BuffBase = GlobalRegistry.createBuff(buffid)
	buff.initBuff(args)
	return buff
