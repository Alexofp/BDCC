extends AuctionTrait

func _init():
	ids = [
		"PersSubby",#
		"PersDominant",#
		"PersBrat",#
		"PersMean",#
		"PersKind",#
		"PersBrave",#
		"PersNaive",#
		"PersPerceptive",#
	]

func getTraitType(_id:String):
	return AuctionTraitType.Mind

func getName(_id:String) -> String:
	if(_id == "PersSubby"):
		return "Subby"
	if(_id == "PersDominant"):
		return "Dominant"
	if(_id == "PersBrat"):
		return "Bratty"
	if(_id == "PersMean"):
		return "Mean"
	if(_id == "PersKind"):
		return "Kind"
	if(_id == "PersBrave"):
		return "Brave"
	if(_id == "PersNaive"):
		return "Naive"
	if(_id == "PersPerceptive"):
		return "Perceptive"
	
	return "ERROR"

func calculateScore(_id:String, _char:BaseCharacter) -> float:
	if(_char.isSlaveToPlayer() && _char.getNpcSlavery().isMindBroken()):
		return 0.0
	var personality:Personality = _char.getPersonality()
	
	if(_id == "PersSubby"):
		if(personality.getStat(PersonalityStat.Subby) >= 0.5):
			return personality.getStat(PersonalityStat.Subby)
	if(_id == "PersDominant"):
		if(personality.getStat(PersonalityStat.Subby) <= -0.5):
			return -personality.getStat(PersonalityStat.Subby)
	if(_id == "PersBrat"):
		if(personality.getStat(PersonalityStat.Brat) >= 0.5):
			return personality.getStat(PersonalityStat.Brat)
	if(_id == "PersMean"):
		if(personality.getStat(PersonalityStat.Mean) >= 0.5):
			return personality.getStat(PersonalityStat.Mean)
	if(_id == "PersKind"):
		if(personality.getStat(PersonalityStat.Mean) <= -0.5):
			return -personality.getStat(PersonalityStat.Mean)
	if(_id == "PersBrave"):
		if(personality.getStat(PersonalityStat.Coward) <= -0.5):
			return -personality.getStat(PersonalityStat.Coward)
	if(_id == "PersNaive"):
		if(personality.getStat(PersonalityStat.Naive) >= 0.5):
			return personality.getStat(PersonalityStat.Naive)
	if(_id == "PersPerceptive"):
		if(personality.getStat(PersonalityStat.Naive) <= -0.5):
			return -personality.getStat(PersonalityStat.Naive)
			
	return 0.0
