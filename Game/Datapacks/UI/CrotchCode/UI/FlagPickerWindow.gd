extends ConfirmationDialog

onready var source_list = $HBoxContainer2/SourceList
onready var flag_list = $HBoxContainer2/FlagList

var flagID:String = ""
var flagSource:String = ""
var sourceIsGlobal:bool = true
var sourceIsModule:bool = false
var sourceIsDatapack:bool = false

var sources:Array = []

var possibleFlags:Array = []

signal onCancelPressed(window)
signal onFlagSelected(window, flagID)

func _ready():
	updateSources()

func _on_FlagPickerWindow_popup_hide():
	emit_signal("onCancelPressed", self)

func setFlag(newFlagID:String, updatePos:bool = true):
	flagID = newFlagID
	
	sourceIsGlobal = false
	sourceIsModule = false
	sourceIsDatapack = false
	
	if("." in flagID):
		sourceIsModule = true
		
		var splitData:Array = Util.splitOnFirst(flagID, ".")
		flagSource = splitData[0]
		flagID = splitData[1]
	elif(":" in flagID):
		sourceIsDatapack = true

		var splitData:Array = Util.splitOnFirst(flagID, ":")
		flagSource = splitData[0]
		flagID = splitData[1]
	else:
		flagSource = ""
		sourceIsGlobal = true
	
	if(updatePos):
		updatePossibleFlags()
	updateSourcesList()
	updateFlagList()

func updateSources():
	sources.clear()
	sources.append(["", "g"])
	
	for moduleID in GlobalRegistry.getModules():
		var theModule = GlobalRegistry.getModule(moduleID)
		if(!theModule.getFlagsCache().empty()):
			sources.append([moduleID, "m"])
	
	for datapackID in GlobalRegistry.getDatapacks():
		var theDatapack:Datapack = GlobalRegistry.getDatapack(datapackID)
		
		if(!theDatapack.flags.empty()):
			sources.append([datapackID, "d"])
	
	updateSourcesList()

func updateSourcesList():
	var _i:int = 0
	source_list.clear()
	for sourceData in sources:
		if(sourceData[1] == "g"):
			source_list.add_item("GAME FLAGS")
		else:
			source_list.add_item(sourceData[0])
		
		if(sourceData[0] == flagSource):
			source_list.select(_i)
		_i += 1

func updatePossibleFlags():
	possibleFlags.clear()
	
	var theFlags:Array = []
	if(sourceIsGlobal):
		theFlags = Flag.getFlags().keys()
	elif(sourceIsModule):
		theFlags = GlobalRegistry.getModule(flagSource).getFlagsCache().keys()
	elif(sourceIsDatapack):
		theFlags = GlobalRegistry.getDatapack(flagSource).flags.keys()
	for flag in theFlags:
		var finalFlag:String = flag
		if(sourceIsModule):
			finalFlag = flagSource+"."+finalFlag
		elif(sourceIsDatapack):
			finalFlag = flagSource+":"+finalFlag
		
		possibleFlags.append(finalFlag)
		
	
func updateFlagList():
	flag_list.clear()
	
	var theFlags = {}
	if(sourceIsGlobal):
		theFlags = Flag.getFlags()
	elif(sourceIsModule):
		theFlags = GlobalRegistry.getModule(flagSource).getFlagsCache()
	elif(sourceIsDatapack):
		theFlags = GlobalRegistry.getDatapack(flagSource).flags
	
	var _i:int = 0
	for flag in theFlags:
		var flagTypeStr:String = "Unknown"
		if(sourceIsDatapack):
			flagTypeStr = DatapackSceneVarType.getName(theFlags[flag]["type"])
		else:
			flagTypeStr = FlagType.getVisibleName(theFlags[flag]["type"])
		
		flag_list.add_item(flag+" ("+flagTypeStr+")")
		
		if(flagSource == flagSource && flagID == flag):
			flag_list.select(_i)
		
		_i += 1

func _on_SourceList_item_selected(index):
	if(index < 0 || index >= sources.size()):
		return
	
	var selData = sources[index]
	
	flagSource = selData[0]
	sourceIsGlobal = (selData[1] == "g")
	sourceIsModule = (selData[1] == "m")
	sourceIsDatapack = (selData[1] == "d")
	
	updatePossibleFlags()
	
	if(possibleFlags.size() > 0):
		setFlag(possibleFlags[0], false)
	
	updateFlagList()


func _on_FlagList_item_selected(index):
	if(index < 0 || index >= possibleFlags.size()):
		return
	
	setFlag(possibleFlags[index], false)


func _on_FlagPickerWindow_confirmed():
	var finalFlag:String = flagID
	if(sourceIsModule):
		finalFlag = flagSource + "." + flagID
	elif(sourceIsDatapack):
		finalFlag = flagSource + ":" + flagID
	emit_signal("onFlagSelected", self, finalFlag)
