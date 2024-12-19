extends SceneBase

func _init():
	sceneID = "SlaveAuctionUpgradesScene"

func _run():
	if(state == ""):
		saynn("What do you want to upgrade?")
		
		var theUpgrades = getModule("SlaveAuctionModule").getUpgrades()
		
		for upgradeID in theUpgrades:
			var upgradeInfo = theUpgrades[upgradeID]
			var maxLevel:int = getModule("SlaveAuctionModule").getMaxUpgradeLevel(upgradeID)
			var curLevel:int = getFlag("SlaveAuctionModule."+upgradeID, 0)
			var canBuy = getModule("SlaveAuctionModule").canBuyUpgrade(upgradeID)
			
			
			sayn("Upgrade: "+upgradeInfo["name"])
			sayn("Description: "+upgradeInfo["desc"])
			sayn("Upgrade level: "+str(curLevel)+"/"+str(maxLevel))
			if(curLevel >= 1):
				sayn("Current level: "+upgradeInfo["descs"][curLevel-1])
			if(curLevel < maxLevel):
				var thePrice:int = upgradeInfo["prices"][curLevel]
				sayn("Next level: "+upgradeInfo["descs"][curLevel])
				sayn("Price: "+str(thePrice)+" credits")
				if(curLevel > 0):
					if(!canBuy):
						sayn("[color=red]Unlock requirement[/color]: "+upgradeInfo["conds"][curLevel-1]+"")
					else:
						sayn("[color=green]Unlock requirement (SATISFIED)[/color]: "+upgradeInfo["conds"][curLevel-1]+"")
			
				if(canBuy):
					addButtonWithChecks(upgradeInfo["name"], "Buy this upgrade for "+str(thePrice)+" credits", "buy_upgrade", [upgradeID, upgradeInfo], [[ButtonChecks.HasCredits, thePrice]])
				else:
					addDisabledButton(upgradeInfo["name"], "Can't buy this upgrade")
			
			sayn("")

		addButton("Close", "Enough upgrading", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "buy_upgrade"):
		var upgradeID = _args[0]
		var upgradeInfo = _args[1]
		var curLevel:int = getFlag("SlaveAuctionModule."+upgradeID, 0)
		var credsToRemove:int = upgradeInfo["prices"][curLevel]
		GM.pc.addCredits(-credsToRemove)
		
		getModule("SlaveAuctionModule").doBuyUpgrade(upgradeID)
		addMessage("You bought the upgrade!")
		return

	setState(_action)

func getDebugActions():
	return [
	{
		"id": "unlockAll",
		"name": "Satisfy requirements",
		"args": [
		],
	},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "unlockAll"):
		for upgradeID in getModule("SlaveAuctionModule").getUpgrades():
			getModule("SlaveAuctionModule").unlockUpgrade(upgradeID)
		
