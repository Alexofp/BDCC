extends ItemBase

var charges:int = 3

func useCharge():
	charges -= 1
	if(charges <= 0):
		destroyMe()

func getDamageRange():
	return [30, 40]

func _init():
	id = "StunBaton"

func getVisibleName():
	return "Stun baton"

func getDescription():
	var text = "Guard's default weapon.\nDoes "+Util.dmgRangeArrayStr(getDamageRange())+" physical damage.\nHas "+str(charges)+" "+Util.multipleOrSingularEnding(charges, "charge")+" left"

	return text

func saveData():
	var data = .saveData()
	
	data["charges"] = charges
	
	return data
	
func loadData(data):
	.loadData(data)
	
	charges = SAVE.loadVar(data, "charges", 3)

func getAttacks():
	return ["StunBatonPCAttack"]
