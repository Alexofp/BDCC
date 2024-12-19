extends Reference
class_name SlaveAuction

var charID:String = ""

var roundNumber:int = 0
var totalBidTimes:int = 0
var currentBid:int = 0
var lastBidderIndex:int = -1
var state:String = "start" # act react start ended
var canPresent:bool = true
var bidLastChances:int = 0

var startingBid:int = 10
var bidIncrease:int = 10
var relevantTraitBonus:float = 0.0
var presenterID:String = "mirri"

var actionText:String = ""
var extraActionTexts:Array = [] # no save

var slaveTraits:Dictionary = {}
var usedTraits:Dictionary = {}
var usedActions:Dictionary = {}

var slaveReactionType = AuctionSlaveReaction.Confused

var bidders:Array = []
var shouldEnd:bool = false

func setCharID(newCharID:String):
	charID = newCharID
	slaveReactionType = calculateSlaveReactionType()

func getChar() -> BaseCharacter:
	return GlobalRegistry.getCharacter(charID)

func getCharacter() -> BaseCharacter:
	return GlobalRegistry.getCharacter(charID)

func start(_args:Dictionary = {}):
	calculateSlaveTraits()
	generateBidders()
	presenterID = _args["presenterID"] if (_args.has("presenterID")) else "mirri"
	startingBid = _args["startingBid"] if (_args.has("startingBid")) else calculateStartingBid(getChar())
	bidIncrease = _args["bidIncrease"] if (_args.has("bidIncrease")) else calculateBidIncrease(getChar())
	relevantTraitBonus = _args["relevantTraitBonus"] if (_args.has("relevantTraitBonus")) else 0.0
	currentBid = startingBid

static func calculateSlaveTraitsStatic(theChar:BaseCharacter) -> Dictionary:
	var theTraits:Dictionary = {}
	for traitID in GlobalRegistry.getAuctionTraits():
		var trait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
		
		var score:float = trait.calculateScore(traitID, theChar)
		theTraits[traitID] = score
	return theTraits

func calculateSlaveTraits():
	slaveTraits = calculateSlaveTraitsStatic(getChar())

func generateBidders():
	bidders = GM.main.SAB.grabBidders()
	for bidder in bidders:
		bidder.setAuction(self)

func getText() -> String:
	if(state == "ended"):
		return actionText
	if(state == "react"):
		return actionText
	
	var isStart:bool = (state == "start")
	var theTexts:Array = []
	var bettingBeginsRound:int = getSoftEndRound()
	
	var slavesTraitsTexts:Array = []
	for traitID in slaveTraits:
		var score:float = slaveTraits[traitID]
		var trait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
		
		if(score > 0.0):
			var theName:String = trait.getName(traitID)
			if(usedTraits.has(traitID)):
				theName = "[color=#FF63E7]"+theName+"[/color]"
			
			#slavesTraitsTexts.append(theName+" ("+str(score)+")")
			slavesTraitsTexts.append(theName)
		
	if(isStart):
		theTexts.append("The auction is about to start. Your job is to sell your slave for as many credits as possible by making bidders outbid each other.")
		theTexts.append("Bidders have different preferences that you can learn while presenting your slave. Try to avoid highlighting the traits that the bidders dislike and focus on the traits that they do like.")
		theTexts.append("The auction will end in 3 rounds (soft end) unless you manage to keep the bid war going. If you get at least 2 new bids after an action, you get an ability to do another action.")
		theTexts.append("")
		theTexts.append("Starting Bid: "+str(getStartingBid())+" credits. Minimum Bid Increment: "+str(getBidIncrease())+" credits.")
		theTexts.append("{slave.name}'s traits: "+Util.join(slavesTraitsTexts, ", "))
		theTexts.append("")
		theTexts.append(getBidderInfo())
		theTexts.append("")
		theTexts.append("How do you want to introduce your slave?")
	else:
		theTexts.append("Round №"+str(roundNumber)+((". Soft end at round "+str(bettingBeginsRound)+".") if roundNumber < bettingBeginsRound else ". Soft end is reached. Auction will end if you get less than 2 new bids."))
		theTexts.append("{slave.name}'s traits: "+Util.join(slavesTraitsTexts, ", "))
		theTexts.append("")
		theTexts.append(getBidderInfo())
		theTexts.append("")
		theTexts.append("How do you want to present your slave?")
	
	return Util.join(theTexts, "\n")

