extends FluidBase

func _init():
	id = "GirlCum"

func getVisibleName():
	return "Girlcum"

func getMessyDescription(_pc, _amount):
	if(_amount >= 500.0):
		return "You're drenched in girlcum, so lewd!"
	
	return null

func getMessyBuffs(_pc, _amount):
	if(_pc.hasPerk(Perk.CumSlut)):
		var messLevel = Util.mini(int(_amount / 40), 10)
		
		if(messLevel > 0):
			return [
				buff(Buff.DodgeChanceBuff, [1 * messLevel]),
			]

func getBellyBuffs(_pc, _amount):
	if(_pc.hasPerk(Perk.CumBreathV1)):
		var messLevel = Util.mini(int(_amount / 40), 10)
		
		if(messLevel > 0):
			return [
				buff(Buff.MaxLustBuff, [5 * messLevel]),
			]

func onSwallow(_pc, _amount):
	var toHeal = Util.mini(int(_amount / 20), 1000)
	
	if(toHeal > 0):
		_pc.addPain(-toHeal)
		return "Drinking girlcum relieved "+_pc.getName()+" of "+DamageType.getDamageColoredString(DamageType.Physical, toHeal)+"."
	
	return null

func getCost(_amount) -> int:
	return int(_amount / 250.0) * 1

func onGettingHitWith(_pc, _amount):
	var topicsToCheck = [InterestTopic.ExposedPussy, InterestTopic.StuffedPussy, InterestTopic.FeminineBody, InterestTopic.HasVaginaOnly, InterestTopic.HasVaginaAndCock]
	var maxInterest = -1.0
	for theTopic in topicsToCheck:
		maxInterest = max(maxInterest, _pc.getLustInterests().getInterestValue(theTopic))
	
	var likesCum = 0.5 + maxInterest
	likesCum = clamp(likesCum, -1.0, 1.0)
	
	var lustToAdd = int(likesCum * sqrt(_amount) / 1.0)
	var staminaToDrain = int(sqrt(_amount))
	var painToAdd = 0
	
	var text = ""
	if(lustToAdd < 0):
		text += _pc.getName()+" hated getting splashed with girlcum!"
	elif(lustToAdd > 0):
		text += _pc.getName()+" "+RNG.pick(["loved", "enjoyed", "got lusty from", "liked", "got aroused from"])+" getting splashed with girlcum!"
	
	if(RNG.chance(4.0 * sqrt(_amount)) && !_pc.hasEffect(StatusEffect.Collapsed)):
		if(text != ""):
			text += " "
		text += _pc.getName()+" slipped on girlcum, ow!"
		_pc.addEffect(StatusEffect.Collapsed)
		painToAdd = 10
		
	return {
		text = text,
		lust = lustToAdd,
		stamina = staminaToDrain,
		pain = painToAdd,
	}

func getCumOverlayColor():
	return Color(1.0, 1.0, 1.0, 0.3)
