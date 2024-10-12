extends Module

func getFlags():
	return {
		#"socketIntroduced": flag(FlagType.Bool),
	}

func _init():
	id = "SlaveAuctionModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/SlaveAuctionModule/Chapter0/MirriS0TeaseScene.gd",
		"res://Modules/SlaveAuctionModule/Chapter0/MirriS1IntroScene.gd",
		"res://Modules/SlaveAuctionModule/Chapter0/MirriS2FirstSellScene.gd",
		
		"res://Modules/SlaveAuctionModule/Auction/SlaveAuctionScene.gd",
		]
	characters = [
		"res://Modules/SlaveAuctionModule/Mirri.gd",
		"res://Modules/SlaveAuctionModule/Luxe.gd",
	]
	items = []
	events = [
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
