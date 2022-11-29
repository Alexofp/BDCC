extends CharacterGeneratorBase
class_name InmateGenerator

func getAttacks():
	return ["simplepunchattack", "trygetupattack"]

func getPossibleAttacks():
	return ["simplekickattack", "shoveattack", "stretchingAttack", "lickWounds", "ShivAttack", "biteattack", "NpcScratch"]

func pickEquipment(character:DynamicCharacter, _args = {}):
	var inmateType = character.getFlag(CharacterFlag.InmateType)
	if(inmateType == null):
		inmateType = RNG.pick([InmateType.General, InmateType.HighSec, InmateType.SexDeviant])
		character.setFlag(CharacterFlag.InmateType, inmateType)
	
	var theEquipment = ["inmatecollar"]
	
	var ehibit = character.getFetishHolder().getFetishValue(Fetish.Exhibitionism)
	
	# Sometimes they're naked
	if(!RNG.chance(ehibit * 5.0)):
		if(inmateType == InmateType.General):
			theEquipment.append("inmateuniform")
		if(inmateType == InmateType.HighSec):
			theEquipment.append("inmateuniformHighsec")
		if(inmateType == InmateType.SexDeviant):
			theEquipment.append("inmateuniformSexDeviant")
	
	# Sometimes they have a forced chastity cage on
	if(RNG.chance(2.0) && character.hasPenis()):
		theEquipment.append(RNG.pick(["ChastityCagePermanentNormal", "ChastityCagePermanent"]))
	
	if(!RNG.chance(ehibit * 100.0 + 50.0)):
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

#func pickNonStaticEquipment(character:DynamicCharacter, _args = {}):
#	# Sometimes they have a forced chastity cage on
#	if(RNG.chance(2.0)):
#		var chastityCageItem = GlobalRegistry.createItem(RNG.pick(["ChastityCage", "ChastityCagePermanent"]))
#
#		character.getInventory().forceEquipRemoveOther(chastityCageItem)
