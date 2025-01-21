extends SceneBase

var genericInventoryScreenScene = preload("res://UI/Inventory/GenericInventoryScreen.tscn")
var colorPickerScene = preload("res://UI/ColorPickerWidget.tscn")


var pickedUpgrade:String = ""
var pickedTF:String = ""
var pickedTFOption:String = ""
var pickedArgs:Dictionary = {}

func _init():
	sceneID = "ChemistryLabScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		
		saynn("You stand inside the laboratory.")
		
		sayn("Science points: " + str(GM.main.SCI.getSciencePoints()))
		sayn("Unlocked transformation pills: "+str(GM.main.SCI.getUnlockedStrangePillsCount())+"/"+str(GM.main.SCI.getTotalStrangePillCount()))
		sayn("Tested transformation pills: "+str(GM.main.SCI.getTestedStrangePillsCount())+"/"+str(GM.main.SCI.getTotalStrangePillCount()))
		saynn("Upgrades: "+str(GM.main.SCI.getUpgradeCount())+"/"+str(GM.main.SCI.getTotalUpgradeCount()))
		
		sayTanksVolume()
		
		addButton("Create", "See what you can create in this lab", "create_menu")
		addButton("Fluid tanks", "See what you can do with the fluid tanks", "fluid_tanks")
		addButton("Upgrades", "Look at the list of possible upgrades", "upgrades")
		addButton("Database", "Look at the database of everything that you have unlocked or researched", "database")
		if(GM.main.SCI.doesPCHaveUnknownStrangePills()):
			addButton("Strange pill!", "Make Eliza scan the strange pill that you have", "scan_strange_pill")
		addButton("Leave", "Time to go", "endthescene")
	
	if(state == "create_menu"):
		addButton("Back", "Back to the previous menu", "")
		
		#var canConfigure:bool = GM.main.SCI.canConfigureDrugs()
		
		var entries:Dictionary = {}
		
		for tfID in GlobalRegistry.getTransformationRefs():
			if(!GM.main.SCI.isTransformationUnlocked(tfID)):
				continue
			var canMakeResult:Array = GM.main.SCI.canMakePillResult(tfID)
			var canMake:bool = canMakeResult[0]
			var tf:TFBase = GlobalRegistry.getTransformationRef(tfID)
			
			var desc:String = GM.main.SCI.getMakePillDescription(tfID)
			
			var theActions:Array = []
			if(canMake):
				theActions = [["make", "Make"]]
				if(tf.getPillCanConfigure() && GM.main.SCI.canConfigureDrugs()):
					theActions = [["custom", "Custom"], ["make", "Make"]]
			
			entries[tfID] = {
				name = tf.getPillName()+" pill",
				desc = desc+("\n\n[color=red]"+canMakeResult[1]+"[/color]" if !canMake else ""),
				actions = theActions,
			}
		
		var crafts:Dictionary = GM.main.SCI.getCraftableItems()
		for itemID in crafts:
			var craftInfo:Dictionary = crafts[itemID]
			var itemRef:ItemBase = GlobalRegistry.getItemRef(itemID)
			if(itemRef == null):
				continue
			
			var itemName:String = itemRef.getVisibleName()
			var itemDesc:String = itemRef.getVisisbleDescription()
			var itemFluidsReq:String = GM.main.SCI.canMakeGetFluidsDescription(craftInfo["fluids"])
			var canMakeResult:Array = GM.main.SCI.canMakeHasFluids(craftInfo["fluids"])
			var canMake:bool = canMakeResult[0]
			
			var theActions:Array = []
			if(canMake):
				theActions = [["makeCraft", "Make"]]
			
			entries[itemID] = {
				name = itemName,
				desc = itemDesc+"\n\nRequired:\n"+itemFluidsReq+("\n\n[color=red]"+canMakeResult[1]+"[/color]" if !canMake else ""),
				actions = theActions,
			}
			
		var inventory = genericInventoryScreenScene.instance()
		GM.ui.addFullScreenCustomControl("inventory", inventory)
		inventory.setRightPanelStretchRation(0.75)
		inventory.setEntries(entries)
		var _ok = inventory.connect("onInteractWith", self, "onMakeInteract")
	
	if(state == "database"):
		addButton("Back", "Back to the previous menu", "")
		
		var entries:Dictionary = {}
		entries["1"] = {
			name = "= UPGRADES =",
			desc = "This list shows the upgrades that you have unlocked",
		}
		
		var upgradesInfo:Dictionary = GM.main.SCI.getUpgrades()
		var hasAnyUnlocked:bool = false
		#sayn("Unlocked upgrades:")
		for upgradeID in upgradesInfo:
			if(!GM.main.SCI.hasUpgrade(upgradeID)):
				continue
			entries["up_"+upgradeID] = {
				name = upgradesInfo[upgradeID]["name"],
				desc = upgradesInfo[upgradeID]["desc"],
			}
			#sayn(" - "+upgradesInfo[upgradeID]["name"])
			hasAnyUnlocked = true
		if(!hasAnyUnlocked):
			#sayn(" - No upgrades found")
			entries["noup_"] = {
				name = "No upgrades found",
				desc = "Get some upgrades first!",
			}
		#sayn("")
		
		entries["2"] = {
			name = "= DRUGS =",
			desc = "This list shows the special drugs that you have found",
		}
		#sayn("Transformation drugs:")
		var _i:int = 1
		for tfID in GlobalRegistry.getTransformationRefs():
			var tf:TFBase = GlobalRegistry.getTransformationRef(tfID)
			if(!tf.canUnlockAsPill()):
				continue
			var isUnlocked:bool = GM.main.SCI.isTransformationUnlocked(tfID)
			var isTested:bool = isUnlocked && GM.main.SCI.isTransformationTested(tfID)
			
			if(!isUnlocked):
				#sayn(" - "+str(_i)+": Unknown")
				entries["drug_"+tfID] = {
					name = str(_i)+": Unknown",
					desc = "You haven't found this drug yet",
				}
			else:
				#sayn(" - "+str(_i)+": "+(tf.getPillName() if isUnlocked else "Unknown")+". "+(tf.getName()+". Untested" if !isTested else tf.getName()+". Tested"))
				
				var drugDesc:String = ""
				drugDesc += "Pill name: "+tf.getPillName()
				drugDesc += "\nPossible effect: "+tf.getName()
				drugDesc += "\nStatus: "+("[color=red]UNTESTED[/color]" if !isTested else "[color=green]TESTED[/color]")
				drugDesc += "\n\nFull description:"
				if(isTested):
					drugDesc += "\n"+tf.getPillDatabaseDesc()
				else:
					drugDesc += "\nNot available, testing is required"
				
				entries["drug_"+tfID] = {
					name = str(_i)+": "+tf.getPillName(),
					desc = drugDesc,
				}
			
			#if(isTested):
			#	addButton(tf.getPillName(), "See detailed info about this pill", "detailedViewTF", [tfID])
			
			_i += 1
			
			

			
		var inventory = genericInventoryScreenScene.instance()
		GM.ui.addFullScreenCustomControl("inventory", inventory)
		inventory.setRightPanelStretchRation(0.75)
		inventory.setEntries(entries)
		#var _ok = inventory.connect("onItemSelected", self, "onInventoryItemSelected")
		#var _ok2 = inventory.connect("onInteractWith", self, "onInventoryItemInteracted")
		
	
	if(state == "upgrades"):
		var upgradesInfo:Dictionary = GM.main.SCI.getUpgrades()
		
		#saynn("Here is a list of upgrades that are currently available. Select any upgrade to see more information about it.")
		
		var hasAnyUpgrades:bool = false
		
		var entries:Dictionary = {}
		
		addButton("Back", "Back to the previous menu", "")
		for upgradeID in upgradesInfo:
			if(GM.main.SCI.hasUpgrade(upgradeID)):
				continue
			if(!GM.main.SCI.isUpgradeVisible(upgradeID)):
				continue
			hasAnyUpgrades = true
			var upgradeInfo:Dictionary = upgradesInfo[upgradeID]
			#sayn("- "+upgradeInfo["name"]+": "+str(upgradeInfo["cost"])+" science points")
			#addButton(upgradeInfo["name"], "See info about this upgrade", "lookAtUpgrade", [upgradeID])
			
			
			var canBuy:bool = upgradeInfo["cost"] <= GM.main.SCI.getPoints()
			var upgradeDesc:String = ""
			upgradeDesc += upgradeInfo["desc"]
			upgradeDesc += "\n\nCost: [color="+("red" if !canBuy else "green")+"]"+str(upgradeInfo["cost"])+" science points[/color]"
			
			entries[upgradeID] = {
				name = upgradeInfo["name"],
				desc = upgradeDesc,
				actions = [
					["buy", "Unlock"]
				] if canBuy else [],
			}
		if(!hasAnyUpgrades):
			#sayn("- No upgrades left to unlock! AlphaCorp is proud of you!")
			entries["1"] = {
				name = "= No Upgrades Left =",
				desc = "No upgrades left to unlock! AlphaCorp is proud of you!",
			}
	
		var inventory = genericInventoryScreenScene.instance()
		GM.ui.addFullScreenCustomControl("inventory", inventory)
		inventory.setRightPanelStretchRation(0.75)
		inventory.setEntries(entries)
		var _ok = inventory.connect("onInteractWith", self, "onUpgradesInteract")
	
	if(state == "lookAtUpgrade"):
		var upgradeInfo:Dictionary = GM.main.SCI.getUpgrades()[pickedUpgrade]
		
		saynn("Upgrade name: "+upgradeInfo["name"])
		sayn("Description:")
		saynn(upgradeInfo["desc"])
		sayn("Cost: "+str(upgradeInfo["cost"])+" science points")
		sayn("You currently have "+str(GM.main.SCI.getPoints())+" science points")
		
		addButton("Back", "Back to the previous menu", "upgrades")
		if(GM.main.SCI.getPoints() >= upgradeInfo["cost"]):
			addButton("Buy", "Spend "+str(upgradeInfo["cost"])+" science points to get this upgrade", "doBuyUpgrade", [pickedUpgrade])
		else:
			addDisabledButton("Buy", "You don't have enough science points")
	
	if(state == "detailedViewTF"):
		var tf:TFBase = GlobalRegistry.getTransformationRef(pickedTF)
		if(tf == null):
			addButton("Back", "Back to the previous menu", "database")
			return
		
		sayn("Pill name: "+tf.getPillName())
		saynn("Short description: "+tf.getName())
		sayn("Full descriptiopn:")
		saynn(tf.getPillDatabaseDesc())
		
		addButton("Back", "Back to the previous menu", "database")
	
	if(state == "after_buy"):
		var upgradeInfo:Dictionary = GM.main.SCI.getUpgrades()[pickedUpgrade]
		saynn("You unlocked the '"+upgradeInfo["name"]+"' upgrade!")
		addButton("Continue", "See what happens next", "upgrades")
		
	if(state == "configuring_drug"):
		var tf:TFBase = GlobalRegistry.getTransformationRef(pickedTF)
		
		saynn("Here you can configure your pill before creating it.")
		
		sayn("Pill name: "+tf.getPillName())
		saynn("Description: "+tf.getName())
		
		addButton("Create", "Create a pill with these options", "do_create_configured_pill")
		
		sayn("Settings:")
		var _i:int = 1
		var options:Dictionary = tf.getPillOptions()
		for optionID in options:
			var option:Dictionary = options[optionID]
			
			if(option.has("color") && option["color"]):
				sayn(str(_i)+". "+option["name"]+" = [color="+pickedArgs[optionID]+"]"+pickedArgs[optionID]+"[/color]")
			else:
				var currentOptionName:String = "???"
				for valueEntry in option["values"]:
					if(valueEntry[0] == pickedArgs[optionID]):
						currentOptionName = valueEntry[1]
				
				sayn(str(_i)+". "+option["name"]+" = "+currentOptionName)
			saynn(option["desc"])
			addButton(option["name"], option["desc"], "configure_value_menu", [optionID])
			
		
		addButton("CANCEL", "You changed your mind!", "")
	
	if(state == "configure_value_menu"):
		var tf:TFBase = GlobalRegistry.getTransformationRef(pickedTF)
		var options:Dictionary = tf.getPillOptions()
		var option:Dictionary = options[pickedTFOption]
		
		if(option.has("color") && option["color"]):
			var colorPicker = colorPickerScene.instance()
			GM.ui.addCustomControl("colorpicker", colorPicker)
			colorPicker.setCurrentColor(Color(pickedArgs[pickedTFOption]))
			
			addButton("Apply", "Select this color", "set_value_configure_color")
		else:
			var currentOptionName:String = "???"
			for valueEntry in option["values"]:
				if(valueEntry[0] == pickedArgs[pickedTFOption]):
					currentOptionName = valueEntry[1]
			
			sayn("Option name: "+option["name"])
			sayn("Description: "+option["desc"])
			saynn("Current setting: "+currentOptionName)
			
			saynn("Pick a new setting for this option!")
			
			for valueEntry in option["values"]:
				addButton(valueEntry[1], "Set the setting to this value", "set_value_configure", [valueEntry[0]])
			
		addButton("BACK", "You changed your mind!", "configuring_drug")
		
