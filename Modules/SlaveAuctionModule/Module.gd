extends Module

func getFlags():
	return {
		"s0hap": flag(FlagType.Bool),
		"s1hap": flag(FlagType.Bool),
		"s2hap": flag(FlagType.Bool),
		"luxeIntroHap": flag(FlagType.Bool),
		
		"repLevel": flag(FlagType.Number),
		"repCredits": flag(FlagType.Number),
		"totalRepCredits": flag(FlagType.Number),
		"totalSlavesSold": flag(FlagType.Number),
		
		"failedAuctionOnce": flag(FlagType.Bool),
		"beganAuctionOnce": flag(FlagType.Bool),
		
		"knowsLuxeName": flag(FlagType.Bool),
		
		"pickedSexSub": flag(FlagType.Bool),
		"sexSubbedToMirri": flag(FlagType.Bool),
		"firstTimeDom": flag(FlagType.Bool),
		"customMirriGreeting": flag(FlagType.Text),
		"mirriNotOnPill": flag(FlagType.Text),
		
		"upgradeStartingBid": flag(FlagType.Number),
		"upgradeStartingBidCan": flag(FlagType.Bool),
		"upgradeBidIncrease": flag(FlagType.Number),
		"upgradeBidIncreaseCan": flag(FlagType.Bool),
		"upgradeSeePrefs": flag(FlagType.Number),
		"upgradeSeePrefsCan": flag(FlagType.Bool),
	}

func _init():
	id = "SlaveAuctionModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/SlaveAuctionModule/Chapter0/MirriS0TeaseScene.gd",
		"res://Modules/SlaveAuctionModule/Chapter0/MirriS1IntroScene.gd",
		"res://Modules/SlaveAuctionModule/Chapter0/MirriS2FirstSellScene.gd",
		
		"res://Modules/SlaveAuctionModule/Mirri/MirriTalkScene.gd",
		"res://Modules/SlaveAuctionModule/Luxe/LuxeIntroScene.gd",
		
		"res://Modules/SlaveAuctionModule/Auction/SlaveAuctionGenericSellScene.gd",
		"res://Modules/SlaveAuctionModule/Auction/SlaveAuctionScene.gd",
		"res://Modules/SlaveAuctionModule/Auction/SlaveAuctionUpgradesScene.gd",
		
		"res://Modules/SlaveAuctionModule/Chapter1/MirriRank1Scene.gd",
		]
	characters = [
		"res://Modules/SlaveAuctionModule/Mirri.gd",
		"res://Modules/SlaveAuctionModule/Luxe.gd",
		"res://Modules/SlaveAuctionModule/Chapter0/slave_guard.gd",
	]
	items = []
	events = [
		"res://Modules/SlaveAuctionModule/Auction/BlacktailMarketEvent.gd",
		"res://Modules/SlaveAuctionModule/Chapter0/C0MirriEvent.gd",
		"res://Modules/SlaveAuctionModule/Luxe/LuxeIntroEvent.gd",
	]

func resetFlagsOnNewDay():
	pass

func getSlaveStartingBid() -> int:
	var upgradeLevel:int = getFlag("SlaveAuctionModule.upgradeStartingBid", 0)
	var upgradeNums:Array = [50, 60, 80, 100, 120, 150, 200]
	if(upgradeLevel > (upgradeNums.size() - 1)):
		upgradeLevel = (upgradeNums.size() - 1)
	if(upgradeLevel < 0):
		upgradeLevel = 0
	
	return upgradeNums[upgradeLevel]

func getSlaveBidIncrement() -> int:
	var upgradeLevel:int = getFlag("SlaveAuctionModule.upgradeBidIncrease", 0)
	var upgradeNums:Array = [10, 15, 20, 25, 30, 40, 50]
	if(upgradeLevel > (upgradeNums.size() - 1)):
		upgradeLevel = (upgradeNums.size() - 1)
	if(upgradeLevel < 0):
		upgradeLevel = 0
	
	return upgradeNums[upgradeLevel]

func getAuctionSettings():
	return {
		startingBid = getSlaveStartingBid(),
		bidIncrease = getSlaveBidIncrement(),
	}

