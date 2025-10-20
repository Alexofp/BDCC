extends DialogueFiller

func _init():
	priority = 12

func canBeUsed(_id:String, _args:Dictionary, _form) -> bool:
	var guard = getChar(_args, _form.mainRole)
	var personality:Personality = guard.getPersonality()
	var meanness = personality.getStat(PersonalityStat.Mean)
	#var subby = personality.getStat(PersonalityStat.Subby)
	
	if(meanness < 0.4):
		return false
	
	return true

func getFormIDs() -> Array:
	return [
		"SoftSlaveryIntro1",
		"SoftSlaveryIntro2",
		"SoftSlaveryIntro3",
		"SoftSlaveryIntroEND",
		
		"SoftSlaveryChangeName",
		"SoftSlaveryChangeNameEND",
		
		"SoftSlaveryAttackReaction",
		"SoftSlaveryAttackLost",
		"SoftSlaveryAttackWon",
		
		"SoftSlaveryAskedFreedom",
		"SoftSlaveryAskedFreedomPay",
		"SoftSlaveryAskedFreedomEND",
		
		"SoftSlaveryTalkStart",
		
		"SoftSlaveryProtectedByFriendStart",
		"SoftSlaveryProtectedByFriendResponse",
		"SoftSlaveryProtectedByFriendAllGoodResp",
		"SoftSlaveryProtectedByFriendLost",
		"SoftSlaveryProtectedByFriendWonThank",
		
		"SoftSlaveryChokeOutStart",
		"SoftSlaveryChokeOutEndured",
		"SoftSlaveryChokeOutPCWon",
		"SoftSlaveryChokeOutPCLost",
		"SoftSlaveryChokeOutPCLostSex",
		
		"SoftSlaveryFuckStart",
		"SoftSlaveryFuckResultGood",
		"SoftSlaveryFuckResultOkay",
		"SoftSlaveryFuckResultBad",
		
		"SoftSlaveryFuckNemesisApproach",
		"SoftSlaveryFuckNemesisAsk",
		"SoftSlaveryFuckNemesisAnswer",
		"SoftSlaveryFuckNemesisYes",
		"SoftSlaveryFuckNemesisNo",
		
		"SoftSlaveryFuckJealousStart",
		"SoftSlaveryFuckJealousFight",
		"SoftSlaveryFuckJealousOwnerWon",
		"SoftSlaveryFuckJealousOwnerWonFuck",
		"SoftSlaveryFuckJealousOwnerLostOffer",
		"SoftSlaveryFuckJealousOwnerLostOffer2",
		"SoftSlaveryFuckJealousOwnerLostOfferAgree",
		"SoftSlaveryFuckJealousOwnerLostOfferAgree2",
		"SoftSlaveryFuckJealousOwnerLostOfferNope",
		
		"SoftSlaverySlutwallStart",
		"SoftSlaverySlutwallLocked",
		
		"SoftSlaveryStocksStart",
		"SoftSlaveryStocksLocked",
		
		"SoftSlaveryGiveCreditsStart",
		"SoftSlaveryGiveCreditsTake",
		"SoftSlaveryGiveCreditsShort",
		
		"SoftSlaveryMarkingStart",
		"SoftSlaveryMarkingEnough",
		"SoftSlaveryMarkingAnother",
		"SoftSlaveryMarkingNoStart",
		"SoftSlaveryMarkingNo",
		"SoftSlaveryMarkingNoFail",
		"SoftSlaveryMarkingBegYes",
		"SoftSlaveryMarkingBegYes2",
		"SoftSlaveryMarkingBegNo",
		"SoftSlaveryMarkingBegNo2",
		"SoftSlaveryMarkingBegCredits",
		"SoftSlaveryMarkingBegCreditsGive",
		"SoftSlaveryMarkingBegCreditsGive2",
		"SoftSlaveryMarkingBegNoMarked",
		"SoftSlaveryMarkingBegFoot",
		"SoftSlaveryMarkingBegFootKiss",
		"SoftSlaveryMarkingBegFootKiss2",
		"SoftSlaveryMarkingBegHumiliation",
		"SoftSlaveryMarkingBegHumiliation2",
		"SoftSlaveryMarkingBegHumiliation3",
		"SoftSlaveryMarkingBegHumiliation4",
		"SoftSlaveryMarkingNotDone",
		"SoftSlaveryMarkingNotDoneStocks",
		"SoftSlaveryMarkingNotDoneStocks2",
		"SoftSlaveryMarkingNotDoneUrinal",
		"SoftSlaveryMarkingNotDoneUrinal2",
		
		"SoftSlaveryParadeAroundStart",
		"SoftSlaveryParadeAroundFirst",
		"SoftSlaveryParadeAroundMore",
		"SoftSlaveryParadeAroundLast",
		"SoftSlaveryParadeAroundFree",
		"SoftSlaveryParadeAroundEatGagged",
		"SoftSlaveryParadeAroundEat",
		"SoftSlaveryParadeAroundPlatform",
		"SoftSlaveryParadeAroundShower",
		
		"SoftSlaveryThreesomeStart",
		
		"SoftSlaveryPunishCredits",
		"SoftSlaveryPunishCredits2",
		
		"SoftSlaveryPunishRipClothes",
		
		"SoftSlaveryPunishRoughSex",
		"SoftSlaveryPunishRoughSexPCWon",
		"SoftSlaveryPunishRoughSexEnded",
		
		"SoftSlaveryPunishSlutwall",
		"SoftSlaveryPunishSlutwallLock",
		
		"SoftSlaveryPunishStocks",
		"SoftSlaveryPunishStocksLock",
		"SoftSlaveryPunishStocksAsk",
		"SoftSlaveryPunishStocksAskNope",
		"SoftSlaveryPunishStocksAskNoBuy",
		"SoftSlaveryPunishStocksAskNoBuy2",
		"SoftSlaveryPunishStocksAskNoBuy3",
		"SoftSlaveryPunishStocksAskSure",
		"SoftSlaveryPunishStocksAfterSex",
		"SoftSlaveryPunishStocksAfterBadSex",
		"SoftSlaveryPunishStocksAfterBadSex2",
		"SoftSlaveryPunishStocksOwnerLost",
		"SoftSlaveryPunishStocksOwnerLost2",
		"SoftSlaveryPunishStocksOwnerLost3",
		"SoftSlaveryPunishStocksOwnerWon",
		"SoftSlaveryPunishStocksOwnerWon2",
		"SoftSlaveryPunishStocksOwnerWon3",
		"SoftSlaveryPunishStocksOwnerWon4",
		
		"SoftSlaveryPunishSell",
		"SoftSlaveryPunishSell2",
		
		"SoftSlaveryPunishGB",
		"SoftSlaveryPunishGBGiveup",
		"SoftSlaveryPunishGBOffer",
		"SoftSlaveryPunishGBSure",
		"SoftSlaveryPunishGBFollow",
		"SoftSlaveryPunishGBSubOffer",
		"SoftSlaveryPunishGBSubOfferYes",
		"SoftSlaveryPunishGBSubOfferNo",
		"SoftSlaveryPunishGBSubOfferNoAw",
		"SoftSlaveryPunishGBNo",
		"SoftSlaveryPunishGBNoReact",
		"SoftSlaveryPunishGBStart",
		"SoftSlaveryPunishGBEnd",
		
		"SoftSlaveryResist",
		
		"SoftSlaveryFuckInStocksExtra",
		"SoftSlaveryFuckInStocksExtraYes",
		"SoftSlaveryFuckInStocksExtraNo",
		"SoftSlaveryFuckInStocksExtraNo2",
		"SoftSlaveryFuckInStocksExtraFree",
		"SoftSlaveryFuckInStocksExtraFreeLost",
		
		"SoftSlaveryParadeFuckOffer",
		"SoftSlaveryParadeFuckOfferYes",
		"SoftSlaveryParadeFuckOfferYesThree",
		"SoftSlaveryParadeFuckOfferNo",
		"SoftSlaveryParadeFuckOfferNo2",
		"SoftSlaveryParadeFuckOfferGood",
		"SoftSlaveryParadeFuckOfferFight",
		"SoftSlaveryParadeFuckOfferWon",
		"SoftSlaveryParadeFuckOfferLostWatch",
		"SoftSlaveryParadeFuckOfferLostBoth",
		
		"SoftSlaveryParadeGuard",
		"SoftSlaveryParadeGuardPunish",
		"SoftSlaveryParadeGuardPunish2",
		"SoftSlaveryParadeGuardProblem",
		"SoftSlaveryParadeGuardProblem2",
		"SoftSlaveryParadeGuardWon",
		"SoftSlaveryParadeGuardLost",
		#"SoftSlavery",
	]

