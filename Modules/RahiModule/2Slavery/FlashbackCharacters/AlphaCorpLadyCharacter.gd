extends Character

func _init():
	id = "rahiAlphaCorpLady"
	disableSerialization = true
	
	pickedSkin="HumanSkin"
	pickedSkinRColor=Color("ffde9b91")
	pickedSkinGColor=Color("fff5cebf")
	pickedSkinBColor=Color("fff5cebf")
	npcSkinData={
	"hair": {"r": Color("ffdaab7c"),"g": Color("ff152a53"),"b": Color("ff152a53"),},
	}
	
func _getName():
	return "AlphaCorp Lady"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A tall woman wearing official AlphaCorp clothes."

func getSpecies():
	return ["human"]
	
func getThickness() -> int:
	return 100

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ponytailhair2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 6
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("plantilegs"))

func getDefaultEquipment():
	return ["OfficialClothes"]
