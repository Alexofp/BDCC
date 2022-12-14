extends CharacterGeneratorBase
class_name GuardGenerator

func pickCharacterType(character:DynamicCharacter, _args = {}):
	character.npcCharacterType = CharacterType.Guard

func getAttacks():
	return ["stunbatonAttack", "trygetupattack"]

func getPossibleAttacks():
	return ["HeatGrenade", "DoubleCuffPC", "CuffPCHands", "ForceGagPC", "ForceMuzzlePC", "stunbatonOverchargeAttack", "simplekickattack", "biteattack", "shoveattack"]

func pickEquipment(character:DynamicCharacter, _args = {}):
	
	var theEquipment = []
	
	var randomUniform = getRandomItemIDByTag(ItemTag.GuardUniform)
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
	var text = "One of the guards. "+str(.pickSmallDescription(character, _args))

	var level = character.npcLevel
	
	var possibleRanks = []
	
	if(level <= 6):
		possibleRanks.append_array([
			NpcRank.Spacer,
			NpcRank.SpaceCadet,
		])
	
	if(level >= 5 && level <= 10):
		possibleRanks.append_array([
			NpcRank.Inspector,
			NpcRank.ChiefInspector,
			NpcRank.Sergeant,
		])
	
	if(level >= 8 && level <= 15):
		possibleRanks.append_array([
			NpcRank.PettyOfficer,
			NpcRank.ChiefPettyOfficer,
		])

	if(level >= 13):
		possibleRanks.append_array([
			NpcRank.Lieutenant,
			NpcRank.Executor,
		])
	
	var pickedRank = RNG.pick(possibleRanks)
	if(pickedRank == null):
		pickedRank = NpcRank.Spacer
	
	character.setFlag(CharacterFlag.Rank, pickedRank)
	
	text = NpcRank.getVisibleName(pickedRank)+". "+text
	return text
