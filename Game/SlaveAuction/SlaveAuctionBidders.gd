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

func peekBidders() -> Array:
	if(bidders.empty()):
		generateBidders()
	return bidders

func grabBidders() -> Array:
	if(bidders.empty()):
		generateBidders()
	
	var theResult:Array = bidders
	
	bidders = []
	return theResult

# Save load here
