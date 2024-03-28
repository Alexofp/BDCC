extends ItemBase

func _init():
	id = "inmatecollar"

func getVisibleName():
	return "Inmate collar"
	
func getDescription():
	return "Bulky and very uncomfortable collar made out of casted iron. Has a magnetic lock and a constantly blinking red light."

func getClothingSlot():
	return InventorySlot.Neck

func getBuffs():
	return [
		]

func getTakeOffScene():
	return "CollarTuggingScene"

func getTags():
	return [ItemTag.AllowsEnslaving]


func isImportant():
	return true

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintUnremovable.new()

func getUnriggedParts(_character):
	return {
		"neck": ["res://Inventory/UnriggedModels/Collar/CollarModel.tscn"],
		#"wrist.L": ["res://Inventory/UnriggedModels/Cuff/CuffModel.tscn"],
		#"wrist.R": ["res://Inventory/UnriggedModels/Cuff/CuffModel.tscn"],
		#"ankle.L": ["res://Inventory/UnriggedModels/Cuff/CuffModel.tscn"],
		#"ankle.R": ["res://Inventory/UnriggedModels/Cuff/CuffModel.tscn"],
	}

#func getRiggedParts(_character):
#	return {
#		"harness": "res://Inventory/RiggedModels/RopeHarness/RopeHarness.tscn",
#	}

#func getRiggedParts(_character):
#	return {
#		"asd": "res://Player/Player3D/Parts/Legs/DigiLegs/DigiLegs.tscn",
#		"asd2": "res://Player/Player3D/Parts/Arms/HumanArms/HumanArms.tscn",
#	}
#
#func getHidesParts(_character):
#	return {
#		BodypartSlot.Penis: true,
#	}

func getInventoryImage():
	return "res://Images/Items/bdsm/collar.png"
