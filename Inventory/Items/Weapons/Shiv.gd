extends ItemBase

var charges:int = 2

func useCharge(amount = 1):
	charges -= amount
	if(charges <= 0):
		destroyMe()

func getCharges():
	return charges

func getDamageRange():
	return [50, 60]

func _init():
	id = "Shiv"

func getVisibleName():
	return "Shiv"

func getDescription():
	var text = "An improvised weapon with a sharp tip.\nDoes "+Util.dmgRangeArrayStr(getDamageRange())+" physical damage and causes bleeding.\nHas enough durability for "+str(charges)+" "+Util.multipleOrSingularEnding(charges, "use")

	return text

func saveData():
	var data = .saveData()
	
	data["charges"] = charges
	
	return data
	
func loadData(data):
	.loadData(data)
	
	charges = SAVE.loadVar(data, "charges", 2)

func getAttacks():
	return ["ShivPCAttack"]

func getTags():
	return [ItemTag.Illegal]

func getItemCategory():
	return ItemCategory.Weapons

func getInventoryImage():
	return "res://Images/Items/weapon/shiv.png"