func getActions() -> Array:
	var result:Array = []
	
	if(state == "react"):
		result.append(GlobalRegistry.getAuctionAction("Continue"))
	elif(state == "ended"):
		result.append(GlobalRegistry.getAuctionAction("Continue"))
	elif(state == "start"):
		for actionID in GlobalRegistry.getAuctionActions():
			var theAction:AuctionAction = GlobalRegistry.getAuctionAction(actionID)
			if(theAction == null || theAction.getActionType() != AuctionActionType.Intro):
				continue
			result.append(theAction)
	else:
		for actionID in GlobalRegistry.getAuctionActions():
			var theAction:AuctionAction = GlobalRegistry.getAuctionAction(actionID)
			if(theAction == null || theAction.id == "Continue"):
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
	
	if(_auctionAction.canOnlyUseOnce()):
		if(usedActions.has(_auctionAction.id)):
			return [false, "You already used this action"]
	
	var canUseInfo:Array = _auctionAction.canUse(getChar(), slaveTraits)
	if(!canUseInfo[0]):
		return canUseInfo
	
	if(_auctionAction.requiresAtLeastOneTraitForSlave()):
		var canUseAction:bool = false
		var traitsToCheck:Dictionary = _auctionAction.getTraits()
		if(!traitsToCheck.empty()):
			for traitID in traitsToCheck:
				if(slaveTraits.has(traitID) && slaveTraits[traitID] > 0.0):
					canUseAction = true
					break
		else:
			canUseAction = true
		
		if(!canUseAction):
			return [false, "Your slave lacks the traits required for this action"]
			
#	var traitsToCheck:Dictionary = _auctionAction.getTraits()
#	if(!traitsToCheck.empty()):
#		for traitID in traitsToCheck:
#			if(usedTraits.has(traitID)):
#				return [false, "You already showed this trait"]
	
	return [true]

