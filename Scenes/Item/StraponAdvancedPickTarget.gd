extends "res://Scenes/SceneBase.gd"

var uniqueItemID = ""
var item: ItemBase
var allCharsWithPanties:Array

func _init():
	sceneID = "StraponAdvancedPickTarget"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]
	
func _reactInit():
	if(uniqueItemID == null || uniqueItemID == ""):
		return
		
	item = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
	allCharsWithPanties = getNpcsWithPortalPanties()
	GM.pc.unequipStrapon()
	GM.pc.getInventory().removeItem(item)
	GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(item)

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand", {bodyState={naked=true}})
		saynn("Pick which character's penis should this advanced strapon use.")
		
		var curID:String = item.penisID
		if(curID.empty()):
			saynn("Current target: None (Will use a hologram strapon)")
		else:
			var theChar:BaseCharacter = getCharacter(curID)
			if(theChar):
				saynn("Current target: "+str(theChar.getName()))
			else:
				saynn("Current target: !ERROR!")
		
		addButton("Close", "Enough messing around", "endthescene")
		if(!curID.empty()):
			addButton("Clear", "Use the hologram strapon", "select", [""])
		var _haveAny:bool = false
		for theChar in allCharsWithPanties:
			#if(!charCanUsePenis(theChar)):
			#	continue
			addButton(theChar.getName(), "Select this character's penis!", "select", [theChar.getID()])
			_haveAny = true
		if(!_haveAny):
			saynn("- There aren't any characters detected that are wearing portal panties or a portal chastity cage.")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		GM.pc.unequipStrapon()
		endScene()
		return
	if(_action == "select"):
		item.setPenisTarget(_args[0])
		return
	
	setState(_action)

func getNpcsWithPortalPanties():
	return GM.main.calculateNpcsWithPortalPanties()

func charCanUsePenis(character):
	return character.canUsePenisThroughPortal()

func saveData():
	var data = .saveData()
	
	data["uniqueItemID"] = uniqueItemID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	uniqueItemID = SAVE.loadVar(data, "uniqueItemID", "")
	item = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
