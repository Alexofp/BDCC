extends Reference
class_name SlaveAuctionBidders

var bidders:Array = []

func generateBidders():
	bidders.clear()
	for _i in range(3):
		var newBidder:AuctionBidder = AuctionBidder.new()
		newBidder.name = "Bidder "+str(_i + 1)
		newBidder.bidderID = "bidder"+str(_i + 1)
		newBidder.index = _i
		#newBidder.setAuction(self)
		
		for traitID in GlobalRegistry.getAuctionTraits():
			var trait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
			if(RNG.chance(trait.getBidderChance(traitID))):
				if(RNG.chance(trait.getBidderPositiveChance(traitID))):
					newBidder.likes[traitID] = AuctionBidder.TRAIT_UNDISCOVERED
				else:
					newBidder.dislikes[traitID] = AuctionBidder.TRAIT_UNDISCOVERED
		
		bidders.append(newBidder)

func applyUpgradeEffects():
	var unlockAmount:int = GM.main.getFlag("SlaveAuctionModule.upgradeSeePrefs", 0)
	
	for bidder in bidders:
		var totalAmountUnlocked:int = bidder.getAmountOfDiscoveredTraits()
		while(totalAmountUnlocked < unlockAmount):
			bidder.discoverRandomTrait(null)
			totalAmountUnlocked += 1

func peekBidders() -> Array:
	if(bidders.empty()):
		generateBidders()
	applyUpgradeEffects()
	return bidders

func grabBidders() -> Array:
	if(bidders.empty()):
		generateBidders()
	applyUpgradeEffects()
	
	var theResult:Array = bidders
	
	bidders = []
	return theResult

# Save load here
func saveData():
	var biddersData:Array = []
	for bidder in bidders:
		biddersData.append(bidder.saveData())
	return {
		bidders = biddersData,
	}

func loadData(_data):
	bidders = []
	
	var biddersData = SAVE.loadVar(_data, "bidders", [])
	for bidderInfo in biddersData:
		var newBidder:AuctionBidder = AuctionBidder.new()
		newBidder.loadData(bidderInfo)
		bidders.append(newBidder)
