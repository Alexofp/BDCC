extends Character

func _init():
	id = "alexrynard"
	
func _getName():
	return "Alex Rynard"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Male fox with a cold stare. Wears an engineer uniform"

func getSpecies():
	return ["canine"]

func getChatColor():
	return '#FFF60C'

func getThickness() -> int:
	return 70

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ponytailhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 18
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxtail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("EngineerClothes"))
