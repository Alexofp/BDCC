extends SceneBase

var pickedUpgrade:String = ""

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
		
		var upgradesInfo:Dictionary = GM.main.SCI.getUpgrades()
		var hasAnyUnlocked:bool = false
		sayn("Unlocked upgrades:")
		for upgradeID in upgradesInfo:
			if(!GM.main.SCI.hasUpgrade(upgradeID)):
				continue
			sayn(" - "+upgradesInfo[upgradeID]["name"])
			hasAnyUnlocked = true
		if(!hasAnyUnlocked):
			sayn(" - No upgrades found")
		sayn("")
		
		sayn("Transformation drugs:")
		var _i:int = 1
		for tfID in GlobalRegistry.getTransformationRefs():
			var tf:TFBase = GlobalRegistry.getTransformationRef(tfID)
			if(!tf.canUnlockAsPill()):
				continue
			var isUnlocked:bool = GM.main.SCI.isTransformationUnlocked(tfID)
			var isTested:bool = isUnlocked && GM.main.SCI.isTransformationTested(tfID)
			
			sayn(" - "+str(_i)+": "+(tf.getPillName() if isUnlocked else "Unknown")+". "+("Untested" if !isTested else tf.getPillDatabaseDesc()))
			
			_i += 1
			
		
	
	if(state == "upgrades"):
		var upgradesInfo:Dictionary = GM.main.SCI.getUpgrades()
		
		saynn("Here is a list of upgrades that you can do now. Select any upgrade to see more information about it.")
		
		var hasAnyUpgrades:bool = false
		
		addButton("Back", "Back to the previous menu", "")
		for upgradeID in upgradesInfo:
			if(GM.main.SCI.hasUpgrade(upgradeID)):
				continue
			if(!GM.main.SCI.isUpgradeVisible(upgradeID)):
				continue
			hasAnyUpgrades = true
			var upgradeInfo:Dictionary = upgradesInfo[upgradeID]
			sayn("- "+upgradeInfo["name"]+": "+str(upgradeInfo["cost"])+" science points")
			addButton(upgradeInfo["name"], "See info about this upgrade", "lookAtUpgrade", [upgradeID])
		if(!hasAnyUpgrades):
			sayn("- No upgrades left to unlock! AlphaCorp is proud of you!")
	
	if(state == "lookAtUpgrade"):
		var upgradeInfo:Dictionary = GM.main.SCI.getUpgrades()[pickedUpgrade]
		
		saynn("Upgrade name: "+upgradeInfo["name"])
		saynn(upgradeInfo["desc"])
		sayn("Cost: "+str(upgradeInfo["cost"])+" science points")
		sayn("You currently have "+str(GM.main.SCI.getPoints())+" science points")
		
		addButton("Back", "Back to the previous menu", "upgrades")
		if(GM.main.SCI.getPoints() >= upgradeInfo["cost"]):
			addButton("Buy", "Spend "+str(upgradeInfo["cost"])+" science points to get this upgrade", "doBuyUpgrade", [pickedUpgrade])
		else:
			addDisabledButton("Buy", "You don't have enough science points")
	
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
	if(_action == "doBuyUpgrade"):
		var upgradeInfo:Dictionary = GM.main.SCI.getUpgrades()[pickedUpgrade]
		GM.main.SCI.addPoints(-upgradeInfo["cost"])
		GM.main.SCI.unlockUpgrade(pickedUpgrade)
		addMessage("You unlocked the '"+upgradeInfo["name"]+"' upgrade!")
		setState("upgrades")
		return
		
	setState(_action)


func getDebugActions():
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
				"values": GlobalRegistry.getFluids().keys(),
			},
			{
				"id": "ml",
				"name": "How much ml",
				"type": "number",
				"value": 100,
			},
		],
	},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "addPoints"):
		GM.main.SCI.addPoints(_args["points"])
	if(_id == "addFluid"):
		GM.main.SCI.addFluid(_args["fluidID"], _args["ml"])
