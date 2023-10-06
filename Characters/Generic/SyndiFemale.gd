extends Character

func _init():
	id = "syndiFemale"
	disableSerialization = true
	
func _getName():
	return "Syndicate Agent"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Just looking at them makes you want to hide the disk.. What disk?"

func getSpecies():
	return ["canine"]

func getThickness() -> int:
	return 70

func getFemininity() -> int:
	return 100

func createBodyparts():
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 4
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("SyndiHelmet"))
	getInventory().equipItem(GlobalRegistry.createItemNoID("SyndiArmor"))
