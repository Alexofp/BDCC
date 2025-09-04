extends InmateGenerator
class_name NakedSlaveGenerator

func pickSmallDescription(_character:DynamicCharacter, _args = {}):
#	var thedesc = ""
#	thedesc += Util.getSpeciesName(character.npcSpecies)
#	thedesc += ". "
#	thedesc += NpcGender.getVisibleName(character.npcGeneratedGender)+"."
#
	return "One of the slaves"

func pickCharacterType(character:DynamicCharacter, _args = {}):
	character.npcCharacterType = CharacterType.Generic

func getAttacks():
	return ["simplepunchattack", "trygetupattack"]

func getPossibleAttacks():
	return ["simplekickattack", "shoveattack", "stretchingAttack", "lickWounds", "ShivAttack", "biteattack", "NpcScratch"]

func pickEquipment(character:DynamicCharacter, _args = {}):
	character.npcDefaultEquipment = []
