extends Character

func _init():
	id = "rahi"
	npcHasMenstrualCycle = true
	
func _getName():
	return "Rahi"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Wears a general block uniform with number P-12406. She is of medium height, has brown fur and a ponytail. Her naive eyes are blue."

func getSpecies():
	return ["feline"]

func createBodyparts():
	#var mybreasts: BodypartBreasts = GlobalRegistry.createBodypart("humanbreasts")
	#mybreasts.size = BreastsSize.C
	#giveBodypartUnlessSame(mybreasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))

func onGivingBirth(_impregnatedEggCells: Array, _newkids: Array):
	.onGivingBirth(_impregnatedEggCells, _newkids)
	
	GM.main.increaseFlag(RahiModule.Rahi_GaveBirthTimes, 1)
