extends Character

func _init():
	id = "jacki"
	npcCharacterType = CharacterType.Inmate
	
func _getName():
	return "Jacki Northstar"

func getGender():
	return Gender.Female

func getSmallDescription() -> String:
	return "General pop inmate, medium-height feminine wolfy with dark fur and a fit body."

func getSpecies():
	return ["canine"]
	
func getChatColor():
	return "#E24646"
	
func getThickness() -> int:
	return 40

func getFemininity() -> int:
	return 20

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("jackihair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 2
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))


func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("inmatecollar"))
	getInventory().equipItem(GlobalRegistry.createItemNoID("inmateuniform"))
	getInventory().equipItem(GlobalRegistry.createItemNoID("sportyTop"))
	getInventory().equipItem(GlobalRegistry.createItemNoID("sportyBriefs"))
	getInventory().equipItem(GlobalRegistry.createItemNoID("JackiChastityPiercings"))
