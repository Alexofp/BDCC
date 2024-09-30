extends Reference
class_name SlaveAuction

var charID:String = ""

var roundNumber:int = 0
var totalBidTimes:int = 0
var currentBid:int = 0
var lastBidderIndex:int = -1
var state:String = "act" # act react

var actionText:String = ""

var slaveTraits:Dictionary = {}
var usedTraits:Dictionary = {}

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
		newBidder.index = _i
		newBidder.setAuction(self)
		
		for traitID in GlobalRegistry.getAuctionTraits():
			var trait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
			if(RNG.chance(trait.getBidderChance())):
				if(RNG.chance(70)):
					newBidder.likes[traitID] = false
				else:
					newBidder.dislikes[traitID] = false
		
		bidders.append(newBidder)

func getText() -> String:
	if(state == "react"):
		return actionText
	
	var theTexts:Array = []
	var bettingBeginsRound:int = getBidderBeginsRound()
	theTexts.append("ROUND = "+str(roundNumber)+((" SOFT END = "+str(bettingBeginsRound)) if roundNumber < bettingBeginsRound else ""))
	theTexts.append("STATE = "+str(state))
	
	for traitID in slaveTraits:
		var score:float = slaveTraits[traitID]
		var trait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
		
		theTexts.append(trait.getName()+": "+str(score))
		
	
	theTexts.append("")
	theTexts.append(getBidderInfo())
	theTexts.append("")
	theTexts.append("How do you want to present your slave?")
	
	return Util.join(theTexts, "\n")

func getActions() -> Array:
	var result:Array = []
	
	if(state == "react"):
		result.append(GlobalRegistry.getAuctionAction("Continue"))
	else:
		for actionID in GlobalRegistry.getAuctionActions():
			var theAction:AuctionAction = GlobalRegistry.getAuctionAction(actionID)
			if(theAction.id == "Continue"):
				continue
			result.append(theAction)
	
	return result

func getState() -> String:
	return state

func getRoundNumber() -> int:
	return roundNumber

func onNewRound():
	state = "act"
	roundNumber += 1
	
	for bidder in bidders:
		bidder.onNewRound()

func canDoAction(_auctionAction:AuctionAction) -> Array:
	if(_auctionAction.getActionType() == AuctionActionType.Continue):
		return [true]
	
	var traitsToCheck:Dictionary = _auctionAction.getTraits()
	if(!traitsToCheck.empty()):
		for traitID in traitsToCheck:
			if(usedTraits.has(traitID)):
				return [false, "You already showed this trait"]
	
	return [true]

func doAction(_auctionAction:AuctionAction):
	if(_auctionAction.id == "Continue"):
		onNewRound()
		return
	
	state = "react"
	var theResult:Dictionary = _auctionAction.onAct(getChar(), self)
	if(!theResult.has("text")):
		theResult["text"] = "NO ACTION TEXT PROVIDED, FIX ME"
	actionText = theResult["text"]
	if(!theResult.has("traits")):
		theResult["traits"] = _auctionAction.getTraits()
	if(!theResult.has("desire")):
		theResult["desire"] = _auctionAction.getPassiveDesireGain()
	if(!theResult.has("instantDesire")):
		theResult["instantDesire"] = _auctionAction.getPassiveInstantDesireGain()
	
	var extraTexts:Array = []
	
	var traits:Dictionary = theResult["traits"]
	if(!traits.empty()):
		for traitID in traits:
			usedTraits[traitID] = true
		
			for bidderA in bidders:
				var bidder:AuctionBidder = bidderA
				bidder.onAction(_auctionAction, theResult)
				
				if(bidder.likes.has(traitID)):
					bidder.likes[traitID] = true
					extraTexts.append("LEARNED THAT "+bidder.name+" PREFERS SLAVES WITH TRAIT "+str(traitID))
				if(bidder.dislikes.has(traitID)):
					bidder.dislikes[traitID] = true
					extraTexts.append("LEARNED THAT "+bidder.name+" DISLIKES SLAVES WITH TRAIT "+str(traitID))
	
	var biddingTexts:Array = doRoundOfBidding()
	if(!biddingTexts.empty()):
		extraTexts.append("")
		extraTexts.append_array(biddingTexts)
	
	if(!extraTexts.empty()):
		actionText += "\n\n"+Util.join(extraTexts, "\n")

func doRoundOfBidding() -> Array:
	var result:Array = []
	
	var biddersCopy:Array = []
	biddersCopy.append_array(bidders)
	biddersCopy.shuffle()
	for _i in range(3):
		for bidderA in biddersCopy:
			var bidder:AuctionBidder = bidderA
			if(lastBidderIndex == bidder.index):
				continue
			
			var chanceToBid:float = bidder.calculateChanceToBid()
			
			if(RNG.chance(chanceToBid / (_i+1))):
				currentBid += 10
				totalBidTimes += 1
				bidder.currentBid = currentBid
				lastBidderIndex = bidder.index
				
				result.append(bidder.name+" placed a "+str(currentBid)+" credits bid.")
		
	
	return result

func getBidderInfo() -> String:
	var resultAr:Array = []
	
	for bidder in bidders:
		resultAr.append_array(bidder.getBidderInfo())
	
	return Util.join(resultAr, "\n")

func getBidderBeginsRound() -> int:
	return 3

func getTotalBidTimes() -> int:
	return totalBidTimes