func sellToSlavery(theCharID:String):
	GM.main.removeDynamicCharacter(theCharID)

func sellToAuction(theCharID:String):
	GM.main.removeDynamicCharacter(theCharID)

func getMirriGreeting() -> String:
	var customGreet:String = getFlag("SlaveAuctionModule.customMirriGreeting", "")
	if(customGreet != ""):
		setFlag("SlaveAuctionModule.customMirriGreeting", "")
		return customGreet
	
	return "What's up, AlphaCorp slave?"

func getRepInfoString() -> String:
	var theLines:Array = []
	
	theLines.append("Current reputation level: "+str(getRepLevel()))
	theLines.append(" "+str(getRepCredits())+" / "+str(getCreditsForRepLevel(getRepLevel()+1))+" credits required for the next rank.")
	theLines.append("Total amount of credits earned for Blacktail: "+str(getTotalRepCredits())+" credits.")
	if(isReadyToAdvanceRepLevel()):
		theLines.append("You are ready to advance the reputation level!")
	
	return Util.join(theLines, "\n")

func getRepLevel() -> int:
	return int(getFlag("SlaveAuctionModule.repLevel", 0))

func getRepCredits() -> int:
	return int(getFlag("SlaveAuctionModule.repCredits", 0))

func getTotalRepCredits() -> int:
	return int(getFlag("SlaveAuctionModule.totalRepCredits", 0))

func addRepCredits(_creds:int):
	var ourCreds:int = getRepCredits()
	var ourLevel:int = getRepLevel()
	
	var maxCreds:int = getCreditsForRepLevel(ourLevel + 1)
	ourCreds += _creds
	if(ourCreds >= maxCreds):
		ourCreds = maxCreds
	setFlag("SlaveAuctionModule.repCredits", ourCreds)
	increaseFlag("SlaveAuctionModule.totalRepCredits", _creds)

func isReadyToAdvanceRepLevel() -> bool:
	var ourCreds:int = getRepCredits()
	var ourLevel:int = getRepLevel()
	if(ourLevel >= 6):
		return false
	
	var maxCreds:int = getCreditsForRepLevel(ourLevel + 1)
	if(ourCreds >= maxCreds):
		return true
	return false

func advanceRepLevel():
	if(!isReadyToAdvanceRepLevel()):
		return
	
	setFlag("SlaveAuctionModule.repCredits", 0)
	increaseFlag("SlaveAuctionModule.repLevel")

func getCreditsForRepLevel(_level:int):
	if(_level <= 0):
		return 0
	if(_level == 1):
		return 100
	if(_level == 2):
		return 200
	if(_level == 3):
		return 500
	if(_level == 4):
		return 1000
	if(_level == 5):
		return 1500
	return 2000

func canDomMirri() -> bool:
	return false

func isMirriOnPill() -> bool:
	return !getFlag("SlaveAuctionModule.mirriNotOnPill", false)

func getSceneForRank(_level:int):
	if(_level == 1):
		return "MirriRank1Scene"
	
	return ""

func getNextRankScene():
	return getSceneForRank(getRepLevel() + 1)

func unlockUpgrade(_upgradeID:String):
	if(getFlag("SlaveAuctionModule."+_upgradeID+"Can", false)):
		return
	setFlag("SlaveAuctionModule."+_upgradeID+"Can", true)
	GM.main.addMessage("UPGRADE AVAIABLE YOO")

func onSlaveSold(_theChar, _howMuchCreds:int):
	increaseFlag("SlaveAuctionModule.totalSlavesSold")

	var bigIncUp = getFlag("SlaveAuctionModule.upgradeBidIncrease", 0)
	if(bigIncUp == 1 && _howMuchCreds >= 100):
		unlockUpgrade("upgradeBidIncrease")
	if(bigIncUp == 2 && _howMuchCreds >= 150):
		unlockUpgrade("upgradeBidIncrease")
	if(bigIncUp == 3 && _howMuchCreds >= 200):
		unlockUpgrade("upgradeBidIncrease")
	if(bigIncUp == 4 && _howMuchCreds >= 300):
		unlockUpgrade("upgradeBidIncrease")
	if(bigIncUp == 5 && _howMuchCreds >= 400):
		unlockUpgrade("upgradeBidIncrease")
	#if(bigIncUp == 6 && _howMuchCreds >= 500):
	#	unlockUpgrade("upgradeBidIncrease")

