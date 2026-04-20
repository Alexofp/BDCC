extends Character

func _init():
	id = "psTentSci1"
	
	pickedSkin="SoftSpikySkin"
	pickedSkinRColor=Color("ffaf9884")
	pickedSkinGColor=Color("ff6e6053")
	pickedSkinBColor=Color("ffe1d8d0")
	npcSkinData={
	"hair": {"skin": "sockethairoverlap","r": Color("ff493a2d"),"g": Color("ff473628"),"b": Color("ffad9178"),},
	"ears": {"g": Color("fffe6a23"),},
	"arms": {"skin": "AngledSkin","b": Color("fffe6a23"),},
	"penis": {"skin": "bodymodcanine","g": Color("fffe6a23"),"b": Color("ff1c00ff"),},
	"tail": {"skin": "LuxeSkin",},
	"legs": {"skin": "LuxeSkin","b": Color("fffe6a23"),},
	}
	
	npcHasMenstrualCycle = true
	
func _getName():
	return "Wolf scientist"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A wolf scientist."

#func getChatColor():
#	return "#D8D500"

func getSpecies():
	return ["canine"]

func getThickness() -> int:
	return 60

func getFemininity() -> int:
	return 20

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("sockethair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("caninetail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["LabcoatOutfitMale"]
