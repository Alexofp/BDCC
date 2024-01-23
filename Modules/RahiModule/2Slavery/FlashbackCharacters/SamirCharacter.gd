extends Character

func _init():
	id = "rahiFather"
	disableSerialization = true
	
	pickedSkin="SoftSpikySkin"
	pickedSkinRColor=Color("ffaf645a")
	pickedSkinGColor=Color("ff9b837f")
	pickedSkinBColor=Color("ff675353")
	npcSkinData={
	"hair": {"r": Color("ff776c6c"),"g": Color("ff776c6c"),"b": Color("ff776c6c"),},
	}
	
func _getName():
	return "Samir Haj'jar"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Rahi's father."

func getSpecies():
	return ["feline"]
	
func getChatColor():
	return '#FF8E5E'
	
func getThickness() -> int:
	return 60

func getFemininity() -> int:
	return 30

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("coolhair"))

func getDefaultEquipment():
	return ["CasualClothes"]