func doAction(_auctionAction:AuctionAction):
	for bidder in bidders:
		bidder.clearDiscovered()
	extraActionTexts = []
	
	if(state == "ended"):
		shouldEnd = true
		return
	
	if(state == "react"):
		if(canPresent):
			onNewRound()
		
		if(!canPresent):
			bidLastChances += 1
			if(bidLastChances == 1):
				if(hasAnyBids()):
					saynnPresenter(str(currentBid)+" credits. Going once."+getGoingOnceText())
				else:
					saynnPresenter("No bids. Going once."+getGoingOnceTextNoBids())
			elif(bidLastChances == 2):
				if(hasAnyBids()):
					saynnPresenter(str(currentBid)+" credits. Going twice."+getGoingTwiceText())
				else:
					saynnPresenter("No bids. Going twice."+getGoingTwiceTextNoBids())
			elif(bidLastChances == 3):
				state = "ended"
				
				if(hasAnyBids()):
					saynnPresenter("SOLD!")
					
					var soldBidder:AuctionBidder = bidders[lastBidderIndex]
					
					sayn("The slave was sold to "+soldBidder.name+" for "+str(currentBid)+" credits!")
					sayn("Total amount of bids: "+str(totalBidTimes))
					saynn("Round amount: "+str(roundNumber))
					
					var totalTraitsPositive:int = 0
					var totalTraitsNegative:int = 0
					var totalRevealedTraitsPositive:int = 0
					var totalRevealedTraitsNegative:int = 0
					var totalHitTraitsPositive:int = 0
					var totalHitTraitsNegative:int = 0
					for bidderA in bidders:
						var bidder:AuctionBidder = bidderA
						totalTraitsPositive += bidder.likes.size()
						totalTraitsNegative += bidder.dislikes.size()
						for traitID in bidder.likes:
							var traitT = bidder.likes[traitID]
							if(traitT >= AuctionBidder.TRAIT_DISCOVERED):
								totalRevealedTraitsPositive += 1
							if(traitT >= AuctionBidder.TRAIT_HIT):
								totalHitTraitsPositive += 1
						for traitID in bidder.dislikes:
							var traitT = bidder.dislikes[traitID]
							if(traitT >= AuctionBidder.TRAIT_DISCOVERED):
								totalRevealedTraitsNegative += 1
							if(traitT >= AuctionBidder.TRAIT_HIT):
								totalHitTraitsNegative += 1
					if(totalTraitsPositive != 0 && totalTraitsNegative != 0):
						sayn("Bidders total traits amount: "+str(totalTraitsPositive+totalTraitsNegative)+", Positive: "+str(totalTraitsPositive)+", Negative: "+str(totalTraitsNegative))
						sayn("Revealed: "+str(totalRevealedTraitsPositive+totalRevealedTraitsNegative)+" ("+str(Util.roundF(float(totalRevealedTraitsPositive+totalRevealedTraitsNegative)/float(totalTraitsPositive+totalTraitsNegative)*100.0, 1))+"%), Positive: "+str(totalRevealedTraitsPositive)+" ("+str(Util.roundF(float(totalRevealedTraitsPositive)/float(totalTraitsPositive)*100.0, 1))+"%), Negative: "+str(totalRevealedTraitsNegative)+" ("+str(Util.roundF(float(totalRevealedTraitsNegative)/float(totalTraitsNegative)*100.0, 1))+"%)")
						sayn("Hit: "+str(totalHitTraitsPositive+totalHitTraitsNegative)+" ("+str(Util.roundF(float(totalHitTraitsPositive+totalHitTraitsNegative)/float(totalTraitsPositive+totalTraitsNegative)*100.0, 1))+"%), Positive: "+str(totalHitTraitsPositive)+" ("+str(Util.roundF(float(totalHitTraitsPositive)/float(totalTraitsPositive)*100.0, 1))+"%), Negative: "+str(totalHitTraitsNegative)+" ("+str(Util.roundF(float(totalHitTraitsNegative)/float(totalTraitsNegative)*100.0, 1))+"%)")
				else:
					saynnPresenter("That's it.. Time is up.")
					
					saynn("The slave wasn't sold to anyone..")
				
				actionText = Util.join(extraActionTexts, "")
				return
			
			doRoundOfBiddingWithChecks()
			actionText = Util.join(extraActionTexts, "")
			state = "react"
			#if(!canPresent):
			#	state = "react"
			#else:
			#	state = "act"
		return
	
	state = "react"
	
	var theResult:Dictionary = _auctionAction.onActFinal(getChar(), self, slaveTraits)
	if(!theResult.has("text")):
		theResult["text"] = "NO ACTION TEXT PROVIDED, FIX ME"
	
	saynn(theResult["text"])
	#actionText = theResult["text"]
	
	if(!theResult.has("traits")):
		theResult["traits"] = _auctionAction.getTraits()
	if(!theResult.has("desire")):
		theResult["desire"] = _auctionAction.getPassiveDesireGain()
	if(!theResult.has("slaveReaction")):
		theResult["slaveReaction"] = _auctionAction.getSlaveReaction(getChar(), getSlaveReactionType())
	
	#var extraTexts:Array = []
	saynn(theResult["slaveReaction"])
	
	var traits:Dictionary = theResult["traits"]
	if(!traits.empty()):
		for traitID in traits:
			usedTraits[traitID] = true
	usedActions[_auctionAction.id] = true
		
	var didPositiveReact:bool = false
	var didNegativeReact:bool = false
	for bidderA in getBiddersRandomOrder():
		var bidder:AuctionBidder = bidderA
		var reactResult:Dictionary = bidder.onAction(self, _auctionAction, theResult)
		
		if(reactResult["hitAnyLikes"] && reactResult["desireDelta"] > 0.0 && !didPositiveReact):
			didPositiveReact = true
			bidder.say(_auctionAction.getPositiveReaction(getChar(), slaveTraits))
		if(reactResult["hitAnyDislikes"] && reactResult["desireDelta"] < 0.0 && !didNegativeReact):
			didNegativeReact = true
			bidder.say(_auctionAction.getNegativeReaction(getChar(), slaveTraits))
	if(!didPositiveReact && !didNegativeReact && _auctionAction.getActionType() != AuctionActionType.Intro && _auctionAction.getActionType() != AuctionActionType.Ungrouped):
		RNG.pick(bidders).say(RNG.pick([
			"Hmm..",
			"..hm.. anyone has any feedback?",
			"Hm.. I don't know..",
		]))
		
	if(!_auctionAction.isEmphasizeAction()):
		for bidderA in getBiddersRandomOrder():
			var bidder:AuctionBidder = bidderA
			
			for traitID in traits:
				var _ok = bidder.hitTrait(self, traitID)
			#var _ok2 = bidder.discoverRandomTrait(self)
	
	var hadAnyLearns:bool = false
	for bidderA in bidders:
		var bidder:AuctionBidder = bidderA
		
		if(bidder.discoveredLikes.empty() && bidder.discoveredDislikes.empty()):
			continue
		
		var disTexts:Array = []
		var disLikesTexts:Array = []
		var disDisLikesTexts:Array = []
		
		for traitID in bidder.discoveredLikes:
			var traitObj:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
			if(traitObj == null):
				continue
			disLikesTexts.append("[color=#"+bidder.getTraitColor(traitID).to_html(false)+"]"+traitObj.getName(traitID)+"[/color]")
		for traitID in bidder.discoveredDislikes:
			var traitObj:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
			if(traitObj == null):
				continue
			disDisLikesTexts.append("[color=#"+bidder.getTraitColor(traitID).to_html(false)+"]"+traitObj.getName(traitID)+"[/color]")
		
		if(disLikesTexts.size() > 0):
			disTexts.append("prefers slaves with "+Util.humanReadableList(disLikesTexts)+" trait"+("s" if disLikesTexts.size() > 1 else ""))
		if(disDisLikesTexts.size() > 0):
			disTexts.append("dislikes slaves with "+Util.humanReadableList(disDisLikesTexts)+" trait"+("s" if disDisLikesTexts.size() > 1 else ""))

		sayn("[i]You learned that "+bidder.name+" "+Util.join(disTexts, " and ")+".[/i]")
		hadAnyLearns = true
	if(hadAnyLearns):
		sayn("")

	if(roundNumber == getSoftEndRound()):
		saynnPresenter("We’re wrapping now, folks! Get your bids in while you can!")

	doRoundOfBiddingWithChecks()
		
	#if(!biddingTexts.empty()):
	#	extraTexts.append("")
	#	extraTexts.append_array(biddingTexts)
	
	#if(!extraTexts.empty()):
	#	actionText += "\n\n"+Util.join(extraTexts, "\n")
		
	actionText = Util.join(extraActionTexts, "")

