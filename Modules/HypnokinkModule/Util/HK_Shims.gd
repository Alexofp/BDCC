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
