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
			sayn("Current level: "+str(curLevel)+"/"+str(maxLevel))
			if(curLevel < maxLevel):
				sayn("Next level: "+upgradeInfo["descs"][curLevel+1])
				sayn("Price: "+str(upgradeInfo["prices"][curLevel+1])+" credits")
				if(curLevel > 0):
					if(!canBuy):
						sayn("Unlock requirement: "+upgradeInfo["conds"][curLevel])
					else:
						sayn("Unlock requirement (SATISFIED): "+upgradeInfo["conds"][curLevel])
			
			sayn("")
			if(canBuy):
				addButton(upgradeInfo["name"], "Buy this upgrade for X credits", "buy_upgrade", [upgradeID, upgradeInfo])
			else:
				addDisabledButton(upgradeInfo["name"], "Can't buy this upgrade")
		
		addButton("Close", "Enough upgrading", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "buy_upgrade"):
		var upgradeID = _args[0]
		var upgradeInfo = _args[1]
		var curLevel:int = getFlag("SlaveAuctionModule."+upgradeID, 0)
		var credsToRemove:int = upgradeInfo["prices"][curLevel+1]
		GM.pc.addCredits(-credsToRemove)
		
		getModule("SlaveAuctionModule").doBuyUpgrade(upgradeID)
		addMessage("You bought the upgrade!")
		return

	setState(_action)