func saynn(theText:String):
	extraActionTexts.append(theText+"\n\n")

func sayn(theText:String):
	extraActionTexts.append(theText+"\n")

func triggerSlaveBiddingReaction():
	var theReaction:String = getSlaveBiddingReactionText()
	if(theReaction != ""):
		saynn(theReaction)
	
	if(RNG.chance(40)):
		var theDialogueLine:String = getSlaveBiddingReactionDialogue()
		if(theDialogueLine != ""):
			saynn("[say=slave]"+theDialogueLine+"[/say]")

func doRoundOfBiddingWithChecks():
	var bidAmount:int = doRoundOfBidding()
	
	if(roundNumber >= getSoftEndRound()):
		if(bidAmount >= 2):
			#print("YAY. BID AMOUNT: "+str(bidAmount))
			saynn("Since you got at least 2 new bids, you can present your slave more!")
			canPresent = true
			bidLastChances = 0
		else:
			canPresent = false
			saynn("Since you got less than 2 new bids after the soft end, you can’t present your slave anymore.")
	else:
		if(roundNumber == 0):
			saynn("The auction has started! Learn as many bidders preferences as possible before the soft end.")
		else:
			saynn("Since it’s round "+str(roundNumber)+" and the soft end hasn’t happened yet, you can present your slave more.")
		canPresent = true
		bidLastChances = 0

func doRoundOfBidding() -> int:
	var resultBidAmount:int = 0
	
	var biddingRoundAmount:int = 1#3
	
	var biddersCopy:Array = []
	for bidder in bidders:
		if(lastBidderIndex != bidder.index):
			biddersCopy.append(bidder)
	biddersCopy.shuffle()
	for bidder in bidders:
		if(lastBidderIndex == bidder.index): # Current bidder is always last so they can bid back
			biddersCopy.append(bidder)
	
	
	for _i in range(biddingRoundAmount):
		for bidderA in biddersCopy:
			var bidder:AuctionBidder = bidderA
			if(lastBidderIndex == bidder.index):
				continue
			
			var chanceToBid:float = bidder.calculateChanceToBid()
			
			if(RNG.chance(chanceToBid / (_i+1))):
				var raiseChance:float = (bidder.desire - 1.5)*50.0
				var willRaise:bool = RNG.chance(raiseChance) && (totalBidTimes != 0)
				
				if(totalBidTimes != 0):
					currentBid += getBidIncrease()
				if(willRaise):
					currentBid += RNG.randi_range(2, 5) * getBidIncrease()
					for otherBidder in bidders:
						if(otherBidder == bidder):
							continue
						if(otherBidder.desire > 0.0):
							otherBidder.desire *= 0.5
							
				bidder.currentBid = currentBid
				lastBidderIndex = bidder.index
				bidder.onBid(totalBidTimes)
				
				if(totalBidTimes == 0):
					saynn("[say="+bidder.bidderID+"]I will match "+str(currentBid)+" credits.[/say]")
				else:
					var theDot:String = "."
					if(totalBidTimes > 10):
						theDot = "!"
					var prefix:String = ""
					if(willRaise):
						prefix = "I will raise it to "
						
					if(resultBidAmount == 0 || RNG.chance(80 - resultBidAmount*10 - totalBidTimes*3)):
						saynn("[say="+bidder.bidderID+"]"+prefix+str(currentBid)+" credits"+theDot+"[/say]")
					else:
						saynn("[say="+bidder.bidderID+"]"+prefix+str(currentBid)+" credits"+theDot+" "+bidder.getOutbidReaction()+"[/say]")
					
					
					#saynn(bidder.name+" placed a "+str(currentBid)+" credits bid.")
				resultBidAmount += 1
				bidLastChances = 0
				totalBidTimes += 1
				
				if(resultBidAmount == 2):
					triggerSlaveBiddingReaction()
	
	return resultBidAmount

