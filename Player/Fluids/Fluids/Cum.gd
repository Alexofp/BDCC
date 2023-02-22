extends FluidBase

func _init():
	id = "Cum"

func getVisibleName():
	return "Cum"

func canImpregnate():
	return true

func getMessyDescription(_pc, _amount):
	if(_amount >= 1000.0):
		return "You look like a complete cum dump and feel like one too!"
	if(_amount >= 500.0):
		return "You're such a cum rag!"
	
	return null

func getMessyBuffs(_pc, _amount):
	if(_pc.hasPerk(Perk.CumSlut)):
		var messLevel = Util.mini(int(_amount / 100), 10)
		
		if(messLevel > 0):
			return [
				buff(Buff.LustDamageBuff, [5 * messLevel]),
			]

func getBellyBuffs(_pc, _amount):
	if(_pc.hasPerk(Perk.CumBreathV1)):
		var messLevel = Util.mini(int(_amount / 200), 10)
		
		if(messLevel > 0):
			return [
				buff(Buff.PhysicalDamageBuff, [5 * messLevel]),
			]

func onSwallow(_pc, _amount):
	var toHeal = Util.mini(int(_amount / 10), 1000)
	
	if(toHeal > 0):
		_pc.addStamina(toHeal)
		return "Drinking cum provided "+_pc.getName()+" with an energy boost, giving you "+DamageType.getDamageColoredString(DamageType.Stamina, toHeal)+" back."
	
	return null

func getCost(_amount) -> int:
	return int(_amount / 300.0) * 1

func onGettingHitWith(_pc, _amount):
	var topicsToCheck = [InterestTopic.CoveredInCum, InterestTopic.CoveredInLotsOfCum, InterestTopic.HasCockOnly, InterestTopic.HasVaginaAndCock, InterestTopic.ExposedCock]
	var maxInterest = -1.0
	for theTopic in topicsToCheck:
		maxInterest = max(maxInterest, _pc.getLustInterests().getInterestValue(theTopic))
	
	var likesCum = 0.5 + maxInterest
	likesCum = clamp(likesCum, -1.0, 1.0)
	
	var lustToAdd = int(likesCum * sqrt(_amount) / 1.0)
	var staminaToDrain = int(sqrt(_amount))
	
	var text = ""
	if(lustToAdd < 0):
		text += _pc.getName()+" hated getting splashed with cum!"
	elif(lustToAdd > 0):
		text += _pc.getName()+" "+RNG.pick(["loved", "enjoyed", "got lusty from", "liked", "got aroused from"])+" getting splashed with cum!"
	
	if(RNG.chance(2.0 * sqrt(_amount))):
		if(text != ""):
			text += " "
		text += _pc.getName()+" got blinded by the cum!"
		_pc.addEffect(StatusEffect.Blindness, [Util.mini(3, 1 + int(_amount/2000))])
		
	return {
		text = text,
		lust = lustToAdd,
		stamina = staminaToDrain,
	}
