extends ItemBase

func _init():
	id = "BreastPump"

func getVisibleName():
	return "Breast Pump"
	
func getDescription():
	return "A tool that can extract milk out of lactating breasts. This is a basic version that has some flaws.\nIf put on during sex it extracts "+str(getMilkSpeedPerMinuteMin())+"-"+str(getMilkSpeedPerMinuteMax())+" of milk per minute."

func getClothingSlot():
	return InventorySlot.UnderwearTop

func getBuffs():
	return [
		]

func getPrice():
	return 10

func canSell():
	return true

func getMilkSpeedPerMinuteMin():
	return 30.0

func getMilkSpeedPerMinuteMax():
	return 100.0

func getTags():
	return [ItemTag.SoldByMedicalVendomat, ItemTag.BreastPump, ItemTag.BreastPumpUsableByNPC]

func getUnriggedParts(_character):
	var howFilled = fluids.getFluidAmount()/fluids.getCapacity()
	
	if(howFilled <= 0.0):
		return {
			"breastpump": ["res://Inventory/UnriggedModels/BreastPump/BreastPumpEmpty.tscn"],
		}
	elif(howFilled < 0.3):
		return {
			"breastpump": ["res://Inventory/UnriggedModels/BreastPump/BreastPumpLittle.tscn"],
		}
	elif(howFilled < 0.75):
		return {
			"breastpump": ["res://Inventory/UnriggedModels/BreastPump/BreastPumpHalf.tscn"],
		}
	else:
		return {
			"breastpump": ["res://Inventory/UnriggedModels/BreastPump/BreastPumpFull.tscn"],
		}

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(2000.0)
	#fluids.addFluid("Milk", 250.0)
	var _ok = fluids.connect("contentsChanged", self, "updatePcIfNeeded")

func updatePcIfNeeded(_oldFluidAmount, _newFluidAmount):
	if(!isWornByWearer()):
		return
	
	updateWearerAppearance()

func getPossibleActions():
	return [
		{
			"name": "Milk self",
			"scene": "BreastPumpsMilkingScene",
			"description": "Turn on the breast pumps",
		},
		{
			"name": "Transfer fluids",
			"scene": "FluidTransferScene",
			"description": "Transfer the fluids between fluid containers",
		},
		{
			"name": "Drink from",
			"scene": "DrinkFromScene",
			"description": "Swallow the contents of this item",
		},
	]