func getBidderInfo() -> String:
	var resultAr:Array = []
	
	for bidder in bidders:
		resultAr.append(Util.join(bidder.getBidderInfo(), "\n"))
	
	return Util.join(resultAr, "\n\n")

func getSoftEndRound() -> int:
	return 3

func getTotalBidTimes() -> int:
	return totalBidTimes

func getBiddersRandomOrder() -> Array:
	var result:Array = []
	result.append_array(bidders)
	result.shuffle()
	return result

func getPresenterID() -> String:
	return presenterID

func saynnPresenter(theText:String):
	saynn("[say=presenter]"+theText+"[/say]")

func unlockRandomTraitEachBidder():
	for bidder in bidders:
		bidder.discoverRandomTrait(self)

func unlockRandomRelevantTraitEachBidder():
	for bidder in bidders:
		bidder.discoverRandomRelevantTrait(self)

func unlockRandomTraitOfTypeEachBidder(_traitType):
	for bidder in bidders:
		bidder.discoverRandomTraitOfType(self, _traitType)

func unlockRandomTraitOfTypeEachBidderWithChance(_traitType, _chance:float):
	for bidder in bidders:
		if(RNG.chance(_chance + relevantTraitBonus*100.0)):
			bidder.discoverRandomTraitOfType(self, _traitType)

func unlockPercentageOfTraitsRandomBidder(howMuch:float, howMuchDesireToAdd:float = 0.0):
	var theBidder:AuctionBidder = RNG.pick(bidders)
	theBidder.desire += howMuchDesireToAdd
	
	var unlockedPerc:float = theBidder.getPercentageOfDiscoveredTraits()
	while(unlockedPerc < howMuch):
		var _ok = theBidder.discoverRandomTrait(self)
		if(!_ok):
			return
		
		unlockedPerc = theBidder.getPercentageOfDiscoveredTraits()

func calculateSlaveReactionType():
	var theCharacter:BaseCharacter = getCharacter()
	var thePersonality:Personality = theCharacter.getPersonality()
	var npcSlavery:NpcSlave
	var obedience:float = 0.0
	var trust:float = 0.0
	var love:float = 0.0
	var spoiling:float = 0.0
	var isMindBroken:bool = false
	if(theCharacter.isSlaveToPlayer()):
		npcSlavery = theCharacter.getNpcSlavery()
		obedience = npcSlavery.getObedience()
		isMindBroken = npcSlavery.isMindBroken()
		love = npcSlavery.getLove()
		trust = npcSlavery.getTrust()
		spoiling = npcSlavery.getSpoiling()
	
	if(isMindBroken):
		return AuctionSlaveReaction.MindBroken
	
	var reactionScores:Dictionary = {}
	reactionScores[AuctionSlaveReaction.Obedient] = obedience + thePersonality.getStat(PersonalityStat.Subby) * 0.5
	reactionScores[AuctionSlaveReaction.Confused] = love*0.5 + trust*0.5 - thePersonality.getStat(PersonalityStat.Mean) * 0.5 + thePersonality.getStat(PersonalityStat.Naive) * 0.5 + thePersonality.getStat(PersonalityStat.Brat) * 0.2
	reactionScores[AuctionSlaveReaction.Shy] = obedience*0.5 + love*0.5 - thePersonality.getStat(PersonalityStat.Mean) * 0.5 + thePersonality.getStat(PersonalityStat.Subby) * 0.5 + thePersonality.getStat(PersonalityStat.Coward) * 0.5
	reactionScores[AuctionSlaveReaction.Desperate] = trust*0.5 + spoiling - thePersonality.getStat(PersonalityStat.Naive) * 0.5 - thePersonality.getStat(PersonalityStat.Subby) * 0.5 + thePersonality.getStat(PersonalityStat.Impatient) * 0.5
	reactionScores[AuctionSlaveReaction.Angry] = trust + love*0.5 + thePersonality.getStat(PersonalityStat.Mean) - thePersonality.getStat(PersonalityStat.Subby) * 0.5 - thePersonality.getStat(PersonalityStat.Impatient) * 0.2 - thePersonality.getStat(PersonalityStat.Coward) * 0.3

	var maxScoreReaction = AuctionSlaveReaction.Confused
	var maxScoreScore:float = -9999.9
	
	for theReaction in reactionScores:
		if(reactionScores[theReaction] > maxScoreScore):
			maxScoreScore = reactionScores[theReaction]
			maxScoreReaction = theReaction
	
	
	return maxScoreReaction