func onUpgradesInteract(_upgradeID:String, _id, _args):
	pickedUpgrade = _upgradeID
	GM.main.pickOption("doBuyUpgrade", [_upgradeID])
		
func onMakeInteract(_upgradeID:String, _id, _args):
	GM.main.pickOption("doMakeTFPill", [_upgradeID, _id])
	
func sayTanksVolume():
	var storedFluids:Dictionary = GM.main.SCI.getStoredFluidsWithDefauls()
	
	sayn("Fluid tanks contents:")
	for fluidID in storedFluids:
		var fluidAmount:float = storedFluids[fluidID]
		var fluidLimit:float = GM.main.SCI.getStoredFluidLimit(fluidID)
		var fluidName:String = "Unknown fluid"
		
		var fluid:FluidBase = GlobalRegistry.getFluid(fluidID)
		if(fluid != null):
			fluidName = fluid.getVisibleName()
		
		sayn("- "+fluidName+": "+str(Util.roundF(fluidAmount, 1))+"/"+str(Util.roundF(fluidLimit, 1))+"ml")
	sayn("")
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "lookAtUpgrade"):
		pickedUpgrade = _args[0]
	if(_action == "detailedViewTF"):
		pickedTF = _args[0]
	if(_action == "configure_value_menu"):
		pickedTFOption = _args[0]
	if(_action == "set_value_configure"):
		pickedArgs[pickedTFOption] = _args[0]
		setState("configuring_drug")
		return
	if(_action == "set_value_configure_color"):
		var colorPicker = GM.ui.getCustomControl("colorpicker")
		pickedArgs[pickedTFOption] = "#"+colorPicker.getCurrentColor().to_html(false)
		setState("configuring_drug")
		return
	if(_action == "doBuyUpgrade"):
		var upgradeInfo:Dictionary = GM.main.SCI.getUpgrades()[pickedUpgrade]
		GM.main.SCI.addPoints(-upgradeInfo["cost"])
		GM.main.SCI.unlockUpgrade(pickedUpgrade)
		#addMessage("You unlocked the '"+upgradeInfo["name"]+"' upgrade!")
		#setState("upgrades")
		setState("after_buy")
		return
	if(_action == "doMakeTFPill"):
		var tfID:String = _args[0]
		
		if(_args[1] == "makeCraft"):
			var theCrafts:Dictionary = GM.main.SCI.getCraftableItems()
			var craftInfo:Dictionary = theCrafts[tfID]
			var itemRef:ItemBase = GlobalRegistry.getItemRef(tfID)
			
			GM.main.SCI.useFluidsToMakeSomething(craftInfo["fluids"])
			
			addMessage("You have create '"+itemRef.getVisibleName()+"'!")
			GM.pc.getInventory().addItem(GlobalRegistry.createItem(tfID))
			setState("")
			return
		
		var tf:TFBase = GlobalRegistry.getTransformationRef(tfID)
		if(_args[1] == "custom" && GM.main.SCI.canConfigureDrugs() && tf.getPillCanConfigure()):
			pickedTF = tfID
			pickedArgs = {}
			var theOptions:Dictionary = tf.getPillOptions()
			for optionID in theOptions:
				pickedArgs[optionID] = theOptions[optionID]["value"]
			setState("configuring_drug")
			return
		
		var newPill:ItemBase = GM.main.SCI.useFluidsToMakePill(tfID)
		if(newPill != null):
			addMessage("You have create a "+tf.getPillName()+" pill!")
			GM.pc.getInventory().addItem(newPill)
		
		setState("")
		return
	if(_action == "do_create_configured_pill"):
		var tfID:String = pickedTF
		
		var newPill:ItemBase = GM.main.SCI.useFluidsToMakePill(tfID, pickedArgs)
		if(newPill != null):
			var tf:TFBase = GlobalRegistry.getTransformationRef(tfID)
			var configDescAr:Array = []
			var options:Dictionary = tf.getPillOptions()
			for optionID in options:
				var option:Dictionary = options[optionID]
				
				if(option.has("color") && option["color"]):
					configDescAr.append(option["name"]+": [color="+pickedArgs[optionID]+"]"+pickedArgs[optionID]+"[/color]")
				else:
					var currentOptionName:String = "???"
					for valueEntry in option["values"]:
						if(valueEntry[0] == pickedArgs[optionID]):
							currentOptionName = valueEntry[1]
					configDescAr.append(option["name"]+": "+currentOptionName)
			newPill.setConfigDesc(Util.join(configDescAr, "\n"))
			
			addMessage("You have create a "+tf.getPillName()+" pill!")
			GM.pc.getInventory().addItem(newPill)
		
		setState("")
		return
		
	setState(_action)


