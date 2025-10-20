extends DialogueFiller

func _init():
	priority = 14

func canBeUsed(_id:String, _args:Dictionary, _form) -> bool:
	var guard = getChar(_args, _form.mainRole)
	var personality:Personality = guard.getPersonality()
	var subby = personality.getStat(PersonalityStat.Subby)
	#var subby = personality.getStat(PersonalityStat.Subby)
	
	if(subby > -0.4):
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
			"Finally awake? Good.",
			"Open those eyes for me, now. Don't keep me waiting.",
			"Look at me, cutie. I know you're not sleeping.",
			"Hello, sleepyhead. Time to wake up.",
			"Eyes open. I want to see you recognize me.",
			"Wake up, softie. This is your reality now.",
			"Finally conscious. Listen closely.",
			"There you are. I was getting impatient.",
			"Eyes on me already? Perfect. Listen up.",
			"Good, you're awake. I was getting bored with your silence.",
			"Sleeping beauty finally graces me with {pc.his} presence.",
			"There's my cutie. I was wondering how long you'd make me wait.",
		]
	if(_id == "SoftSlaveryIntro2"):
		return [
			"From this moment, you are my {npc.npcSlave}. Is that understood?",
			"Listen carefully, my sweet {npc.npcSlave}. You belong to me now. Do you hear me?",
			"You are my {npc.npcSlave} now. Learn your place beneath me and don't ever forget it. Clear?",
			"Your freedom is a fading memory from now on. You're mine, {npc.npcSlave}. Understand your new purpose?",
			"Let's be perfectly clear. You are my {npc.npcSlave}. Your life is mine to command. Hear me?",
			"Let this sink in. You are my {npc.npcSlave}. You belong to me. Is that simple enough to grasp?.",
		]
	if(_id == "SoftSlaveryIntro3"):
		return [
			"You will obey my every command. Disappoint me, and we will have a problem.",
			"Do exactly as I order and you'll be treated well. Defy me, and you'll regret it deeply.",
			"Your only purpose is to obey me without question. That is how you please me. Fail, and I will correct you.",
			"Try to resist, my little {npc.npcSlave}, and I'll enjoy breaking that spirit.",
			"I do not tolerate disobedience from my {npc.npcSlave}. I will punish you until you learn.",
			"This means you will do precisely what I say. Or I will have to discipline my new {npc.npcSlave}.",
			"Every word from my mouth is your command. Unless you crave my punishments.",
			"Your sole function is to obey me. Fail in that, and you will be corrected, swiftly.",
			"Say no to me, and I'll break you until yes is the only word you remember.",
		]
	if(_id == "SoftSlaveryIntroEND"):
		return [
			"I will be checking on you often. Don't forget who owns you.",
			"I will be checking on you often. Don't forget your place is at my feet.",
			"I'll check on you frequently. You're mine, never forget that.",
			"I will be seeing you regularly. Remember your role as my {npc.npcSlave}.",
			"I will check on you often. Keep that in mind and be ready.",
			"I will stop by. Make sure you are behaving for your owner.",
			"You'll see me often. Each time, expect to serve me.",
			"I'll be checking my {npc.npcSlave} frequently. Make sure you're always ready to be used.",
		]

	if(_id == "SoftSlaveryChangeName"):
		return [
			"Speak, my {npc.npcSlave}. What name should your owner use?",
			"Tell me how I should call my property. Make it good, {npc.npcSlave}.",
			"Offer me a name, sweet thing. I'll decide if it's worthy of my {npc.npcSlave}.",
			"What shall I name my toy? Choose carefully, {npc.npcSlave}.",
			"Sure, {npc.npcSlave}. What name do you beg to be called by?",
			"Let's hear it. This is a privilege, remember.",
		]
	if(_id == "SoftSlaveryChangeNameEND"):
		return [
			"Good. From this moment, you are my {npc.npcSlave}, and you belong to me.",
			"Sure. You are now my {npc.npcSlave}. Don't ever forget it.",
			"So be it. You wear that name as a collar, my {npc.npcSlave}.",
			"Very well. You are my {npc.npcSlave}, and I am your owner. This is your purpose.",
			"Good choice. Now, my {npc.npcSlave}, you will learn to love that name.",
		]

	if(_id == "SoftSlaveryAttackReaction"):
		return [
			"You foolish, foolish {npc.npcSlave}. You will be broken for this.",
			"How dare you raise a hand to me?! You'll regret that, {npc.npcSlave}.",
			"That was a very, very bad mistake, my dear. Prepare for your punishment.",
			"Defiance? How adorable. And how painfully stupid. You've earned every bit of what's coming.",
			"You just signed your own punishment order, {npc.npcSlave}. I hope it was worth it.",
			"Ah, spirit. I do enjoy crushing it. You've made this so much more fun for me, {npc.npcSlave}.",
			"Bad {npc.npcSlave}! That little act of rebellion just cost you all your privileges.",
			"Oh, you think you're strong? How cute. Let me show you what real strength feels like.",
			"You've just proven you need a firmer hand. Lucky for you, I'm happy to provide.",
		]
	if(_id == "SoftSlaveryAttackLost"):
		return [
			"Was that your best, my {npc.npcSlave}? You're still mine.",
			"All that effort, and you're still right where you belong..",
			"Your struggle was amusing, but ultimately pointless. You're still my {npc.npcSlave}.",
			"Did that make you feel better? Okay. You're sitll mine.",
		]
	if(_id == "SoftSlaveryAttackWon"):
		return [
			"And now, my disobedient {npc.npcSlave}, you will learn the price of your actions.",
			"Victory is mine. Now, it's time for your re-education, {npc.npcSlave}.",
			"Now you're going to understand what happens to naughty slaves who misbehave.",
			"You forced my hand, sweet thing. Now you'll face the consequences.",
			"This is not anger, it's correction. And you, my pet, are in dire need of it.",
			"You wanted a fight? The fight is over. Now comes the fun part for me.",
		]

	if(_id == "SoftSlaveryAskedFreedom"):
		return [
			"Do you really think you're ready for that, {npc.npcSlave}? My protection ends the moment I say yes. Are you certain?",
			"Such a bold request from my cute little {npc.npcSlave}. I could grant it, but you know you belong to me. Is this truly what you want?",
			"I could release you. But the galaxy is a cruel place for a pet without a master. Are you sure you want to give up being mine?",
			"Hmm. The audacity. But fine. If you wish to be cast out, I won't stop you. Just remember who took care of you, {npc.npcSlave}. Will you?",
			"You want to leave my side? After everything I've given you? Speak the truth, my softie. Do you truly wish to be dismissed?",
			"Is my sweet {npc.npcSlave} feeling restless? I allow you this one question. But your answer had better be final.",
			"You wish to be freed? Then you are free. But do not expect to crawl back to me when you realize your mistake, cutie. Are you sure?",
		]
	if(_id == "SoftSlaveryAskedFreedomPay"):
		return [
			"Your freedom has a price, {npc.npcSlave}. <CREDITS>. Pay me, and the chain is severed.",
			"You think I'd let my property go for free? <CREDITS>. That is the cost of your release, {npc.npcSlave}.",
			"Everything has a price, even my mercy. <CREDITS> is what your liberty will cost you, {npc.npcSlave}. Do you have it?",
			"I am a generous owner, but not a foolish one. <CREDITS> will secure your freedom. Not a credit less, my sweet {npc.npcSlave}.",
			"You want out? Then buy your way out. <CREDITS>. Consider it a final lesson in how the world works, {npc.npcSlave}.",
			"<CREDITS>. That is the value I place on letting you go. Pay it, and you are no longer mine. Refuse, and you remain my cute little {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryAskedFreedomEND"):
		return [
			"Well, you can go. You are dismissed, {npc.npcSlave}.",
			"Very well. You're free now. Your presence is no longer required.",
			"Go on then. Run along. Your time as mine is over.",
			"Then our business is concluded. You're free to go.",
			"Decision made. Now leave, before I change my mind.",
			"Then you are released. Do not waste this freedom.",
			"Then it's done. Leave, and do not look back.",
		]

	if(_id == "SoftSlaveryTalkStart"):
		return [
			"Speak, {npc.npcSlave}. You have my attention, for now.",
			"You may address me, {npc.npcSlave}. What is so important?",
			"Approach. State your business, {npc.npcSlave}.",
			"I'm listening, {npc.npcSlave}. This had better be good.",
			"You have permission to speak. Be quick about it.",
			"Your owner is busy. Make this worth my while, {npc.npcSlave}.",
			"Yes, my {npc.npcSlave}? You have something to say?",
			"You seek my attention? You have it. Do not squander it.",
			"Go on, {npc.npcSlave}. Talk.",
		]

	if(_id == "SoftSlaveryProtectedByFriendStart"):
		return [
			"Hey, what do you think you're doing with my friend?",
			"Step away from {pc.name}, now. You don't get to play with {pc.him}.",
			"Is there a reason your hands are on this sweet cutie?",
			"Explain yourself. Why are you bothering my friend?",
			"Let {pc.him} go. My friend doesn't need your attention.",
			"Back off. That's my good friend you're harassing.",
			"I suggest you find a different pet to bother.",
			"Touch {pc.name} again and you'll be dealing with me.",
		]
	if(_id == "SoftSlaveryProtectedByFriendResponse"):
		return [
			"This {npc.npcSlave} belongs to me. You're the one who doesn't belong here.",
			"I'd love to teach you some manners.",
			"You're challenging me? How adorable.",
			"Leave before I decide to keep you as well, pet.",
			"That's a brave stance for someone in striking distance.",
			"You think you have a choice in this matter? How cute."
		]
	if(_id == "SoftSlaveryProtectedByFriendAllGoodResp"):
		return [
			"Alright. Sure. Enjoy it.",
			"Fine. Carry on, then. Have fun.",
			"Suit yourself. Have fun.",
			"Very well. Continue what you were doing, it looked fun.",
			"Fine by me. I can just watch.",
		]
	if(_id == "SoftSlaveryProtectedByFriendLost"):
		return [
			"Now crawl away before I change my mind about letting you go.",
			"Run along, little pest. You're not worth the effort.",
			"Consider this your only warning. Disappear.",
			"Go. And be grateful I'm letting you keep your dignity.",
			"Leave my sight before I decide to enslave you too.",
			"You've wasted enough of my time. Vanish.",
			"Get out of here. I have a {npc.npcSlave} to discipline.",
			"Don't let me see you near my property again.",
			"Be gone. I have better things to do than deal with you.",
			"Leave. And be thankful I'm in a merciful mood today."
		]
	if(_id == "SoftSlaveryProtectedByFriendWonThank"):
		return [
			"Of course, sweetie. I'll always protect you.",
			"No problem, cutie. Stay safe.",
			"Don't mention it, sweetheart. We're friends after all.",
		]

	if(_id == "SoftSlaveryChokeOutStart"):
		return [
			"My patience is at its end. Come here, {npc.npcSlave}. You're going to be my relief, sorry.",
			"I am in a mood, and you are going to be my outlet. Don't even think of struggling, {npc.npcSlave}.",
			"This rage needs a target. Be a good {npc.npcSlave} and take it for me.",
			"I require a release. You will provide it. Be still and accept your purpose, {npc.npcSlave}.",
			"Anger is burning me up inside. You will be the one to put it out, my {npc.npcSlave}. Sorry.",
			"You're going to help me work through this, {npc.npcSlave}. Cooperate, and it will be easier on you.",
			"I'm feeling particularly mean today I'm afraid. You're going to submit, {npc.npcSlave}, one way or another.",
		]
	if(_id == "SoftSlaveryChokeOutEndured"):
		return [
			"Good {npc.npcSlave}. You've helped me immensely.",
			"Excellent. You know how to please me, {npc.npcSlave}.",
			"That was exactly what I needed. You may go, for now.",
			"I feel much more in control, thanks to you, my {npc.npcSlave}.",
			"You serve your purpose well. I am satisfied, {npc.npcSlave}.",
			"You took that beautifully. Run along now, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryChokeOutPCWon"):
		return [
			"Ugh.. Impressive fight, {npc.npcSlave}. It only makes me want to break you more.",
			"Ah.. You have spirit. I like that. It makes owning you more rewarding..",
			"A temporary victory. Do not mistake my amusement for permission, {npc.npcSlave}.",
			"You fight well, but you are still mine. Remember your place..",
			"Feeling proud, my fierce little {npc.npcSlave}? This changes nothing.",
			"A valiant effort. It will make your eventual submission all the sweeter..",
		]
	if(_id == "SoftSlaveryChokeOutPCLost"):
		return [
			"And you fold. Just as I knew you would, my weak little {npc.npcSlave}.",
			"Pathetic. You couldn't even stay conscious for your owner.",
			"All that fight, gone. You're so much easier to handle when you're quiet, {npc.npcSlave}.",
			"See? This is your true place. Helpless and yielding before me.",
			"Such a delicate thing. It's a wonder you lasted as long as you did.",
		]
	if(_id == "SoftSlaveryChokeOutPCLostSex"):
		return [
			"Now, where were we? Ah, yes. My reward.",
			"Let's see what other uses my unconscious {npc.npcSlave} has.",
			"Perfect. Now you're perfectly pliant for me.",
			"Time for me to claim what's mine.",
			"Don't worry, {npc.npcSlave}. I'll take good care of you.",
			"Unconscious or not, you will serve your purpose, {npc.npcSlave}.",
			"This is what you were made for. To be used by me.",
		]

	if(_id == "SoftSlaveryFuckStart"):
		return [
			"I wanna fuck my {npc.npcSlave}. Come here.",
			"I'm horny and I wanna fuck you. Get over here, {npc.npcSlave}.",
			"Come to me, I wanna fuck you, {npc.npcSlave}.",
			"I need something to fuck. Don't make me call you twice, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryFuckResultGood"):
		return [
			"Not bad for a {npc.npcSlave}. I will be back when I'm horny again.",
			"You handled me well. I will return when I'm horny again..",
			"You're pretty fun to fuck, {npc.npcSlave}.",
			"Decent effort, {npc.npcSlave}. I suppose it will do for now.",
		]
	if(_id == "SoftSlaveryFuckResultOkay"):
		return [
			"That was okay. Can't you moan a little louder, {npc.npcSlave}? I will be back when I'm horny again.",
			"Not terrible. But you can moan better, I'm sure.",
			"You scratched the itch. But that's about it, {npc.npcSlave}.",
			"Acceptable. There is room for improvement, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryFuckResultBad"):
		return [
			"That was awful. Are you trying to make me mad, {npc.npcSlave}?",
			"You suck, {npc.npcSlave}. Not even in a good way.",
			"Why are you so terrible at fucking? Do you need more training?",
			"Useless. You made this unpleasant for both of us.",
		]

	if(_id == "SoftSlaveryFuckNemesisApproach"):
		return [
			"Well-well-well, what do we have here?",
			"Look who wandered into my sight. Interesting.",
			"Well, well. This could be fun.",
			"Fancy meeting you here.",
			"Oh hey. Never thought things would turn out like this.",
		]
	if(_id == "SoftSlaveryFuckNemesisAsk"):
		return [
			"What's your problem?",
			"You want something or just causing a scene?",
			"Talk fast. I have a slave to fuck.",
			"What do you want? Get lost."
		]
	if(_id == "SoftSlaveryFuckNemesisAnswer"):
		return [
			"I have a proposition. Your slave crossed me. Wanna punish {pc.him} together?",
			"Your slave caused me trouble. Wanna help me teach {pc.him} a lesson?",
			"{pc.He} screwed me. Fancy a little payback together?",
			"Your slave crossed the line. Want to help me put {pc.him} back?",
			"I have a score to settle with your slave. You in?",
			"Your slave made a huge mistake. Wanna punish {pc.him} together?",
		]
	if(_id == "SoftSlaveryFuckNemesisYes"):
		return [
			"Sure. Let's do it.",
			"Fine. Together then.",
			"Hm. Alright. Anything to make this {npc.npcSlave} learn {npc.his} place faster.",
			"You wanna fuck this {npc.npcSlave} together? Hm. This might be fun.",
			"Right. Sounds good. Let's teach {npc.him} another lesson.",
		]
	if(_id == "SoftSlaveryFuckNemesisNo"):
		return [
			"No. {pc.He} {pc.isAre} mine.",
			"I'll handle {pc.him} myself. {pc.He} {pc.isAre} my property.",
			"No. Keep your hands off. {pc.He} belongs to me.",
			"Don't interfere. {pc.He} {pc.isAre} under my control.",
			"No. {pc.He} {pc.isAre} mine to deal with.",
			"I won't share {npc.him}. {pc.He} {pc.isAre} mine.",
			"Back off. {pc.He} {pc.isAre} mine to fuck with.",
		]

	if(_id == "SoftSlaveryFuckJealousStart"):
		return [
			"Hey! That's my {npc1.npcSlave}! The fuck are you doing with {pc.him}?",
			"Hey. That {npc1.npcSlave} is mine. What the fuck is happening?",
			"Hey, you got a problem? That {npc1.npcSlave} belongs to me.",
			"What do you think you're doing with my {npc1.npcSlave}?",
			"Hey. You picked the wrong person to mess with. That's my {npc1.npcSlave}.",
		]
	if(_id == "SoftSlaveryFuckJealousFight"):
		return [
			"Huh? Get lost. That {npc.npcSlave} is mine.",
			"That's my {npc.npcSlave}. Now get lost or you will regret it.",
			"Go away, this {npc.npcSlave} belongs to me.",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerWon"):
		return [
			"This is my {npc.npcSlave}. Do you understand that now?",
			"See? I told you. {pc.He} {pc.isAre} mine. Remember that.",
			"You lost. This {npc.npcSlave} stays with me. Loser.",
			"Clear enough? {pc.He} {pc.verb('belong')} to me.",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerWonFuck"):
		return [
			"Shouldn't have come here. Now you're gonna be my fucktoy too.",
			"You brought this on yourself, little fucktoy. I'll make sure you regret it.",
			"Wrong place, wrong time. But I'm not done with you yet. Come here, both of you.",
			"You made a huge mistake. Time to make you my second bitch.",
			"You chose to screw with me. Prepare to be fucked, together with my {npc.npcSlave}.",
			"I'm horny and both of you will now deal with it."
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOffer"):
		return [
			"Hey! Hear me out. How about we.. share this {npc.npcSlave} together?",
			"Wait! Before you do anything.. I have an idea. What if we just share this {npc.npcSlave} together?",
			"Stop! Before you do anything.. The {npc.npcSlave} could serve us both.. how about that?",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOffer2"):
		return [
			"It's the slave's fault that {pc.he} didn't tell us about each other, right? So why not punish {pc.him} instead?",
			"The slave didn't tell us about each other. So let's punish {pc.him} for it. Yeah?",
			"That bitch slave never told me that {pc.he} {pc.has} another fucking owner. Wanna punish {pc.him} for that?",
			"The slave kept secrets. So let's make {pc.him} regret that?",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOfferAgree"):
		return [
			"You might be right.",
			"Perhaps that's fair.",
			"Hmm. That could work.",
			"I can see the logic in that.",
			"Maybe we should do it your way.",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOfferAgree2"):
		return [
			"Let's have some fun.",
			"Let's break this bitch.",
			"Fine. Let's do it.",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOfferNope"):
		return [
			"Huh. You're funny. I think I will just fuck both of you.",
			"You are so desperate. Only makes me wanna fuck you harder. Both of you.",
			"Your begging won't work, loser. I will fuck you both.",
			"Great idea. I will change just one piece. You will be the one getting fucked.",
		]

	if(_id == "SoftSlaverySlutwallStart"):
		return [
			"Today I feel like fucking you in the slutwall. Stay still while I leash you.",
			"The slutwall is waiting for you. Hold still, {npc.npcSlave}.",
			"Come here. I'm gonna shove you into the slutwall today. Don't struggle, {npc.npcSlave}.",
			"You're gonna be my fucktoy in the slutwall today. Show me your neck.",
			"Today I feel like fucking you in the slutwall. Hold still, {npc.npcSlave}.",
			"Be a good {npc.npcSlave} and obey while I bring you to the slutwall.",
		]
	if(_id == "SoftSlaverySlutwallLocked"):
		return [
			"Now that you're locked in.. Let's have some fun.",
			"Great view. Got you right where I want you.",
			"Helpless and exposed. Just the way I like it.",
			"Chained up and exposed. Let's have some fun.",
		]
	if(_id == "SoftSlaveryStocksStart"):
		return [
			"Today I feel like fucking you in the stocks while everyone is watching. Stay still while I leash you.",
			"The stocks are waiting for you. Hold still, {npc.npcSlave}.",
			"Come here. I'm gonna shove you into the stocks today. Don't struggle, {npc.npcSlave}.",
			"You're gonna be my fucktoy in the stocks today. And everyone is gonna see it. Show me your neck.",
			"Today I feel like fucking you in the stocks while everyone is watching. Hold still, {npc.npcSlave}.",
			"Be a good {npc.npcSlave} and obey while I bring you to the stocks.",
		]
	if(_id == "SoftSlaveryStocksLocked"):
		return [
			"Don't even try to wriggle free. Let's have some fun.",
			"Locked and on display. Perfect.",
			"Helpless and exposed. Just the way I like it.",
			"Now that you're locked in.. Let's have some fun.",
		]
	if(_id == "SoftSlaveryGiveCreditsStart"):
		return [
			"I'm short on credits, I need exactly <CREDITS> right now. Be a good {npc.npcSlave} and give them to me.",
			"I need <CREDITS> immediately. Hand them over, {npc.npcSlave}.",
			"You're going to give me <CREDITS> now. Don't make me ask twice.",
			"I want <CREDITS> from you. C'mon, I'm waiting.",
			"<CREDITS>. Hand 'em over. Do what you're told, {npc.npcSlave}.",
			"Give me <CREDITS>, now. Consider it your purpose.",
			"I decided that you owe me <CREDITS>. Give them to me now.",
			"Be useful and give me <CREDITS> right this moment. No excuses.",
		]
	if(_id == "SoftSlaveryGiveCreditsTake"):
		return [
			"Thanks. Good {npc.npcSlave}.",
			"That's better. Maybe you'll be useful after all.",
			"Good. Obeying is better than being punished.",
			"Mhm. I will find a better use for them anyway.",
			"Okay. You would have wasted them anyway.",
			"I appreciate that. Stay useful.",
			"Nice. Don't forget who's in charge.",
		]
	if(_id == "SoftSlaveryGiveCreditsShort"):
		return [
			"Bullshit. Guess I'll have to punish you.",
			"Really? You're asking to be punished.",
			"Short? You disappoint me. Prepare to be punished.",
			"Pathetic. You're asking for punishment."
		]

	if(_id == "SoftSlaveryMarkingStart"):
		return [
			"I feel like marking my {npc.npcSlave}. So stand still while I do this.",
			"Hold still. This will remind you who you belong to.",
			"Don't flinch. I wanna leave some marks on my {npc.npcSlave}.",
			"Stay still now. I'm going to make sure everyone knows who you are and who you belong to.",
			"Look at me and don't move. I wanna mark you, like property.",
			"Come here and stay quiet. You're not leaving until I'm done marking you."
		]
	if(_id == "SoftSlaveryMarkingEnough"):
		return [
			"That should be enough. Looks great.",
			"Good. That'll do. Can't mistake you now.",
			"Perfect. Such a nice marked {npc.npcSlave}.",
			"Enough for now. Not bad, eh?",
			"Done. Looks pretty hot I think.",
			"Clean lines. Dirty language. Fits a {npc.npcSlave} like you.",
		]
	if(_id == "SoftSlaveryMarkingAnother"):
		return [
			"Another one?",
			"Want me to add more? I will.",
			"Think that's enough? I don't.",
			"I wanna add another.",
			"You want another? I do. Stay still.",
			"I could keep going.. actually.. I will.",
			"These bodywritings make you look so slutty. Let's add another.",
			"You squirmed. So I'm adding another.",
			"You moved too much. I guess I have to scribble some more words on you.",
			"One more won't hurt. Stay still.",
			"Bodywritings are hot. So you're getting another one.",
		]
	if(_id == "SoftSlaveryMarkingNoStart"):
		return [
			"Whatever, I guess I'm not marking you.",
			"Fine. Might as well leave you unmarked for now.",
			"Not today then. Consider yourself lucky.",
			"Alright. No bodywritings this time. Don't get comfortable, {npc.npcSlave}.",
			"Hmm. Maybe another day. You still belong to me.",
			"Be glad I'm not feeling it today.",
		]
	if(_id == "SoftSlaveryMarkingNo"):
		return [
			"Alright. I guess this is enough for now.",
			"Fine. We're done for now. You look pretty slutty.",
			"Enough for today. Behave and I might not add more.",
			"That'll do. Perfect.",
			"I'm done, fine. I hope everyone will see these.",
			"Okay. For the time being, you're marked enough."
		]
	if(_id == "SoftSlaveryMarkingNoFail"):
		return [
			"Don't anger me. My {npc.npcSlave} needs to be marked.",
			"Don't push your luck, {npc.npcSlave}. Either you're getting marked or I will punish you.",
			"You test me and I won't stop at one bodywriting. Stand still and accept them.",
			"Keep your mouth shut, it's up to me to decide. You're getting marked.",
		]
	if(_id == "SoftSlaveryMarkingBegYes"):
		return [
			"You are being so cute, begging me. How can I say no?",
			"You look pathetic begging. Fine. I can be merciful.",
			"Your pleading amuses me. Sure, just this time.",
			"Begging me, huh. That's cute.",
		]
	if(_id == "SoftSlaveryMarkingBegYes2"):
		return [
			"That's enough then.",
			"Alright. We're done here.",
			"You earned temporary mercy.",
			"Okay. This time I will let you off.",
		]
	if(_id == "SoftSlaveryMarkingBegNo"):
		return [
			"If you're gonna beg, do it on your knees.",
			"Down to your knees. Just begging is not enough.",
			"Who begs like that? Do it on your knees.",
			"You wanna beg? Get down to your knees first.",
			"Beg like proper slaves do it. On your knees.",
		]
	if(_id == "SoftSlaveryMarkingBegNo2"):
		return [
			"Kneel, now.",
			"You heard me? Kneel.",
			"Kneel. Don't make me repeat that.",
			"Kneel. Show that you mean it.",
			"Kneel. Don't waste my time.",
		]
	if(_id == "SoftSlaveryMarkingBegCredits"):
		return [
			"Good. Now give me 5 credits or I will leave some ink on you.",
			"Want me to stop? Pay 5 credits. Otherwise.. you know.",
			"Hand over 5 credits or I'm leaving some writings on you.",
			"Now give me 5 credits and I will let you go. Maybe.",
		]
	if(_id == "SoftSlaveryMarkingBegCreditsGive"):
		return [
			"Thanks. These are more useful to me anyway.",
			"Good. That's the price of your subbiness.",
			"Accepted. I'll take that and forget the rest.",
			"Nice. Your money buys you a favor.",
			"Those will do. Keep them coming if you value comfort.",
		]
	if(_id == "SoftSlaveryMarkingBegCreditsGive2"):
		return [
			"I guess that's it then.",
			"That settles it for now.",
			"Alright. We're done. For now.",
			"Good. Leave before I change my mind.",
		]
	if(_id == "SoftSlaveryMarkingBegNoMarked"):
		return [
			"That's what you get. Enjoy the marks.",
			"So be it. Wear them as a reminder.",
			"You asked for it. Now live with the marks.",
			"Markings suit you. They'll help keep you in line.",
			"Don't cry about it. This is on you.",
			"This is your consequence. Wear these proudly.",
			"You wanted to act up. Now look at yourself.",
			"Consider it your punishment. Don't complain."
		]
	if(_id == "SoftSlaveryMarkingBegFoot"):
		return [
			"Good. Now kiss my {npc.foot}, worship me if you don't want to get inked.",
			"Okay. Now kiss my {npc.foot}. Be a good {pc.boy} or I will do it.",
			"Now humiliate yourself for me a bit. Kiss my {npc.foot}. Now.",
			"Think you're done? Kiss my {npc.foot} first. I need to be worshipped.",
		]
	if(_id == "SoftSlaveryMarkingBegFootKiss"):
		return [
			"Pathetic. Doing anything to avoid the bodywritings, huh?",
			"That's such a great view. Nice. Keep it up.",
			"Seeing you like this is nice. Just perfect.",
			"Feels nice. Keep going.",
			"Humiliation suits you. Keep kissing.",
		]
	if(_id == "SoftSlaveryMarkingBegFootKiss2"):
		return [
			"I guess that's it then.",
			"That settles it for now.",
			"Alright. We're done. For now.",
			"Good. Leave before I change my mind.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation"):
		return [
			"Good. Now admit that you are my {npc.npcSlave}. Nothing but my property.",
			"Okay. Now I wanna hear you admitting to being a {npc.npcSlave}. My {npc.npcSlave}. Say it loudly.",
			"Right. Now I wanna hear you humiliate yourself. Admit that you belong to me. Admit that you are a {npc.npcSlave}.",
			"Next. I want you to say something loudly. Admit that you are my {npc.npcSlave}. You belong to me. Mean every word.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation2"):
		return [
			"What? A little louder.",
			"Louder. I want to hear it.",
			"Not loud enough. Say it again.",
			"Raise your voice. I didn't hear anything.",
			"Make it audible. Don't mumble.",
			"Again, but with feeling this time.",
			"Louder. I want everyone to hear.",
			"Don't be shy. Say it like you mean it.",
			"Say it again and make it believable.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation3"):
		return [
			"That's much better. Glad you agree with me.",
			"Good. Finally some sense out of you.",
			"That's the tone I wanted to hear.",
			"Now that's acceptable. Keep that attitude.",
			"Better. Maybe you'll behave now.",
			"That will do. Remember what you said.",
			"Good. Your words mean something now.",
			"That's acceptable. Carry on with that in mind.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation4"):
		return [
			"I guess that's it then.",
			"That settles it for now.",
			"Alright. We're done. For now.",
			"Good. Leave before I change my mind.",
		]
	if(_id == "SoftSlaveryMarkingNotDone"):
		return [
			"Actually.. you know what.. I'm not done with you just yet.",
			"Hold on. I have another thing I wanna do with you.",
			"Wait. We're not done actually. I have something else I wanna do with you.",
			"I lied. This isn't over yet.",
			"Actually.. There is something else we can do. Yes.",
		]
	if(_id == "SoftSlaveryMarkingNotDoneStocks"):
		return [
			"This is just so you don't run away now.",
			"Consider it insurance.",
			"I don't want you to squirm while I do this.",
			"This will make sure you don't squirm. We don't want me to mess up, do we?",
			"This will help you stand still for me. Yes.",
		]
	if(_id == "SoftSlaveryMarkingNotDoneStocks2"):
		return [
			"Perfect. This is art.",
			"Neat. It looks exactly how I wanted.",
			"Perfect. It suits you.",
			"Good. It reads well to anyone who sees it.",
			"Perfect. This will last.",
		]
	if(_id == "SoftSlaveryMarkingNotDoneUrinal"):
		return [
			"Gonna mark you real good.",
			"I wanna mark my {npc.npcSlave} with this.",
			"That's the proper way to mark someone, don't you think?",
			"See this? About to mark you..",
		]
	if(_id == "SoftSlaveryMarkingNotDoneUrinal2"):
		return [
			"Mmhh.. Good {npc.npcSlave}.",
			"That felt good. Oh, you are looking so lewd.",
			"Hah. You look great, such a slut.",
			"You liked it, didn't you? Hah.",
			"Yes.. good.. wear it proudly, slut.",
		]

	if(_id == "SoftSlaveryParadeAroundStart"):
		return [
			"I wanna parade you around the prison. And show off my {npc.npcSlave}.",
			"I'm taking you out for everyone to see. Let me leash you and don't cause trouble.",
			"It's time to walk you around the prison and let others look. Show your neck, {npc.npcSlave}.",
			"I'm leashing you. We're doing a little walk around the prison for the others to see.",
			"I need your neck. I'm gonna parade you around the prison today.",
		]
	if(_id == "SoftSlaveryParadeAroundFirst"):
		return [
			"Like it so far? We're just getting started.",
			"How do you feel, {npc.npcSlave}? We're only at the first stop.",
			"See their eyes looking at you? This is only the beginning.",
			"Enjoying the attention? There's plenty more, we're just getting started.",
			"This is only the warm-up. Keep up, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryParadeAroundMore"):
		return [
			"Good. Let's continue.",
			"Another stop. We're not done yet.",
			"Take a short breather and let's go.",
			"Are you tired yet? There is still more spots to show you off at.",
			"Ready to continue? Not enough people have seen you yet.",
			"See their eyes? They're looking at you. Let's continue.",
			"I bet you like being paraded around like that.",
			"It's pretty fun to show off my {npc.npcSlave} like that, not gonna lie.",
		]
	if(_id == "SoftSlaveryParadeAroundLast"):
		return [
			"One more time. I want everyone to see you.",
			"This is the last round. Make it memorable.",
			"Final one. Show that you're proud.",
			"One last stop. Don't slow down.",
			"Last spot left. Don't embarrass me now.",
			"We're nearly done. Don't hide anything.",
		]
	if(_id == "SoftSlaveryParadeAroundFree"):
		return [
			"Perfect. You're free for now, {npc.npcSlave}.",
			"Alright. For the moment, you're free.",
			"You did as told. Go. But don't stray far, {npc.npcSlave}.",
			"That's enough for today. You're free until I find you again.",
			"Good. Off with you. And remember your place.",
			"You're done for now. Keep out of trouble.",
			"You're free until I need you again.",
		]
	if(_id == "SoftSlaveryParadeAroundEatGagged"):
		return [
			"Too bad you can't eat, {npc.npcSlave}. I will though.",
			"Can't bite? I'll eat for the both of us.",
			"You'll wait while I eat. That's the rule.",
			"Sit and watch me eat. Maybe later you'll get something.",
		]
	if(_id == "SoftSlaveryParadeAroundEat"):
		return [
			"Let's take a break. Enjoy your meal, {npc.npcSlave}.",
			"Sit down and eat what's given to you.",
			"Time for a short rest. Eat your portion.",
			"Here's your food. Don't waste it.",
			"Eat now. We'll be moving again soon.",
		]
	if(_id == "SoftSlaveryParadeAroundPlatform"):
		return [
			"Gonna lock you into one of these if you don't behave.",
			"Stocks are pretty fun, don't you think? Yeah.",
			"This is where you will end up if you don't behave.",
			"Misbehave and I will shove you into one of these.",
			"Do you like public use, {npc.npcSlave}? Hah.",
		]
	if(_id == "SoftSlaveryParadeAroundShower"):
		return [
			"Can't let you stay messy all the time.",
			"You're due for a wash. Don't struggle.",
			"I want you to be presentable. A quick wash it is.",
			"Stand under the water. I'm washing you.",
		]

	if(_id == "SoftSlaveryThreesomeStart"):
		return [
			"I brought a friend today. You're gonna service both of us.",
			"Got company. You'll be pleasing two masters today. Understand?",
			"Double the trouble for you today. We're gonna use you together.",
			"I brought a friend today. Make sure we're both satisfied.",
		]
	if(_id == "SoftSlaveryPunishCredits"):
		return [
			"I will take some of that.",
			"Consider this a tax for your disobedience.",
			"This is mine now. Call it a lesson fee.",
			"Payment for my trouble. Don't make me take more.",
			"Your credits look better in my pocket.",
			"This should cover my frustration.",
			"Not enough to buy your freedom, but it might buy my mercy.",
		]
	if(_id == "SoftSlaveryPunishCredits2"):
		return [
			"If I can't have your obedience, I will at least have some of your credits. Obey or I will have to do something much worse.",
			"Obey or it will get much worse for you.",
			"This is nothing. Obey or I will have to start punishing you for real.",
			"Next time I will take more than credits.",
		]
	if(_id == "SoftSlaveryPunishRipClothes"):
		return [
			"That's enough for you? Yeah? Obey or I will have to do something much worse.",
			"Had your fun? Now start obeying before I really lose my temper.",
			"Did you enjoy your little rebellion? You want something much worse? Start obeying.",
			"Still feel brave? Next time I'll give you something real to cry about.",
			"Finished with being a brat? Good. Now start obeying or suffer the consequences.",
			"Got it out of your system? Start obeying.",
		]
	if(_id == "SoftSlaveryPunishRoughSex"):
		return [
			"Fuck it. If you don't wanna obey, I will make you.",
			"Fine. We'll do this the hard way.",
			"You had your chance. Now you'll learn the hard way.",
			"Disobedience earns punishment. Don't fucking struggle.",
			"You chose pain. And I will not disappoint.",
			"Your resistance just made this much worse for you.",
			"Should have obeyed. Now you'll pay the price.",
			"You just ran out of choices. Welcome to your consequences, {npc.npcSlave}.",
			"Fine. We'll do this the hard way. Your body will obey even if your mind won't.",
			"You're going to learn your place one way or another.",
			"I enjoy breaking stubborn ones like you. Makes the victory sweeter.",
			"Think you can say no to me? Let's see how long that attitude lasts.",
			"Every time you fight back, I'll just get rougher. Your choice.",
			"You exist for my pleasure. Time for a reminder.",
		]
	if(_id == "SoftSlaveryPunishRoughSexPCWon"):
		return [
			"Ugh.. I'm not done with you.",
			"This isn't over. Not by a long shot.",
			"You'll pay for that. Mark my words..",
			"Enjoy your moment. It won't last. I'm still your owner.",
			"You just made everything worse for yourself.",
			"Big mistake. Huge.",
			"This changes nothing. You're still mine.",
		]
	if(_id == "SoftSlaveryPunishRoughSexEnded"):
		return [
			"Obey next time. Or I will have to do something much worse.",
			"Let that be a lesson. Next time will be worse.",
			"Consider yourself warned. My patience has limits.",
			"That was a taste. Next time I won't hold back.",
			"Remember this feeling. It gets much worse.",
			"You got off easy. Don't make me prove it.",
			"That was your free lesson. The next one costs.",
			"Let that be a lesson. My patience has limits.",
			"Remember how this felt. It can always get worse.",
			"That was just a taste of what disobedience earns you.",
			"I hope you learned something today. For your sake.",
			"Your body belongs to me. Don't make me remind you again.",
			"This was mercy compared to what comes next.",
			"I own every inch of you. Time you started acting like it.",
		]
	if(_id == "SoftSlaveryPunishSlutwall"):
		return [
			"Follow or I will break your legs and pull you along the floor.",
			"Walk to the slutwall yourself or I'll drag you there by the leash.",
			"Move your feet or I'll make sure you can't.",
			"Follow nicely or I'll break something and you'll follow anyway.",
			"The slutwall awaits. You can go willingly or unwillingly.",
			"Come along quietly or I'll give you real reason to scream.",
			"Don't make this harder than it has to be. Walk.",
		]
	if(_id == "SoftSlaveryPunishSlutwallLock"):
		return [
			"Enjoy being used.",
			"Enjoy all the free public use, slut.",
			"Make yourself useful for once.",
			"Finally serving your purpose as a free cum dumpster.",
			"This is what you're good for. Being fucked for free.",
			"Welcome to your new function. Try to be bratty now.",
			"At least you're good for something.",
			"This is all you're worth.",
			"Embrace your purpose, {npc.npcSlave}.",
		]

	if(_id == "SoftSlaveryPunishStocks"):
		return [
			"Follow or I will break your legs and pull you along the floor.",
			"Move it, or I'll drag you by your hair.",
			"Walk or I'll make you crawl the whole way.",
			"Come quietly or I'll chain you and make you walk on your knees.",
			"Either you walk to the stocks on your own, or I'll carry you there broken.",
		]
	if(_id == "SoftSlaveryPunishStocksLock"):
		return [
			"I'm sick of you. Gonna find someone else to use you.",
			"You're worthless to me right now. Let's see if others find you more entertaining.",
			"Since you refuse to serve me properly, you'll serve as a fucktoy anyone who wants you.",
			"Your defiance earns you public use. Hope you enjoy being everyone's toy.",
			"Too stubborn? Let's see how you handle being public property for a bit.",
			"If you won't be my obedient slave, you'll be everyone's whore.",
			"Time to make you useful to someone, since you're useless to me.",
			"Your body's still good for something.. even if it's just being a public fucktoy.",
			"Since you can't behave, you'll learn your place under strangers.",
		]
	if(_id == "SoftSlaveryPunishStocksAsk"):
		return [
			"Is {pc.he} free to use?",
			"This one available for a quick fuck?",
			"Is your whore open for fucking?",
			"Mind if I use your fucktoy?",
			"Your slave looks like {pc.he} needs some attention. Can I?",
			"Can I have a turn with your slave?",
			"This slave available for use?",
		]
	if(_id == "SoftSlaveryPunishStocksAskNope"):
		return [
			"Nope. <CREDITS> credits first and then you can do whatever you want with {pc.him}.",
			"Not for free. <CREDITS> credits first.",
			"Everything has a price. <CREDITS> and {pc.he} {pc.isAre} all yours.",
			"<CREDITS> credits and you can break {pc.him} however you like.",
			"Pay <CREDITS> credits and use {pc.him} as your personal toy.",
			"Not giving {pc.him} away. <CREDITS> credits for a single use.",
		]
	if(_id == "SoftSlaveryPunishStocksAskNoBuy"):
		return [
			"What if I don't wanna pay?",
			"I'm not paying for used goods.",
			"Too expensive for damaged property.",
			"That's more than this slave is worth.",
			"Not paying that for your disobedient whore.",
			"Your slave isn't worth that much.",
			"Your price is too high for broken merchandise.",
			"This one looks used up already. Why pay?",
			"I'd rather take {pc.him} by force than pay.",
		]
	if(_id == "SoftSlaveryPunishStocksAskNoBuy2"):
		return [
			"Go away then.",
			"Then fuck off, cheapskate.",
			"No credits, no fuck. Simple. Go away.",
			"Then stop wasting my time. Go away.",
			"Get lost if you can't pay.",
			"Poor people shouldn't bother slave owners. Go away.",
			"Come back when you have real credits.",
			"Then you get nothing. Leave.",
		]
	if(_id == "SoftSlaveryPunishStocksAskNoBuy3"):
		return [
			"I don't wanna do that either.",
			"I'm not leaving empty-handed.",
			"Maybe I'll just take what I want.",
			"Your slave looks tempting enough to fuck you up.",
			"I think I'll help myself anyway.",
			"Your property looks like it needs proper use.",
			"Maybe I'll use {pc.him} and let you watch.",
			"I don't take no for an answer.",
			"This slave's going to get used one way or another.",
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
			"You better obey next time. I'm serious. Thanks for being such a good whore. Enjoy your stay.",
			"See how much better life is when you're useful? Now stay put and think about your place.",
			"That's what you're good for. Remember this feeling next time you consider disobedience.",
			"You served your purpose well. Maybe being a public use slut suits you better?",
			"See? You can be obedient when properly motivated. Enjoy the stocks.",
			"You finally found something you're good at. Public use slut.",
			"Good whore. Now stay locked up and think about how much better obedience feels.",
		]
	if(_id == "SoftSlaveryPunishStocksAfterBadSex"):
		return [
			"That sucked. Give me my credits back.",
			"Worst fuck I've ever paid for. Refund me.",
			"Your slave is terrible. I want my money back.",
			"This whore isn't worth the credits. Return them.",
			"Your slave fights too much. Not worth the price.",
			"This one's broken. Give me my credits back.",
			"Waste of good creds. Your whore is useless.",
			"Terrible fucking service. I demand a refund.",
		]
	if(_id == "SoftSlaveryPunishStocksAfterBadSex2"):
		return [
			"That's not how it works. You used my {npc.npcSlave}, now go away.",
			"No refunds. You got what you paid for.",
			"You used my {npc.npcSlave}. No refunds.",
			"My slave served you. Deal with it.",
			"You paid for access, not satisfaction.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerLost"):
		return [
			"Pathetic display.",
			"You fight like a slave yourself.",
			"Is that the best you can manage?",
			"All that struggle for nothing.",
			"You're even weaker than I thought.",
			"All that anger, so little strength.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerLost2"):
		return [
			"Much better. Enjoy yourself. Both of you.",
			"Two slaves, both in stocks. Much better.",
			"Both slaves are now in stocks. That's the way things always should have been.",
			"Learn your place alongside your slave. Doormat.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerLost3"):
		return [
			"Much better. And now your little slave will watch as I punish you.",
			"Good. Now your property gets to see what happens to disobedient owners.",
			"Perfect. Your slave will learn from your mistakes.",
			"Much better. Your slave will remember this.",
			"Good. Your whore gets to see proper punishment.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerWon"):
		return [
			"Learn your place.",
			"You're so weak. Learn your place.",
			"Pathetic display. Learn your place.",
			"You're dumb and weak. Learn your place.",
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
			"Nothing's changed. You're still my {npc.npcSlave}.",
			"You still answer to me, understand?",
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
			"Perfect. Two fucktoys for me to use.",
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
