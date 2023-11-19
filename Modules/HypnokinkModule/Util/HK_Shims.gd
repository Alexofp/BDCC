extends Object
class_name HK_Shims

static func swayHips(_lustState, pc, text):
	if(_lustState.isInBattle() && pc.hasPerk(HK_Perk.HypnoticAllure) && pc.hasEffect(HK_StatusEffect.Suggestible)):
		var stacks = HK_CharUtil.getSuggestibleStacks(pc)
		if(RNG.chance(stacks)):
			var enemy:BaseCharacter = _lustState.getEnemyCharacter()
			if(enemy != null):
				enemy.addEffect(HK_StatusEffect.Suggestible, [RNG.randi_range(5,15)])
				text += "[b]Enemy is mesmerized by your hips![/b]"
				text += "\n\n"
	return text
	
static func onForceEquip(item):
	if(item.has_method("on_forceEquip")):
		item.on_forceEquip(GM.pc)
	
static func restingInCell(timePassed):
	if(GM.pc.buffsHolder.hasBuff(HK_Buff.RestEffectivenessBuff)):
		var _hours = floor(timePassed/3600.0)
		var extraEffectiveness = GM.pc.buffsHolder.getCustom(HK_Buff.RestEffectivenessBuff)
		GM.pc.addStamina(_hours * 10 * extraEffectiveness)
