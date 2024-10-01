extends Reference
class_name AuctionBidder

const TRAIT_UNDISCOVERED = 0
const TRAIT_DISCOVERED = 1
const TRAIT_HIT = 2

var index:int = 0
var name:String = ""
var desire:float = 0.0
var instantDesire:float = 0.0
var likes:Dictionary = {}
var dislikes:Dictionary = {}
var currentBid:int = 0

var auctionRef:WeakRef

func setAuction(theAuction):
	auctionRef = weakref(theAuction)

func getAuction():
	if(auctionRef == null):
		return null
	return auctionRef.get_ref()

func getFinalDesire() -> float:
	return desire + instantDesire

func onNewRound():
	instantDesire = 0.0

func onAction(_auction, _action:AuctionAction, _result:Dictionary):
	var traits:Dictionary = _result["traits"]
	var passiveDesire:float = _result["desire"]
	var passiveInstantDesire:float = _result["instantDesire"]

	var hitAnyDislikes:bool = false
	var hitAnyLikes:bool = false
	for traitID in traits:
		if(!_auction.slaveTraits.has(traitID) || _auction.slaveTraits[traitID] <= 0.0):
			continue
		
		var mult:float = traits[traitID] * (clamp(_auction.slaveTraits[traitID] * RNG.randf_range(0.9, 1.1), 0.4, 1.0) if _auction.slaveTraits.has(traitID) else 1.0)
		if(likes.has(traitID)):
			desire += 1.0 * mult
			#desire += 0.5 * mult
			#instantDesire += 0.5 * mult
			hitAnyLikes = true
		if(dislikes.has(traitID)):
			desire -= 0.5 * mult
			#instantDesire -= 0.5 * mult
			hitAnyDislikes = true
	
	if(!hitAnyDislikes && !hitAnyLikes):
			desire += passiveDesire
			instantDesire += passiveInstantDesire
		

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
	
	if(roundNumber <= 1):
		mult *= 0.1
	if(getHitPreferencesAmount() <= 2):
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
				var theColor:Color = Color("#FFBAF8")
				if(likes[traitID] >= TRAIT_HIT):
					theColor = Color("#FF63E7")
				
				knownLikes.append("[color=#"+theColor.to_html(false)+"]"+theTrait.getName(traitID)+"[/color]")
	for traitID in dislikes:
		if(!dislikes[traitID]):
			hiddenDislikesAmount += 1
		else:
			var theTrait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
			if(theTrait != null):
				var theColor:Color = Color("#FFB0A0")
				if(dislikes[traitID] >= TRAIT_HIT):
					theColor = Color("#FF554C")
				
				knownDislikes.append("[color=#"+theColor.to_html(false)+"]"+theTrait.getName(traitID)+"[/color]")
	
	resultAr.append(name+". "+ "Desire to bid: " + str(Util.roundF(getFinalDesire()*100.0, 1))+"% "+"Current bid: " + str(currentBid)+" credits")
	if(likes.empty()):
		resultAr.append("- Prefers: Nothing")
	else:
		resultAr.append("- Prefers: "+str(Util.join(knownLikes, ", "))+(", " if !knownLikes.empty() && hiddenLikesAmount > 0 else "")+((str(hiddenLikesAmount)+" undiscovered") if hiddenLikesAmount > 0 else "")) # + "   ("+str(Util.join(likes.keys(), ", "))+")"
	if(dislikes.empty()):
		resultAr.append("- Dislikes: Nothing")
	else:
		resultAr.append("- Dislikes: "+str(Util.join(knownDislikes, ", "))+(", " if !knownDislikes.empty() && hiddenDislikesAmount > 0 else "")+((str(hiddenDislikesAmount)+" undiscovered") if hiddenDislikesAmount > 0 else "")) # + "   ("+str(Util.join(dislikes.keys(), ", "))+")"
	
	return resultAr
