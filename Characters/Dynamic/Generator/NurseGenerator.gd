extends CharacterGeneratorBase
class_name NurseGenerator

func pickCharacterType(character:DynamicCharacter, _args = {}):
	character.npcCharacterType = CharacterType.Nurse

func getAttacks():
	return ["stunbatonAttack", "trygetupattack"]

func getPossibleAttacks():
	return ["HeatGrenade", "DoubleCuffPC", "CuffPCHands", "stretchingAttack", "lickWounds", "ForceMuzzlePC", "stunbatonOverchargeAttack", "simplekickattack", "biteattack", "shoveattack"]

func pickEquipment(character:DynamicCharacter, _args = {}):
	
	var theEquipment = []
	
	var randomUniform = getRandomItemIDByTag(ItemTag.NurseUniform)
	if(randomUniform != null):
		theEquipment.append(randomUniform)
	
	var ehibit = character.getFetishHolder().getFetishValue(Fetish.Exhibitionism)
	
	if(!RNG.chance(ehibit * 100.0)):
		if(character.getFemininity() < 50):
			if(RNG.chance(50)):
				theEquipment.append("plainBriefs")
				theEquipment.append("plainUndershirt")
			else:
				theEquipment.append("sportyBriefs")
				theEquipment.append("sportyTankTop")
		else:
			if(RNG.chance(33)):
				theEquipment.append("plainPanties")
				theEquipment.append("plainBra")
			elif(RNG.chance(33)):
				theEquipment.append("LaceBra")
				theEquipment.append("LacePanties")
			else:
				theEquipment.append("sportyBriefs")
				theEquipment.append("sportyTop")
	
	character.npcDefaultEquipment = theEquipment

func pickSmallDescription(character:DynamicCharacter, _args = {}):
	var text = "One of the nurses. "+str(.pickSmallDescription(character, _args))

	return text
