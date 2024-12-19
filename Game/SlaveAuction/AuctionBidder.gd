extends Reference
class_name AuctionBidder

const TRAIT_UNDISCOVERED = 0
const TRAIT_DISCOVERED = 1
const TRAIT_HIT = 2

var index:int = 0
var name:String = "" # no save
var bidderID:String = "" # no save
var desire:float = 0.0
var likes:Dictionary = {}
var dislikes:Dictionary = {}
var currentBid:int = 0

var auctionRef:WeakRef

var discoveredLikes:Array = [] # no save
var discoveredDislikes:Array = [] # no save

func setAuction(theAuction):
	auctionRef = weakref(theAuction)

func getAuction():
	if(auctionRef == null):
		return null
	return auctionRef.get_ref()

func getFinalDesire() -> float:
	return desire

func onNewRound():
	pass

func getAmountOfDiscoveredTraits() -> int:
	var result:int = 0
	for traitID in likes:
		if(likes[traitID] != TRAIT_UNDISCOVERED):
			result += 1
	for traitID in dislikes:
		if(dislikes[traitID] != TRAIT_UNDISCOVERED):
			result += 1
	return result

func getPercentageOfDiscoveredTraits() -> float:
	var totalTraits:int = likes.size() + dislikes.size()
	var totalUnlocked:int = 0
	for traitID in likes:
		if(likes[traitID] != TRAIT_UNDISCOVERED):
			totalUnlocked += 1
	for traitID in dislikes:
		if(dislikes[traitID] != TRAIT_UNDISCOVERED):
			totalUnlocked += 1
	if(totalTraits == 0 || totalTraits == totalUnlocked):
		return 1.0
	
	return float(totalUnlocked) / float(totalTraits)

func clearDiscovered():
	discoveredLikes.clear()
	discoveredDislikes.clear()

func discoverTrait(_auction, _traitID:String) -> bool:
	var result:bool = false
	
	if(likes.has(_traitID) && likes[_traitID] == TRAIT_UNDISCOVERED):
		likes[_traitID] = TRAIT_DISCOVERED
		discoveredLikes.append(_traitID)
		result = true
	if(dislikes.has(_traitID) && dislikes[_traitID] == TRAIT_UNDISCOVERED):
		dislikes[_traitID] = TRAIT_DISCOVERED
		discoveredDislikes.append(_traitID)
		result = true
	return result

func discoverRandomTrait(_auction) -> bool:
	var possible:Array = []
	for traitID in likes:
		var weightBonus:float = 0.0
		if(_auction != null && _auction.slaveTraits.has(traitID) && _auction.slaveTraits[traitID] > 0.0):
			weightBonus += _auction.relevantTraitBonus
		
		if(likes[traitID] == TRAIT_UNDISCOVERED):
			possible.append([traitID, 1.0 + weightBonus])
	for traitID in dislikes:
		var weightBonus:float = 0.0
		if(_auction != null && _auction.slaveTraits.has(traitID) && _auction.slaveTraits[traitID] > 0.0):
			weightBonus += _auction.relevantTraitBonus
		
		if(dislikes[traitID] == TRAIT_UNDISCOVERED):
			possible.append([traitID, 1.0 + weightBonus])
	if(possible.empty()):
		return false
	return discoverTrait(_auction, RNG.pickWeightedPairs(possible))

func discoverRandomRelevantTrait(_auction) -> bool:
	var possible:Array = []
	var slaveTraits:Dictionary = _auction.slaveTraits
	
	for traitID in likes:
		if(likes[traitID] == TRAIT_UNDISCOVERED && slaveTraits.has(traitID) && slaveTraits[traitID] > 0.0):
			possible.append(traitID)
	for traitID in dislikes:
		if(dislikes[traitID] == TRAIT_UNDISCOVERED && slaveTraits.has(traitID) && slaveTraits[traitID] > 0.0):
			possible.append(traitID)
	if(possible.empty()):
		return false
	return discoverTrait(_auction, RNG.pick(possible))

func discoverRandomTraitOfType(_auction, _traitType) -> bool:
	var possible:Array = []
	for traitID in likes:
		var theTraitObj:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
		if(theTraitObj == null):
			continue
		if(theTraitObj.getTraitType(traitID) != _traitType):
			continue
		
		if(likes[traitID] == TRAIT_UNDISCOVERED):
			possible.append(traitID)
	for traitID in dislikes:
		var theTraitObj:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
		if(theTraitObj == null):
			continue
		if(theTraitObj.getTraitType(traitID) != _traitType):
			continue
		
		if(dislikes[traitID] == TRAIT_UNDISCOVERED):
			possible.append(traitID)
	if(possible.empty()):
		return false
	return discoverTrait(_auction, RNG.pick(possible))

