extends Module

func getFlags():
	return {
		"s0hap": flag(FlagType.Bool),
		"s1hap": flag(FlagType.Bool),
		"s2hap": flag(FlagType.Bool),
		"luxeIntroHap": flag(FlagType.Bool),
		
		"r2outcome": flag(FlagType.Text), # kiss nohate luxeisright silence
		"r4outcome": flag(FlagType.Text), # support antag
		"r5outcome": flag(FlagType.Text), # mirri luxe
		"r6outcome": flag(FlagType.Text), # mirrislave mirrigone luxedead middleground
		
		"repLevel": flag(FlagType.Number),
		"repCredits": flag(FlagType.Number),
		"totalRepCredits": flag(FlagType.Number),
		"totalSlavesSold": flag(FlagType.Number),
		
		"failedAuctionOnce": flag(FlagType.Bool),
		"beganAuctionOnce": flag(FlagType.Bool),
		
		"knowsLuxeName": flag(FlagType.Bool),
		"knowsMirriName": flag(FlagType.Bool),
		
		"pickedSexSub": flag(FlagType.Bool),
		"sexSubbedToMirri": flag(FlagType.Bool),
		"firstTimeDom": flag(FlagType.Bool),
		"customMirriGreeting": flag(FlagType.Text),
		"mirriNotOnPill": flag(FlagType.Bool),
		"mirriCanSkipCombat": flag(FlagType.Bool),
		"mirriNotBlacktail": flag(FlagType.Bool),
		
		"luxeTalkIntro": flag(FlagType.Bool),
		"customLuxeGreeting": flag(FlagType.Text),
		"luxeSexIntro": flag(FlagType.Bool),
		"luxeSexProgress": flag(FlagType.Number),
		
		"mirriAffection": flag(FlagType.Number),
		"luxeAffection": flag(FlagType.Number),
		
		"upgradeStartingBid": flag(FlagType.Number),
		"upgradeStartingBidCan": flag(FlagType.Bool),
		"upgradeBidIncrease": flag(FlagType.Number),
		"upgradeBidIncreaseCan": flag(FlagType.Bool),
		"upgradeSeePrefs": flag(FlagType.Number),
		"upgradeSeePrefsCan": flag(FlagType.Bool),
		"upgradeBetterHearing": flag(FlagType.Number),
		"upgradeBetterHearingCan": flag(FlagType.Bool),
	}

func _init():
	id = "SlaveAuctionModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/SlaveAuctionModule/Chapter0/MirriS0TeaseScene.gd",
		"res://Modules/SlaveAuctionModule/Chapter0/MirriS1IntroScene.gd",
		"res://Modules/SlaveAuctionModule/Chapter0/MirriS2FirstSellScene.gd",
		
		"res://Modules/SlaveAuctionModule/Mirri/MirriTalkScene.gd",
		"res://Modules/SlaveAuctionModule/Mirri/MirriBuySellScene.gd",
		"res://Modules/SlaveAuctionModule/Luxe/LuxeIntroScene.gd",
		"res://Modules/SlaveAuctionModule/Luxe/LuxeTalkScene.gd",
		
		"res://Modules/SlaveAuctionModule/Auction/SlaveAuctionGenericSellScene.gd",
		"res://Modules/SlaveAuctionModule/Auction/SlaveAuctionScene.gd",
		"res://Modules/SlaveAuctionModule/Auction/SlaveAuctionUpgradesScene.gd",
		"res://Modules/SlaveAuctionModule/Auction/SlaveAuctionGenericSellNoMirriScene.gd",
		"res://Modules/SlaveAuctionModule/Auction/SlaveAuctionBiddersScene.gd",
		
		"res://Modules/SlaveAuctionModule/Chapter1/MirriRank1Scene.gd",
		"res://Modules/SlaveAuctionModule/Chapter1/MirriRank2Scene.gd",
		"res://Modules/SlaveAuctionModule/Chapter1/MirriRank3Scene.gd",
		"res://Modules/SlaveAuctionModule/Chapter1/MirriRank4Scene.gd",
		"res://Modules/SlaveAuctionModule/Chapter1/MirriRank5Scene.gd",
		"res://Modules/SlaveAuctionModule/Chapter1/MirriRank6Scene.gd",
		"res://Modules/SlaveAuctionModule/Chapter1/LuxeBackstoryScene.gd",
		]
	characters = [
		"res://Modules/SlaveAuctionModule/Mirri.gd",
		"res://Modules/SlaveAuctionModule/Luxe.gd",
		"res://Modules/SlaveAuctionModule/Chapter0/slave_guard.gd",
		"res://Modules/SlaveAuctionModule/Chapter1/BackstoryChars/LuxeWife.gd",
		"res://Modules/SlaveAuctionModule/Chapter1/BackstoryChars/LuxeWife2.gd",
		"res://Modules/SlaveAuctionModule/Chapter1/BackstoryChars/LuxeDad.gd",
		"res://Modules/SlaveAuctionModule/Chapter1/BackstoryChars/LuxeCatgirl.gd",
	]
	items = []
	events = [
		"res://Modules/SlaveAuctionModule/Auction/BlacktailMarketEvent.gd",
		"res://Modules/SlaveAuctionModule/Chapter0/C0MirriEvent.gd",
		"res://Modules/SlaveAuctionModule/Luxe/LuxeIntroEvent.gd",
		"res://Modules/SlaveAuctionModule/Luxe/LuxeTalkEvent.gd",
	]
	quests = [
		"res://Modules/SlaveAuctionModule/Chapter0/BlacktailQuest.gd",
	]

