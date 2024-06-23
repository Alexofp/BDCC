extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var thePrefix = ""

var data = {
	InventorySlot.Body: {id="inmateuniform"},
}
var values = []

var singleSlotScene = preload("res://Game/Datapacks/UI/PackVarUIs/EquipItemVarUI.tscn")
onready var inv_list = $InvList

func setInvData(_value):
	data = _value
	updateValues()

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		thePrefix = _dataLine["name"]
		$Label.text = thePrefix
	
	if(_dataLine.has("value")):
		setInvData(_dataLine["value"])
	else:
		updateValues()

func updateValues():
	Util.delete_children(inv_list)
	
	for inventorySlot in InventorySlot.getAll():
		var newSlot = singleSlotScene.instance()
		inv_list.add_child(newSlot)
		newSlot.setData({
			"name": InventorySlot.getVisibleName(inventorySlot),
			"slot": inventorySlot,
			"value": data[inventorySlot] if data.has(inventorySlot) else {id=""},
		})
		newSlot.id = inventorySlot
		newSlot.connect("onValueChange", self, "onInvSlotChanged")

func onInvSlotChanged(slotID, newdata):
	if(newdata["id"] == ""):
		if(data.has(slotID)):
			data.erase(slotID)
			triggerChange(data.duplicate())
		return
	data[slotID] = newdata
	triggerChange(data.duplicate())