func getMaxUpgradeLevel(_upgradeID:String):
	
	return 6

func canBuyUpgrade(_upgradeID:String):
	var theLevel:int = getFlag("SlaveAuctionModule."+_upgradeID, 0)
	if(theLevel <= 0):
		return true
	if(theLevel >= getMaxUpgradeLevel(_upgradeID)):
		return false
		
	if(_upgradeID == "upgradeStartingBid"):
		var totalSold = getFlag("SlaveAuctionModule.totalSlavesSold", 0)
		if(theLevel == 1):
			return totalSold >= 2
		if(theLevel == 2):
			return totalSold >= 4
		if(theLevel == 3):
			return totalSold >= 7
		if(theLevel == 4):
			return totalSold >= 10
		if(theLevel == 5):
			return totalSold >= 15
		#if(theLevel == 6):
		#	return totalSold >= 20
	
	return getFlag("SlaveAuctionModule."+_upgradeID+"Can", false)

func doBuyUpgrade(_upgradeID:String):
	increaseFlag("SlaveAuctionModule."+_upgradeID)
	setFlag("SlaveAuctionModule."+_upgradeID+"Can", false)

func getUpgrades():
	return {
		"upgradeStartingBid": {
			name = "Starting bid",
			desc = "Install better seats for bidders. Increases the starting bid.",
			conds = [
				"", #0
				"Sell 2 slaves total",#1
				"Sell 4 slaves total",#2
				"Sell 7 slaves total",#3
				"Sell 10 slaves total ",#4
				"Sell 15 slaves total",#5
				"Sell 20 slaves total",#6
			],
			descs = [
				"",#0
				"Starting bid increased to 60",#1
				"Starting bid increased to 80",#2
				"Starting bid increased to 100",#3
				"Starting bid increased to 120",#4
				"Starting bid increased to 150",#5
				"Starting bid increased to 200",#6
			],
			prices = [
				0,#0
				20,#1
				40,#2
				50,#3
				75,#4
				100,#5
				200,#6
			],
		},
		"upgradeBidIncrease": {
			name = "Bid increase",
			desc = "Make the stage prettier. Increases the bid increase.",
			conds = [
				"", #0
				"Sell a slave for at least 100 credits",#1
				"Sell a slave for at least 150 credits",#2
				"Sell a slave for at least 200 credits",#3
				"Sell a slave for at least 300 credits",#4
				"Sell a slave for at least 400 credits",#5
				"Sell a slave for at least 500 credits",#6
			],
			descs = [
				"",#0
				"Bid increase becomes 15",#1
				"Bid increase becomes 20",#2
				"Bid increase becomes 25",#3
				"Bid increase becomes 30",#4
				"Bid increase becomes 40",#5
				"Bid increase becomes 50",#6
			],
			prices = [
				0,#0
				20,#1
				40,#2
				50,#3
				75,#4
				100,#5
				200,#6
			],
		},
		"upgradeSeePrefs": {
			name = "Reveal preferences",
			desc = "Extra intel on the next bidders. Allows to see some preferences of the next bidders.",
			conds = [
				"", #0
				"Sell an inmate",#1
				"Sell a subby/kind slave",#2
				"Sell a staff member",#3
				"Sell a mean/dominant slave",#4
				"Sell a slave with one of the skills maxed",#5
				"",#6
			],
			descs = [
				"",#0
				"Reveals 1 preference ahead of time",#1
				"Reveals 2 preference ahead of time",#2
				"Reveals 3 preference ahead of time",#3
				"Reveals 4 preference ahead of time",#4
				"Reveals 5 preference ahead of time",#5
				"",#6
			],
			prices = [
				0,#0
				20,#1
				40,#2
				50,#3
				75,#4
				100,#5
				200,#6
			],
		},
	}

func getBidderInfo() -> String:
	var resultAr:Array = []
	
	for bidder in GM.main.SAB.peekBidders():
		resultAr.append(Util.join(bidder.getBidderInfoNoAuction(), "\n"))
	
	return Util.join(resultAr, "\n\n")
