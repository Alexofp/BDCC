extends "res://Inventory/Items/Underwear/Strapon.gd"

# The whole thing is a glorious hack. Admire it

var penisID:String = "nova"
var fallbackFluids:Fluids

func _init():
	id = "StraponAdvanced"
	clothesColor = Color.white
	fallbackFluids = Fluids.new()
	fallbackFluids.setCapacity(0.0)

func getVisibleName():
	var thePenis = getPenisBodypart()
	if(thePenis):
		var theChar:BaseCharacter = thePenis.getCharacter()
		if(GM.main && penisID != "pc"): # HAAAAAAAAAACK
			GM.main.updateCharacterUntilNow(penisID)
		return theChar.getName()+"'s penis"
	return "Strapon (advanced)"
	
func getDescription():
	var text:String = "Just don't ask about how the 'Transfer fluids' feature works"

	return text

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	var thePenis = getPenisBodypart()
	if(thePenis):
		return {
			"straponbase": "res://Inventory/RiggedModels/Strapons/StraponAdvancedBase.tscn",
			"strapon": thePenis.getDoll3DScene(),
		}
	return {
		"strapon": "res://Inventory/RiggedModels/Strapons/StraponAdvanced.tscn",
	}

func getStraponPleasureForDom():
	return 0.5

func getCasualName():
	return "advanced strapon"

func getLewdStraponName() -> String:
	# Get these from the original penis?
	return RNG.pick(["advanced strapon"])

func getPrice():
	return 35

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(0.0)

func getFluids():
	checkFluids()
	return fluids

func checkFluids():
	var thePenis:BodypartPenis = getPenisBodypart()
	if(thePenis && thePenis.getFluids()):
		fluids = thePenis.getFluids()
		if(GM.main && penisID != "pc"):
			GM.main.updateCharacterUntilNow(penisID)
	else:
		fluids = fallbackFluids
		penisID = ""

func setPenisTarget(_charID:String):
	penisID = _charID
	checkFluids()
	updateWearerAppearance()

func getInventoryImage():
	return "res://Images/Items/strapons/feeldoe.png"

func getInventoryImageColor():
	return clothesColor

func getPossibleActions():
	return [
		{
			"name": "Transfer fluids", # Too funny so I didn't remove, embrace the jank
			"scene": "FluidTransferScene",
			"description": "Transfer the fluids between fluid containers",
		},
		{
			"name": "Select target",
			"scene": "StraponAdvancedPickTarget",
			"description": "Select who's penis should this strapon's portal use. You can only select characters that are wearing portal panties or a portal chastity cage",
		},
	]

func getStraponTraits() -> Dictionary:
	# GET THESE FROM THE ORIGINAL PENIS
	return {
		PartTrait.PenisKnot: true,
	}

func canDye():
	return false

func getPenisBodypart():
	if(penisID.empty()):
		fluids = fallbackFluids
		return null
	var theChar:BaseCharacter = GlobalRegistry.getCharacter(penisID)
	if(!theChar || !theChar.canUsePenisThroughPortal()):
		penisID = ""
		fluids = fallbackFluids
		return null
	var thePenis = theChar.getBodypart(BodypartSlot.Penis) if theChar.hasPenis() else null
	if(thePenis && thePenis.getFluids()):
		fluids = thePenis.getFluids()
	else:
		penisID = ""
		fluids = fallbackFluids
	return thePenis

func getStraponLength():
	var thePenis = getPenisBodypart()
	if(thePenis):
		return thePenis.lengthCM
	return 20.0

func updateDoll(doll: Doll3D):
	var thePenis = getPenisBodypart()
	if(thePenis):
		if(thePenis.has_method("getPenisScale")):
			doll.setPenisScale(thePenis.getPenisScale())
		if(thePenis.has_method("getBallsScale")):
			doll.setBallsScale(thePenis.getBallsScale())
		
		var bodySkinData = thePenis.getCharacter().getSkinData()
		var bodypartSkinData = thePenis.getSkinData()
		for field in BaseCharacter.fieldsToCheckSkin:
			if(!bodypartSkinData.has(field) || bodypartSkinData[field] == null):
				if(bodySkinData.has(field)):
					bodypartSkinData[field] = bodySkinData[field]
						
		doll.skinData[BodypartSlot.Penis] = bodypartSkinData
		doll.setState("cock", "")
	else:
		doll.setPenisScale(1.0)
		doll.setBallsScale(1.0)

func getTags():
	if(GM.main != null && GM.main.SCI != null && GM.main.SCI.hasUpgrade("advStrapon")):
		return [
			ItemTag.Strapon,
			ItemTag.SoldByMedicalVendomat,
			ItemTag.AdvancedStrapon,
			]
	return [
		ItemTag.Strapon,
		ItemTag.AdvancedStrapon,
		]

func saveData():
	var theData:Dictionary = .saveData()
	theData["penisID"] = penisID
	return theData

func loadData(_data):
	.loadData(_data)
	
	penisID = SAVE.loadVar(_data, "penisID", "nova")
	penisID = ""
	call_deferred("checkFluids") # Ehhhh but we have to run this function after all characters were loaded