func getSlaveReactionType():
	return slaveReactionType

func hasEnded() -> bool:
	return shouldEnd

func increaseBiddersDesire(howMuch:float):
	for bidder in bidders:
		bidder.desire += howMuch

func getSlaveBiddingReactionText() -> String:
	var _reactionType = getSlaveReactionType()
	if(_reactionType == AuctionSlaveReaction.Obedient):
		return RNG.pick([
			"{slave.name} lowers {slave.his} head even further, accepting the frenzy of bids with silent submission.",
			"{slave.name} glances up briefly, the rapid bidding only confirming {slave.his} place, {slave.he} waits patiently for it to end.",
			"{slave.name}'s breathing remains steady, though {slave.his} fingers twitch subtly in response to the intense focus.",
			"{slave.name} closes {slave.his} eyes momentarily, as if resigned to the outcome, allowing the chaos to continue.",
			"A faint nod comes from {slave.name}'s head, as if silently acknowledging {slave.his} worth to the bidders.",
			"{slave.name} stands perfectly still, offering no visible reaction as the bidding war rages on, fully accepting {slave.his} fate.",
		])
	if(_reactionType == AuctionSlaveReaction.Confused):
		return RNG.pick([
			"{slave.name}'s eyes widen slightly as the bids escalate, the confusion in {slave.his} gaze deepening.",
			"{slave.name} looks around anxiously, the desperation in {slave.his} eyes growing with each new offer.",
			"{slave.name} bites {slave.his} lip, a mix of sadness and uncertainty creeping into {slave.his} expression.",
			"{slave.name} winces at every new bid, the rising numbers making {slave.him} feel more and more lost.",
			"{slave.name} blinks rapidly, as if trying to understand why so much attention is on {slave.him}.",
			"A small, quiet gasp escapes {slave.name}'s lips, overwhelmed by the growing intensity of the bid war.",
		])
	if(_reactionType == AuctionSlaveReaction.Shy):
		return RNG.pick([
			"{slave.name}'s cheeks flush deeper with every rising bid, clearly overwhelmed by the attention.",
			"{slave.name} looks away, {slave.his} body trembling slightly as {slave.he} tries to hide {slave.his} embarrassment.",
			"{slave.name} stifles a whimper, clearly unused to being fought over like this.",
			"{slave.name}'s entire face burns crimson as the bids keep coming, {slave.his} shy nature causing {slave.him} to shift nervously.",
			"{slave.name}'s breath quickens, the intensity of the bids making {slave.him} feel even more exposed.",
			"{slave.name} squeezes {slave.his} eyes shut for a moment, trying to cope with the barrage of attention.",
		])
	if(_reactionType == AuctionSlaveReaction.MindBroken):
		return RNG.pick([
			"{slave.name} remains utterly still, the increasing bids seeming to have no impact on {slave.him}.",
			"{slave.name} stares blankly into the distance, oblivious to the intense bid war erupting around {slave.him}.",
			"{slave.name}'s body sways slightly, but there is no awareness in {slave.his} eyes as the numbers rise.",
			"{slave.name} doesn’t blink or respond, the frantic bidding as meaningless to {slave.him} as anything else.",
			"{slave.name}'s head hangs loosely, no sign of recognition in {slave.his} empty gaze.",
			"{slave.name} stands in place like a lifeless doll, completely unaffected by the chaos around {slave.him}.",
		])
	if(_reactionType == AuctionSlaveReaction.Desperate):
		return RNG.pick([
			"{slave.name}'s breath quickens in panic as the bidding intensifies, {slave.his} eyes darting between the bidders.",
			"{slave.name} pulls against the chains, the desperation building with every bid, a silent plea for it to stop.",
			"A soft sob escapes {slave.name}'s lips, the rapidly rising bids only heightening {slave.his} confusion and fear.",
			"{slave.name} gasps, shaking {slave.his} head as if trying to deny what’s happening, unable to make sense of the chaos.",
			"{slave.name} twists in the restraints, visibly panicked, the rising offers making {slave.his} situation feel more hopeless.",
			"{slave.name}'s entire body trembles as the bids soar higher, clearly feeling trapped with no way out.",
		])
	if(_reactionType == AuctionSlaveReaction.Angry):
		return RNG.pick([
			"{slave.name}'s jaw clenches tighter with every new bid, fury building in {slave.his} gaze.",
			"{slave.name} glares at the crowd, hate-filled eyes daring the bidders to keep going, as if ready to fight them all.",
			"{slave.name} growls under {slave.his} breath, the rising bids only fueling {slave.his} anger further.",
			"{slave.name} spits on the ground, the aggressive bidding war enraging {slave.him} even more.",
			"{slave.name}'s eyes burn with defiance as the numbers climb, clearly refusing to accept {slave.his} fate quietly.",
			"{slave.name} jerks against {slave.his} restraints, every new bid making {slave.him} more determined to resist.",
		])
	return ""

