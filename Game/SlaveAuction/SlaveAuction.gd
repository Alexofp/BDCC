extends Reference
class_name SlaveAuction

var charID:String = ""

#var showedFetish:Dictionary = {}

var slaveTraits:Dictionary = {}

var bidders:Array = []

func setCharID(newCharID:String):
	charID = newCharID

func getChar() -> BaseCharacter:
	return GlobalRegistry.getCharacter(charID)

func getCharacter() -> BaseCharacter:
	return GlobalRegistry.getCharacter(charID)

func start():
	calculateSlaveTraits()
	generateBidders()

func calculateSlaveTraits():
	slaveTraits.clear()
	
	var theChar:BaseCharacter = getChar()
	
	for traitID in GlobalRegistry.getAuctionTraits():
		var trait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
		
		var score:float = trait.calculateScore(theChar)
		slaveTraits[traitID] = score

func generateBidders():
	bidders.clear()
	for _i in range(3):
		var newBidder:AuctionBidder = AuctionBidder.new()
		newBidder.name = "Bidder "+str(_i + 1)
		
		for traitID in GlobalRegistry.getAuctionTraits():
			var trait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
			if(RNG.chance(trait.getBidderChance())):
				if(RNG.chance(50)):
					newBidder.likes[traitID] = true
				else:
					newBidder.dislikes[traitID] = true
		
		bidders.append(newBidder)

func getText() -> String:
	var theTexts:Array = []
	
	for traitID in slaveTraits:
		var score:float = slaveTraits[traitID]
		var trait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
		
		theTexts.append(trait.getName()+": "+str(score))
		
	
	theTexts.append("")
	theTexts.append(getBidderInfo())
	
	return Util.join(theTexts, "\n")

func getActions() -> Array:
	return []

func doAction(_auctionAction):
	pass

func getBidderInfo() -> String:
	var resultAr:Array = []
	
	for bidder in bidders:
		resultAr.append(bidder.name+":")
		resultAr.append("- Desire: " + str(Util.roundF(bidder.getFinalDesire()*100.0, 1))+"%")
		resultAr.append("- Prefers: "+str(Util.join(bidder.likes.keys(), ", ")))
		resultAr.append("- Dislikes: "+str(Util.join(bidder.dislikes.keys(), ", ")))
	
	return Util.join(resultAr, "\n")
