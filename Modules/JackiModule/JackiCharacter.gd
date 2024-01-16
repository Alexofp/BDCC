extends Character

func _init():
	id = "jacki"
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="WildSkin"
	pickedSkinRColor=Color("ff232323")
	pickedSkinGColor=Color("ff605f5f")
	pickedSkinBColor=Color("ffd4cfcb")
	npcSkinData={
	"hair": {"r": Color("ff212121"),"g": Color("ff890000"),"b": Color("ff7d2b2b"),},
	"ears": {"b": Color("ff636363"),},
	"arms": {"g": Color("ff473934"),},
	"legs": {"g": Color("ff473934"),},
	}
	npcHasMenstrualCycle = true
	
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

func getDefaultEquipment():
	var jackiModule = GlobalRegistry.getModule("JackiModule")
	
	var defaultStuff = ["inmatecollar", "JackiChastityPiercings"]
	
	if(jackiModule.shouldWearSportsBra()):
		defaultStuff.append("sportyTop")
	if(jackiModule.shouldWearSportsShorts()):
		defaultStuff.append("sportyBriefs")
	if(!jackiModule.shouldUnderwear()):
		defaultStuff.append("inmateuniform")
	
	return defaultStuff

func updateBodyparts():
	var jackiModule = GlobalRegistry.getModule("JackiModule")
	
	if(jackiModule.shouldWearSportsBra() && !getInventory().hasSlotEquipped(InventorySlot.UnderwearTop)):
		getInventory().equipItem(GlobalRegistry.createItemNoID("sportyTop"))
	if(jackiModule.shouldWearSportsShorts() && !getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom)):
		getInventory().equipItem(GlobalRegistry.createItemNoID("sportyBriefs"))
	if(jackiModule.shouldUnderwear() && getInventory().hasSlotEquipped(InventorySlot.Body)):
		getInventory().removeItemFromSlot(InventorySlot.Body)
		
