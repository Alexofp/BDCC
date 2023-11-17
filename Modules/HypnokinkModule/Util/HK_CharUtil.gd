extends Object
class_name HK_CharUtil

#frikken cyclic definitions. Muh type safety :c

static func getSuggestibleEffect(character: BaseCharacter): #-> StatusEffectBase:
	var suggestibleStatus: HK_Suggestible = character.getEffect(HK_StatusEffect.Suggestible)
	return suggestibleStatus
	
static func isHypnotized(character: BaseCharacter) -> bool:
	var status:HK_Suggestible = getSuggestibleEffect(character)# as HK_Suggestible
	if(status == null):
		return false
	return status.isHypnotized()
	
static func isInTrance(character: BaseCharacter) -> bool:
	var status:HK_Suggestible = getSuggestibleEffect(character)# as HK_Suggestible
	if(status == null):
		return false
	return status.isInTrance()
	
static func getSuggestibleStacks(character: BaseCharacter) -> float:
	var status:HK_Suggestible = getSuggestibleEffect(character)# as HK_Suggestible
	if(status == null):
		return 0.0
	return status.stacks
	
static func raiseSuggestibilityTo(character: BaseCharacter, amount: float):
	var status:HK_Suggestible = getSuggestibleEffect(character)# as HK_Suggestible
	if(status == null):
		character.addEffect(HK_StatusEffect.Suggestible, [amount])
	else:
		status.stacks = max(status.stacks, amount)
		status.clampOrRemove()
	
static func changeSuggestibilityBy(character: BaseCharacter, amount: float):
	var status:HK_Suggestible = getSuggestibleEffect(character)# as HK_Suggestible
	if(status == null):
		if(amount >= 0):
			character.addEffect(HK_StatusEffect.Suggestible, [amount])
	else:
		status.stacks += amount
		status.clampOrRemove()
	
