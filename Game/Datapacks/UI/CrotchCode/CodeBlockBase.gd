extends Reference
class_name CodeBlockBase

var id = "error"
var lineNum:int = -1

func getCategories():
	return [""]

func getMainCategory():
	var theCats = getCategories()
	if(theCats.size() > 0):
		return theCats[0]
	return ""

func updateEditor(_editor):
	pass

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	pass

func getValue(_contex:CodeContex):
	return execute(_contex)

func getTemplate():
	return [
		{
			type = "label",
			text = "MEOW",
		},
	]

func shouldExpandTemplate():
	return false

func getSlot(_id):
	return null

func hidesNextBlockAdder():
	return getType() == CrotchBlocks.RETURNCALL

const savedSlotTypes = ["slot", "slot_list", "anim", "button_checks", "image"]

func saveData():
	var data = {}
	
	var slotData = {}
	for templateLine in getTemplate():
		if(templateLine["type"] in savedSlotTypes):
			slotData[templateLine["id"]] = getSlot(templateLine["id"]).saveData()
	data["slots"] = slotData
	
	return data

func loadData(_data):
	var slotData = loadVar(_data, "slots", {})
	
	for templateLine in getTemplate():
		if(templateLine["type"] in savedSlotTypes):
			var theSlot = getSlot(templateLine["id"])
			theSlot.loadData(loadVar(slotData, templateLine["id"], {}))

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue

func updateVisualSlot(_editor, _id, _visSlot):
	pass

func applyRawValue(_id, _value):
	pass

func throwError(_contex:CodeContex, errorText):
	_contex.throwError(self, errorText)

func calcLineNums(_contex:CodeContex):
	lineNum = _contex.curLine
	
	for templateLine in getTemplate():
		if(templateLine["type"] == "slot"):
			getSlot(templateLine["id"]).calcLineNums(_contex)
		if(templateLine["type"] == "slot_list"):
			#_contex.curLine += 1
			getSlot(templateLine["id"]).calcLineNums(_contex)

func isNumber(val):
	if((val is float || val is int)):
		return true
	return false

func isString(val):
	if(val is String):
		return true
	return false

func getSupportedEditors():
	var mainCategory = getMainCategory()
	if(mainCategory in ["Scene"]):
		return CrotchBlockEditorType.SCENE
	if(mainCategory in ["Event"]):
		return CrotchBlockEditorType.EVENT
	if(mainCategory in ["Quest"]):
		return CrotchBlockEditorType.QUEST
	return CrotchBlockEditorType.ALL

const themeVars = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockVariables.tres")
const themeOutput = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockOutput.tres")
const themeMath = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockMath.tres")
const themeLogic = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockLogic.tres")
const themeControl = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockControl.tres")
const themeFlags = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockFlags.tres")
const themeGame = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockGame.tres")
const themeEvent = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockEvent.tres")
const themeQuest = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockQuest.tres")
const themeRNG = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockRNG.tres")
const themeLewd = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockLewd.tres")
const themeInventory = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockInventory.tres")
const themeNPC = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockNPC.tres")
const themeString = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockString.tres")
const themeFlagGlobal = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockFlagsGlobal.tres")
const themeTFs = preload("res://Game/Datapacks/UI/CrotchCode/VisualBlockThemes/BlockTFs.tres")

func getVisualBlockTheme():
	var mainCategory = getMainCategory()
	if(mainCategory in ["Output"]):
		return themeOutput
	if(mainCategory in ["Logic"]):
		return themeLogic
	if(mainCategory in ["Variables"]):
		return themeVars
	if(mainCategory in ["Math"]):
		return themeMath
	if(mainCategory in ["Flags"]):
		return themeFlags
	if(mainCategory in ["Game"]):
		return themeGame
	if(mainCategory in ["Event"]):
		return themeEvent
	if(mainCategory in ["Quest"]):
		return themeQuest
	if(mainCategory in ["RNG"]):
		return themeRNG
	if(mainCategory in ["Lewd"]):
		return themeLewd
	if(mainCategory in ["Inventory"]):
		return themeInventory
	if(mainCategory in ["NPC Manipulation"]):
		return themeNPC
	if(mainCategory in ["Strings"]):
		return themeString
	if(mainCategory in ["Transformation"]):
		return themeTFs
	
	return themeOutput

func makeSureRunMode(_contex:CodeContex):
	if(!_contex.isInRunMode()):
		throwError(_contex, "This code block only supports getting executed in the 'Run' mode (OUTSIDE of addButton/runScene calls)")
		return false
	return true

func makeSureReactMode(_contex:CodeContex):
	if(!_contex.isInReactMode()):
		throwError(_contex, "This code block only supports getting executed in the 'React' mode (INSIDE of addButton/runScene calls)")
		return false
	return true

func hasSlotObject(theSlot) -> bool:
	for entry in getTemplate():
		if(entry["type"] in ["slot", "slot_list"]):
			var anSlot = getSlot(entry["id"])
			
			if(theSlot == anSlot):
				return true
			
			if(entry["type"] == "slot"):
				if(anSlot.block != null && anSlot.block.hasSlotObject(theSlot)):
					return true
			elif(entry["type"] == "slot_list"):
				for theBlock in anSlot.blocks:
					if(theBlock.hasSlotObject(theSlot)):
						return true
	return false