func hitTrait(_auction, _traitID:String) -> bool:
	var result:bool = false
	var slaveHasTrait:bool = (_auction.slaveTraits.has(_traitID) && _auction.slaveTraits[_traitID] > 0.0)
	
	var _ok = discoverTrait(_auction, _traitID)
	#if(discoverTrait(_auction, _traitID)):
	#	result = true
	if(likes.has(_traitID)):
		if(slaveHasTrait && likes[_traitID] != TRAIT_HIT):
			likes[_traitID] = TRAIT_HIT
			result = true
	if(dislikes.has(_traitID)):
		if(slaveHasTrait && dislikes[_traitID] != TRAIT_HIT):
			dislikes[_traitID] = TRAIT_HIT
			result = true
	return result

func onAction(_auction, _action:AuctionAction, _result:Dictionary):
	var traits:Dictionary = _result["traits"]
	var passiveDesire:float = _result["desire"]

	var hitAnyDislikes:bool = false
	var hitAnyLikes:bool = false
	var desireDelta:float = 0.0
	for traitID in traits:
		if(!_auction.slaveTraits.has(traitID) || _auction.slaveTraits[traitID] <= 0.0):
			continue
		
		var mult:float = traits[traitID] * (clamp(_auction.slaveTraits[traitID] * RNG.randf_range(0.9, 1.1), 0.4, 1.0) if _auction.slaveTraits.has(traitID) else 1.0)
		if(likes.has(traitID)):
			desireDelta += 1.0 * mult
			#desire += 0.5 * mult
			hitAnyLikes = true
		if(dislikes.has(traitID)):
			desireDelta -= 0.5 * mult
			hitAnyDislikes = true
	
	if(!hitAnyDislikes && !hitAnyLikes):
		desireDelta += passiveDesire
	
	desire += desireDelta
	return {
		hitAnyLikes = hitAnyLikes,
		hitAnyDislikes = hitAnyDislikes,
		desireDelta = desireDelta,
	}
		
func say(theText:String):
	var theAuction = getAuction()
	if(theAuction != null):
		theAuction.saynn("[say="+bidderID+"]"+theText+"[/say]")

func sayn(theText:String):
	var theAuction = getAuction()
	if(theAuction != null):
		theAuction.sayn(theText)

func saynn(theText:String):
	var theAuction = getAuction()
	if(theAuction != null):
		theAuction.saynn(theText)

func getHitPreferencesAmount() -> int:
	var result:int = 0
	
	for traitID in likes:
		if(likes[traitID] >= TRAIT_HIT):
			result += 1
	
	return result

func calculateChanceToBid() -> float:
	var theAuction = getAuction()
	var roundNumber:int = theAuction.getRoundNumber()
	var theDesire:float = getFinalDesire()
	
	var theChance:float = theDesire * 100.0
	
	var mult:float = 1.0
	
	if(roundNumber <= 2):
		mult *= 0.1
	if(getHitPreferencesAmount() <= 1):
		mult *= 0.1
		
	#if(roundNumber >= 5):
	#	theChance -= (roundNumber - 5) * 20
	
	return theChance * mult

func onBid(_totalBidTimes:int):
	var theMult:float = 0.5
	if(_totalBidTimes > 3):
		theMult -= _totalBidTimes * _totalBidTimes * 0.002
	
	desire *= clamp(theMult, 0.0, 1.0)

func getBidderInfo() -> Array:
	var resultAr:Array = []
	
	var hasWinningBid:bool = (getAuction().lastBidderIndex == index)
	var hiddenLikesAmount:int = 0
	var knownLikes:Array = []
	var knownDislikes:Array = []
	var hiddenDislikesAmount:int = 0
	for traitID in likes:
		if(!likes[traitID]):
			hiddenLikesAmount += 1
		else:
			var theTrait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
			if(theTrait != null):
				knownLikes.append("[color=#"+getTraitColor(traitID).to_html(false)+"]"+theTrait.getName(traitID)+"[/color]")
	for traitID in dislikes:
		if(!dislikes[traitID]):
			hiddenDislikesAmount += 1
		else:
			var theTrait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
			if(theTrait != null):
				knownDislikes.append("[color=#"+getTraitColor(traitID).to_html(false)+"]"+theTrait.getName(traitID)+"[/color]")
	
	resultAr.append(name+". "+ "Desire to bid: " + str(Util.roundF(getFinalDesire()*100.0, 1))+"% "+"Current bid: " + ("[color=#FFD677][b]" if hasWinningBid else "") + str(currentBid)+" credits"+("[/b][/color]" if hasWinningBid else ""))
	if(likes.empty()):
		resultAr.append("- Prefers: Nothing")
	else:
		resultAr.append("- Prefers: "+str(Util.join(knownLikes, ", "))+(", " if !knownLikes.empty() && hiddenLikesAmount > 0 else "")+((str(hiddenLikesAmount)+" undiscovered") if hiddenLikesAmount > 0 else "")) # + "   ("+str(Util.join(likes.keys(), ", "))+")"
	if(dislikes.empty()):
		resultAr.append("- Dislikes: Nothing")
	else:
		resultAr.append("- Dislikes: "+str(Util.join(knownDislikes, ", "))+(", " if !knownDislikes.empty() && hiddenDislikesAmount > 0 else "")+((str(hiddenDislikesAmount)+" undiscovered") if hiddenDislikesAmount > 0 else "")) # + "   ("+str(Util.join(dislikes.keys(), ", "))+")"
	
	return resultAr

