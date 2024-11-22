extends Character

func _init():
	id = "slave_guard"
	
	pickedSkin="DappledSkin"
	pickedSkinRColor=Color("ff4d3327")
	pickedSkinGColor=Color("ffa07e6e")
	pickedSkinBColor=Color("ff6a4d40")
	npcSkinData={
	"hair": {"r": Color("ffd7c2b0"),"g": Color("ffa19183"),"b": Color("ffffffff"),},
	}
	
	npcCharacterType = CharacterType.Generic
	disableSerialization = true
	
func _getName():
	return "Uknown Guard"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A guard that you have never seen before"

func getSpecies():
	return ["canine"]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("overeyehair2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	var tail = GlobalRegistry.createBodypart("caninetail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["ropeharness"]
