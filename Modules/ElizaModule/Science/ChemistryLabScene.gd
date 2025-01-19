extends SceneBase

var genericInventoryScreenScene = preload("res://UI/Inventory/GenericInventoryScreen.tscn")

var pickedUpgrade:String = ""
var pickedTF:String = ""

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
		
		addButton("Upgrades", "Look at the list of possible upgrades", "upgrades")
		addButton("Database", "Look at the database of everything that you have unlocked or researched", "database")
		addButton("Leave", "Time to go", "endthescene")
	
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
		
func onUpgradesInteract(_upgradeID:String, _id, _args):
	pickedUpgrade = _upgradeID
	GM.main.pickOption("doBuyUpgrade", [_upgradeID])
	
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
	if(_action == "doBuyUpgrade"):
		var upgradeInfo:Dictionary = GM.main.SCI.getUpgrades()[pickedUpgrade]
		GM.main.SCI.addPoints(-upgradeInfo["cost"])
		GM.main.SCI.unlockUpgrade(pickedUpgrade)
		#addMessage("You unlocked the '"+upgradeInfo["name"]+"' upgrade!")
		#setState("upgrades")
		setState("after_buy")
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
	
	return data
	
func loadData(data):
	.loadData(data)
	
	pickedUpgrade = SAVE.loadVar(data, "pickedUpgrade", "")
	pickedTF = SAVE.loadVar(data, "pickedTF", "")
