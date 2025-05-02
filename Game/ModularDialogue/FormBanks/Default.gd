extends DialogueFormBank

func getForms() -> Dictionary:
	return {
		"AttackStart": form("I will fuck you up.", {main=CHAR, target=CHAR}, "main", "target"), # Attacking someone
		"AttackReact": form("Hey, what the fuck are you doing. What's your problem.", {main=CHAR, target=CHAR}, "main", "target"), # Reacting to being attacked
		"FightLostGeneric": form("Argh..", {loser=CHAR, winner=CHAR}, "loser", "winner"),
		"FightWonGeneric": form("That was easy.", {loser=CHAR, winner=CHAR}, "winner", "loser"),
		"FightSurrender": form("I surrender, don't hurt me.", {loser=CHAR, winner=CHAR}, "loser", "winner"),
		
		"GuardCaughtOffLimits": form("Hey, what are you doing in there?", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardCaughtOffLimitsFight": form("You wanna fight? Alright.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardInmateSurrender": form("Surrendering? Smart.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardFrisk": form("Don't move while I do this.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardFriskFound": form("This isn’t allowed. I’m taking it.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardFriskNoFound": form("Clean. You're lucky, inmate.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardFriskFailResist": form("Argh. Fuck it.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardGoAway": form("Now go away.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardKeepMoving": form("Keep moving, inmate.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		
		"PunishDecide": form("What should I do with you..", {punisher=CHAR, target=CHAR}, "punisher", "target"),
		"PunishDecideStocks": form("Stocks will do nicely.", {punisher=CHAR, target=CHAR}, "punisher", "target"),
		"PunishAboutToStocks": form("Bend over.", {punisher=CHAR, target=CHAR}, "punisher", "target"),
		"PunishLockIntoStocks": form("Have fun.", {punisher=CHAR, target=CHAR}, "punisher", "target"),
		"PunishSex": form("Let's have some fun.", {punisher=CHAR, target=CHAR}, "punisher", "target"),
		"PunishSubSex": form("You can do whatever you want with me.", {punisher=CHAR, target=CHAR}, "punisher", "target"),
		"PunishDecidedSlutwall": form("I want to see others use you in a slutwall.", {punisher=CHAR, target=CHAR}, "punisher", "target"),
		"PunishLockIntoSlutwall": form("Enjoy.", {punisher=CHAR, target=CHAR}, "punisher", "target"),
		
		"ReactBODYWRITINGS": form("Nice bodywritings, slut!", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactTALLYMARKS": form("Nice tallymarks, slut!", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactCOVERED_IN_CUM": form("So messy. What a slut!", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactCOVERED_IN_PISS": form("Ew, gross!", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactNAKED": form("Ha, cover up, slut!", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactCAN_GRAB_AND_FUCK": form("Wow, someone should fuck you, slut!", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactON_A_LEASH": form("Haha, you love being paraded around, slut?", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactGETTING_FUCKED": form("Nice, a whore is getting fucked!", {main=CHAR, target=CHAR}, "main", "target"),
		
		"ReactLEASHING_SOMEONE": form("Nice catch!", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactFUCKING_SOMEONE": form("Yeah, fuck that slut!", {main=CHAR, target=CHAR}, "main", "target"),
	
		"AskKeyCanYouUnlock": form("Hey, can you unlock me?", {main=CHAR, target=CHAR}, "main", "target"),
		"AskKeyDeny": form("Maybe later.", {main=CHAR, target=CHAR}, "main", "target"),
		"AskKeyGive": form("Okay, let's unlock you.", {main=CHAR, target=CHAR}, "main", "target"),
		"AskKeyChallenge": form("Tell you what. I'm gonna fuck you. And if you're gonna be a good fucktoy.. I might unlock you.", {main=CHAR, target=CHAR}, "main", "target"),
		"AskKeyChallengeUnlock": form("Good slut. I liked that.", {main=CHAR, target=CHAR}, "main", "target"),
		"AskKeyChallengeFail": form("That sucked. You can stay locked, whore.", {main=CHAR, target=CHAR}, "main", "target"),
		"AskKeyChallengeRefuse": form("I refuse.", {main=CHAR, target=CHAR}, "main", "target"),
		"AskKeyChallengeRefuseStay": form("Stay locked then. Like I care.", {main=CHAR, target=CHAR}, "main", "target"),
		
		"HelpRestraintsAsk": form("Hey. Can you help me with these restraints maybe?", {main=CHAR, target=CHAR}, "main", "target"),
		"HelpRestraintsAgree": form("Sure. Let's see what I can do.", {main=CHAR, target=CHAR}, "main", "target"),
		"HelpRestraintsAltStart": form("Hey. I wanna help you with these restraints. Sit tight.", {main=CHAR, target=CHAR}, "main", "target"),
		"HelpRestraintsAltRefuseUnhappy": form("I don't want your help with restraints.", {main=CHAR, target=CHAR}, "main", "target"),
		"HelpRestraintsAltRefuseKinky": form("Oh, I'm only wearing those because I want to.", {main=CHAR, target=CHAR}, "main", "target"),
		"HelpRestraintsAltRefuseKinkyReact": form("Kinky.", {main=CHAR, target=CHAR}, "main", "target"),
		"HelpRestraintsDeny": form("No can't do. You will have to stay locked.", {main=CHAR, target=CHAR}, "main", "target"),
		"HelpRestraintsFinished": form("That's all that I can do.", {main=CHAR, target=CHAR}, "main", "target"),
		"HelpRestraintsPaid": form("That will do. I will go now.", {main=CHAR, target=CHAR}, "main", "target"),
		"HelpRestraintsRefusePay": form("I'm not paying! You didn't even do that much.", {main=CHAR, target=CHAR}, "main", "target"),
		"HelpRestraintsRefusePayWhatever": form("Whatever then.", {main=CHAR, target=CHAR}, "main", "target"),
		
		"HelpStocksSlutwallRefuse": form("I don't want your help breaking free.", {main=CHAR, target=CHAR}, "main", "target"),
		"SlutwallStealCredits": form("A whore like you doesn't deserve these credits.", {main=CHAR, target=CHAR}, "main", "target"), # Stealing from the slutwall's tipbox
		"SlutwallAddTip": form("There you go. What a good fucktoy.", {main=CHAR, target=CHAR}, "main", "target"), # Getting tipped after being used in a slutwall
		"StocksShout": form("Anyone? I need some help over here.", {main=CHAR}, "main"), # Stuck in stocks, trying to get some attention
		
		"ProstitutionStart": form("Wanna have a good time?", {main=CHAR, target=CHAR}, "main", "target"), # Whore offering herself to the potential client
		"ProstitutionOffer": form("What's the offer?", {main=CHAR, target=CHAR}, "main", "target"), # Client asking what the whore is offering
		"ProstitutionUsual": form("The usual, {X} credits.", {main=CHAR, target=CHAR, credits=VAR}, "main", "target"), # Whore offering her 'usual'
		"ProstitutionServiceDom": form("I can be in charge and make you feel real good, {X} credits.", {main=CHAR, target=CHAR, credits=VAR}, "main", "target"), # Whore offering to be a dominant during the sex
		"ProstitutionPricySlut": form("I'm expensive. But I'm worth it, baby, just {X} credits.", {main=CHAR, target=CHAR, credits=VAR}, "main", "target"), # Whore is trying to get more credits out of a client
		"ProstitutionDenied": form("I'd rather not.", {main=CHAR, target=CHAR}, "main", "target"), # Client denying the whore (sometimes in a rude way)
		"ProstitutionDeniedWhatever": form("Whatever then, your loss.", {main=CHAR, target=CHAR}, "main", "target"), # Whore being annoyed that the client has denied her
		"ProstitutionAccept": form("Alright, let's see what you can do.", {main=CHAR, target=CHAR}, "main", "target"), # Client agreeing to the whore's services
		"ProstitutionDemandCreds": form("That sucked. Give me the credits back, whore.", {main=CHAR, target=CHAR}, "main", "target"), # Client wasn't satisfied enough with the sex
		"ProstitutionRefuseReturnCreds": form("I'm not giving you anything back, fuck off!", {main=CHAR, target=CHAR}, "main", "target"), # Whore refuses to return the credits
		"ProstitutionScam": form("You know what.. I decided to raise the price. 5 more credits please.", {main=CHAR, target=CHAR}, "main", "target"), # Whore is trying to scam the client and get more credits
		
		"TalkChatWhat": form("What do you wanna chat about?", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkChatCancel": form("Never mind, I don't wanna chat anymore.", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkChatLeaving": form("Whatever then, I'm leaving.", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkChatAgree": form("I agree.", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkChatDisagree": form("I disagree. Fuck you.", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkChatWhatever": form("It's whatever, honestly.", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkChatPickupLine": form("If you were a triangle you'd be acute one.", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkChatPickupLineFail": form("That was so bad!", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkFlirtAccept": form("You are cute.", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkFlirtDeny": form("I don't think I'm into what you are offering.", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkSexOffer": form("Hey, let's fuck!", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkSexOfferAccept": form("Sure, you can fuck me.", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkSexOfferDeny": form("I'd rather not.", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkSexOfferSelf": form("Hey, wanna fuck me maybe?", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkSexOfferSelfAccept": form("Sure, I can fuck you real good.", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkSexOfferSelfDeny": form("I'd rather not.", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkGrabAndFuck": form("You're not going anywhere until I have some fun with you, bdsm slut.", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkAboutToKidnap": form("You are mine now. Understand?", {main=CHAR, target=CHAR}, "main", "target"),
		"TalkAboutToKidnapReact": form("O.. O-Okay..", {main=CHAR, target=CHAR}, "main", "target"),
	}
