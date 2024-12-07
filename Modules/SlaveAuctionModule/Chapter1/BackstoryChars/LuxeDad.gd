extends Character

func _init():
	id = "luxedad"
	
	pickedSkin="SoftSpikySkin"
	pickedSkinRColor=Color("ff171717")
	pickedSkinGColor=Color("ff353535")
	pickedSkinBColor=Color("ff7c7c7c")
	npcSkinData={
	"hair": {"r": Color("ff171717"),"g": Color("ff828282"),"b": Color("ff232323"),},
	"penis": {"skin": "Weiny",},
	"tail": {"g": Color("ff141414"),"b": Color("ff343434"),},
	}
	disableSerialization = true
	
func _getName():
	return "Father"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Your father."

func getChatColor():
	return "#999999"

func getSpecies():
	return ["canine"]

func getThickness() -> int:
	return 60

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("manehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 30
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("caninetail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["OfficialClothesRed", "plainBriefs"]
