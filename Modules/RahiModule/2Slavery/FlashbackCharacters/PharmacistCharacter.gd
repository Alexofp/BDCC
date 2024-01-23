extends Character

func _init():
	id = "rahiPharmGirl"
	disableSerialization = true
	
	pickedSkin="FerriSkin"
	pickedSkinRColor=Color("fff6b57f")
	pickedSkinGColor=Color("fff7f8fa")
	pickedSkinBColor=Color("ffff8620")
	npcSkinData={
	"hair": {"r": Color("fff2f5f8"),"g": Color("ffe1e1e1"),"b": Color("ff959cb4"),},
	}
	
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

func getDefaultEquipment():
	return ["CasualClothes"]
