extends Character

func _init():
	id = "syndiMale"
	disableSerialization = true
	
func _getName():
	return "Syndicate Agent"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Just looking at them makes you want to hide the disk.. What disk?"

func getSpecies():
	return ["canine"]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 0

func createBodyparts():
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("SyndiHelmet"))
	getInventory().equipItem(GlobalRegistry.createItemNoID("SyndiArmor"))
