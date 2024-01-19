extends Character

func _init():
	id = "rahiRabi"
	disableSerialization = true
	
	pickedSkin="SoftSpikySkin"
	pickedSkinRColor=Color("ffaf645a")
	pickedSkinGColor=Color("ffcb9b94")
	pickedSkinBColor=Color("ff9e5050")
	npcSkinData={
	"hair": {"r": Color("ffab3e3e"),"g": Color("ffaf3131"),"b": Color("ffaf3131"),},
	}
	
func _getName():
	return "Rabi Haj'jar"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Rahi's twin brother."

func getSpecies():
	return ["feline"]
	
func getChatColor():
	return '#FF8E5E'
	
func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 10

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("simplehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["CasualClothes"]
