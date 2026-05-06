extends SceneBase
class_name RecruitSceneBase

var RC:RecruitContext
var c1:int = 0
var c2:int = 0
var c3:int = 0
var success:bool = false
var perfect:bool = false
var recStrapons:Dictionary = {} # char id = unique item id
var resStraponDefault:Dictionary = {} # char id = true/false

func _initScene(_args = []):
	RC = _args[0]
	c1 = RC.choices[0]
	c2 = RC.choices[1]
	c3 = RC.choices[2]
	success = RC.success
	perfect = RC.perfect

func saveData():
	var data = .saveData()
	
	data["RC"] = RC.saveData()
	data["recStrapons"] = recStrapons
	data["resStraponDefault"] = resStraponDefault
	
	return data

func loadData(data):
	.loadData(data)

	RC = RecruitContext.new()
	RC.loadData(SAVE.loadVar(data, "RC", {}))
	c1 = RC.choices[0]
	c2 = RC.choices[1]
	c3 = RC.choices[2]
	success = RC.success
	perfect = RC.perfect
	
	recStrapons = SAVE.loadVar(data, "recStrapons", {})
	resStraponDefault = SAVE.loadVar(data, "resStraponDefault", {})


func t3(_choiceIndx:int, _text1:String, _text2:String, _text3:String) -> String:
	return RC.t3(_choiceIndx, _text1, _text2, _text3)

func ch1(_text1:String, _text2:String, _text3:String) -> String:
	return RC.ch1(_text1, _text2, _text3)

func ch2(_text1:String, _text2:String, _text3:String) -> String:
	return RC.ch2(_text1, _text2, _text3)

func ch3(_text1:String, _text2:String, _text3:String) -> String:
	return RC.ch3(_text1, _text2, _text3)

func extra(_id:String, _default = ""):
	return RC.extra(_id, _default)

func recWearStrapon(_charID:String = "pc", _straponExtra:String = "strapon", _defaultStrapon:String = "Strapon"):
	var itemUniqueID:String = RC.extra(_straponExtra, "")
	
	if(itemUniqueID == "default"):
		var theStrapon = GlobalRegistry.createItem(_defaultStrapon)
		getCharacter(_charID).getInventory().forceEquipStoreOtherUnlessRestraint(theStrapon)
		recStrapons[_charID] = theStrapon.uniqueID
		resStraponDefault[_charID] = true
	else:
		var theStrapon = GM.pc.getInventory().getItemByUniqueID(itemUniqueID)
		GM.pc.getInventory().removeItem(theStrapon)
		getCharacter(_charID).getInventory().forceEquipStoreOtherUnlessRestraint(theStrapon)
		recStrapons[_charID] = theStrapon.uniqueID
		resStraponDefault[_charID] = false

func recRemoveStrapons():
	for theCharID in recStrapons.keys():
		var theItemUniqueID:String = recStrapons[theCharID]
		var theIsDefault:bool = resStraponDefault.get(theCharID, false)
		
		var theItem = GlobalRegistry.getCharacter(theCharID).getInventory().getItemByUniqueID(theItemUniqueID)
		GlobalRegistry.getCharacter(theCharID).getInventory().removeEquippedItem(theItem)
		if(!theIsDefault):
			GM.pc.getInventory().addItem(theItem)
	recStrapons.clear()
	resStraponDefault.clear()
