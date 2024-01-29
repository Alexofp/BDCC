extends Character

func _init():
	id = "socket"
	npcHasMenstrualCycle = false
	npcCharacterType = CharacterType.Engineer
	
	pickedSkin="SocketSkin"
	pickedSkinRColor=Color("ffa37d64")
	pickedSkinGColor=Color("ffe4c7b9")
	pickedSkinBColor=Color("ff834d35")
	npcSkinData={
	"hair": {"r": Color("ff351d18"),"g": Color("ff4f2c23"),"b": Color("ff351d18"),},
	"ears": {"g": Color("ffdfa19b"),"b": Color("ffe9d8d2"),},
	"breasts": {"r": Color("ffeba794"),"b": Color("ffb7736c"),},
	}
	
func _getName():
	return "Socket"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Cute fennec that wears a very revealing armor."

func getSpecies():
	return ["canine"]

func getThickness() -> int:
	return 100

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fennechead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("sockethair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fennecears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fennectail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["SocketArmor", "SocketVisorUp", "SocketBackpack"]
