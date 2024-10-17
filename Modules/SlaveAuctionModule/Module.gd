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
		
		"failedAuctionOnce": flag(FlagType.Bool),
		"beganAuctionOnce": flag(FlagType.Bool),
		
		"knowsLuxeName": flag(FlagType.Bool),
		
		"pickedSexSub": flag(FlagType.Bool),
		"sexSubbedToMirri": flag(FlagType.Bool),
		"customMirriGreeting": flag(FlagType.Text),
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
	return 50 # Will change depending on upgrades

func getSlaveBidIncrement() -> int:
	return 10

func getAuctionSettings():
	return {}

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
