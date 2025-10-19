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
			"I'm just so sick of you. I'm done. I hate you. I don't want to see you ever again.",
			"I've had enough of your disobedience. You're not gonna be my problem anymore.",
			"You've failed me for the last time. I'm getting rid of you.",
			"I wanted to break you, but you're not even worth the effort. Goodbye.",
			"You could have been good, but you're just broken. I'm done with you.",
		]
	if(_id == "SoftSlaveryPunishSell2"):
		return [
			"I will let someone else deal with your bullshit.",
			"Maybe someone else can handle your attitude. I doubt it.",
			"Enjoy your new life. I hope they're stricter than I was.",
			"Let's see how long you last with someone who won't tolerate your nonsense.",
			"You're not my problem anymore. Someone else can try to tame you.",
			"Good luck with your new life. They won't be as patient as I was.",
			"Someone else can deal with your disobedience now. I'm washing my hands of you.",
		]


	if(_id == "SoftSlaveryPunishGB"):
		return [
			"I'm so getting annoyed with you. Let's see how you will like a whole ass gangbang.",
			"You've been disobedient. Time to be used by everyone as punishment.",
			"Think you're too good to listen? Let's see how you like being gangbanged in the public.",
			"Your mouth has been saying no too often. Time to find some use for all your holes.",
			"Bad slaves get shared. You're about to become a public gangbang whore.",
			"I'm tired of your attitude. Maybe being passed around will improve it.",
			"You need to remember your place. A good gangbang should remind you.",
			"Disobedience earns you extra cocks down all of your holes. Hope you're ready for your punishment.",
		]
	if(_id == "SoftSlaveryPunishGBGiveup"):
		return [
			"Whatever. You're lucky there is not enough people around.",
			"Damn, nobody wants to fuck you? Even as punishment? Pathetic.",
			"Can't even find enough people who want your holes. What does that say about you?",
			"Nobody's interested in punishing you today. Consider yourself lucky.",
			"Too bad, seems like you're not even worth gangbanging right now.",
		]
	if(_id == "SoftSlaveryPunishGBOffer"):
		return [
			"Hey. Do you wanna help me punish this {npc.npcSlave}?",
			"Interested in breaking in my disobedient {npc.npcSlave}?",
			"Want to help teach my {npc.npcSlave} {pc.his} place?",
			"Care to join in punishing this useless {npc.npcSlave}?",
			"My {npc.npcSlave} needs correction. Want to help?",
			"This {npc.npcSlave} needs to be reminded they're just holes. Interested?",
			"Want to use my {npc.npcSlave} as punishment? {pc.He} {pc.isAre} been naughty.",
			"Care to join a gangbang? My {npc.npcSlave} deserves it.",
			"My {npc.npcSlave} needs to be put in {pc.his} place. Want to help?",
		]
	if(_id == "SoftSlaveryPunishGBSure"):
		return [
			"Sure. I can do that.",
			"Always happy to fuck a whore.",
			"Would love to.",
			"Count me in.",
			"Gladly.",
		]
	if(_id == "SoftSlaveryPunishGBFollow"):
		return [
			"Follow then.",
			"This way. Let's find a good spot.",
			"Follow me.",
			"Come along.",
			"Follow me. Let's get this gangbang started soon.",
		]
	if(_id == "SoftSlaveryPunishGBSubOffer"):
		return [
			"Mmm.. maybe you can punish me too?",
			"I'd rather be the one getting used, actually.",
			"Could I join as another hole to be filled?",
			"Would you mind if I was on the receiving end instead?",
			"I'm more interested in being the one getting gangbanged.",
			"Actually, I'd prefer to be the punishment toy.",
			"Mind if I switch places with your {npc.npcSlave}? Or an extra..",
			"I'd rather be the one taking all the cocks.",
			"Could I be the one getting punished instead? Or at least be an extra.",
			"I want to be the gangbang slut, not one of the participants.",
		]
	if(_id == "SoftSlaveryPunishGBSubOfferYes"):
		return [
			"I guess we could use some extra fuckmeat.",
			"Fine by me. The more holes the better.",
			"Sure, why not? Two sluts are better than one.",
			"Excellent. Double the fun for everyone.",
			"Perfect. We'll use both of you then.",
			"Works for me. More bodies to play with.",
			"Great. You can be the bonus hole.",
			"Alright. The more the merrier when it comes to gangbangs.",
			"Good thinking. We'll break in both of you.",
			"Why not? Plenty of cocks to go around.",
		]
	if(_id == "SoftSlaveryPunishGBSubOfferNo"):
		return [
			"We already have an extra bitch.",
			"No thanks, we've got enough holes to fill.",
			"This is about punishing my {npc.npcSlave}, not you.",
			"We don't need another slut right now.",
			"Sorry, this punishment is reserved for my {npc.npcSlave}.",
			"We're focused on correcting one bitch at a time.",
			"We've got all the fuckmeat we need.",
		]
	if(_id == "SoftSlaveryPunishGBSubOfferNoAw"):
		return [
			"Aw.. Oh well.",
			"That's too bad. Maybe next time.",
			"Damn. I really wanted to be used.",
			"Too bad. I love being gangbang material.",
			"Disappointing. I enjoy being punished.",
			"Oh well. Maybe I'll find another gangbang.",
			"Shame. Nothing better than being used by multiple people.",
		]
	if(_id == "SoftSlaveryPunishGBNo"):
		return [
			"I will pass.",
			"Not interested, thanks.",
			"No thanks, not my thing.",
			"I'll sit this one out.",
			"Not today.",
			"I'd rather not participate.",
			"No, I'm good.",
			"Not for me, thanks.",
			"I'll pass on that.",
		]
	if(_id == "SoftSlaveryPunishGBNoReact"):
		return [
			"Well screw you then.",
			"Your loss.",
			"Fine. More for the rest of us.",
			"Suit yourself.",
			"Whatever. We don't need you.",
			"Too bad for you.",
			"Your choice. We'll find someone else.",
			"Fine. We'll manage without you.",
			"No problem. Plenty of others want to have fun.",
		]
	if(_id == "SoftSlaveryPunishGBStart"):
		return [
			"Time to teach you a lesson.",
			"Let the punishment begin.",
			"Ready to learn your place?",
			"This is what disobedience earns you.",
			"Hope you're ready for your punishment.",
			"This will remind you who owns you.",
			"Let's see how many cocks you can take.",
		]
	if(_id == "SoftSlaveryPunishGBEnd"):
		return [
			"You're on very thin ice from now on, {npc.npcSlave}.",
			"Remember this feeling the next time you think about disobeying.",
			"Let that be a lesson about who owns these holes.",
			"Next time it will be worse. Remember that.",
			"Hope you enjoyed your punishment. There's more where that came from.",
			"Think about this the next time you consider saying no.",
			"Your body belongs to me. Never forget that again.",
			"This is just a taste of what happens to disobedient slaves.",
			"Remember this gangbang every time you think about misbehaving.",
			"Your holes are mine to share. Don't make me do this again.",
		]

	if(_id == "SoftSlaveryResist"):
		return [
			"Really, {npc.npcSlave}? Is that how you wanna do this?",
			"Think you can resist me, {npc.npcSlave}? How adorable.",
			"So you want to do this the hard way? Fine by me.",
			"Resisting? You'll regret that choice.",
			"You're actually trying to fight back? How pathetic.",
			"This is your idea of a good time? Getting beaten into submission?",
			"You think you have a choice here? How cute.",
			"You want to play rough? Let's play rough then.",
			"This rebellion of yours is going to end painfully.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtra"):
		return [
			"Hey! I wanna fuck them too.",
			"Mind if I join in? Looks like fun.",
			"Can I get a turn with that fucktoy?",
			"Room for one more? I'd love to use those holes.",
			"Think your fucktoy can handle two of us?",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraYes"):
		return [
			"Sure, let's do it. Help me lock {pc.him} in.",
			"Good idea. Help me secure my {npc.npcSlave}.",
			"Perfect timing. Let's make sure {pc.he} can't escape.",
			"Glad you asked. Help me get {pc.him} properly restrained.",
			"Sure thing. Let's double team this bitch.",
			"Works for me. Help me make sure {pc.he} {pc.isAre} completely helpless.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraNo"):
		return [
			"No. This is my {npc.npcSlave}, fuck off.",
			"Get lost. I don't share my property.",
			"This {npc.npcSlave} is mine alone. Find your own.",
			"No way. I'm not sharing my {npc.npcSlave} with you.",
			"Beat it. This {npc.npcSlave} is for me to use.",
			"Piss off. My {npc.npcSlave}, my rules.",
			"No sharing. This {npc.npcSlave} belongs to me.",
			"Find your own {npc.npcSlave}. This one's taken.",
			"Get your own. This one's mine.",
			"Back off. This {npc.npcSlave} is mine to use.",
			"Not interested in sharing. Go away.",
			"This is a private session. Fuck off.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraNo2"):
		return [
			"Really? I wasn't asking.",
			"Too bad. I'm taking what I want.",
			"Your opinion doesn't matter. Step aside.",
			"I wasn't requesting permission.",
			"This isn't a negotiation.",
			"Watch me take what I want.",
			"I don't care what you think.",
			"Try and stop me then.",
			"This is happening whether you like it or not.",
			"I think I'll help myself anyway.",
			"You can't stop me from having some fun.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraFree"):
		return [
			"You're free, for now.",
			"Alright, that's enough for today. You can go.",
			"Get out of here. I'm done with you for now.",
			"That's all the attention you get today. Now go.",
			"Run along. We'll continue this another time.",
			"Go on, get out of here. I've had my fun.",
			"Consider this session over. Now disappear.",
			"You're free to go. For now.",
			"Get lost. I'll find you when I want you again.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraFreeLost"):
		return [
			"You are still my {npc.npcOwner}, understand?",
			"Don't think this changes anything. You're still mine.",
			"Remember who really owns you, {npc.npcSlave}.",
			"This was just a temporary loan. You still belong to me.",
			"Don't get any ideas. You're still my property.",
			"Nothing's changed. You're still my {npc.npcSlave}.",
			"You still answer to me, understand?",
			"This doesn't change your status as my property.",
			"You're still mine, just with some extra miles now.",
		]

	if(_id == "SoftSlaveryParadeFuckOffer"):
		return [
			"That's a nice slave you have here. Can I fuck {pc.him}?",
			"What a delicious looking piece of fuckmeat. Mind if I use {pc.him}?",
			"That slave looks like they need a good fucking. Can I use {pc.him}?",
			"Your property looks quite tempting. Care to share?",
			"I've been watching your slave. I want to break them in properly. May I?",
			"That whore is begging for it with those eyes. Let me have a turn using {pc.him}.",
			"What a pretty toy you have. Mind if I play with it?",
			"That slave looks underused. Can I fix that for you?",
			"I need to relieve some stress. Your slave will do nicely.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferYes"):
		return [
			"You know what? Sure. Make that slut squirm.",
			"Go ahead. {pc.He} could use some raw fucking.",
			"Be my guest. Show {pc.him} what a real fucking feels like.",
			"Fine by me. Just don't break {pc.him} completely.",
			"Sure, why not? {pc.He} {pc.verb('exist')} to be used anyway.",
			"Absolutely. Make sure everyone hears {pc.his} scream.",
			"Yes. Remind {pc.him} of {pc.his} place.",
			"Go on. I enjoy watching my property get used.",
			"Please do. The more humiliation, the better.",
			"Of course. Public use builds character in slaves.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferYesThree"):
		return [
			"You know what? Sure. I will join as well.",
			"Actually, I think I'll participate too. Make it a party.",
			"Good idea. I could use some stress relief myself.",
			"Perfect. I'll show you how to properly handle my property.",
			"Fine, but I'm taking charge. Watch and learn.",
			"Yes, and I'll demonstrate the proper way to use {pc.him}.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferNo"):
		return [
			"No. You can only watch.",
			"Not interested. Find your own toy.",
			"Absolutely not. My property isn't free to use.",
			"Fuck off. This {npc.npcSlave} is mine alone.",
			"No chance. I don't share my {npc.npcSlave}. Just watch.",
			"Get lost. I don't let strangers touch what's mine.",
			"No. You can watch.",
			"No way. Watch, don't touch.",
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
			"Good little slut. Let's continue.",
			"Well used and properly broken. Just how I like you.",
			"See? You were made for this. Now move along.",
			"Good. Now move along.",
			"Let's continue now.",
			"Okay. Time to move.",
			"I haven't finished walking you around.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferFight"):
		return [
			"I see. You just need someone to teach you a lesson.",
			"Wrong answer. Time to show you how things work around here.",
			"So that's how it is? Fine. I'll take what I want by force.",
			"Big mistake. Now I'm going to enjoy breaking both of you.",
			"You'll regret that decision. Prepare to lose everything.",
			"Resistance? How cute. Time to make you regret it.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferWon"):
		return [
			"You're not getting rid of me so easily.",
			"Another fool who thought they could take what's mine.",
			"Let that be a lesson for others. Nobody touches my property but me.",
			"Another stupid asshole defeated. Let's go.",
			"They thought they could take you? How adorable.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferLostWatch"):
		return [
			"You're mine now. Your stupid owner can watch.",
			"I can fuck you now. Your owner gets front row seats to your humiliation.",
			"I won. And so I will fuck you.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferLostBoth"):
		return [
			"You're mine now. Actually.. I will fuck both of you.",
			"Two for the price of one. I will fuck both of you.",
			"Perfect. I two fucktoys for me to use.",
		]

	if(_id == "SoftSlaveryParadeGuard"):
		return [
			"Hey. What is happening here?",
			"Hold it right there. Explain this.",
			"You there. What do you think you're doing?",
			"Stop. This requires an explanation.",
			"Is that inmate supposed to be leashed like that?",
			"Wait. Why is the inmate leashed. I need answers.",
			"Explain yourself. Now. Why {pc.isAre} {pc.he} leashed.",
			"This doesn't look right. What's going on?",
			"Hold up. I need to know what this is about.",
		]
	if(_id == "SoftSlaveryParadeGuardPunish"):
		return [
			"I'm punishing this inmate.",
			"Just administering some discipline to this one.",
			"This is corrective action for a problematic inmate.",
			"Teaching this inmate a lesson in obedience.",
			"Standard procedure for difficult cases like this.",
			"This one needs to learn {pc.his} place.",
			"Just making sure this inmate understands {pc.his} role.",
		]
	if(_id == "SoftSlaveryParadeGuardPunish2"):
		return [
			"Carry on then.",
			"Very well. Proceed.",
			"Okay. Continue with your duties.",
			"Alright then, don't let me stop you.",
			"Fine. Just keep it moving.",
			"Right. Carry on.",
			"Sure. I'll leave you to it.",
			"Good. {pc.He} probably {pc.verb('deserve')} it.",
		]
	if(_id == "SoftSlaveryParadeGuardProblem"):
		return [
			"That's none of your business.",
			"Fuck off, this doesn't concern you.",
			"Mind your own fucking business.",
			"Step aside, guard. This is private.",
			"You don't want to get involved in this.",
			"Back off before you regret it.",
			"This is between me and my property.",
			"Not your problem. Walk away.",
			"I don't answer to you.",
			"Get lost. {pc.He} {pc.isAre} mine.",
		]
	if(_id == "SoftSlaveryParadeGuardProblem2"):
		return [
			"Really?",
			"You really want to do this?",
			"So that's how it's going to be?",
			"You're making a big mistake.",
			"That wasn't the right answer.",
			"You just signed your own trouble.",
			"Big words for someone about to get hurt.",
			"You shouldn't have said that.",
			"Alright. Now you've done it.",
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
			"Go away, inmate.",
			"Consider yourself lucky. Now get out of here.",
			"You're free to go. Don't let me catch you like this again.",
			"Run along now. You've been given a second chance.",
			"Get moving before I change my mind.",
			"You're dismissed. Don't make me regret this.",
			"Go on, get out of my sight.",
			"Consider this your lucky day. Now disappear.",
		]
