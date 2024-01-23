extends Character

func _init():
	id = "directortau"
	npcCharacterType = CharacterType.Generic
	disableSerialization = true
	
	pickedSkin="HumanSkin"
	pickedSkinRColor=Color("ffdbb3a2")
	pickedSkinGColor=Color("ff9c544f")
	pickedSkinBColor=Color("ff9c544f")
	npcSkinData={
	"hair": {"r": Color("ffffffff"),"g": Color("ffd3d3d3"),"b": Color("ffa9a9a9"),},
	}
	
func _getName():
	return "Director"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A male human of older age with a cold piercing gaze."

func getSpecies():
	return ["human"]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 0

func getChatColor():
	return '#BABAD6'

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanoldhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("combedbackhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("plantilegs"))

func getDefaultEquipment():
	return ["OfficialClothes"]
