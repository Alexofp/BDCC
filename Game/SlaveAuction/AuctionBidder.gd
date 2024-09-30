extends Reference
class_name AuctionBidder

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

func onAction(_action:AuctionAction, _result:Dictionary):
	var traits:Dictionary = _result["traits"]
	var passiveDesire:float = _result["desire"]
	var passiveInstantDesire:float = _result["instantDesire"]

	var hitAnyDislikes:bool = false
	for traitID in traits:
		var mult:float = traits[traitID]
		if(likes.has(traitID)):
			desire += 0.5 * mult
			instantDesire += 0.5 * mult
		if(dislikes.has(traitID)):
			desire -= 0.5 * mult
			#instantDesire -= 0.5 * mult
			hitAnyDislikes = true
	
	if(!hitAnyDislikes):
			desire += passiveDesire
			instantDesire += passiveInstantDesire
		

func calculateChanceToBid() -> float:
	var theAuction = getAuction()
	var roundNumber:int = theAuction.getRoundNumber()
	var theDesire:float = getFinalDesire()
	
	var theChance:float = theDesire * 100.0
	if(roundNumber >= 5):
		theChance -= (roundNumber - 5) * 20
	
	return theChance
	
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
				knownLikes.append(theTrait.getName())
	for traitID in dislikes:
		if(!dislikes[traitID]):
			hiddenDislikesAmount += 1
		else:
			var theTrait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
			if(theTrait != null):
				knownDislikes.append(theTrait.getName())
	
	resultAr.append(name+". "+ "Desire: " + str(Util.roundF(getFinalDesire()*100.0, 1))+"% "+"Current bid: " + str(currentBid)+" credits")
	if(likes.empty()):
		resultAr.append("- Prefers: Nothing")
	else:
		resultAr.append("- Prefers: "+str(Util.join(knownLikes, ", "))+(", " if !knownLikes.empty() && hiddenLikesAmount > 0 else "")+((str(hiddenLikesAmount)+" undiscovered") if hiddenLikesAmount > 0 else "") + "   ("+str(Util.join(likes.keys(), ", "))+")")
	if(dislikes.empty()):
		resultAr.append("- Dislikes: Nothing")
	else:
		resultAr.append("- Dislikes: "+str(Util.join(knownDislikes, ", "))+(", " if !knownDislikes.empty() && hiddenDislikesAmount > 0 else "")+((str(hiddenDislikesAmount)+" undiscovered") if hiddenDislikesAmount > 0 else "") + "   ("+str(Util.join(dislikes.keys(), ", "))+")")
	
	return resultAr
