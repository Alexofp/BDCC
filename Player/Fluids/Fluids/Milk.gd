extends FluidBase

func _init():
	id = "Milk"

func getVisibleName():
	return "Milk"

func getMessyDescription(_pc, _amount):
	if(_amount >= 500.0):
		return "You're drenched in milk! Moo!"
	
	return null

func getMessyBuffs(_pc, _amount):
	if(_pc.hasPerk(Perk.CumSlut)):
		var messLevel = Util.mini(int(_amount / 200), 10)
		
		if(messLevel > 0):
			return [
				buff(Buff.PhysicalArmorBuff, [5 * messLevel]),
			]

func getBellyBuffs(_pc, _amount):
	if(_pc.hasPerk(Perk.CumBreathV1)):
		var messLevel = Util.mini(int(_amount / 100), 100)
		
		if(messLevel > 0):
			return [
				buff(Buff.MaxPainBuff, [2 * messLevel]),
			]

func onSwallow(_pc, _amount):
	var toHeal = Util.mini(int(_amount / 20), 1000)
	
	if(toHeal > 0):
		_pc.addPain(-toHeal)
		return "Drinking milk relieved "+_pc.getName()+" of "+DamageType.getDamageColoredString(DamageType.Physical, toHeal)+"."
	
	return null

func getCost(_amount) -> int:
	return int(_amount / 1000.0) * 1

func onGettingHitWith(_pc, _amount):
	var topicsToCheck = [InterestTopic.LactatingBreasts]
	var maxInterest = -1.0
	for theTopic in topicsToCheck:
		maxInterest = max(maxInterest, _pc.getLustInterests().getInterestValue(theTopic))
	
	var likesCum = 0.5 + maxInterest
	likesCum = clamp(likesCum, -1.0, 1.0)
	
	var lustToAdd = int(likesCum * sqrt(_amount) / 1.0)
	var staminaToDrain = int(sqrt(_amount))
	
	var text = ""
	if(lustToAdd < 0):
		text += _pc.getName()+" hated getting splashed with milk!"
	elif(lustToAdd > 0):
		text += _pc.getName()+" "+RNG.pick(["loved", "enjoyed", "got lusty from", "liked", "got aroused from"])+" getting splashed with milk!"
	
	if(RNG.chance(2.0 * sqrt(_amount))):
		if(text != ""):
			text += " "
		text += _pc.getName()+" got blinded by the milk!"
		_pc.addEffect(StatusEffect.Blindness, [Util.mini(3, 1 + int(_amount/2000))])
		
	return {
		text = text,
		lust = lustToAdd,
		stamina = staminaToDrain,
	}
