extends "res://Inventory/Items/Underwear/Strapon.gd"

func _init():
	id = "StraponOviFeeldoe"
	clothesColor = Color("#61C71B")

func getVisibleName():
	return "Ovipositor (feeldoe)"
	
func getDescription():
	var text:String = "A double-sided ovipositor strapon. Doesn't have egg storage but it can automatically use eggs from your holes. Also brings pleasure to the wearer during sex"

	return text

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"strapon": "res://Inventory/RiggedModels/Strapons/OviFeeldoeStrapon.tscn",
	}

func getStraponPleasureForDom():
	return 0.5

func updateDoll(doll: Doll3D):
	doll.setPenisScale(1.1)
	doll.setBallsScale(1.0)

func getStraponLength():
	return 22.0

func getCasualName():
	return "feeldoe strapon"

func getLewdStraponName() -> String:
	return RNG.pick(["ovipositor strapon"])
	
func getPrice():
	return 40

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(1000.0)

func getInventoryImage():
	return "res://Images/Items/strapons/ovifeeldoe.png"

func getInventoryImageColor():
	return clothesColor

func getStraponTraits() -> Dictionary:
	return {
		PartTrait.Ovipositor: true,
	}

func canStuffEggInto(_targetChar, _bodypart:String) -> bool:
	return canStuffEggIntoTransfer(_targetChar, _bodypart)

func doStuffEggInto(_targetChar, _bodypart:String) -> Dictionary:
	return doStuffEggIntoTransfer(_targetChar, _bodypart)

func getTags():
	var theTags:Array= .getTags()
	if(GM.main != null && GM.main.SCI != null && GM.main.SCI.hasUpgrade("oviStrapons")):
		theTags.append(ItemTag.SoldByMedicalVendomat)
	return theTags