func resetFlagsOnNewDay():
	pass

func getSlaveStartingBid() -> int:
	var upgradeLevel:int = getFlag("SlaveAuctionModule.upgradeStartingBid", 0)
	var upgradeNums:Array = [50, 60, 80, 100, 150, 200, 300, 500]
	if(upgradeLevel > (upgradeNums.size() - 1)):
		upgradeLevel = (upgradeNums.size() - 1)
	if(upgradeLevel < 0):
		upgradeLevel = 0
	
	return upgradeNums[upgradeLevel]

func getSlaveBidIncrement() -> int:
	var upgradeLevel:int = getFlag("SlaveAuctionModule.upgradeBidIncrease", 0)
	var upgradeNums:Array = [10, 15, 20, 25, 30, 40, 50, 100]
	if(upgradeLevel > (upgradeNums.size() - 1)):
		upgradeLevel = (upgradeNums.size() - 1)
	if(upgradeLevel < 0):
		upgradeLevel = 0
	
	return upgradeNums[upgradeLevel]

func getAuctionSettings():
	return {
		startingBid = getSlaveStartingBid(),
		bidIncrease = getSlaveBidIncrement(),
		relevantTraitBonus = float(getFlag("SlaveAuctionModule.upgradeBetterHearing", 0))*0.1,
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
	
	if(getMirriAffection() >= 1.0):
		return "Hey love~."
	if(getMirriAffection() >= 0.5):
		return "What's up, softie?"
	return "What's up, AlphaCorp slave?"

func getLuxeGreeting() -> String:
	var customGreet:String = getFlag("SlaveAuctionModule.customLuxeGreeting", "")
	if(customGreet != ""):
		setFlag("SlaveAuctionModule.customLuxeGreeting", "")
		return customGreet
	
	return "Hm."

func getRepInfoString() -> String:
	var theLines:Array = []
	
	theLines.append("Current reputation level: "+str(getRepLevel()))
	if(getRepLevel() < 6):
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
	if(_level == 2):
		return "MirriRank2Scene"
	if(_level == 3):
		return "MirriRank3Scene"
	if(_level == 4):
		return "MirriRank4Scene"
	if(_level == 5):
		return "MirriRank5Scene"
	if(_level == 6):
		return "MirriRank6Scene"
	
	return ""

func getNextRankScene():
	return getSceneForRank(getRepLevel() + 1)

func unlockUpgrade(_upgradeID:String):
	if(getFlag("SlaveAuctionModule."+_upgradeID+"Can", false)):
		return
	setFlag("SlaveAuctionModule."+_upgradeID+"Can", true)
	var upgradeName = getUpgrades()[_upgradeID]["name"]
	GM.main.addMessage("Upgrade '"+upgradeName+"' level "+str(getFlag("SlaveAuctionModule."+_upgradeID, 0)+1)+" is unlocked for purchase!")

func onSlaveSold(_theChar:BaseCharacter, _howMuchCreds:int):
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
	if(bigIncUp == 5 && _howMuchCreds >= 500):
		unlockUpgrade("upgradeBidIncrease")
	if(bigIncUp == 6 && _howMuchCreds >= 1000):
		unlockUpgrade("upgradeBidIncrease")

	var seePrefsUp = getFlag("SlaveAuctionModule.upgradeSeePrefs", 0)
	var npcSlavery:NpcSlave = _theChar.getNpcSlavery()
	if(seePrefsUp == 1 && _theChar.isInmate()):
		unlockUpgrade("upgradeSeePrefs")
	if(seePrefsUp == 2 && _theChar.getPersonality().personalityScoreMax({PersonalityStat.Mean:-1.0, PersonalityStat.Subby:1.0}) >= 0.5):
		unlockUpgrade("upgradeSeePrefs")
	if(seePrefsUp == 3 && npcSlavery != null && npcSlavery.getSkillAmountFullyLearned() >= 1):
		unlockUpgrade("upgradeSeePrefs")
	if(seePrefsUp == 4 && _theChar.isStaff()):
		unlockUpgrade("upgradeSeePrefs")
	if(seePrefsUp == 5 && _theChar.getPersonality().personalityScoreMax({PersonalityStat.Mean:1.0, PersonalityStat.Subby:-1.0}) >= 0.5):
		unlockUpgrade("upgradeSeePrefs")
	if(seePrefsUp == 6 && npcSlavery != null && npcSlavery.getSkillAmountFullyLearned() >= 3):
		unlockUpgrade("upgradeSeePrefs")

	var betterHearingUp = getFlag("SlaveAuctionModule.upgradeBetterHearing", 0)
	if(betterHearingUp == 1 && npcSlavery != null && npcSlavery.getLevel() >= 5):
		unlockUpgrade("upgradeBetterHearing")
	if(betterHearingUp == 2 && _theChar.isVisiblyPregnant()):
		unlockUpgrade("upgradeBetterHearing")
	if(betterHearingUp == 3 && npcSlavery != null && npcSlavery.hasSubmittedToPC()):
		unlockUpgrade("upgradeBetterHearing")
	if(betterHearingUp == 4 && npcSlavery != null && npcSlavery.isMindBroken()):
		unlockUpgrade("upgradeBetterHearing")
	if(betterHearingUp == 5 && _theChar.getInventory().getEquippedRestraints().size() >= 5):
		unlockUpgrade("upgradeBetterHearing")
	if(betterHearingUp == 6 && npcSlavery != null && npcSlavery.getLevel() >= 15):
		unlockUpgrade("upgradeBetterHearing")

func getMaxUpgradeLevel(_upgradeID:String):
	return getUpgrades()[_upgradeID]["prices"].size()

func canBuyUpgrade(_upgradeID:String):
	var theLevel:int = getFlag("SlaveAuctionModule."+_upgradeID, 0)
	if(theLevel <= 0):
		return true
	if(theLevel >= getMaxUpgradeLevel(_upgradeID)):
		return false
		
	#if(true):
	#	return true
		
	if(getFlag("SlaveAuctionModule."+_upgradeID+"Can", false)):
		return true
		
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
		if(theLevel == 6):
			return totalSold >= 20
	
	return false

func doBuyUpgrade(_upgradeID:String):
	increaseFlag("SlaveAuctionModule."+_upgradeID)
	setFlag("SlaveAuctionModule."+_upgradeID+"Can", false)

func getUpgrades():
	var totalSlaves:int = getFlag("SlaveAuctionModule.totalSlavesSold", 0)
	return {
		"upgradeStartingBid": {
			name = "Starting bid",
			desc = "Install better seats for bidders. Increases the starting bid.",
			conds = [
				"Sell 2 slaves total. Currently: "+str(totalSlaves),#1
				"Sell 4 slaves total. Currently: "+str(totalSlaves),#2
				"Sell 7 slaves total. Currently: "+str(totalSlaves),#3
				"Sell 10 slaves total. Currently: "+str(totalSlaves),#4
				"Sell 15 slaves total. Currently: "+str(totalSlaves),#5
				"Sell 20 slaves total. Currently: "+str(totalSlaves),#6
			],
			descs = [
				"Starting bid increased to 60",#1
				"Starting bid increased to 80",#2
				"Starting bid increased to 100",#3
				"Starting bid increased to 150",#4
				"Starting bid increased to 200",#5
				"Starting bid increased to 300",#6
				"Starting bid increased to 500",#7
			],
			prices = [
				10,#1
				20,#2
				30,#3
				40,#4
				50,#5
				75,#6
				100,#7
			],
		},
		"upgradeBidIncrease": {
			name = "Bid increase",
			desc = "Make the stage prettier. Increases the bid increase.",
			conds = [
				"Sell a slave for at least 100 credits",#1
				"Sell a slave for at least 150 credits",#2
				"Sell a slave for at least 200 credits",#3
				"Sell a slave for at least 300 credits",#4
				"Sell a slave for at least 500 credits",#5
				"Sell a slave for at least 1000 credits",#6
			],
			descs = [
				"Bid increase is 15 credits",#1
				"Bid increase is 20 credits",#2
				"Bid increase is 25 credits",#3
				"Bid increase is 30 credits",#4
				"Bid increase is 40 credits",#5
				"Bid increase is 50 credits",#6
				"Bid increase is 100 credits",#7
			],
			prices = [
				10,#1
				20,#2
				30,#3
				50,#4
				75,#5
				100,#6
				150,#7
			],
		},
		"upgradeSeePrefs": {
			name = "Reveal preferences",
			desc = "Extra intel on the next bidders. Allows to see some preferences of the next bidders.",
			conds = [
				"Sell an inmate",#1
				"Sell a slave who is very kind or subby",#2
				"Sell a slave with one of the skills fully learned",#3
				"Sell a staff member",#4
				"Sell a slave who is very mean or dominant",#5
				"Sell a slave that has 3 skills fully learned",#6
			],
			descs = [
				"Reveals 1 preference ahead of time",#1
				"Reveals 2 preferences ahead of time",#2
				"Reveals 3 preferences ahead of time",#3
				"Reveals 4 preferences ahead of time",#4
				"Reveals 5 preferences ahead of time",#5
				"Reveals 6 preferences ahead of time",#6
				"Reveals 7 preferences ahead of time",#7
			],
			prices = [
				5,#1
				10,#2
				15,#3
				25,#4
				40,#5
				50,#6
				100,#7
			],
		},
		"upgradeBetterHearing": {
			name = "Better hearing",
			desc = "Install hidden microphones into bidders' seats. Increases the chances of relevant preferences being revealed.",
			conds = [
				"Sell a slave with slave level 5 or more",#1
				"Sell a pregnant slave",#2
				"Sell a slave that has submitted to you",#3
				"Sell a completely mindbroken slave",#4
				"Sell a slave with at least 5 pieces of bdsm equipment",#5
				"Sell a slave with slave level 15 or more",#6
			],
			descs = [
				"Increases the chance that relevant preferences will be revealed by 10%",#1
				"Increases the chance that relevant preferences will be revealed by 20%",#2
				"Increases the chance that relevant preferences will be revealed by 30%",#3
				"Increases the chance that relevant preferences will be revealed by 40%",#4
				"Increases the chance that relevant preferences will be revealed by 50%",#5
				"Increases the chance that relevant preferences will be revealed by 60%",#6
				"Increases the chance that relevant preferences will be revealed by 70%",#6
			],
			prices = [
				15,#1
				20,#2
				25,#3
				30,#4
				35,#5
				50,#6
				75,#6
			],
		},
	}

func getBidderInfo() -> String:
	var resultAr:Array = []
	
	for bidder in GM.main.SAB.peekBidders():
		resultAr.append(Util.join(bidder.getBidderInfoNoAuction(), "\n"))
	
	return Util.join(resultAr, "\n\n")

func addMirriAffection(howMuch:float, cap:float = 1.0):
	var currentValue:float = getFlag("SlaveAuctionModule.mirriAffection", 0.0)
	if(currentValue >= cap && howMuch > 0):
		return
	
	currentValue += howMuch
	
	currentValue = clamp(currentValue, -0.5, cap)
	setFlag("SlaveAuctionModule.mirriAffection", currentValue)

func getMirriAffection():
	return getFlag("SlaveAuctionModule.mirriAffection", 0.0)

func addLuxeAffection(howMuch:float, cap:float = 1.0):
	var currentValue:float = getFlag("SlaveAuctionModule.luxeAffection", 0.0)
	if(currentValue >= cap && howMuch > 0):
		return
	
	currentValue += howMuch
	
	currentValue = clamp(currentValue, -0.5, cap)
	setFlag("SlaveAuctionModule.luxeAffection", currentValue)

func getLuxeAffection():
	return getFlag("SlaveAuctionModule.luxeAffection", 0.0)

func getPCCut():
	if(getRepLevel() >= 6):
		return 0.2
	return 0.1

func noMirri():
	if(getFlag("SlaveAuctionModule.r6outcome", "") in ["mirrislave", "mirrigone"]):
		return true
	return false
