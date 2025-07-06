extends Character

func _init():
	id = "psricky"
	npcCharacterType = CharacterType.Generic
	
	pickedSkin="LuxeSkin"
	pickedSkinRColor=Color("ff593228")
	pickedSkinGColor=Color("ff170b0c")
	pickedSkinBColor=Color("ff6f5659")
	npcSkinData={
	"hair": {"skin": "combedlayered","r": Color("ffd8643e"),"g": Color("ffd83ea7"),"b": Color("ffef7431"),},
	"ears": {"g": Color("ffe3776f"),},
	"penis": {"skin": "Gradientcanine","g": Color("ff142026"),"b": Color("ffdc6424"),},
	}
	
	
func _getName():
	return "Ricky"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Canine with a mean stare"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["CapEnergyBlast", "CapTacticalStrike", "CapDisablingShot", "CapRapidFire", "CapTakeAim", "CapEvasiveManeuver", "trygetupattack"]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("combedbackhair"))
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)

func getDefaultEquipment():
	return ["OfficialClothes"]