func getBidderInfoNoAuction() -> Array:
	var resultAr:Array = []
	
	var hiddenLikesAmount:int = 0
	var knownLikes:Array = []
	var knownDislikes:Array = []
	var hiddenDislikesAmount:int = 0
	for traitID in likes:
		if(!likes[traitID]):
			hiddenLikesAmount += 1
		else:
			var theTrait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
			if(theTrait != null):
				knownLikes.append("[color=#"+getTraitColor(traitID).to_html(false)+"]"+theTrait.getName(traitID)+"[/color]")
	for traitID in dislikes:
		if(!dislikes[traitID]):
			hiddenDislikesAmount += 1
		else:
			var theTrait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
			if(theTrait != null):
				knownDislikes.append("[color=#"+getTraitColor(traitID).to_html(false)+"]"+theTrait.getName(traitID)+"[/color]")
	
	resultAr.append(name)
	if(likes.empty()):
		resultAr.append("- Prefers: Nothing")
	else:
		resultAr.append("- Prefers: "+str(Util.join(knownLikes, ", "))+(", " if !knownLikes.empty() && hiddenLikesAmount > 0 else "")+((str(hiddenLikesAmount)+" undiscovered") if hiddenLikesAmount > 0 else "")) # + "   ("+str(Util.join(likes.keys(), ", "))+")"
	if(dislikes.empty()):
		resultAr.append("- Dislikes: Nothing")
	else:
		resultAr.append("- Dislikes: "+str(Util.join(knownDislikes, ", "))+(", " if !knownDislikes.empty() && hiddenDislikesAmount > 0 else "")+((str(hiddenDislikesAmount)+" undiscovered") if hiddenDislikesAmount > 0 else "")) # + "   ("+str(Util.join(dislikes.keys(), ", "))+")"
	
	return resultAr

func getTraitColor(_traitID:String) -> Color:
	var theAuction = getAuction()
	if(theAuction == null):
		return Color.white
	if(!theAuction.slaveTraits.has(_traitID) || theAuction.slaveTraits[_traitID] <= 0.0):
		return Color.darkgray
	
	if(likes.has(_traitID)):
		if(likes[_traitID] == TRAIT_HIT):
			return Color("#FF63E7")
		return Color("#FFBAF8")
	if(dislikes.has(_traitID)):
		if(dislikes[_traitID] == TRAIT_HIT):
			return Color("#FF554C")
		return Color("#FFB0A0")
	return Color.red

func getOutbidReaction():
	var possible:Array = [
		"Fuck off.",
		"Fuck you.",
		"{slave.She} {slave.isAre} mine.",
		"Give {slave.him} to me.",
		'Back off, {slave.he} {slave.isAre} mine.',
		'I’ll outbid you all for {slave.him}.',
		'No one else deserves {slave.him}.',
		'{slave.HeShe} belongs to me now.',
		'Keep trying, but I’m winning this.',
	]
	
	var auction = getAuction()
	var slaveTraits:Dictionary = auction.slaveTraits
	var theChar = auction.getChar()
	
	for traitID in likes:
		if(slaveTraits.has(traitID) && slaveTraits[traitID] > 0.0):
			var theTraitObj:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
			if(theTraitObj == null):
				continue
			
			possible.append_array(theTraitObj.getBidderOutbidReactions(traitID, theChar))
	
	return RNG.pick(possible)

func saveData():
	return {
		index = index,
		desire = desire,
		likes = likes,
		dislikes = dislikes,
		currentBid = currentBid,
	}

func loadData(_data):
	index = SAVE.loadVar(_data, "index", 0)
	name = "Bidder "+str(index + 1)
	bidderID = "bidder"+str(index + 1)
	desire = SAVE.loadVar(_data, "desire", 0.0)
	var theLikes = SAVE.loadVar(_data, "likes", {})
	var theDislikes = SAVE.loadVar(_data, "dislikes", {})
	currentBid = SAVE.loadVar(_data, "currentBid", 0)
	
	likes = {}
	dislikes = {}
	for traitID in theLikes:
		if(GlobalRegistry.getAuctionTrait(traitID) != null):
			likes[traitID] = theLikes[traitID]
	for traitID in theDislikes:
		if(GlobalRegistry.getAuctionTrait(traitID) != null):
			dislikes[traitID] = theDislikes[traitID]
