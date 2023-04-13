extends Character

func _init():
	id = "rahiPharmGirl"
	disableSerialization = true
	
func _getName():
	return "Pharmacist girl"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A feline that sells drugs in the drugstore. Light brown fur, green eyes, short height."

func getSpecies():
	return ["feline"]
	
func getThickness() -> int:
	return 100

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorthair2"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 5
	giveBodypartUnlessSame(breasts)

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("CasualClothes"))
