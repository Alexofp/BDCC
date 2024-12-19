extends Character

func _init():
	id = "luxecatgirl"
	
	pickedSkin="MonsterGirl"
	pickedSkinRColor=Color("ffb37162")
	pickedSkinGColor=Color("ffb20b29")
	pickedSkinBColor=Color("ff690d0d")
	npcSkinData={
	"hair": {"r": Color("ff9d0202"),"g": Color("ff9b0b8f"),"b": Color("ff7226b6"),},
	"ears": {"r": Color("ff891917"),"g": Color("ffcca2a2"),"b": Color("fff3e9e9"),},
	"tail": {"r": Color("ff891917"),"g": Color("ff790402"),"b": Color("ff891917"),},
	}
	disableSerialization = true
	
func _getName():
	return "Catgirl"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A cute slave with a naive stare"

#func getChatColor():
#	return "#E24F4D"

func getSpecies():
	return ["feline", "human"]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = BreastsSize.B
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("sockethair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanhead"))

func getDefaultEquipment():
	return ["oldcollar"]
