extends SceneBase
class_name HK_SessionBodyBase


func onBody():
	GM.pc.addEffect(HK_StatusEffect.Suggestible, [30])
	processTime(10*60)

func afterBody():
	runScene(pickAwakener())
	
func pickAwakener():
	var pool = []
	if(getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.GOOD || getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.NEUTRAL):
		pool.append(HK_Sessions.AwakenerSimple)
	if(getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.EVIL):
		pool.append(HK_Sessions.AwakenerFakeWake)
		
	var pick = RNG.pick(pool)
	return pick

func buff(buffid, args = []):
	var buff: BuffBase = GlobalRegistry.createBuff(buffid)
	buff.initBuff(args)
	return buff
	
func betterBuffs() -> bool:
	if(GM.pc.hasPerk(HK_Perk.FastAsleep)):
		return true
	else:
		return false
	
func debuffEffectMultiplier() -> float:
	var mult = 1.0
	return mult
	
func buffDurationMultiplier() -> float:
	var duration = 1.0
	if(getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.GOOD):
		duration = 1.25
	if(getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.NEUTRAL):
		duration = 1.0
	if(getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.EVIL):
		duration = 0.65
	if(GM.pc.hasPerk(HK_Perk.FastAsleep)):
		duration += 0.1
	return duration
	
func debuffDurationMultiplier() -> float:
	var duration
	if(getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.GOOD):
		duration = 1.0
	if(getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.NEUTRAL):
		duration = 1.0
	if(getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.EVIL):
		duration = 1.25
	return duration
