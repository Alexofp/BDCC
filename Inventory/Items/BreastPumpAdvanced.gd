extends "res://Inventory/Items/BreastPump.gd"

func _init():
	id = "BreastPumpAdvanced"

func getVisibleName():
	return "Breast Pump Mk2"
	
func getDescription():
	return "(Will be a reward for something)\nA tool that can extract milk out of lactating breasts. This is an advanced version that will automatically collect milk if worn over time.\nIf put on during sex it extracts "+str(getMilkSpeedPerMinuteMin())+"-"+str(getMilkSpeedPerMinuteMax())+" of milk per minute."

func getBuffs():
	return [
		buff(Buff.BreastsMilkProductionBuff, [50.0]),
		]

func getPrice():
	return 50

func canSell():
	return true

func getMilkSpeedPerMinuteMin():
	return 100.0

func getMilkSpeedPerMinuteMax():
	return 300.0

func getTags():
	return [ItemTag.SoldByMedicalVendomat, ItemTag.BreastPump]

func getUnriggedParts(_character):
	var howFilled = fluids.getFluidAmount()/fluids.getCapacity()
	
	if(howFilled <= 0.0):
		return {
			"breastpump": ["res://Inventory/UnriggedModels/BreastPump/BreastPumpAdvEmpty.tscn"],
		}
	elif(howFilled < 0.3):
		return {
			"breastpump": ["res://Inventory/UnriggedModels/BreastPump/BreastPumpAdvLittle.tscn"],
		}
	elif(howFilled < 0.75):
		return {
			"breastpump": ["res://Inventory/UnriggedModels/BreastPump/BreastPumpAdvHalf.tscn"],
		}
	else:
		return {
			"breastpump": ["res://Inventory/UnriggedModels/BreastPump/BreastPumpAdvFull.tscn"],
		}

func generateFluids():
	.generateFluids()
	fluids.setCapacity(20000.0)
