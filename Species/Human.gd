extends Species

func _init():
	id = Species.Human
	
func getVisibleName():
	return "Human"

func getDefaultLegs(_gender):
	return "plantilegs"

func isPlayable():
	return true

func getVisibleDescription():
	return "Your ordinary human"

func getDefaultEars(_gender):
	return "humanears"

func getEggCellOvulationAmount():
	return [
		[1, 10.0],
		[2, 1.0],
		[3, 0.3],
	]

func getSkinType():
	return SkinType.SkinHuman

func generateSkinColors():
	return ColorUtils.generateGenericHumanSkinColors()

func calculateScoreForSpeciesCalculations(_npc) -> float:
	var result:float = 1.0
	if(_npc.hasBodypart(BodypartSlot.Horns)):
		result -= 0.25
	if(_npc.hasBodypart(BodypartSlot.Tail)):
		result -= 0.25
	return result