func getSlaveBiddingReactionDialogue() -> String:
	var _reactionType = getSlaveReactionType()
	if(_reactionType == AuctionSlaveReaction.Obedient):
		return RNG.pick([
			'I’ll serve.. whoever wins.. I will do my best.',
			'I.. accept my fate. Whoever chooses me, I’m ready.',
			'Please.. I only want to be useful.',
			'I’ll obey.. I’ll obey anyone who wins.',
			'I was trained for this.. I won’t disappoint.',
			'I belong to whoever decides.. I’ll serve loyally.',
		])
	if(_reactionType == AuctionSlaveReaction.Confused):
		return RNG.pick([
			'Please.. stop this.. I don’t understand.',
			'I don’t know why.. this is happening.. please..',
			'I just want to go back.. please let me go.',
			'Why are you doing this? I didn’t ask for any of this..',
			'I don’t want to be sold.. Please, someone help me!',
			'This.. can’t be happening.. I don’t belong here.',
		])
	if(_reactionType == AuctionSlaveReaction.Shy):
		return RNG.pick([
			'Wh-why are they bidding so much for me?',
			'I.. I don’t know if I deserve this kind of attention.',
			'Th-they’re fighting over me.. I can’t believe it.',
			'I-I don’t understand.. why are they all looking at me?',
			'This is too much.. I don’t want them staring at me like that.',
			'They’re all watching me.. I-I don’t know what to do!',
		])
	if(_reactionType == AuctionSlaveReaction.MindBroken):
		return RNG.pick([
			"...",
			"... ..",
			"... . . . ...",
			"..k.. h..",
			"..kh..",
		])
	if(_reactionType == AuctionSlaveReaction.Desperate):
		return RNG.pick([
			'Why are you bidding on me?! Stop! I don’t want this!',
			'Please, someone.. help me! Don’t leave me here!',
			'Let me go! Stop fighting for me! I don’t belong here!',
			'You can’t sell me! I’m not some object!',
			'Someone.. anyone.. please get me out of here!',
			'Stop bidding! I’m not for sale!',
		])
	if(_reactionType == AuctionSlaveReaction.Angry):
		return RNG.pick([
			'Keep bidding, you bastards. You won’t break me!',
			'I’m not afraid of you! You’ll regret this!',
			'You think you own me? I’ll tear you apart!',
			'Go ahead, fight over me. You’ll never control me.',
			'I’m not some prize! I’ll make you pay for this!',
			'Bid all you want, I’ll escape the moment you turn your back!',
		])
	return ""

func calculateStartingBid(_char:BaseCharacter) -> int:
	return 50

func calculateBidIncrease(_char:BaseCharacter) -> int:
	return 10

func getStartingBid() -> int:
	return startingBid

func getBidIncrease() -> int:
	return bidIncrease

func hasAnyBids() -> bool:
	return (lastBidderIndex >= 0)

func getAuctionResult() -> Dictionary:
	return {
		slaveID = charID,
		wasSold = (lastBidderIndex >= 0),
		winningBid = (currentBid if (currentBid >= 0) else 0),
		totalBidTimes = totalBidTimes,
		bidderIndex = lastBidderIndex,
	}

func getGoingOnceText() -> String:
	if(RNG.chance(50)):
		return ""
	return " "+RNG.pick([
		"Come on, don’t let this rare chance slip by!",
		"This is your moment to steal the prize!",
		"Any more offers maybe?",
		"Don’t hesitate, or you’ll regret it!",
		"Are we really going to stop here?",
		"This is your last chance to outbid the competition!",
		"You won’t find another slave like {slave.him}, I assure you.",
		"A slave of this caliber deserves a little more enthusiasm!",
		"Anyone willing to go higher?",
		"Any more bids?",
		"More bids?",
		"Will you give me more?",
		"Can you give me more?",
	])

