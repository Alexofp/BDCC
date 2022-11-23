extends CharacterGeneratorBase
class_name GuardGenerator

func pickEquipment(character:DynamicCharacter, _args = {}):
	var theEquipment = ["GuardArmor"]
	
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
