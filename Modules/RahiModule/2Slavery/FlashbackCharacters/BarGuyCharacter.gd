extends Character

func _init():
	id = "rahiBarGuy"
	disableSerialization = true
	
	pickedSkin="MonsterGirl"
	pickedSkinRColor=Color("ffe8e5e2")
	pickedSkinGColor=Color("ff111017")
	pickedSkinBColor=Color("ffe07841")
	npcSkinData={
	"hair": {"r": Color("ffffffff"),"g": Color("ffd3d3d3"),"b": Color("ffa9a9a9"),},
	}
	
func _getName():
	return "Cat"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "One of the bar visitors. A tall tough cat."

func getSpecies():
	return ["feline"]
	
func getThickness() -> int:
	return 70

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("messyhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("lynxears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorttail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["CasualClothes"]