func getDebugActions():
	var fluidValues:Array = []
	for fluidID in GlobalRegistry.getFluids():
		fluidValues.append([fluidID, fluidID])
	var tfValues:Array = []
	for tfID in GlobalRegistry.getTransformationRefs():
		var tf:TFBase = GlobalRegistry.getTransformationRef(tfID)
		tfValues.append([tfID, tf.getPillName()+" ("+tf.getName()+")"])
	
	return [
	{
		"id": "addPoints",
		"name": "Add Science",
		"args": [
			{
				"id": "points",
				"name": "Points",
				"type": "number",
				"value": 100,
			},
		],
	},
	{
		"id": "addFluid",
		"name": "Add Fluid",
		"args": [
			{
				"id": "fluidID",
				"name": "Fluid",
				"type": "list",
				"value": "Milk",
				"values": fluidValues,
			},
			{
				"id": "ml",
				"name": "How much ml",
				"type": "number",
				"value": 100,
			},
		],
	},
	{
		"id": "unlockTF",
		"name": "Unlock TF",
		"args": [
			{
				"id": "tf",
				"name": "TF id",
				"type": "list",
				"value": "Demonification",
				"values": tfValues,
			},
		],
	},
	{
		"id": "testTF",
		"name": "Test TF",
		"args": [
			{
				"id": "tf",
				"name": "TF id",
				"type": "list",
				"value": "Demonification",
				"values": tfValues,
			},
		],
	},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "addPoints"):
		GM.main.SCI.addPoints(_args["points"])
	if(_id == "addFluid"):
		GM.main.SCI.addFluid(_args["fluidID"], _args["ml"])
	if(_id == "unlockTF"):
		GM.main.SCI.doUnlockTF(_args["tf"])
	if(_id == "testTF"):
		GM.main.SCI.doUnlockTF(_args["tf"])
		GM.main.SCI.doTestTF(_args["tf"])

func saveData():
	var data = .saveData()
	
	data["pickedUpgrade"] = pickedUpgrade
	data["pickedTF"] = pickedTF
	data["pickedTFOption"] = pickedTFOption
	data["pickedArgs"] = pickedArgs
	
	return data
	
func loadData(data):
	.loadData(data)
	
	pickedUpgrade = SAVE.loadVar(data, "pickedUpgrade", "")
	pickedTF = SAVE.loadVar(data, "pickedTF", "")
	pickedTFOption = SAVE.loadVar(data, "pickedTFOption", "")
	pickedArgs = SAVE.loadVar(data, "pickedArgs", {})
