extends SceneBase

var genericInventoryScreenScene = preload("res://UI/Inventory/GenericInventoryScreen.tscn")
var colorPickerScene = preload("res://UI/ColorPickerWidget.tscn")


var pickedUpgrade:String = ""
var pickedTF:String = ""
var pickedTFOption:String = ""
var pickedArgs:Dictionary = {}
var uniqueItemID:String = ""

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
		
		# DEBUG INFO
		if(false):
			sayn("MAX SCIENCE FOR UNLOCKING TFS: "+str(GM.main.SCI.getMaxScienceFromUnlockingTFs()))
			sayn("MAX SCIENCE FOR UNLOCKING+TESTING TFS: "+str(GM.main.SCI.getMaxScienceFromUnlockingAndTestingTFs()))
			saynn("ALL UPGRADES COST: "+str(GM.main.SCI.getAllUpgradesScienceCost()))
		
		addButton("Create", "See what you can create in this lab", "create_menu")
		addButton("Fluids", "See what you can do with the fluid tanks", "fluid_tanks")
		addButton("Upgrades", "Look at the list of possible upgrades", "upgrades")
		addButton("Database", "Look at the database of everything that you have unlocked or researched", "database")
		if(GM.main.SCI.hasUpgrade("bluespaceStash")):
			addButton("Stash", "Look at your personal item stash", "look_stash")
		if(GM.main.SCI.doesPCHaveUnknownStrangePills()):
			addButton("Strange pill!", "Make Eliza scan the strange pill that you have", "scan_strange_pill")
		addButton("Leave", "Time to go", "endthescene")
	
	if(state == "fluid_tanks"):
		playAnimation(StageScene.Solo, "stand")
		sayTanksVolume()
		
		saynn("What do you want to do?")
		
		addButton("Fill", "Fill the tanks with one of your items", "tank_fill_select")
		addButton("Clear", "Select one of the fluid tanks and fully empty it", "tank_clear_select")
		
		if(GM.main.SCI.hasUpgrade("shower1")):
			addButton("Shower", "Take a special shower that will collect all the fluids", "tank_shower")
		if(GM.main.SCI.hasUpgrade("fluidInspector")):
			addButton("Inspect container", "Use the lab's equipment to inspect one of your fluid containers and get full info about its contents", "inspect_select")
		if(GM.main.SCI.hasUpgrade("fluidFilter")):
			addButton("Filter container", "Use the lab's equipment to filter away fluids from one of your fluid containers", "filter_select")
		
		
		addButton("Back", "Back to the previous menu", "")
	
	if(state == "filter_select"):
		addButton("Back", "Back to the previous menu", "fluid_tanks")
		
		saynn("Pick a fluid container that you want to filter. You will be able to remove selected fluids from that container.")
		
		var equippedItems = GM.pc.getInventory().getAllEquippedItems()
		for slot in equippedItems:
			var equippedItem:ItemBase = equippedItems[slot]
			
			if(equippedItem.getFluids() != null && !equippedItem.getFluids().isEmpty()):
				addButton(equippedItem.getStackName(), equippedItem.getVisisbleDescription(), "tank_pickFilter", [equippedItem])
		for theitem in GM.pc.getInventory().getItems():
			if(theitem.getFluids() != null):
				if(theitem.getFluids().isEmpty()):
					#addDisabledButton(theitem.getStackName(), "(This item is empty)\n\n"+theitem.getVisisbleDescription())
					pass
				else:
					addButton(theitem.getStackName(), theitem.getVisisbleDescription(), "tank_pickFilter", [theitem])
	
	if(state == "tank_pickFilter"):
		var item:ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
		if(item == null):
			saynn("ERROR, NO ITEM FOUND.")
			addButton("Continue", "See what happens next", "filter_select")
			return
		var fluids:Fluids = item.getFluids()
		if(fluids == null):
			saynn("ERROR, ITEM HAS NO FLUIDS OBJECT.")
			addButton("Continue", "See what happens next", "filter_select")
			return
		addButton("Back", "Back to the previous menu", "filter_select")
		
		sayn("Container name: "+item.getVisibleName())
		saynn("Capacity: "+str(Util.roundF(fluids.getFluidAmount(), 1))+(("/"+str(Util.roundF(fluids.getCapacity(), 1))) if fluids.isCapacityLimited() else "")+" ml")
		
		if(fluids.isEmpty()):
			saynn("The container is empty!")
		else:
			var fluidByType:Dictionary = fluids.getFluidAmountByType()
			sayn("Found fluids:")
			
			for fluidID in fluidByType:
				var fluidAmount:float = fluidByType[fluidID]
				var fluidOBJ:FluidBase = GlobalRegistry.getFluid(fluidID)
				var fluidName:String = fluidOBJ.getVisibleName() if fluidOBJ != null else fluidID
				
				sayn(" - "+fluidName+": "+str(Util.roundF(fluidAmount, 1))+" ml")
				
				addButton(fluidName, "Remove "+str(Util.roundF(fluidAmount, 1))+" ml of "+fluidName, "do_filter_out", [fluids, fluidID])
				
			sayn("")
			saynn("Select which fluid you want to filter out. The selected fluid will be removed from the container and disposed safely.")
		
	
	if(state == "inspect_select"):
		addButton("Back", "Back to the previous menu", "fluid_tanks")
		
		saynn("Pick a fluid container that you want to inspect. The lab will show you full detailed information about the contents of that item.")
		
		var equippedItems = GM.pc.getInventory().getAllEquippedItems()
		for slot in equippedItems:
			var equippedItem:ItemBase = equippedItems[slot]
			
			if(equippedItem.getFluids() != null && !equippedItem.getFluids().isEmpty()):
				addButton(equippedItem.getStackName(), equippedItem.getVisisbleDescription(), "tank_pickInspect", [equippedItem])
		for theitem in GM.pc.getInventory().getItems():
			if(theitem.getFluids() != null):
				if(theitem.getFluids().isEmpty()):
					#addDisabledButton(theitem.getStackName(), "(This item is empty)\n\n"+theitem.getVisisbleDescription())
					pass
				else:
					addButton(theitem.getStackName(), theitem.getVisisbleDescription(), "tank_pickInspect", [theitem])
		
	if(state == "tank_pickInspect"):
		var item:ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
		if(item == null):
			saynn("ERROR, NO ITEM FOUND.")
			addButton("Continue", "See what happens next", "inspect_select")
			return
		var fluids:Fluids = item.getFluids()
		if(fluids == null):
			saynn("ERROR, ITEM HAS NO FLUIDS OBJECT.")
			addButton("Continue", "See what happens next", "inspect_select")
			return
		
		saynn("You put your container into the scanner and press a button. A computer screen lights up with various info.")
		
		sayn("Container name: "+item.getVisibleName())
		saynn("Capacity: "+str(Util.roundF(fluids.getFluidAmount(), 1))+(("/"+str(Util.roundF(fluids.getCapacity(), 1))) if fluids.isCapacityLimited() else "")+" ml")
		
		saynn("Unique records found: "+str(fluids.contents.size()))
		
		var _i:int = 1
		for recordInfo in fluids.contents:
			var fluidType:String = recordInfo["fluidType"] if recordInfo.has("fluidType") else "ERROR"
			var fluidAmount:float = recordInfo["amount"] if recordInfo.has("amount") else 0.0
			var fluidDNA:FluidDNA = recordInfo["fluidDNA"] if recordInfo.has("fluidDNA") else null
			var fluidOBJ:FluidBase = GlobalRegistry.getFluid(fluidType)
			var fluidName:String = fluidOBJ.getVisibleName() if fluidOBJ != null else fluidType
			
			sayn("Record #"+str(_i))
			sayn("Fluid type: "+fluidName)
			sayn("Amount: "+str(Util.roundF(fluidAmount, 1))+" ml")
			if(fluidDNA == null):
				saynn("No DNA found")
			else:
				var theChar:BaseCharacter = fluidDNA.getCharacter()
				var charName:String = theChar.getName() if theChar != null else "Unknown"
				var theSpeciesRaw:Array = fluidDNA.getSpecies()
				var theSpeciesStr:String = ""
				for species in theSpeciesRaw:
					var theSpeciesObj:Species = GlobalRegistry.getSpecies(species)
					if(theSpeciesObj == null):
						continue
					if(theSpeciesStr != ""):
						theSpeciesStr += ", "
					theSpeciesStr += theSpeciesObj.getVisibleName()
				sayn("DNA found: "+charName)
				sayn("Species: "+theSpeciesStr)
				sayn("Virility: "+str(Util.roundF(fluidDNA.getVirility()*100.0, 1))+"%")
				sayn("")
			
			_i += 1
		
		addButton("Continue", "See what happens next", "inspect_select")
	
	if(state == "tank_fill_select"):
		addButton("Back", "Back to the previous menu", "fluid_tanks")
		saynn("Which item do you want to use to fill the fluid tanks? The selected item will be [b]fully emptied[/b]!")
		
		sayTanksVolume()
		
		var equippedItems = GM.pc.getInventory().getAllEquippedItems()
		for slot in equippedItems:
			var equippedItem:ItemBase = equippedItems[slot]
			
			if(equippedItem.getFluids() != null && !equippedItem.getFluids().isEmpty()):
				addButton(equippedItem.getStackName(), equippedItem.getVisisbleDescription(), "tank_pickFillFrom", [equippedItem])
		for theitem in GM.pc.getInventory().getItems():
			if(theitem.getFluids() != null):
				if(theitem.getFluids().isEmpty()):
					#addDisabledButton(theitem.getStackName(), "(This item is empty)\n\n"+theitem.getVisisbleDescription())
					pass
				else:
					addButton(theitem.getStackName(), theitem.getVisisbleDescription(), "tank_pickFillFrom", [theitem])

	
	if(state == "tank_clear_select"):
		addButton("Back", "Back to the previous menu", "fluid_tanks")
		
		saynn("Which fluid tank do you want to empty? [b]This will fully clear it, removing the fluds of that type from your lab[/b].")
		
		sayTanksVolume()
		
		var storedFluids:Dictionary = GM.main.SCI.getStoredFluids()
		for fluidID in storedFluids:
			var fluidOBJ:FluidBase = GlobalRegistry.getFluid(fluidID)
			var fluidName:String = fluidOBJ.getVisibleName() if fluidOBJ != null else fluidID
			
			addButton(fluidName, "Empty "+str(round(storedFluids[fluidID]))+"ml of "+fluidName, "do_empty_tank", [fluidID])
	
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
			
			if(itemID == "TFPill"):
				itemName = "Strange Pill"
				itemDesc = "Use advanced algorithms to brute-force random molecular structures until we find one that has transformative proporties.\n\nThis pill is guaranteed to be one that hasn't been unlocked yet (Unless you have unlocked all of them already). The cost of this pill will raise each time you make it."
			
			var itemFluidsReq:String = GM.main.SCI.canMakeGetFluidsDescription(craftInfo["fluids"])
			var canMakeResult:Array = GM.main.SCI.canMakeHasFluids(craftInfo["fluids"])
			var canMake:bool = canMakeResult[0]
			
			if(craftInfo.has("science")):
				itemFluidsReq = "Science points: "+str(craftInfo["science"])+"  (You have "+str(GM.main.SCI.getSciencePoints())+")\n"+itemFluidsReq
				if(GM.main.SCI.getPoints() < craftInfo["science"]):
					canMake = false
					if(canMakeResult[1] != ""):
						canMakeResult[1] += "\n"
					canMakeResult[1] += "Not enough Science Points"
				
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
		addButton("Replay scene", "Replay one of the old drug-related scene", "replay_menu")
		
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
		var currentDrugAmount:int = GM.main.SCI.getUnlockedStrangePillsCount()
		
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
			upgradeDesc += "\n\nYou have "+str(GM.main.SCI.getPoints())+" science points"
			upgradeDesc += "\nCost: [color="+("red" if !canBuy else "green")+"]"+str(upgradeInfo["cost"])+" science points[/color]"
			if(upgradeInfo.has("drugAmount")):
				var needDrugAmount:int = upgradeInfo["drugAmount"]
				if(currentDrugAmount < needDrugAmount):
					canBuy = false
				upgradeDesc += "\nAmount of drugs unlocked: [color="+("red" if currentDrugAmount < needDrugAmount else "green")+"]"+str(needDrugAmount)+" drug"+("s" if needDrugAmount != 1 else "")+"[/color]"
			
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
		
	if(state == "replay_menu"):
		addButton("Back", "Back to the previous menu", "database")
		saynn("Some transformation drugs have unique Eliza sex scenes attached to them. Here you can see and replay all of them.")
		
		for tfID in GlobalRegistry.getTransformationRefs():
			if(!GM.main.SCI.isTransformationUnlocked(tfID)):
				continue
			var tf:TFBase = GlobalRegistry.getTransformationRef(tfID)
			
			var unlockData:Dictionary = tf.getUnlockData()
			
			if(unlockData.has("tryOptions")):
				var tryOptions:Array = unlockData["tryOptions"]
				if(tryOptions.size() > 0):
					addButton(tf.getPillName(), "See scenes related to this drug", "replay_menu_drug", [tfID])
		
	if(state == "replay_menu_drug"):
		addButton("Back", "Back to the previous menu", "replay_menu")
		var tf:TFBase = GlobalRegistry.getTransformationRef(pickedTF)
		
		saynn("Selected drug: "+tf.getPillName())
		saynn("Do you wanna replay its scene?")
		
		var unlockData:Dictionary = tf.getUnlockData()
		if(!unlockData.has("tryOptions")):
			return
		var tryOptions:Array = unlockData["tryOptions"]
		
		for optionEntry in tryOptions:
			if(optionEntry.has("disabled") && optionEntry["disabled"]):
				addDisabledButton(optionEntry["name"], "(Impossible for your current body) "+optionEntry["desc"])
			else:
				addButton(optionEntry["name"], optionEntry["desc"], "play_replay_scene", [optionEntry["sceneID"]])

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
	if(_action == "replay_menu_drug"):
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
			
			if(craftInfo.has("science")):
				GM.main.SCI.addPoints(-craftInfo["science"])
			GM.main.SCI.useFluidsToMakeSomething(craftInfo["fluids"])
			
			addMessage("You have created '"+itemRef.getVisibleName()+"'!")
			
			if(tfID == "TFPill"):
				GM.main.SCI.madeStrangePills += 1
				var newPill:ItemBase = GlobalRegistry.createItem(tfID)
				newPill.makePillStrangeIfCan()
				GM.pc.getInventory().addItem(newPill)
			else:
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
			addMessage("You have created a "+tf.getPillName()+" pill!")
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
			
			addMessage("You have created a "+tf.getPillName()+" pill!")
			GM.pc.getInventory().addItem(newPill)
		
		setState("")
		return
		
	if(_action == "do_empty_tank"):
		var fluidID:String = _args[0]
		var fluidOBJ:FluidBase = GlobalRegistry.getFluid(fluidID)
		var fluidName:String = fluidOBJ.getVisibleName() if fluidOBJ != null else fluidID
		
		GM.main.SCI.clearFluid(fluidID)
		addMessage("'"+fluidName+"' fluid tank got cleared!")
		return
		
	if(_action == "tank_pickFillFrom"):
		var theItem:ItemBase = _args[0]
		if(theItem == null):
			return
		var fluids:Fluids = theItem.getFluids()
		if(fluids == null):
			return
		
		var fluidsByType:Dictionary = fluids.getFluidAmountByType()
		for fluidID in fluidsByType:
			var theFluidOBJ:FluidBase = GlobalRegistry.getFluid(fluidID)
			if(theFluidOBJ == null):
				continue
			
			var howMuchAdded:float = GM.main.SCI.addFluid(fluidID, fluidsByType[fluidID])
			if(howMuchAdded > 0.0):
				addMessage(str(Util.roundF(howMuchAdded, 1))+" ml of "+theFluidOBJ.getVisibleName()+" was deposited into the fluids tanks.")
		fluids.clear()
		
		return
		
	if(_action == "tank_shower"):
		runScene("ChemistryLabShowerScene")
		return
	
	if(_action == "look_stash"):
		runScene("PlayerStashScene")
		return
	
	if(_action in ["tank_pickInspect", "tank_pickFilter"]):
		if(_args.size() > 0):
			uniqueItemID = _args[0].uniqueID
	
	if(_action == "do_filter_out"):
		var fluids:Fluids = _args[0]
		var fluidID:String = _args[1]
		
		fluids.removeFluidType(fluidID)
		
		return
	
	if(_action == "scan_strange_pill"):
		runScene("ElizaGenericUnlockDrugScene")
		return
	
	if(_action == "play_replay_scene"):
		endScene()
		runScene(_args[0])
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
	{
		"id": "unlockAll",
		"name": "Unlock ALL TFs",
		"args": [
		],
	},
	{
		"id": "testAll",
		"name": "Test ALL TFs",
		"args": [
		],
	},
	{
		"id": "lockAll",
		"name": "Lock ALL TFs",
		"args": [
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
	if(_id == "unlockAll"):
		for tfID in GlobalRegistry.getTransformationRefs():
			GM.main.SCI.doUnlockTF(tfID)
	if(_id == "testAll"):
		for tfID in GlobalRegistry.getTransformationRefs():
			GM.main.SCI.doTestTF(tfID)
	if(_id == "lockAll"):
		GM.main.SCI.unlockedTFs.clear()
		GM.main.SCI.testedTFs.clear()

func saveData():
	var data = .saveData()
	
	data["pickedUpgrade"] = pickedUpgrade
	data["pickedTF"] = pickedTF
	data["pickedTFOption"] = pickedTFOption
	data["pickedArgs"] = pickedArgs
	data["uniqueItemID"] = uniqueItemID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	pickedUpgrade = SAVE.loadVar(data, "pickedUpgrade", "")
	pickedTF = SAVE.loadVar(data, "pickedTF", "")
	pickedTFOption = SAVE.loadVar(data, "pickedTFOption", "")
	pickedArgs = SAVE.loadVar(data, "pickedArgs", {})
	uniqueItemID = SAVE.loadVar(data, "uniqueItemID", "")
