extends Character

func _init():
	id = "psTentSci2"
	npcCharacterType = CharacterType.Generic
	
	pickedSkin="CrystalineSkin"
	pickedSkinRColor=Color("ffebfcfd")
	pickedSkinGColor=Color("ff2d8287")
	pickedSkinBColor=Color("ff9cc9cc")
	npcSkinData={
	"hair": {"skin": "ponytail3highlight","r": Color("ff28dbd5"),"g": Color("ff28dbd5"),"b": Color("ff6924ea"),},
	"breasts": {"b": Color("ff26dbd5"),},
	}
	
	npcHasMenstrualCycle = true
	
func _getName():
	return "Cat scientist"

func getGender():
	return Gender.Female
	
#func getChatColor():
#	return "#F26AB5"
	
func getSmallDescription() -> String:
	return "A cat scientist."
	
func getSpecies():
	return ["feline"]

func getThickness() -> int:
	return 80

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ponytailhair3"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 4
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("felinetail")
	tail.tailScale = 1.1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["LabcoatOutfitAlt", "LaceBra", "LacePanties"]