func getText(_id:String, _args:Dictionary):
	if(_id == "SoftSlaveryIntro1"):
		return [
			"Finally awake, you fucker?",
			"Open your fucking eyes already. I know you're faking.",
			"Back to reality, slut? Welcome to hell.",
			"Hey there, fucktoy. Feeling disoriented? Good.",
			"Rise and shine already. Your beauty sleep is over.",
			"Morning, fucker. Look at me. Now.",
			"Wake the fuck up. You don't get to be sleepy anymore.",
			"Finally. Now. Listen the fuck up.",
			"Show me you're alive, bitch. Look at me.",
			"Good, you're awake. Don't you fucking dare pass out again.",
			"About fucking time. You know how boring it is, to watch you.",
			"Look who finally decided to wake up. Useless slut.",
			"There you are. I was about to dump water on you.",
		]
	if(_id == "SoftSlaveryIntro2"):
		return [
			"From this point on, you are my property, my {npc.npcSlave}. Got it?",
			"Listen the fuck up, {npc.npcSlave}. You. Are. Mine. Do you hear me?",
			"Your freedom is gone, {npc.npcSlave}. You're my thing to use. Clear?",
			"Let's get this through your thick skull, {npc.npcSlave}. You belong to me now. Hear me?",
			"Let's make this fucking simple. My {npc.npcSlave}. Do you hear me?",
			"Your life is mine now, fucker. You're my {npc.npcSlave}. Do you understand that?",
			"Listen the fuck up, {npc.npcSlave}. You belong to me now. Every last inch of you. Got it?",
			"Your life is fucking over. You're my {npc.npcSlave} now, you pathetic excuse. Hear me?",
			"Freedom is a fucking memory. You're mine, {npc.npcSlave}. Hear me?",
			"Let me spell it out for your stupid ass. You. Are. My. {npc.npcSlave}. Nothing more. Do you fucking hear me?",
			"From this moment on, you are a slave. My {npc.npcSlave}. You exist for my use. Got it?",
		]
	if(_id == "SoftSlaveryIntro3"):
		return [
			"You will obey every fucking word I say. Or I will make you wish you were never born.",
			"Do exactly as I order, you little bitch. Refuse, and I'll break you. It's that simple.",
			"Your only purpose is to obey me. Question me and I will have to punish you.",
			"Try to resist. I fucking dare you. It'll just give me an excuse to punish you.",
			"Your only job is to obey. Fail, and I'll punish you until you forget your own name.",
		]
	if(_id == "SoftSlaveryIntroEND"):
		return [
			"I'll be checking on you. Don't you fucking forget who owns you.",
			"My eyes are always on you, {npc.npcSlave}. Remember your owner.",
			"I'll be by to use you. Don't forget you're mine.",
			"I will see you regularly. Remember your place is beneath me.",
			"I will be checking in. The thought of me should be a constant terror.",
			"I will stop by. You better be ready to serve.",
			"There is no escape. I'll find you, and I'll remind you what you are.",
			"Don't bother hiding, I own you. I'll be back to use my {npc.npcSlave}, remember that.",
			"I'll be checking my {npc.npcSlave} frequently. Be ready to be used.",
		]

	if(_id == "SoftSlaveryChangeName"):
		return [
			"And how should I call you, {npc.npcSlave}?",
			"Give me a name to mock you with, {npc.npcSlave}.",
			"Tell me what to call you before I just name you 'Cunt'.",
			"Spit out a name, {npc.npcSlave}. I need something to yell when I'm punishing you.",
			"What name should I use when I'm fucking you? Tell me.",
			"You can choose a name, {npc.npcSlave}. It won't make you any less mine.",
		]
	if(_id == "SoftSlaveryChangeNameEND"):
		return [
			"Fine. You're my {npc.npcSlave}, nothing more.",
			"Sure. I can call you {npc.npcSlave} if that's humiliating enough for you.",
			"Good. Now remember that name is all you have left, {npc.npcSlave}.",
		]

	if(_id == "SoftSlaveryAttackReaction"):
		return [
			"You stupid fucking bitch! You'll pay for that, {npc.npcSlave}!",
			"How DARE you touch me, you worthless {npc.npcSlave}!",
			"That's it! I'm going to break you for that!",
			"You just signed your own torture warrant, {npc.npcSlave}!",
			"Big mistake, {npc.npcSlave}! Now you're really going to suffer!",
		]
	if(_id == "SoftSlaveryAttackLost"):
		return [
			"Pathetic.. really..",
			"Was that your best? You're still my property, {npc.npcSlave}.",
			"Ugh.. You're still my {npc.npcSlave}.",
			"You're so dumb.. You're still mine, {npc.npcSlave}.",
			"Did you really think that would work? You're so dumb..",
			"Brave but stupid..",
			"All that effort and you're still just as worthless..",
			"Give up, trash. You were born to be my {npc.npcSlave}.. you know it.. ugh..",
		]
	if(_id == "SoftSlaveryAttackWon"):
		return [
			"This is where I teach you your fucking place, {npc.npcSlave}!",
			"Time to teach you a lesson, you defiant piece of shit!",
			"You wanted a fight? Now you get a fucking lesson!",
			"I'm going to enjoy every second of punishing you, {npc.npcSlave}!",
		]

	if(_id == "SoftSlaveryAskedFreedom"):
		return [
			"Freedom? You think you deserve that, you worthless {npc.npcSlave}? Do you?",
			"You want out? You think that I should release my favorite {npc.npcSlave}?",
			"Leave my protection? You'd be dead in hours without me, {npc.npcSlave}. Do you really want that?",
			"You're nothing without me, {npc.npcSlave}. You think you can survive out there?",
		]
	if(_id == "SoftSlaveryAskedFreedomPay"):
		return [
			"Your freedom costs <CREDITS>, {npc.npcSlave}. Not that you're worth it.",
			"Pay me <CREDITS> and I might consider letting my {npc.npcSlave} go.",
			"<CREDITS> or shut the fuck up about freedom, {npc.npcSlave}.",
			"That's <CREDITS> if you want out, you {npc.npcSlave}.",
			"Think you can buy your way out? <CREDITS> might convince me, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryAskedFreedomEND"):
		return [
			"Okay. Now get the fuck out of my sight, trash. Live your stupid life.",
			"Finally. Now I can find a more obedient slave. I guess.",
			"Alright. Get lost then. I might even remember you.",
			"Mhm. Don't come crawling back when you realize nobody wants you.",
			"Finally making yourself useful by leaving. Now fuck off. It was fun knowing you.",
		]

	#TODO: Unique lines?
	if(_id == "SoftSlaveryTalkStart"):
		return [
			"What the fuck do you want, {npc.npcSlave}?",
			"Speak, you worthless {npc.npcSlave}. This better be important.",
			"You're interrupting me, {npc.npcSlave}. This better be fucking good.",
			"Make it quick, {npc.npcSlave}. My patience is thinner than your usefulness.",
			"Don't waste my fucking time. What is it, {npc.npcSlave}?",
			"Why are you bothering me, {npc.npcSlave}? Spit it out.",
			"You have five seconds to state your business, {npc.npcSlave}.",
			"Talking to me without permission, {npc.npcSlave}? This better be a fucking emergency.",
		]

	if(_id == "SoftSlaveryProtectedByFriendStart"):
		return [
			"Hey, fucker, what are you doing with {pc.name}?",
			"Hands off {pc.name}, you bitch. The fuck are you doing with {pc.him}?",
			"You there! You best leave {pc.name} alone, fucker.",
			"What the fuck are you doing with {pc.name}? Let {pc.him} go.",
		]
	if(_id == "SoftSlaveryProtectedByFriendResponse"):
		return [
			"This is none of your fucking business. Walk away now.",
			"Mind your own affairs before you get hurt.",
			"Stick your nose in my business and I'll break it.",
			"This doesn't concern you. Fuck off.",
			"Back the fuck off before I make you.",
			"You're asking for it. Get lost.",
			"Interfere and you'll regret it. I own this {npc.npcSlave}.",
			"One more word and I'll add you to my collection. Now disappear."
		]
	if(_id == "SoftSlaveryProtectedByFriendAllGoodResp"):
		return [
			"Alright. Whatever then.",
			"Fine, ugh. Carry on, then.",
			"Ugh. Suit yourself then, bitch.",
			"Very well, get abused for all I care.",
			"Fine by me. Don't bother me again.",
		]
	if(_id == "SoftSlaveryProtectedByFriendLost"):
		return [
			"Now crawl away before I decide to keep you too.",
			"Get the fuck out of my sight while you still can.",
			"Run along, you pathetic loser. Don't test me again.",
			"Disappear, and be grateful I'm letting you go.",
			"Go. And if I see you near my {npc.npcSlave} again, you'll lose more than a fight.",
		]
	if(_id == "SoftSlaveryProtectedByFriendWonThank"):
		return [
			"You're welcome.",
			"Whatever. No problem.",
			"Whatever. Don't mention it.",
			"Whatever. Glad I could help.",
			"Someone's gotta do it. You're welcome.",
		]

	if(_id == "SoftSlaveryChokeOutStart"):
		return [
			"My rage needs a punching bag and you're the lucky {npc.npcSlave}, aren't you?",
			"I'm in a fucking vile mood. And you're the worthless {npc.npcSlave} who gets to suffer for it.",
			"I need to break something. Stay the fuck still, {npc.npcSlave}, and take it.",
			"All this anger needs an outlet. You're going to be my stress relief, {npc.npcSlave}.",
			"Nothing fixes a bad day like choking a disobedient {npc.npcSlave} out.",
			"You're going to absorb my anger, {npc.npcSlave}. Struggle and I'll just enjoy it more.",
			"Time for you to earn your keep, {npc.npcSlave}. By being my personal anger outlet.",
		]
	if(_id == "SoftSlaveryChokeOutEndured"):
		return [
			"Good. I feel better. You served your purpose, {npc.npcSlave}.",
			"That took the edge off. Now get the fuck out of my sight, {npc.npcSlave}.",
			"Don't think surviving that means you're special. You're still just my {npc.npcSlave}.",
			"Consider that a privilege, {npc.npcSlave}. You got to be useful for once.",
			"Fine. You can go. But my hands will remember the feel of your throat, {npc.npcSlave}.",
			"You took it. Good. Now crawl away, {npc.npcSlave}. Your usefulness is spent.",
		]
	if(_id == "SoftSlaveryChokeOutPCWon"):
		return [
			"Fuck you, you defiant piece of shit. This isn't over.",
			"You got lucky, {npc.npcSlave}. I'll make you regret that.",
			"Remember this moment, {npc.npcSlave}. It's the last victory you'll ever get.",
			"Stupid, stubborn {npc.npcSlave}. I'm going to enjoy breaking you for that.",
			"Don't you dare think this changes anything. You're still my property.",
			"Mark my words, {npc.npcSlave}. I will own that fighting spirit and crush it.",
		]
	if(_id == "SoftSlaveryChokeOutPCLost"):
		return [
			"Pathetic. Couldn't even stay awake for your beating, {npc.npcSlave}.",
			"Useless. You folded like a cheap slut.",
			"Look at you. Out cold. You're a disappointment even as a punching bag, {npc.npcSlave}.",
			"Unconscious? I barely even started, you weak piece of trash.",
			"Of course you passed out. Can't even be a good {npc.npcSlave} when it counts.",
		]
	if(_id == "SoftSlaveryChokeOutPCLostSex"):
		return [
			"Now you can't even struggle.",
			"At least you're quiet like this.",
			"You're finally being a good {npc.npcSlave}.",
			"This is all you're good for anyway.",
			"You won't feel a thing. Not that your feelings matter.",
			"Let's see how much use I can get out of you before you wake up.",
		]

	if(_id == "SoftSlaveryFuckStart"):
		return [
			"I'm horny. Get your ass over here, {npc.npcSlave}. Now.",
			"I'm fucking horny. Come here, {npc.npcSlave}, before I drag you.",
			"Get on your knees, {npc.npcSlave}. I'm going to use you.",
			"I need to fuck something. Consider yourself lucky it's you, {npc.npcSlave}.",
			"Don't just stand there, {npc.npcSlave}. Get over here and service me.",
		]
	if(_id == "SoftSlaveryFuckResultGood"):
		return [
			"You didn't completely disappoint me for once. Don't get used to it, {npc.npcSlave}.",
			"Fine. You served your purpose. I might even use you again.",
			"Not a total waste of my time. Remember this feeling, {npc.npcSlave}, it's the best you'll ever get.",
			"Acceptable. Maybe you're learning your place after all, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryFuckResultOkay"):
		return [
			"Barely adequate. Put more effort in next time, or I'll find a way to motivate you, {npc.npcSlave}.",
			"Mediocre. Is that really the best you can do, {npc.npcSlave}?",
			"You're lucky I came. Your performance was pathetic, {npc.npcSlave}.",
			"That was underwhelming. Try harder next time I decide to grace you with my presence, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryFuckResultBad"):
		return [
			"Useless. You're not even good for a quick fuck, {npc.npcSlave}.",
			"Did you think that was acceptable? You're even more stupid than you look, {npc.npcSlave}.",
			"Absolutely pathetic. I've had more fun fucking a airlock, {npc.npcSlave}.",
			"You're a disgrace. I should space you and find a {npc.npcSlave} who knows what they're doing.",
		]
	if(_id == "SoftSlaveryFuckNemesisApproach"):
		return [
			"Well, well. If it isn't the new bitch on the block.",
			"Look what the cat dragged in. Finally found your level, I see.",
			"Oh, this is a pleasant surprise. Seeing you like this warms my heart.",
			"Fancy meeting you here. I always knew you'd end up as someone's property.",
			"My, my. How the mighty have fallen. Or were you always this pathetic?",
		]
	if(_id == "SoftSlaveryFuckNemesisAsk"):
		return [
			"What the fuck do you want? Spit it out.",
			"Talk fast. I'm busy putting this {npc.npcSlave} in {pc.his} place.",
			"Interrupt me again and you'll regret it. What do you want?",
			"Make it quick. My {npc.npcSlave} is waiting for {pc.his} lesson.",
		]
	if(_id == "SoftSlaveryFuckNemesisAnswer"):
		return [
			"This piece of shit crossed me. Feel like teaching {pc.him} a lesson as a team?",
			"Your property here owes me. Let's make {pc.him} pay up. Right now.",
			"I want a piece of your slave for what {pc.he} did. Let's break {pc.him} in together.",
			"That slave of yours needs to be put in {npc.his} place after what they did to me. I'm offering to help you do it.",
		]
	if(_id == "SoftSlaveryFuckNemesisYes"):
		return [
			"Fine. Let's see how much this {npc.npcSlave} can take.",
			"Good idea. This worthless {npc.npcSlave} deserves double the attention.",
			"Alright. I'm down for that.",
			"Why not? Let's fucking do it.",
		]
	if(_id == "SoftSlaveryFuckNemesisNo"):
		return [
			"Fuck off. My {npc.npcSlave}, my rules. I don't share.",
			"Not a chance. I break my own property. Now get lost.",
			"Keep your hands to yourself. This {npc.npcSlave} is mine to ruin.",
			"No. I don't need your help to put this {npc.npcSlave} in {pc.his} place.",
			"Back off. The only one fucking this {npc.npcSlave} is me.",
		]

	if(_id == "SoftSlaveryFuckJealousStart"):
		return [
			"Hey! That's my {npc1.npcSlave}! Get your fucking hands off {pc.him}!",
			"What the fuck do you think you're doing with my property? That {npc1.npcSlave} is mine!",
			"Hey, you piece of shit! That {npc1.npcSlave} belongs to me! Back the fuck off!",
			"Touch my {npc1.npcSlave} again and I'll break your fucking arms!",
			"You've got a death wish, fucking with my {npc1.npcSlave} like that?",
		]
	if(_id == "SoftSlaveryFuckJealousFight"):
		return [
			"Get the fuck out of here before I make you. That {npc.npcSlave} is mine.",
			"That's my {npc.npcSlave}, you worthless fuck. Walk away now or you'll crawl away later.",
			"Forget about this slave. This {npc.npcSlave} belongs to me.",
			"Walk away, asshole. This is my {npc.npcSlave}, not yours.",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerWon"):
		return [
			"See that? This {npc.npcSlave} is fucking mine. Don't you ever forget it.",
			"Let that be a lesson. {pc.He} {pc.isAre} my property. Now get the fuck out.",
			"You lost, you pathetic piece of shit. My {npc.npcSlave} stays with me. Now crawl away.",
			"Clear enough for your stupid brain? {pc.He} {pc.verb('belong')} to me. Now fuck off.",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerWonFuck"):
		return [
			"Shouldn't have fucked with what's mine. Now you're both my personal toys.",
			"You brought this on yourself. Now I get two sluts to break instead of one.",
			"Wrong move, asshole. Now I'm going to enjoy breaking both of you.",
			"You just volunteered to be my second {npc.npcSlave}. Hope you're ready to get used.",
			"Perfect. Now I have twice the holes to fuck. Get over here, both of you.",
			"I'm horny and both of you are going to deal with it. Consider it your punishment."
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOffer"):
		return [
			"Wait! Fuck.. look, maybe we could share the little {npc.npcSlave}?",
			"Hold on! Before you do anything stupid.. we could both use this {npc.npcSlave}.",
			"Stop! Let's be reasonable here.. The {npc.npcSlave} could serve two masters, right?",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOffer2"):
		return [
			"This fucking {npc.npcSlave} is the one who lied to us both! Let's make {pc.him} pay for it.",
			"That deceitful little shit never told me about you. Let's punish {pc.him} together.",
			"This bitch {npc.npcSlave} played us both. Don't you think {pc.he} {pc.verb('deserve')} to suffer for that?",
			"The slave is the real problem here. Let's teach {pc.him} a lesson {pc.he} won't forget.",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOfferAgree"):
		return [
			"Maybe you've got a point.",
			"Fuck, that actually makes sense.",
			"Alright, I'm listening.",
			"Now that's a fucking idea I can get behind.",
			"Maybe we should work together on this.",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOfferAgree2"):
		return [
			"Let's make this little shit regret everything.",
			"Fine. Let's break this lying whore together.",
			"Deal. Now let's have some real fun with this bitch.",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOfferNope"):
		return [
			"Nice try, you pathetic fuck. I'm just going to enjoy both of you.",
			"You're desperate. It's cute. Now you're both going to serve me.",
			"Your begging just made me horny. I'll take both of you.",
			"Great idea. I'll improve it. You'll both be on your knees for me.",
		]

	if(_id == "SoftSlaverySlutwallStart"):
		return [
			"Get over here. I'm shoving you into the slutwall today. Stay the fuck still, {npc.npcSlave}.",
			"The slutwall is calling for you. Don't you dare struggle, {npc.npcSlave}.",
			"Move it, {npc.npcSlave}. You're going in the slutwall, and I don't want to hear a fucking word about it.",
			"You're my fucktoy in the slutwall today. Present your neck, you worthless {npc.npcSlave}.",
			"I own your ass, and today I'm using it in the slutwall. Hold still, {npc.npcSlave}.",
			"Be a good little {npc.npcSlave} and get your ass to the slutwall. Now.",
		]
	if(_id == "SoftSlaverySlutwallLocked"):
		return [
			"Now you're locked in, you pathetic {npc.npcSlave}. Let's see how much you can take.",
			"Perfect. Trapped and helpless. Just how I like my {npc.npcSlave}.",
			"Look at you. No escape now, {npc.npcSlave}. Time for your lesson.",
			"Chained up and ready to be used. This is what you were made for, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryStocksStart"):
		return [
			"Get over here. The stocks are waiting, and everyone's going to watch me break you. Don't struggle, {npc.npcSlave}.",
			"You're going in the stocks today, {npc.npcSlave}. The whole station will see what a whore you are.",
			"Move it, {npc.npcSlave}. I'm putting you on display in the stocks. Try to struggle and I'll make it worse.",
			"You're my public fucktoy today. Everyone will see you locked in the stocks. Present your neck, {npc.npcSlave}.",
			"I feel like humiliating you in the stocks while everyone watches. Hold still, {npc.npcSlave}.",
			"Be a good {npc.npcSlave} and get your ass to the stocks. The crowd wants a show.",
		]
	if(_id == "SoftSlaveryStocksLocked"):
		return [
			"Don't even think about moving. You're mine to use now, {npc.npcSlave}.",
			"Locked and on display for everyone. You're nothing but a toy, {npc.npcSlave}.",
			"Helpless and exposed for the whole station to see. This is your life now, {npc.npcSlave}.",
			"Now you're locked in.. Let's give these people a show they won't forget, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryGiveCreditsStart"):
		return [
			"I need <CREDITS> right the fuck now. Hand them over, {npc.npcSlave}.",
			"Your credits are mine. Give me <CREDITS> immediately, {npc.npcSlave}.",
			"You're going to give me <CREDITS> right now. Don't make me ask twice, you worthless {npc.npcSlave}.",
			"<CREDITS>. Now. I don't want to hear any fucking excuses, {npc.npcSlave}.",
			"Give me <CREDITS>, you pathetic {npc.npcSlave}. That's an order.",
			"Consider this your only purpose today. Hand over <CREDITS>, {npc.npcSlave}.",
			"I've decided you owe me <CREDITS>. Pay up now, {npc.npcSlave}.",
			"Be useful for once in your miserable life and give me <CREDITS> right now, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryGiveCreditsTake"):
		return [
			"About fucking time. Maybe you're not completely useless, {npc.npcSlave}.",
			"Finally. I was starting to think I'd have to beat it out of you, {npc.npcSlave}.",
			"Good. You saved yourself a world of pain, {npc.npcSlave}.",
			"It's about time you learned to obey, {npc.npcSlave}.",
			"Took you long enough. Don't make me wait next time, {npc.npcSlave}.",
			"See? Obedience is easier than punishment, {npc.npcSlave}.",
			"Fine. Now remember who really owns these credits, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryGiveCreditsShort"):
		return [
			"You dare come up short? You're going to regret this, {npc.npcSlave}.",
			"Short? You're fucking begging for punishment, {npc.npcSlave}.",
			"Pathetic. You can't even do this right. Prepare to suffer, {npc.npcSlave}.",
			"Disappointing. I guess I'll have to take my payment in a different way, {npc.npcSlave}."
		]

	if(_id == "SoftSlaveryMarkingStart"):
		return [
			"I'm going to mark my {npc.npcSlave}. Don't you fucking move.",
			"Hold still, you worthless shit. This is to remind you of your owner.",
			"Don't even think about flinching. I'm decorating my property.",
			"Stay the fuck still. I'm making sure the whole prison knows who you belong to.",
			"Look at me and don't fucking blink. I'm marking my property.",
			"Get over here and shut up. You're not leaving until I've painted my mark on you."
		]
	if(_id == "SoftSlaveryMarkingEnough"):
		return [
			"That should do it. Now you look properly owned.",
			"Good. No one will mistake who owns this {npc.npcSlave} now.",
			"Perfect. A well-marked {npc.npcSlave} is a happy {npc.npcSlave}.",
			"Enough for now. You look almost acceptable.",
			"Done. Looks appropriately degrading.",
			"Clean lines. Filthy meanings. Fits a {npc.npcSlave} like you.",
		]
	if(_id == "SoftSlaveryMarkingAnother"):
		return [
			"Think one is enough? Nope.",
			"Want more? Too bad, you're getting them whether you want to or not.",
			"Enough? I decide what's enough. We're adding another.",
			"I'm not done defiling you yet.",
			"You want another? Yes you do. Stay still.",
			"I could do this all day.. and I think I will.",
			"These writings make you look so pathetic. Let's add another.",
			"You twitched. That earns you another one.",
			"You moved. Now I get to scribble more stuff on you.",
			"One more won't kill you. But moving again might.",
			"Your suffering is entertaining. You're getting another one.",
		]
	if(_id == "SoftSlaveryMarkingNoStart"):
		return [
			"Whatever, I can't be bothered to mark trash today.",
			"Fine. I'll leave you unmarked for now. Don't get comfortable.",
			"Not today. Consider yourself lucky, you worthless {npc.npcSlave}.",
			"Alright. No bodywritings this time. Remember you still belong to me.",
			"Hmm. Maybe I'll let you stay clean today. Tomorrow won't be so kind.",
			"Be grateful I'm feeling merciful today, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryMarkingNo"):
		return [
			"Alright. I'm bored of decorating for today.",
			"Fine. We're done for now. You look appropriately degraded.",
			"Enough for today. Misbehave and I'll cover every inch of you.",
			"That'll do. You're properly humiliated.",
			"I'm done. I hope everyone sees these and knows what you are.",
			"Okay. For now, you're marked enough to remind you of your place."
		]
	if(_id == "SoftSlaveryMarkingNoFail"):
		return [
			"Don't test me, you piece of shit. My {npc.npcSlave} gets marked when I say so.",
			"Push me and I'll carve these words into your skin. Stand still and take it.",
			"You resist and I'll cover your entire body in writings. Now hold still.",
			"Keep your fucking mouth shut. I decide when we're done. You're getting marked.",
		]
	if(_id == "SoftSlaveryMarkingBegYes"):
		return [
			"Your pathetic begging amuses me. Fine, I'll be merciful for once.",
			"You look so disgusting when you beg. Alright, just this once.",
			"Your pleading is pathetic enough to be entertaining. Sure, this time only.",
			"Begging me? How fitting for a {npc.npcSlave}. Fine.",
		]
	if(_id == "SoftSlaveryMarkingBegYes2"):
		return [
			"That's enough then.",
			"Alright. We're done here.",
			"You've earned a temporary reprieve.",
			"Okay. I'll let you off this time.",
		]
	if(_id == "SoftSlaveryMarkingBegNo"):
		return [
			"If you're gonna beg, get on your fucking knees where you belong.",
			"Down on your knees. That's how proper a {npc.npcSlave} should beg.",
			"Who begs standing up? On your knees, {npc.npcSlave}.",
			"You wanna beg? Get on your knees and make it convincing.",
			"Beg like the worthless {npc.npcSlave} you are. On your knees.",
		]
	if(_id == "SoftSlaveryMarkingBegNo2"):
		return [
			"Kneel, now.",
			"You heard me? Kneel before I make you.",
			"Kneel. Don't make me repeat myself.",
			"Kneel. Show some fucking respect.",
			"Kneel. I don't have all day.",
		]
	if(_id == "SoftSlaveryMarkingBegCredits"):
		return [
			"Good. Now give me 5 credits or I'll paint your skin.",
			"Want me to stop? Pay 5 credits. Otherwise, you know what happens.",
			"Hand over 5 credits or I'm decorating your worthless body.",
			"Now give me 5 credits and I might let you go. Maybe.",
		]
	if(_id == "SoftSlaveryMarkingBegCreditsGive"):
		return [
			"Thanks. Your credits are more valuable than you are.",
			"Good. That's the price of your pathetic existence.",
			"Sure. I'll take your credits instead of your dignity today.",
			"Nice. Your credits buy you a temporary reprieve.",
			"Those will do. Keep paying if you want to avoid suffering.",
		]
	if(_id == "SoftSlaveryMarkingBegCreditsGive2"):
		return [
			"I guess that's it then, {npc.npcSlave}.",
			"That settles it for now, {npc.npcSlave}.",
			"Alright. We're done. For now, {npc.npcSlave}.",
			"Good. Get out of my sight before I change my mind.",
		]
	if(_id == "SoftSlaveryMarkingBegNoMarked"):
		return [
			"That's what you get for testing me. Enjoy your new decorations.",
			"So be it. Wear these marks as a reminder of your place.",
			"You asked for this. Now live with the consequences.",
			"Markings suit trash like you. They'll help keep you in line.",
			"Don't cry about it. You brought this on yourself.",
			"This is your punishment. Wear these with shame.",
			"You wanted to act up. Now look at the walking disgrace you've become.",
			"Consider it your well-deserved humiliation. Don't you dare complain."
		]
	if(_id == "SoftSlaveryMarkingBegFoot"):
		return [
			"Good. Now kiss my {npc.foot}, worship me if you want to avoid being defaced.",
			"Okay. Now kiss my {npc.foot}. Be a good {npc.npcSlave} or I'll paint you like the whore you are.",
			"Now humiliate yourself properly. Kiss my {npc.foot}. Now.",
			"Think you're done? Kiss my {npc.foot} first. I require worship from my property.",
		]
	if(_id == "SoftSlaveryMarkingBegFootKiss"):
		return [
			"Pathetic. You'll do anything to avoid being marked, won't you?",
			"That's such a satisfying view. A worthless {npc.npcSlave} where they belong.",
			"Seeing you degrade yourself is perfect. Just what I wanted.",
			"Feels appropriate. Keep going.",
			"Humiliation becomes you. Keep kissing.",
		]
	if(_id == "SoftSlaveryMarkingBegFootKiss2"):
		return [
			"I guess that's enough degradation for now.",
			"That settles it for now.",
			"Alright. We're done. For now.",
			"Good. Get out of my sight before I find more uses for you.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation"):
		return [
			"Good. Now admit that you are my {npc.npcSlave}. Nothing but my property.",
			"Okay. Now I wanna hear you confess to being a {npc.npcSlave}. My worthless {npc.npcSlave}. Say it loudly.",
			"Right. Now I want to hear you humiliate yourself. Admit that you belong to me. Admit that you are a {npc.npcSlave}.",
			"Next. I want you to say something truthful. Admit that you are my {npc.npcSlave}. You belong to me. Mean every fucking word.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation2"):
		return [
			"What? I can't hear your pathetic mumbling.",
			"Louder. I want to hear your shame.",
			"Not loud enough. Say it like you mean it, trash.",
			"Raise your voice. I want everyone to hear your degradation.",
			"Make it audible. Don't fucking mumble.",
			"Again, but with the proper shame this time.",
			"Louder. I want the whole prison to know what you are.",
			"Don't be shy. Say it like the worthless {npc.npcSlave} you are.",
			"Say it again and make it sound believable.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation3"):
		return [
			"That's much better. Glad you finally accept your place.",
			"Good. Finally some truth from that worthless mouth.",
			"That's the tone of proper submission I wanted to hear.",
			"Now that's acceptable. Remember that attitude.",
			"Better. Maybe you'll learn your place after all.",
			"That will do. Don't forget what you just admitted.",
			"Good. At least you know your worth now.",
			"That's acceptable. Carry that shame with you.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation4"):
		return [
			"I guess that's enough humiliation for now.",
			"That settles it for now.",
			"Alright. We're done. For now.",
			"Good. Get out of my sight before I find more entertainment.",
		]
	if(_id == "SoftSlaveryMarkingNotDone"):
		return [
			"Actually.. you know what.. I'm not done degrading you yet.",
			"Hold on. I have more humiliation planned for you.",
			"Wait. We're not done actually. I have more uses for you.",
			"I lied. This isn't over yet.",
			"Actually.. There's more suffering to be had. Yes.",
		]
	if(_id == "SoftSlaveryMarkingNotDoneStocks"):
		return [
			"This is just so my property doesn't try to escape.",
			"Consider this insurance against your pathetic struggles.",
			"I don't want you squirming while I decorate my property.",
			"This will ensure you don't move. We don't want me to mess up my artwork, do we?",
			"This will help you stand still like the good {npc.npcSlave} you should be.",
		]
	if(_id == "SoftSlaveryMarkingNotDoneStocks2"):
		return [
			"Perfect. This is truly art.",
			"Neat. It looks exactly how worthless property should.",
			"Perfect. Degradation suits you.",
			"Good. It shows your status perfectly.",
			"Perfect. This will serve as a permanent reminder.",
		]
	if(_id == "SoftSlaveryMarkingNotDoneUrinal"):
		return [
			"Gonna mark you properly now.",
			"I wanna brand my {npc.npcSlave} with this.",
			"That's the proper way to mark worthless property, don't you think?",
			"See this? About to give you the marking you deserve..",
		]
	if(_id == "SoftSlaveryMarkingNotDoneUrinal2"):
		return [
			"Mmhh.. Good worthless {npc.npcSlave}.",
			"That felt satisfying. Oh, you look appropriately marked now.",
			"Hah. You look perfect, such a disgusting {npc.npcSlave}.",
			"You enjoyed that, didn't you? Pathetic.",
			"Yes.. good.. wear your humiliation proudly, {npc.npcSlave}.",
		]

	if(_id == "SoftSlaveryParadeAroundStart"):
		return [
			"Time to show the whole prison the new {npc.npcSlave} I own. Get moving.",
			"I'm putting you on a leash and parading you around like the {npc.npcSlave} you are. Don't even think about resisting.",
			"Everyone's going to see what I've have. Present your neck, {npc.npcSlave}.",
			"It's time for a walk. The entire prison gets to see my {npc.npcSlave} on display.",
			"I'm going to march you through this prison and let everyone get a good look at my new property.",
		]
	if(_id == "SoftSlaveryParadeAroundFirst"):
		return [
			"Get used to those stares, {npc.npcSlave}. This is just the beginning.",
			"Feeling humiliated yet? Good. We've only just started.",
			"See how they look at you? That's the look you get when you're owned. And we're not done.",
			"Enjoying being my little exhibit? Don't get comfortable, this is the easy part.",
			"This is nothing, {npc.npcSlave}. The real fun hasn't even begun.",
		]
	if(_id == "SoftSlaveryParadeAroundMore"):
		return [
			"Move. We're not finished.",
			"Another spot, another audience for my {npc.npcSlave}.",
			"Tired? Too bad. We have more spots to check out.",
			"Ready to be shown off again? Yes, you are.",
			"See their faces? They all know what you are now. Let's give the next batch a show.",
			"I bet you're starting to love this, you pathetic {npc.npcSlave}.",
			"It's amusing to watch you squirm. Let's find more people to make you uncomfortable.",
		]
	if(_id == "SoftSlaveryParadeAroundLast"):
		return [
			"One final humiliation. Make it count.",
			"Last stretch. Don't you dare disappoint me now.",
			"Final stop. I want you to remember every staring face.",
			"One more round. I want you broken and compliant by the end.",
			"Almost done. Don't embarrass me or you'll regret it.",
			"This is your last chance to prove you can be a presentable {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryParadeAroundFree"):
		return [
			"That's enough for now. Don't get comfortable, {npc.npcSlave}.",
			"You're dismissed. But remember who you belong to.",
			"Get out of my sight. I'll find you when I want you again.",
			"Run along, {npc.npcSlave}. Don't make me come looking for you.",
			"You're done. Don't make me come looking for you.",
			"Go. But know that I own you, and I can take you back anytime.",
			"You're free to crawl away for now. Don't forget your place.",
		]
	if(_id == "SoftSlaveryParadeAroundEatGagged"):
		return [
			"Watch me eat, {npc.npcSlave}.",
			"Can't eat with that thing, can you? Good. You'll learn hunger.",
			"You'll sit there and watch me enjoy this. Maybe I'll feed you my scraps if you're lucky.",
			"Your hunger amuses me. Keep watching, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryParadeAroundEat"):
		return [
			"Eat this slop. It's more than a {npc.npcSlave} like you deserves.",
			"Here's your food. Don't take too long.",
			"Eat quickly, {npc.npcSlave}.",
			"Your meal, {npc.npcSlave}. Be grateful I'm feeding you at all.",
			"Swallow it down. Your break is almost over.",
		]
	if(_id == "SoftSlaveryParadeAroundPlatform"):
		return [
			"See those stocks? That's where you'll end up if you misbehave.",
			"One wrong move and I'll lock you in one of those for public use.",
			"This is your future if you disobey me, {npc.npcSlave}.",
			"Think this walk is humiliating? These platforms are where real shame begins.",
			"Do you enjoy the idea of being displayed here, {npc.npcSlave}? You should.",
		]
	if(_id == "SoftSlaveryParadeAroundShower"):
		return [
			"Time to wash the dirt off my property. Don't struggle.",
			"I need you presentable. Under the water, now.",
			"Stand still while I clean you, {npc.npcSlave}.",
		]

	if(_id == "SoftSlaveryThreesomeStart"):
		return [
			"I brought a friend. You're going to service both of us, {npc.npcSlave}.",
			"Got company. You'll be pleasing two masters today. Understand, {npc.npcSlave}?",
			"Double the trouble for you today, {npc.npcSlave}. We're going to use you together.",
			"I brought a friend. Make sure we're both satisfied, {npc.npcSlave}.",
			"Two of us to please today, {npc.npcSlave}. You'd better not disappoint.",
			"Hope you're ready, {npc.npcSlave}. You have double the duty today.",
			"You belong to both of us for now, {npc.npcSlave}. Get on your knees.",
		]
	if(_id == "SoftSlaveryPunishCredits"):
		return [
			"I'm taking this. Consider it your stupidity tax.",
			"This is mine now. Payment for wasting my time.",
			"These are mine. Call it a fee for your pathetic disobedience.",
			"Your credits look better in my pocket than in your worthless hands.",
			"This should cover the frustration of dealing with you.",
			"Not enough to buy your freedom, but it might buy you a little less pain.",
			"Consider this the price for my patience, which you've just exhausted.",
		]
	if(_id == "SoftSlaveryPunishCredits2"):
		return [
			"If I can't have your obedience, I'll take everything else. Next time it will be worse.",
			"This is a fucking warning. Disobey again and I'll take something else.",
			"Credits are the least of what I can take from you. Test me again.",
			"Next time I won't be so merciful. I'll take something that really hurts.",
		]
	if(_id == "SoftSlaveryPunishRipClothes"):
		return [
			"Had your fun, you little shit? Start obeying before I really lose my temper.",
			"Finished your pathetic rebellion? Next time I'll rip more than your clothes.",
			"Still feel brave, {npc.npcSlave}? I can make you a lot more naked and a lot more sorry.",
			"Got that out of your system? Good. Now obey or I'll give you something real to cry about.",
			"Enjoy being a brat? That's the last fun you'll have for a long time. Now obey.",
			"Consider your spirit broken. Now your body will learn to obey.",
		]
	if(_id == "SoftSlaveryPunishRoughSex"):
		return [
			"Fine. We'll do this the hard way, {npc.npcSlave}.",
			"You had your chance to obey. Now you'll learn what happens when you refuse.",
			"Disobedience earns punishment. Don't you dare struggle.",
			"You chose this pain. And I'm going to enjoy giving it to you.",
			"Your resistance just made this so much worse for you.",
			"Should have obeyed when you had the chance. Now you'll pay the price.",
			"You just ran out of choices, {npc.npcSlave}. Welcome to your consequences.",
			"Your body will obey even if your stubborn mind won't.",
			"You're going to learn your place, one scream at a time.",
			"I enjoy breaking stubborn slaves like you. Your fight just makes it better.",
			"Think you can refuse me? Let's see how long that lasts.",
			"Every time you fight back, I'll just get rougher. Your pain, your choice.",
			"I own this body. Time to prove it.",
		]
	if(_id == "SoftSlaveryPunishRoughSexPCWon"):
		return [
			"This isn't over. Not by a fucking long shot, {npc.npcSlave}.",
			"You'll pay for that ten times over. Mark my words.",
			"Enjoy your moment. It'll make your punishment sweeter.",
			"Big mistake. You've just made everything so much worse.",
			"This changes nothing. You're still my property.",
			"You think this means you've won? You've only postponed the inevitable.",
		]
	if(_id == "SoftSlaveryPunishRoughSexEnded"):
		return [
			"Obey next time. Or I will make that feel like a gentle massage.",
			"Let that be a lesson. My patience is gone.",
			"Consider that a warning. I have so much worse in store for you.",
			"That was me being kind. Next time I won't hold back.",
			"Remember this pain. It's nothing compared to what comes next.",
			"You got off easy. Don't make me prove how much worse it can get.",
			"That was your free lesson. The next one will cost you dearly.",
			"My mercy has limits. You've just found them.",
			"Remember this feeling. It's the best you'll feel after disobeying me.",
			"That was just a taste of what you earn with disobedience.",
			"I hope you learned your lesson. For your sake.",
			"Your body is mine to use. Don't make me remind you like this again.",
			"This was compassion compared to what I'll do next time.",
			"I own every scream, every tear. Act like it.",
		]
	if(_id == "SoftSlaveryPunishSlutwall"):
		return [
			"Walk to the slutwall or I'll break your legs and drag you there.",
			"Move your feet, {npc.npcSlave}, or I'll make sure you can't.",
			"Follow or I'll break something and you'll follow anyway.",
			"The slutwall awaits. You can go willingly or screaming.",
			"Come along quietly or I'll give you a real reason to cry.",
			"Don't make this harder than it has to be. Walk, {npc.npcSlave}.",
			"You can walk to the slutwall or I can carry your broken body there.",
		]
	if(_id == "SoftSlaveryPunishSlutwallLock"):
		return [
			"Enjoy being used by everyone, {npc.npcSlave}.",
			"Make yourself useful for once in your pathetic life.",
			"Finally serving your true purpose as public property.",
			"This is all you're good for. Being a free-use hole.",
			"Welcome to your only function. Try to be bratty now.",
			"At least you're finally good for something.",
			"This is all you're worth. Remember that.",
			"Embrace your purpose, {npc.npcSlave}. This is all you are.",
			"Hope you enjoy your new role as the station's cum dumpster.",
		]

	if(_id == "SoftSlaveryPunishStocks"):
		return [
			"Move your fucking feet or I'll break them and drag your useless body.",
			"Walk, {npc.npcSlave}, or I'll tear out your hair pulling you.",
			"Get moving or you'll crawl every inch on your broken knees.",
			"Come willingly or I'll chain you and make you bleed the whole way.",
			"Either you walk to the stocks yourself, or I'll carry your unconscious body.",
		]
	if(_id == "SoftSlaveryPunishStocksLock"):
		return [
			"I'm done with your defiance. Let's see how you like being everyone's {npc.npcSlave}.",
			"You're worthless to me. Maybe the public can find some use for you.",
			"Since you refuse to serve me, you'll serve as a toy for anyone who wants my {npc.npcSlave}.",
			"Your disobedience earns you public humiliation. Enjoy being everyone's {npc.npcSlave}.",
			"Too stubborn for me? Let's see how you handle being common property.",
			"If you won't be my {npc.npcSlave}, you'll be everyone's {npc.npcSlave}.",
			"Time to make you useful to someone, since you're useless as my {npc.npcSlave}.",
			"Since you can't behave as my {npc.npcSlave}, you'll learn under strangers.",
		]
	if(_id == "SoftSlaveryPunishStocksAsk"):
		return [
			"Is your slave available for use?",
			"This slave open for business?",
			"Mind if I use your slave?",
			"Your slave looks like {pc.he} {pc.verb('need')} breaking in.",
			"Can I have a turn with your slave?",
			"This slave ready for public use?",
			"Your slave looks hungry for attention. Can I?",
		]
	if(_id == "SoftSlaveryPunishStocksAskNope"):
		return [
			"Nothing's free. <CREDITS> credits to use my {npc.npcSlave}.",
			"Not without payment. <CREDITS> credits first.",
			"Everything has a price. <CREDITS> and my {npc.npcSlave} is yours for a bit.",
			"<CREDITS> credits and you can do whatever you want to my {npc.npcSlave} for a bit.",
			"Pay <CREDITS> credits and use my {npc.npcSlave} as your toy.",
			"Not giving my {npc.npcSlave} away. <CREDITS> credits for a single use.",
		]
	if(_id == "SoftSlaveryPunishStocksAskNoBuy"):
		return [
			"What if I don't wanna pay for your used {npc.npcSlave}?",
			"I'm not paying for damaged goods.",
			"Too expensive for broken property.",
			"That's more than your {npc.npcSlave} is worth.",
			"Not paying that for your disobedient {npc.npcSlave}.",
			"Your {npc.npcSlave} isn't worth that much.",
			"Your price is too high for worthless merchandise.",
			"This {npc.npcSlave} looks used up already.",
		]
	if(_id == "SoftSlaveryPunishStocksAskNoBuy2"):
		return [
			"Then fuck off, beggar.",
			"No credits, no {npc.npcSlave}. Get lost.",
			"Then stop wasting my time. Disappear.",
			"Get the fuck out if you can't pay.",
			"Poor scum shouldn't bother owners. Leave.",
			"Come back when you have real credits.",
			"Then you get nothing. Get out.",
			"Piss off, cheapskate.",
		]
	if(_id == "SoftSlaveryPunishStocksAskNoBuy3"):
		return [
			"I'm not leaving without using your {npc.npcSlave}.",
			"Maybe I'll just take what I want from your {npc.npcSlave}.",
			"Your {npc.npcSlave} looks tempting enough to take anyway.",
			"I think I'll help myself to your {npc.npcSlave} anyway.",
			"Your {npc.npcSlave} is going to get used regardless.",
			"I don't take no for an answer with property like yours.",
			"Maybe I'll use your {npc.npcSlave} and make you watch.",
			"This {npc.npcSlave} is going to serve me one way or another.",
		]
	if(_id == "SoftSlaveryPunishStocksAskSure"):
		return [
			"Sure.",
			"Fine by me.",
			"There you go.",
			"Here. Should be enough.",
			"Should be good.",
		]
	if(_id == "SoftSlaveryPunishStocksAfterSex"):
		return [
			"See what happens when you're useful, {npc.npcSlave}? Now stay where you are and remember your place.",
			"That's all you're good for, {npc.npcSlave}. Remember this when you think of disobeying.",
			"You finally served your purpose, {npc.npcSlave}. Maybe public use suits you. Enjoy the stocks.",
			"See how much better life is when you're obedient, {npc.npcSlave}? Enjoy the stocks.",
			"You found your calling, {npc.npcSlave}. Public whore.",
			"Good {npc.npcSlave}. Now stay locked up and think about obedience.",
			"This is your true purpose, {npc.npcSlave}. Remember that. Enjoy the stocks.",
		]
	if(_id == "SoftSlaveryPunishStocksAfterBadSex"):
		return [
			"Your {npc.npcSlave} is terrible. I want my creds back.",
			"Worst fuck I've ever paid for. Refund me for this worthless {npc.npcSlave}.",
			"This {npc.npcSlave} isn't worth the credits. Return them.",
			"Your {npc.npcSlave} fights too much. Not worth the price.",
			"This {npc.npcSlave} is broken. Give me my credits back.",
			"Waste of good creds. Your {npc.npcSlave} is useless.",
			"Terrible service from your {npc.npcSlave}. I demand a refund.",
			"Your {npc.npcSlave} is defective. Pay me back.",
		]
	if(_id == "SoftSlaveryPunishStocksAfterBadSex2"):
		return [
			"No refunds. You used my {npc.npcSlave}, now fuck off.",
			"You got what you paid for. No returns on used property.",
			"You used my {npc.npcSlave}. Deal with it.",
			"My {npc.npcSlave} served you. No refunds.",
			"You paid for access to my {npc.npcSlave}, not satisfaction.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerLost"):
		return [
			"Pathetic display of weakness.",
			"You fight like the slave.",
			"Is that the best you can manage, weakling?",
			"All that struggle for nothing, fool.",
			"You're even weaker than your {npc.npcSlave}.",
			"All that anger, so little strength. Pathetic.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerLost2"):
		return [
			"Much better. Two slaves in stocks where you belong.",
			"Both slaves are now properly contained. Perfect.",
			"Learn your place alongside your {npc.npcSlave}.",
			"Now you understand your true position.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerLost3"):
		return [
			"Perfect. Now your {npc.npcSlave} will watch your punishment.",
			"Good. Your {npc.npcSlave} will learn from your suffering.",
			"Excellent. Your {npc.npcSlave} will see what happens to failures.",
			"Much better. Your {npc.npcSlave} will remember your weakness.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerWon"):
		return [
			"Know your place, scum.",
			"You're weak. Remember your position.",
			"Pathetic. Learn your standing.",
			"You're nothing. Remember that.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerWon2"):
		return [
			"You as well. You are on some very thin ice, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerWon3"):
		return [
			"And now you're gonna learn your place.",
			"You're so weak. And now you're gonna learn your place.",
			"Pathetic display. And now you're gonna learn your place.",
			"You're dumb and weak. And now you're gonna learn your place.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerWon4"):
		return [
			"And you watch. You are on some very thin ice, {npc.npcSlave}.",
			"Pay attention, slave. This is what happens to disobedient bitches.",
		]

	if(_id == "SoftSlaveryPunishSell"):
		return [
			"I'm so fucking sick of the sight of you. I'm done. I really am.",
			"I've had it with your constant disobedience. You're not gonna be my problem anymore.",
			"You've failed me for the last time, you pathetic {npc.npcSlave}. I'm getting rid of you.",
			"I wanted to break you, but you're not even worth the fucking effort. This is over.",
			"You could have been something, but you're just broken. I'm done with you.",
			"You're a complete disappointment. I'm done with you.",
			"I'm sick of wasting my time on you. Consider yourself someone else's problem.",
			"You're a lost cause. I'm cutting my losses. I'm done.",
			"Every moment with you has been a mistake. I'm rectifying that now.",
			"You're the worst {npc.npcSlave} I've ever had. I am done.",
		]
	if(_id == "SoftSlaveryPunishSell2"):
		return [
			"I'll let someone else deal with your pathetic bullshit.",
			"Maybe your next owner can handle your worthless attitude. I doubt it.",
			"Enjoy your new life. I hope they're ten times fucking stricter than I was.",
			"Let's see how long you last with someone who won't tolerate your bullshit.",
			"You're not my problem anymore. Someone else can try to beat some sense into you.",
			"Good luck with your new life. They won't be as fucking patient as I was.",
			"Someone else can deal with your disobedience now. I'm washing my hands of you.",
			"Whoever buys you is getting a defective {npc.npcSlave}. Good fucking luck to them.",
			"I hope your next owner breaks you in half. You deserve it.",
			"Go be someone else's massive disappointment.",
		]


	if(_id == "SoftSlaveryPunishGB"):
		return [
			"You've been a disobedient little shit. Time to become a gangbang whore.",
			"Think you behave like that? Let's see how you like being used by everyone.",
			"Your constant disobedience has earned you a great reward. A gangbang.",
			"Since you can't obey simple commands, maybe your holes can serve instead.",
			"Bad slaves get shared. You're about to become a public gangbang whore.",
			"I'm done with your attitude. Maybe being passed around like a toy will fix it.",
			"You need a reminder of your place. Something like a gangbang should do the trick.",
			"Disobedience means every one of your holes gets filled. Hope you're ready, {npc.npcSlave}.",
			"Think you're special? Let's see how special you will feel when I turn you into just another gangbang slut.",
		]
	if(_id == "SoftSlaveryPunishGBGiveup"):
		return [
			"Fuck. Not even enough people want to use your worthless holes.",
			"Pathetic. Can't even find people interested in fucking you as punishment.",
			"Fuck. What does it say about you that nobody wants your stupid holes?",
			"Shit. Nobody is interested in your pathetic body today. You got lucky.",
			"Fuck. Can't even find enough people for a gangbang. You're that bad.",
		]
	if(_id == "SoftSlaveryPunishGBOffer"):
		return [
			"Hey. Want to help break my disobedient {npc.npcSlave}?",
			"Interested in punishing my useless {npc.npcSlave}?",
			"Care to use my disobedient {npc.npcSlave} as a cumdump?",
			"Want to help teach this worthless {npc.npcSlave} a lesson?",
			"My {npc.npcSlave} needs a good lesson. Feel like joining a gangbang?",
			"This piece of shit needs reminding they're just holes. Interested?",
			"Want to join in gangbanging my disobedient {npc.npcSlave}?",
			"Care to help me turn this {npc.npcSlave} into a gangbang whore?",
			"My {npc.npcSlave} deserves to be used by everyone. Want in?",
			"This bitch needs to be put in {pc.his} place. Care to help?",
		]
	if(_id == "SoftSlaveryPunishGBSure"):
		return [
			"Fuck yes. I love breaking sluts.",
			"Always happy to put a worthless slave in their place.",
			"Count me in. Nothing better than punishing disobedient fucktoys.",
			"Gladly. I've been looking for a good fucktoy.",
			"Absolutely. Let's make this bitch regret being born.",
			"Would love to. Nothing like gangbanging a slut.",
			"Fuck yeah. I need to relieve some stress anyway.",
			"Perfect timing. I could use a good rough fuck.",
		]
	if(_id == "SoftSlaveryPunishGBFollow"):
		return [
			"Follow me, let's find a spot to ruin this bitch.",
			"This way. Time to make this {npc.npcSlave} scream.",
			"Follow. Let's get this punishment started.",
			"Come on. The sooner we start, the sooner we break {pc.him}.",
			"Follow me. I want this {npc.npcSlave} broken before it gets too late.",
			"Let's go. I can't wait to hear this whore beg.",
		]
	if(_id == "SoftSlaveryPunishGBSubOffer"):
		return [
			"Maybe I could be the one getting punished instead?",
			"I'd rather be the gangbang slut, if that's an option.",
			"Could I take your slave's place? I need to be used.",
			"Would you mind if I was on the receiving end? I love being a hole.",
			"Actually, I'd prefer to be the one taking all the cocks.",
			"Mind if I join as another fucktoy? I love being gangbanged.",
			"Could I be the main event instead? Or at least an extra hole?",
			"I want to be the one getting passed around and used.",
			"Would you consider using me instead? I need to be punished.",
		]
	if(_id == "SoftSlaveryPunishGBSubOfferYes"):
		return [
			"Fine by me. The more fuckmeat the better.",
			"Sure, why not? Two sluts to break instead of one.",
			"Excellent. Double the screaming, double the fun.",
			"Perfect. We'll use both of you until you're broken.",
			"Works for me. More holes to fill and degrade.",
			"Great. You can be the bonus cumdump.",
			"Alright. The more worthless sluts the merrier.",
			"Good thinking. We'll ruin both of you.",
			"Why not? Plenty of abuse to go around.",
			"Fuck yes. Two gangbang whores are better than one.",
		]
	if(_id == "SoftSlaveryPunishGBSubOfferNo"):
		return [
			"No, we already have one bitch to punish.",
			"Sorry, this is about breaking my {npc.npcSlave}, not you.",
			"We don't need another slut distracting from the main event.",
			"This punishment is reserved for my disobedient property.",
			"We've got all the fuckmeat we need right here.",
			"No thanks, I want to concentrate on breaking this particular whore.",
		]
	if(_id == "SoftSlaveryPunishGBSubOfferNoAw"):
		return [
			"Fuck. I really wanted to be used.",
			"Damn. Nothing better than being gangbang material.",
			"Too bad. I love being passed around like a toy.",
			"Disappointing. I live for this kind of punishment.",
			"Oh well. Maybe I'll find someone else to abuse me.",
			"Shame. Being used by multiple people is my favorite.",
			"Damn it. I was hoping to be the gangbang slut today.",
		]
	if(_id == "SoftSlaveryPunishGBNo"):
		return [
			"Not interested.",
			"I'll pass on this one.",
			"No thanks.",
			"Not my thing.",
			"I'll sit this out.",
			"Not today.",
			"I'd rather not.",
			"No, I'm good.",
			"I'll decline.",
		]
	if(_id == "SoftSlaveryPunishGBNoReact"):
		return [
			"Fuck you then. Your loss.",
			"Suit yourself, coward.",
			"Fine. We don't need your weak ass anyway.",
			"Your choice. Plenty of others want to have fun.",
			"Too bad for you. Missing out on a good time.",
			"No problem. We'll find someone with actual balls.",
			"Whatever. More fun for me.",
			"Pathetic. Can't handle a real gangbang.",
		]
	if(_id == "SoftSlaveryPunishGBStart"):
		return [
			"Time to learn your place, you worthless slut.",
			"Let the punishment begin. Hope you're ready to be broken.",
			"This is what happens to disobedient slaves.",
			"Ready to become a gangbang whore? Hope not.",
			"Let's see how much fucking you can take before you break.",
			"Time to make you regret every time you said no to me.",
		]
	if(_id == "SoftSlaveryPunishGBEnd"):
		return [
			"Remember this feeling every time you think about disobeying me.",
			"Let that be a lesson about who owns these holes, slut.",
			"Next time it will be twice as brutal. Remember that.",
			"Hope you enjoyed your punishment, because there's plenty more where that came from.",
			"Your body is my property to use and share. Never forget that again.",
			"Remember this moment the next time you think about misbehaving.",
			"Let this remind you that you're nothing but fuckmeat.",
		]

	if(_id == "SoftSlaveryResist"):
		return [
			"Really, {npc.npcSlave}? You stupid fuck, is that how you wanna do this?",
			"Think you can resist me, {npc.npcSlave}? How fucking adorable.",
			"So you want to do this the hard way? Fine by me, you little shit.",
			"Resisting? You'll regret that choice more than anything in your pathetic life.",
			"You're actually trying to fight back? How fucking pathetic.",
			"This is your idea of a good time? Getting beaten into submission? You're sick.",
			"You think you have a choice here? How fucking cute.",
			"You want to play rough? Let's play rough then, you worthless bitch.",
			"This little rebellion of yours is going to end with you sobbing in pain.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtra"):
		return [
			"Hey! I want a turn fucking that slut too.",
			"Mind if I join? That slut looks like it could use more fucking.",
			"Can I get a turn with your fucktoy? Those holes are begging for it.",
			"Room for one more? I'd love to wreck that slut with you.",
			"Think your slut can handle two of us?",
			"Don't hog all the fun. Share your slut.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraYes"):
		return [
			"Sure, let's do it. Help me lock this worthless {npc.npcSlave} in tighter.",
			"Good idea. Help me secure my {npc.npcSlave} so {pc.he} can't squirm.",
			"Perfect timing. Let's make sure this bitch {pc.isAre} completely trapped.",
			"Glad you asked. Help me get {pc.him} properly restrained for a good fucking.",
			"Sure thing. Let's double team this pathetic {npc.npcSlave}.",
			"Works for me. Help me make sure {pc.he} {pc.isAre} utterly helpless for us.",
			"Fuck yes. Let's break this {npc.npcSlave} together.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraNo"):
		return [
			"No. This is my {npc.npcSlave}, now fuck off.",
			"Get lost. I don't share my property with trash like you.",
			"This {npc.npcSlave} is mine alone. Find your own fucktoy.",
			"No way. I'm not sharing my {npc.npcSlave} with you.",
			"Beat it. This {npc.npcSlave} is for my use only.",
			"Piss off. My {npc.npcSlave}, my rules.",
			"No sharing. This {npc.npcSlave} belongs to me.",
			"Find your own {npc.npcSlave}. This one's taken.",
			"Get your own. This one's mine to break.",
			"Back off. This {npc.npcSlave} is mine.",
			"Not interested in sharing. Go find another hole to fill.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraNo2"):
		return [
			"Really? I wasn't asking, you piece of shit.",
			"Too bad. I'm taking what I want.",
			"I wasn't requesting permission, fuckface.",
			"This isn't a negotiation, asshole.",
			"Watch me take what I want.",
			"I don't care what you think, fucker.",
			"Try and stop me then, you fuck.",
			"This is happening whether you like it or not.",
			"You can't stop me from having my fun.",
			"Tough shit. I'm not leaving.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraFree"):
		return [
			"You're free, for now. Don't get used to it.",
			"Alright, that's enough. Get the fuck out of my sight.",
			"Get out of here. I'm bored with you for now.",
			"That's all the attention you get today. Now disappear.",
			"Run along, you used-up slut. We'll continue this later.",
			"Go on, get out of here. I've had my fun for now.",
			"Consider this session over. Now fuck off.",
			"You're free to go. Don't make me come find you.",
			"Get lost. I'll drag you back when I want you again.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraFreeLost"):
		return [
			"You are still my {npc.npcSlave}, understand? Don't forget it.",
			"Don't think this changes anything. You're still my property.",
			"Remember who really owns you, you worthless {npc.npcSlave}.",
			"This was just a temporary loan. You still belong to me, bitch.",
			"Don't get any ideas. You're still my fucking {npc.npcSlave}.",
			"Nothing's changed. You're still my property to use and abuse.",
			"You still answer to me, understand? Don't make me remind you.",
			"This doesn't change your status as my fucktoy.",
			"You're still mine, just a little more broken in now.",
			"Your body might be free, but you're still my {npc.npcSlave}.",
		]

	if(_id == "SoftSlaveryParadeFuckOffer"):
		return [
			"That slut looks like they need a proper fucking. Can I use {pc.him}?",
			"What a desperate looking slave. Mind if I wreck {pc.him}?",
			"That slave is practically begging for it. Can I break {pc.him}?",
			"Your slave looks under-fucked. Care to let me fix that?",
			"I've been watching your slave. I want to show {pc.him} what real pain feels like. May I?",
			"That slave has needy written all over {pc.him}. Let me have a turn.",
			"What a pathetic slave. Mind if I put {pc.him} to proper use?",
		]
	if(_id == "SoftSlaveryParadeFuckOfferYes"):
		return [
			"Sure. Make that {npc.npcSlave} scream.",
			"Go ahead. {pc.He} could use some good fucking.",
			"Be my guest. Just don't damage my property beyond use.",
			"Fine. Just don't damage my property beyond use.",
			"Sure, why not? {pc.He} {pc.verb('exist')} to be used anyway.",
			"Absolutely. Make sure the whole prison hears {pc.his} moans.",
			"Yes. Put that {npc.npcSlave} in {pc.his} place.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferYesThree"):
		return [
			"You know what? Sure. I'll join and show you how it's done.",
			"Actually, I think I'll participate too. Make it into a threesome.",
			"Good idea. I could use some stress relief myself.",
			"Fine, but I'm taking the first turn. Watch and learn.",
			"Yes, and I'll show you the right way to make {pc.him} beg.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferNo"):
		return [
			"Fuck no. You can watch, but you don't get to touch my {npc.npcSlave}.",
			"Not a fucking chance. Find your own {npc.npcSlave} to ruin.",
			"Absolutely not. My {npc.npcSlave} isn't some public whore.",
			"Get the fuck out of here. This {npc.npcSlave} is mine alone.",
			"Get lost, scum. I don't let trash like you touch what's mine.",
			"Touch my {npc.npcSlave} and I'll break your fucking hands.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferNo2"):
		return [
			"Fine.",
			"Whatever.",
			"Your loss.",
			"Suit yourself.",
			"Cheap bastard.",
			"Missed opportunity.",
			"Pathetic.",
			"Figures.",
			"Waste of time.",
			"Keep your trash then.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferGood"):
		return [
			"Good little {npc.npcSlave}. Now let's continue this parade.",
			"See? You were born to be a public whore. Now move your ass.",
			"Good. Now stop basking in the attention and move along.",
			"Show's over. Time to move, {npc.npcSlave}.",
			"Okay. Enough fun for you. Back to work.",
			"I haven't finished parading my property around yet. Let's go.",
			"Entertaining the masses is your job. Now walk.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferFight"):
		return [
			"I see. You just need someone to beat some sense into you.",
			"Wrong answer, fuckface. Time to show you how things work around here.",
			"So that's how it is? Fine. I'll take what I want by force.",
			"Perfect. I've been looking for an excuse to hurt someone today.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferWon"):
		return [
			"Another fool who thought they could take what's mine.",
			"Let that be a lesson for everyone watching. Nobody touches my {npc.npcSlave} but me.",
			"Another stupid asshole defeated. Now everyone knows not to challenge me.",
			"They actually thought they could take you? How fucking adorable.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferLostWatch"):
		return [
			"You're mine now. Your pathetic owner gets to watch.",
			"I won. And now your stupid owner gets front row seats to the show.",
			"I won. Your owner should watch closely as I break {npc.his} properly.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferLostBoth"):
		return [
			"I won. I think I'll fuck both of you worthless sluts.",
			"Two for the price of one. I'll use you as I please.",
			"Perfect. Two fucktoys for me to use.",
		]

	if(_id == "SoftSlaveryParadeGuard"):
		return [
			"Hey. What the fuck is going on here?",
			"Hold it right there, scum. Explain this shit.",
			"You there. What the fuck do you think you're doing?",
			"Stop. You better have a fucking good explanation.",
			"Is that inmate supposed to be leashed like some animal?",
			"Wait. Why the fuck is this inmate leashed? Start talking.",
			"Explain yourself. Now. Why {pc.isAre} {pc.he} leashed like a dog.",
			"Hold the fuck up. I need to know what this shit is about.",
		]
	if(_id == "SoftSlaveryParadeGuardPunish"):
		return [
			"I'm putting this worthless inmate in {pc.his} place.",
			"Just teaching this inmate some fucking manners.",
			"I'm administering some much-needed humiliation to this disobedient inmate.",
			"Standard procedure for putting a disobedient inmate back in line.",
			"Just reminding this inmate what {pc.he} is good for.",
		]
	if(_id == "SoftSlaveryParadeGuardPunish2"):
		return [
			"Carry on then. Make it hurt.",
			"Very well. Don't go easy on {pc.him}.",
			"Okay. Make sure {pc.he} learns {pc.his} lesson.",
			"Alright then, teach that inmate some respect.",
			"Fine. {pc.He} probably {pc.verb('deserve')} whatever {pc.he} {pc.verb('get')}.",
			"Good. That inmate looks like {pc.he} {pc.verb('need')} it.",
		]
	if(_id == "SoftSlaveryParadeGuardProblem"):
		return [
			"That's none of your fucking business.",
			"Fuck off, this doesn't concern your sorry ass.",
			"Mind your own fucking business before you get hurt.",
			"Step aside, guard. This is between me and my property.",
			"You don't want to get involved in this, trust me.",
			"Back the fuck off before I make you regret it.",
			"This is between me and my {npc.npcSlave}. Fuck off.",
			"Not your problem. Walk away while you still can.",
			"Get lost. {pc.He} {pc.isAre} my property, not yours.",
		]
	if(_id == "SoftSlaveryParadeGuardProblem2"):
		return [
			"Really? You want to suffer today?",
			"You really want to fucking do this?",
			"So that's how it's going to be? Fine by me.",
			"You're making your last fucking mistake.",
			"Big words for someone about to get fucking wrecked.",
			"You shouldn't have said that.",
		]
	if(_id == "SoftSlaveryParadeGuardWon"):
		return [
			"You're not getting rid of me so easily.",
			"That's what happens when you mess with what's mine.",
			"Now where were we? Oh right, let's go.",
			"Let that be a lesson to anyone who tries to mess with me.",
			"Come along, {npc.npcSlave}. We're not done here.",
			"Time to continue, {npc.npcSlave}.",
			"Now that the interruption is dealt with, back to business.",
		]
	if(_id == "SoftSlaveryParadeGuardLost"):
		return [
			"Get lost, inmate.",
			"Consider yourself lucky. Now get out of here.",
			"You're free to go. Don't let me catch you like this again.",
			"Run along now. You won't get another chance.",
			"Get moving before I change my mind.",
			"You're dismissed. Don't make me regret this.",
			"Go on, get the fuck out of my sight.",
			"Consider this your lucky day. Now disappear.",
		]
