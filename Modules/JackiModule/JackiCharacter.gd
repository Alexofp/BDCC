extends Character

func _init():
	id = "jacki"
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="SoftSpikySkin"
	pickedSkinRColor=Color("ff232323")
	pickedSkinGColor=Color("ff5f5e5e")
	pickedSkinBColor=Color("ffa9a9a9")
	npcSkinData={
	"hair": {"r": Color("ff212121"),"g": Color("ff890000"),"b": Color("ff7d2b2b"),},
	"ears": {"b": Color("ff636363"),},
	"body": {"b": Color("ff444242"),},
	"arms": {"skin": "SoftSpikySkin","r": Color("ff473934"),"g": Color("ff2b2b2b"),"b": Color("ff502020"),},
	"tail": {"skin": "SoftSpikySkin","g": Color("ff232323"),"b": Color("ff565656"),},
	"legs": {"skin": "FerriSkin","b": Color("ff433837"),},
	}
	
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
	getInventory().equipItem(GlobalRegistry.createItemNoID("JackiChastityPiercings"))

func updateBodyparts():
	var jackiModule = GlobalRegistry.getModule("JackiModule")
	
	if(jackiModule.shouldWearSportsBra() && !getInventory().hasSlotEquipped(InventorySlot.UnderwearTop)):
		getInventory().equipItem(GlobalRegistry.createItemNoID("sportyTop"))
	if(jackiModule.shouldWearSportsShorts() && !getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom)):
		getInventory().equipItem(GlobalRegistry.createItemNoID("sportyBriefs"))
	if(jackiModule.shouldUnderwear() && getInventory().hasSlotEquipped(InventorySlot.Body)):
		getInventory().removeItemFromSlot(InventorySlot.Body)
		