func getGoingTwiceText() -> String:
	return " "+RNG.pick([
		"C'mon, it's your last chance to bid!",
		"Last chance! Don’t say I didn’t warn you!",
		"Speak now, or lose this fucktoy forever!",
		"I can feel someone’s hesitation - make the call now!",
		"Anyone daring enough?",
		"This is your final moment to claim this gem!",
		"Surely you won’t let them walk away this easily?",
		"The clock’s ticking, any last-minute offers?",
		"Is that truly your best? Show me a final bid!",
		"Will you make it count, or let it go?"
	])

func getGoingOnceTextNoBids() -> String:
	return " "+RNG.pick([
		"This is such an opportunity, c'mon!",
		"Not a single bid yet? You’re missing out!",
		"This slave is worth far more than silence - who’ll start us off?",
		"Don’t let this end without a single offer!",
		"Are you really going to pass on such a fine specimen?",
		"This is your moment to start the bidding - don’t hold back!",
		"Surely, someone sees the potential here?",
		"First bid wins the advantage - who’s going to take it?",
		"Don’t be shy. A first bid can make all the difference!",
		"I’m surprised.. no bids for such a rare find?",
	])

func getGoingTwiceTextNoBids() -> String:
	return " "+RNG.pick([
		"This is it! Someone start the bidding or lose this fucktoy for good!",
		"Last chance! Are you all going to let this one go?",
		"The auction’s about to end, who will place the first bid?",
		"I can’t believe there’s no interest - prove me wrong!",
		"This rare opportunity will slip away - don’t be the one to regret it!",
		"I can feel hesitation in the room - just one bid to change everything!",
		"This slave deserves better than silence - who will start the bidding?",
		"Almost gone! You’ll kick yourselves for missing out!",
		"No bids yet? Make one now before the auction ends!",
	])

func saveData():
	var biddersData:Array = []
	for bidder in bidders:
		biddersData.append(bidder.saveData())
	
	return {
		charID = charID,
		roundNumber = roundNumber,
		totalBidTimes = totalBidTimes,
		currentBid = currentBid,
		lastBidderIndex = lastBidderIndex,
		state = state,
		canPresent = canPresent,
		bidLastChances = bidLastChances,
		startingBid = startingBid,
		bidIncrease = bidIncrease,
		relevantTraitBonus = relevantTraitBonus,
		actionText = actionText,
		slaveTraits = slaveTraits,
		usedTraits = usedTraits,
		usedActions = usedActions,
		slaveReactionType = slaveReactionType,
		shouldEnd = shouldEnd,
		bidders = biddersData,
		presenterID = presenterID,
	}

func loadData(_data):
	charID = SAVE.loadVar(_data, "charID", "rahi")
	roundNumber = SAVE.loadVar(_data, "roundNumber", 0)
	totalBidTimes = SAVE.loadVar(_data, "totalBidTimes", 0)
	currentBid = SAVE.loadVar(_data, "currentBid", 0)
	lastBidderIndex = SAVE.loadVar(_data, "lastBidderIndex", -1)
	state = SAVE.loadVar(_data, "state", "start")
	canPresent = SAVE.loadVar(_data, "canPresent", true)
	bidLastChances = SAVE.loadVar(_data, "bidLastChances", 0)
	startingBid = SAVE.loadVar(_data, "startingBid", 50)
	bidIncrease = SAVE.loadVar(_data, "bidIncrease", 10)
	relevantTraitBonus = SAVE.loadVar(_data, "relevantTraitBonus", 0.0)
	actionText = SAVE.loadVar(_data, "actionText", "")
	slaveTraits = SAVE.loadVar(_data, "slaveTraits", {})
	usedTraits = SAVE.loadVar(_data, "usedTraits", {})
	usedActions = SAVE.loadVar(_data, "usedActions", {})
	slaveReactionType = SAVE.loadVar(_data, "slaveReactionType", AuctionSlaveReaction.Confused)
	shouldEnd = SAVE.loadVar(_data, "shouldEnd", false)
	presenterID = SAVE.loadVar(_data, "presenterID", "mirri")
	
	bidders = []
	var biddersData = SAVE.loadVar(_data, "bidders", [])
	for bidderInfo in biddersData:
		var newBidder:AuctionBidder = AuctionBidder.new()
		newBidder.loadData(bidderInfo)
		newBidder.setAuction(self)
		bidders.append(newBidder)
