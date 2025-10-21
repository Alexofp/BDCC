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
			"Perfect. Now you're fully obedient to me.",
			"Time for me to claim what's mine.",
			"Don't worry, {npc.npcSlave}. I'll take good care of you.",
			"Unconscious or not, you will serve your purpose, {npc.npcSlave}.",
			"This is what you were made for. To be used by me.",
		]

	if(_id == "SoftSlaveryFuckStart"):
		return [
			"Come here, {npc.npcSlave}. Your owner is feeling horny today.",
			"My body needs attention, {npc.npcSlave}. Get over here and make yourself useful.",
			"Come here, my little {npc.npcSlave}. I'm horny and it's time you earn your keep.",
			"Your purpose is to serve me. And so I require servicing, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryFuckResultGood"):
		return [
			"Very good, {npc.npcSlave}. You know how to please your owner. I'm satisfied.",
			"Excellent work, my sweet {npc.npcSlave}. You've earned a little praise.",
			"You learn quickly, don't you, {npc.npcSlave}? That was exactly what I needed.",
			"A commendable performance, {npc.npcSlave}. You may just become my favorite.",
			"You please me well, little one. I'll be sure to use you again soon.",
			"See? When you obey, everyone is happy. You made me very happy, {npc.npcSlave}.",
			"Outstanding. You're finally understanding your place, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryFuckResultOkay"):
		return [
			"Acceptable, {npc.npcSlave}. But I know you can do better. You will do better next time.",
			"It was.. adequate. Don't look so proud, you can offer me much more, {npc.npcSlave}.",
			"You served your purpose, but barely. I expect more enthusiasm next time, {npc.npcSlave}.",
			"Not your best work, {npc.npcSlave}. I'll let it slide this time, but I expect improvement.",
			"You met the minimum standard. Try harder to impress me next time, {npc.npcSlave}.",
			"A passable effort. Remember, your pleasure comes from mine, and I was only mildly amused.",
			"You'll need to be more attentive if you want to truly please me, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryFuckResultBad"):
		return [
			"Pathetic. Is that really the best you can do, {npc.npcSlave}? You disappoint me.",
			"Did you forget who owns you? That was bad. A severe disappointment.",
			"You are pretty bad at this, {npc.npcSlave}. I own a thing that can't even perform its simplest function.",
			"Are you trying to provoke me? If that was a deliberate failure, {npc.npcSlave}, you will regret it.",
		]

	if(_id == "SoftSlaveryFuckNemesisApproach"):
		return [
			"Well-well-well, what do we have here? That is so adorable.",
			"Look who wandered into my sight. My enemy is now someone's personal toy. Hah.",
			"Well, well. Didn't think I'd see you like this. Too bad I'm not the one with the leash.",
			"Fancy meeting you here. I love how you look.",
			"Oh hey. Never thought things would turn out like this. This is kinda funny, hah.",
		]
	if(_id == "SoftSlaveryFuckNemesisAsk"):
		return [
			"Say what you want already. My sweet {npc.npcSlave} is waiting for my attention.",
			"Say what you want already. You're interrupting my time with my sweet {npc.npcSlave}.",
			"Make it fast. I have a cute {npc.npcSlave} to discipline and adore.",
			"You have five seconds before I return to more important matters.. like my cute little {npc.npcSlave}.",
			"Whatever you want, be quick about it. My sweet {npc.npcSlave} needs me.",
			"Talk. But know you're borrowing time I usually dedicate to my sweet thing.",
		]
	if(_id == "SoftSlaveryFuckNemesisAnswer"):
		return [
			"Your adorable thing crossed me. How about we both teach {pc.him} some manners?",
			"That cute property of yours needs to learn a lesson. Care to help me discipline {pc.him}?",
			"Your sweet little thing screwed me over. Fancy a collaboration?",
			"That precious thing of yours crossed me. Want to help me put {pc.him} back in {pc.his} place?",
			"I have unfinished business with your pet. Care to let me play with {pc.him}?",
			"Your delicious softie of a pet made a huge mistake. How about we both punish {pc.him} for that?",
			"That lovely property of yours needs reminding of {pc.his} place. Shall we provide the education together?",
		]
	if(_id == "SoftSlaveryFuckNemesisYes"):
		return [
			"Perfect. My {npc.npcSlave} could use the extra.. attention.",
			"Mm, yes. This sounds fun.",
			"I like your thinking. Sure.",
			"Certainly. Let's make my {npc.npcSlave} squirm.",
		]
	if(_id == "SoftSlaveryFuckNemesisNo"):
		return [
			"Absolutely not. My {npc.npcSlave} is mine alone to discipline and cherish.",
			"No. This sweet thing belongs to me, and I don't share my toys.",
			"Never. My fixing my {npc.npcSlave} is my privilege alone.",
			"Don't even think about it. My {npc.npcSlave} is mine to protect and punish.",
			"Hands off. This adorable {npc.npcSlave} answers only to me.",
		]

	if(_id == "SoftSlaveryFuckJealousStart"):
		return [
			"Hey! Keep your hands off my {npc1.npcSlave}! What do you think you're doing with {pc.him}?",
			"Excuse me? That {npc1.npcSlave} belongs to me. Explain yourself.",
			"Is there a problem here? You're touching my property.",
			"What is the meaning of this? Get away from my {npc1.npcSlave} this instant.",
			"You have some nerve. That cute little thing is mine.",
		]
	if(_id == "SoftSlaveryFuckJealousFight"):
		return [
			"Huh? Back off. This is my {npc.npcSlave} and {pc.he} {pc.isAre} mine alone.",
			"What? This {npc.npcSlave} answers only to me. Go away.",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerWon"):
		return [
			"Let that be a lesson. This {npc.npcSlave} is mine. Do you understand?",
			"See? I told you. {pc.He} {pc.isAre} my good little {npc.npcSlave}. Remember that.",
			"You lost. My sweet {npc.npcSlave} stays with me. Now get out.",
			"Clear enough? {pc.He} {pc.verb('belong')} to me. Don't make me remind you again.",
			"That's what happens when you challenge me. Now crawl back to where you came from.",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerWonFuck"):
		return [
			"You shouldn't have interfered. Now you get to learn your place alongside my {npc.npcSlave}.",
			"You brought this on yourself. Now you're both mine to play with.",
			"Wrong place, wrong time. But I'm feeling generous. You can both serve me.",
			"You made a huge mistake. Now I have two toys to play with instead of one.",
			"Since you're both here, you might as well both be useful. Get over here.",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOffer"):
		return [
			"Wait! Perhaps we can come to an arrangement.. we could share this {npc.npcSlave}.",
			"Hold on. There's no need for this. We could both enjoy this {npc.npcSlave}. Know what I mean?",
			"Before this goes further.. consider this. The {npc.npcSlave} could serve two masters. Yeah?",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOffer2"):
		return [
			"This disobedient {npc.npcSlave} kept secrets from us. Shouldn't {pc.he} be punished for that?",
			"Our little {npc.npcSlave} failed to mention having another owner. Don't you think {pc.he} {pc.verb('deserve')} correction?",
			"My {npc.npcSlave} never told me about you. Let's make {pc.him} regret that.",
			"The {npc.npcSlave} is the one who misbehaved. Perhaps we should focus our attention on {pc.him}?",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOfferAgree"):
		return [
			"You might have a point.",
			"Perhaps that is a more fitting punishment.",
			"Hmm. The {npc1.npcSlave} does need to learn a lesson.",
			"I see the merit in your proposal.",
			"Maybe you're right.",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOfferAgree2"):
		return [
			"Let's teach our {npc1.npcSlave} some manners.",
			"Fine. Let's discipline this little troublemaker together.",
			"Agreed. The {npc1.npcSlave} needs to understand the consequences.",
		]
	if(_id == "SoftSlaveryFuckJealousOwnerLostOfferNope"):
		return [
			"An amusing suggestion. But I think I'll just take both of you.",
			"Your bargaining is pathetic. It only makes me want to dominate you both more.",
			"Begging doesn't suit you. I'll enjoy putting you both in your place.",
			"A interesting idea. I'll amend it. You will be serving me.",
		]

	if(_id == "SoftSlaverySlutwallStart"):
		return [
			"To me, {npc.npcSlave}. The slutwall is where you belong today. Don't make me repeat myself.",
			"The slutwall is calling for you, my little pet. Hold still while I leash my good {npc.npcSlave}.",
			"Come here, {npc.npcSlave}. Your owner going to use you in the slutwall today. Struggle and you'll regret it.",
			"You're going to be my perfect little fucktoy in the slutwall today. Present your neck, {npc.npcSlave}.",
			"I own this pretty body, and today I'm using it in the slutwall. Be still, {npc.npcSlave}.",
			"Be a good {npc.npcSlave} and come willingly to the slutwall. It's easier if you obey.",
		]
	if(_id == "SoftSlaverySlutwallLocked"):
		return [
			"Now you're locked in, my sweet pet. Let's see how well you can please me.",
			"Perfect. My pretty {npc.npcSlave} is right where you belong.",
			"Completely helpless and all for me. So hot.",
			"Chained up and so exposed for me. Love it.",
		]
	if(_id == "SoftSlaveryStocksStart"):
		return [
			"Today, the entire prison gets to watch me use you in the stocks. Show me your neck, {npc.npcSlave}.",
			"The stocks are waiting for you. Hold still, {npc.npcSlave}, and remember your place.",
			"Come here. You're going in the stocks, and everyone will see what a good {npc.npcSlave} you are for me.",
			"I feel like displaying and using my property today. The stocks will do nicely. Hold still, {npc.npcSlave}.",
			"Be a good {npc.npcSlave} and obey while I put you in the stocks. Don't shame me by struggling.",
		]
	if(_id == "SoftSlaveryStocksLocked"):
		return [
			"Don't even think about moving. You're mine to play with now.",
			"Locked, helpless, and fully mine. Love it.",
			"Helpless and exposed for everyone. This is your purpose, my cute little {npc.npcSlave}.",
			"Now that you're properly secured.. Let's show everyone how a good {npc.npcSlave} behaves.",
		]
	if(_id == "SoftSlaveryGiveCreditsStart"):
		return [
			"Master needs <CREDITS>, and you're going to provide. Be a good {npc.npcSlave} and give them. Now.",
			"I require <CREDITS> immediately. Don't test me, {npc.npcSlave}. Hand them over.",
			"You will give me <CREDITS> right now, {npc.npcSlave}. This isn't a request.",
			"I want <CREDITS>. Provide for your owner, {npc.npcSlave}. Don't keep me waiting.",
			"<CREDITS>. Now, {npc.npcSlave}. A good pet knows its duties.",
			"Give me <CREDITS> immediately. Consider it your privilege to serve me.",
			"I've decided you will give me <CREDITS>. Don't question your owner.",
			"Be useful, my sweet {npc.npcSlave}, and transfer <CREDITS> to me now. No arguments.",
		]
	if(_id == "SoftSlaveryGiveCreditsTake"):
		return [
			"Good {npc.npcSlave}. You know how to please me.",
			"That's my obedient {npc.npcSlave}. You know your place.",
			"Good. It's so much better when you choose to obey willingly, {npc.npcSlave}.",
			"Mhm. This is what you're for, my sweet. To serve me.",
			"Okay. This is a much better use for them than anything you'd do.",
			"I appreciate your submission, {npc.npcSlave}. It suits you.",
			"Nice. Never forget who provides for and owns you, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryGiveCreditsShort"):
		return [
			"Unacceptable. You've earned a punishment, {npc.npcSlave}.",
			"Really, {npc.npcSlave}? You're deliberately disobeying me? Prepare to be punished.",
			"Short? You dare disappoint me? You will be punished, {npc.npcSlave}.",
			"Pathetic. You're just begging for me to discipline you, aren't you, {npc.npcSlave}?"
		]

	if(_id == "SoftSlaveryMarkingStart"):
		return [
			"Stand perfectly still, {npc.npcSlave}. I wanna mark you.",
			"Hold still, {npc.npcSlave}. I'm going to mark you.",
			"Come here. Be a good {npc.npcSlave} and stay quiet while I mark you.",
			"Your body is my canvas, {npc.npcSlave}. Now stand still while I make my art.",
			"Such a pretty {npc.npcSlave} needs a pretty mark or two. Now. Don't. Move.",
			"I love seeing my marks on you. It's time for a few new ones, so be still."
		]
	if(_id == "SoftSlaveryMarkingEnough"):
		return [
			"Perfect. My {npc.npcSlave} looks properly claimed now.",
			"Good. That's exactly how my property should look.",
			"Beautiful. Every mark makes you look more like mine, {npc.npcSlave}.",
			"Enough for now. Doesn't it look good, {npc.npcSlave}?",
			"Excellent. My little art project is complete. For now.",
			"Looks perfect on you.",
			"That should do it. It suits you, don't you think?",
		]
	if(_id == "SoftSlaveryMarkingAnother"):
		return [
			"Another one? Yes.",
			"You think I'm finished? We're adding another.",
			"Your squirming just earned you another mark, {npc.npcSlave}. Hold still.",
			"I love the way you look like this. Let's add one more, for my pleasure.",
			"You want another? How can I say no.",
			"These look so good on you. I think you need another, my sweet {npc.npcSlave}.",
			"One more won't hurt. And it will please me. So stand still.",
			"I own every inch of you. I'll mark as much as I want.",
			"Your body begs for another mark. Don't worry, I'll oblige.",
		]
	if(_id == "SoftSlaveryMarkingNoStart"):
		return [
			"Fine. I'll leave you unmarked for now.",
			"Lucky you. I'm feeling merciful today.",
			"Not today. But remember, your body is mine to decorate when I choose.",
			"Very well. I'll let you stay plain for a little longer, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryMarkingNo"):
		return [
			"Alright, that's enough for now.",
			"Fine. We're done. I've left enough writings.",
			"Perfect. My work here is done. For now.",
			"I'm satisfied. I hope you enjoy showing off my artwork.",
		]
	if(_id == "SoftSlaveryMarkingNoFail"):
		return [
			"Don't test me, {npc.npcSlave}. You will be marked, one way or another.",
			"Push me, and I'll cover you in marks. Now stand still and be a good {npc.npcSlave}.",
			"You don't get a choice in this. Your body is mine to decorate as I see fit.",
			"Keep arguing, and this will be much less pleasant. You're getting marked.",
			"Silence. I decide what happens to my property. And I've decided you need some marks on you.",
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
			"On your knees, {npc.npcSlave}. That's where you belong when begging.",
			"Get on your knees, {npc.npcSlave}. Proper begging requires proper posture.",
			"Did I hear begging? Not until you're on your knees, {npc.npcSlave}.",
			"You want something? Then get on your knees and ask properly, {npc.npcSlave}.",
			"Knees. Now. Then you can beg, my little thing.",
		]
	if(_id == "SoftSlaveryMarkingBegNo2"):
		return [
			"I said kneel. Don't test me.",
			"Kneel. I won't ask again.",
			"On your knees. Show me you know your place.",
			"Kneel. Now.",
			"To your knees. Now.",
		]
	if(_id == "SoftSlaveryMarkingBegCredits"):
		return [
			"Good {npc.npcSlave}. Now, 5 credits, or I'll decorate that skin of yours.",
			"Want my mercy? It costs 5 credits. Otherwise, I'll leave my mark on you.",
			"Your comfort is 5 credits, cutie. Pay up, or become my canvas.",
			"5 credits, and I might be lenient. Refuse, and you'll wear your disobedience.",
		]
	if(_id == "SoftSlaveryMarkingBegCreditsGive"):
		return [
			"Good {npc.npcSlave}. Your tribute is accepted.",
			"Wise choice, {npc.npcSlave}.",
			"Excellent. This pleases me.",
		]
	if(_id == "SoftSlaveryMarkingBegCreditsGive2"):
		return [
			"Run along now. I'm bored.",
			"You're dismissed. Don't wander too far.",
			"Go on. But remember you belong to me.",
			"Leave my sight. I'll find you when I need my property.",
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
			"Good. Now show your devotion. Kiss my {npc.foot}, {npc.npcSlave}.",
			"On your knees and worship my {npc.foot}. Be a good {pc.boy}.",
			"Your lips belong on my {npc.foot}, {npc.npcSlave}. Now prove it.",
			"Kiss my {npc.foot}. That's where a {npc.npcSlave} like you belongs.",
		]
	if(_id == "SoftSlaveryMarkingBegFootKiss"):
		return [
			"Pathetic and perfect. You'll do anything to please me, won't you, {npc.npcSlave}?",
			"What a delightful sight. My {npc.npcSlave} in its proper place.",
			"Good. I enjoy seeing you humiliate yourself for me, {npc.npcSlave}.",
			"Good {npc.npcSlave}. Your devotion is noted.",
		]
	if(_id == "SoftSlaveryMarkingBegFootKiss2"):
		return [
			"You may stop. That's enough worship for now.",
			"Enough. You've pleased me for the moment.",
			"Very good. You can get up now.",
			"Acceptable. Now go, before I decide I want more.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation"):
		return [
			"Okay, now. I want to hear you say you're my property. Loud and clear.",
			"Now, announce it. Tell the world you are nothing but my {npc.npcSlave}.",
			"Good. Now admit that you are my {npc.npcSlave}. Nothing but my property.",
			"Right. Now I wanna hear you humiliate yourself. Admit that you belong to me. Admit that you are a {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation2"):
		return [
			"Louder. I want to hear you.",
			"Say it like you believe it. With conviction.",
			"Again! And put some shame into it.",
			"The whole prison should hear who owns you.",
			"More feeling! I want to hear your submission.",
			"Don't whisper, shout it.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation3"):
		return [
			"Good. Now you sound like a proper {npc.npcSlave}.",
			"Excellent. Finally, you understand your role.",
			"That's the tone I love to hear from my property.",
			"There we go. Was that so hard?",
			"Good. Let that truth sink deep into you.",
			"Acceptable. You learn, when motivated.",
		]
	if(_id == "SoftSlaveryMarkingBegHumiliation4"):
		return [
			"You're dismissed, {npc.npcSlave}. I'm done with you for now.",
			"That's all I wanted. Now get out of my sight, {npc.npcSlave}.",
			"Alright. We're finished. Don't go far.",
			"Good. You may leave. I'll summon you when I desire your company.",
		]
	if(_id == "SoftSlaveryMarkingNotDone"):
		return [
			"Wait. Hm.. Did I say you could move? I'm not finished with you.",
			"Hold it. I've decided I'm not done playing with my {npc.npcSlave} just yet.",
			"I changed my mind. We're going to continue until I am satisfied.",
			"I changed my mind. I have one more thing for you.",
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
			"Perfect. This looks great.",
			"Excellent. Now it's finished.",
			"Beautiful. Yes. Just beautiful.",
		]
	if(_id == "SoftSlaveryMarkingNotDoneUrinal"):
		return [
			"This is the most intimate way to mark you..",
			"This is how a dominant truly marks {pc.his} property..",
			"You're going to take my marking and learn to love the taste..",
			"A true {npc.npcSlave} is marked by their owner's fluids. You're no exception.",
		]
	if(_id == "SoftSlaveryMarkingNotDoneUrinal2"):
		return [
			"Mmhh.. Such a good {npc.npcSlave}, taking it all.",
			"That felt incredible. Look at you, so perfectly lewd and owned.",
			"Hah. You look so complete now, you beautiful slut.",
			"You loved it, didn't you? I can see it in your eyes.",
			"Yes.. good.. wear my gift proudly, my dirty little {npc.npcSlave}.",
			"What a good, obedient {npc.npcSlave} you are. I'm proud.",
			"Remember this feeling, {npc.npcSlave}. This is your purpose.",
		]

	if(_id == "SoftSlaveryParadeAroundStart"):
		return [
			"Come here, {npc.npcSlive}. I wanna parade you around the prison.",
			"Leash time, {npc.npcSlive}. You're going to be my pretty little showpiece for the whole prison.",
			"Neck out, {npc.npcSlave}. We're parading you today, and I expect you to wear my leash with pride.",
			"I'm parading you around the prison today, {npc.npcSlive}. The whole station will see what a good {npc.npcSlave} I've trained.",
		]
	if(_id == "SoftSlaveryParadeAroundFirst"):
		return [
			"Like it so far? Keep your posture straight. We're just getting started.",
			"How do you feel? We're only at the first stop. Don't avoid the hungry gazes.",
			"See their eyes looking at you? Look back. This is only the beginning.",
			"Enjoying the attention? There's plenty more, we're just getting started.",
			"This is only the warm-up. Keep up, my sweet {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryParadeAroundMore"):
		return [
			"Good. On to the next. Let's give them another look at you.",
			"Catch your breath for a second.",
			"Ready to continue? Still more spots to visit.",
			"Admit it, you love this. Being my displayed {npc.npcSlave} is what you were made for.",
			"It never gets old, parading my well-behaved {npc.npcSlave} for everyone to envy.",
			"Another stop. We're not done yet.",
			"Take a short breather and let's go.",
			"Are you tired yet? There is still more spots to show you off at.",
			"Ready to continue? Not enough people have seen you yet.",
			"See their eyes? They're looking at you. Let's continue.",
			"I bet you like being paraded around like that.",
		]
	if(_id == "SoftSlaveryParadeAroundLast"):
		return [
			"One final stop left. Make it count, {npc.npcSlave}. I want a perfect performance.",
			"Almost done. Keep your back straight and show them all how submissive you are.",
			"One more time. I want everyone to see my pretty thing.",
			"Final one. Show that you're proud.",
			"We're nearly done. Look proud of who you are.",
		]
	if(_id == "SoftSlaveryParadeAroundFree"):
		return [
			"Excellent work. You're free to move about.. for now.",
			"You obeyed perfectly. You may go.",
			"Good. Now you're free.",
		]
	if(_id == "SoftSlaveryParadeAroundEatGagged"):
		return [
			"Such a shame you can't eat right now, {npc.npcSlave}. You'll just have to watch me enjoy this.",
			"Since you can't bite, I'll eat for both of us. Be a good {npc.npcSlave} and watch.",
			"You'll sit and wait while I eat.",
		]
	if(_id == "SoftSlaveryParadeAroundEat"):
		return [
			"Break time. Eat up, {npc.npcSlave}. You need your strength for me.",
			"Sit. Eat what you're given. You've earned this little reward, {npc.npcSlave}.",
			"A short rest. Fuel up, {npc.npcSlave}. I'm not done with you yet.",
			"Here. Don't waste it.",
		]
	if(_id == "SoftSlaveryParadeAroundPlatform"):
		return [
			"See those? That's where you'll spend the day if you step out of line, {npc.npcSlave}.",
			"Public stocks. A perfect place for a disobedient cutie to learn a lesson, don't you think?",
			"This is your alternative to behaving. I suggest you remember that, my {npc.npcSlave}.",
			"Do you like the idea of public use, {npc.npcSlave}? Be good, or you'll find out firsthand.",
		]
	if(_id == "SoftSlaveryParadeAroundShower"):
		return [
			"Can't have my {npc.npcSlave} looking anything less than perfect. You're getting washed.",
			"You're getting cleaned up. Stand still and let me take care of you.",
			"I want you presentable. A quick wash to keep my {npc.npcSlave} looking {pc.his} best.",
		]

	if(_id == "SoftSlaveryThreesomeStart"):
		return [
			"I've brought a friend. You'll service us both.",
			"Another master to please today. I expect you to be on your best behavior for us.",
			"My friend wants to see how well I've trained you. Don't disappoint me, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryPunishCredits"):
		return [
			"This belongs to me now. A small price for your disobedience.",
			"Payment for my patience. Be grateful I'm not taking more.",
			"These credits are mine. Let this be a lesson in obedience.",
			"This should compensate for my frustration with you.",
			"Not enough to buy your freedom, but it might purchase my mercy for today.",
		]
	if(_id == "SoftSlaveryPunishCredits2"):
		return [
			"Continue this and the consequences will be far more severe, {npc.npcSlave}.",
			"Obey or I'll have to do more.",
			"Consider this the gentle reminder. Next time, I won't be so lenient with my {npc.npcSlave}.",
			"Credits are the least of what I'll take if you continue testing me.",
		]
	if(_id == "SoftSlaveryPunishRipClothes"):
		return [
			"Had your fun, little brat? Now obey before I decide to make this truly unpleasant.",
			"Enjoying your rebellion? This is nothing compared to what awaits if you don't start behaving, {npc.npcSlave}.",
			"Still feeling brave? Next time will be worse.",
			"Finished with your tantrum? Good. Now obey or discover what real punishment feels like.",
			"Got that out of your system? Time to remember your place, {npc.npcSlave}.",
			"That was your one free pass. Continue this and you'll regret it deeply.",
		]
	if(_id == "SoftSlaveryPunishRoughSex"):
		return [
			"Fine. If you won't obey willingly, I'll make you, my stubborn {npc.npcSlave}.",
			"You've chosen the hard way. I do so enjoy breaking in defiant pets.",
			"You chose this pain. Now accept it like the good {npc.npcSlave} you pretend not to be.",
			"Should have obeyed when you had the chance. Now you'll learn the hard way.",
			"Your body will obey even if your mind refuses. Let's begin.",
			"I particularly enjoy breaking stubborn ones like you. Makes the victory so much sweeter.",
		]
	if(_id == "SoftSlaveryPunishRoughSexPCWon"):
		return [
			"This isn't over, {npc.npcSlave}. Not by a long shot.",
			"Enjoy your momentary victory. It changes nothing.",
			"Big mistake. Huge.",
		]
	if(_id == "SoftSlaveryPunishRoughSexEnded"):
		return [
			"Let that be a lesson, {npc.npcSlave}. Next time will be considerably worse.",
			"Consider yourself warned. My patience has its limits.",
			"That was merely a taste of what disobedience earns you.",
			"Remember this feeling. It can always get worse.",
			"You got off lightly. Don't make me demonstrate what happens next.",
			"My patience is not infinite, {npc.npcSlave}. Remember that.",
			"I hope you learned something today, for your own sake.",
			"This was mercy compared to what might come next.",
		]
	if(_id == "SoftSlaveryPunishSlutwall"):
		return [
			"Walk to the slutwall willingly, {npc.npcSlave}, or I'll ensure you go there unable to walk.",
			"The slutwall awaits. You can go with dignity or without it.",
			"Don't make this harder than necessary. Walk like a good {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryPunishSlutwallLock"):
		return [
			"Finally serving your true purpose as public property.",
			"Welcome to your proper place. Try being bratty now.",
			"Make yourself useful while you reconsider your behavior.",
			"Perhaps some public service will improve your attitude.",
		]

	if(_id == "SoftSlaveryPunishStocks"):
		return [
			"Walk to the stocks yourself, {npc.npcSlave}, or I'll drag you there by your collar.",
			"Move those pretty legs for me, {npc.npcSlave}, or I'll make you crawl every inch.",
			"To the stocks, now. Either you go yourself, or I'll pull my struggling {npc.npcSlave} by the leash.",
			"Don't make this harder than it needs to be. Walk, or I'll ensure you remember the journey.",
		]
	if(_id == "SoftSlaveryPunishStocksLock"):
		return [
			"Since you refuse to be my good {npc.npcSlave}, you can be everyone's toy for a while.",
			"Your disobedience has consequences, {npc.npcSlave}. Let's see how you enjoy being public property.",
			"If you won't be obedient for me, you'll learn to be useful for strangers.",
			"Stubborn, aren't we? Maybe a few hours as the prison's fucktoy will soften you up, {npc.npcSlave}.",
			"You belong to me, and I'll decide your use. Right now, that means serving anyone I find.",
			"Maybe a dozen strangers will teach you the obedience you refuse to show me.",
		]
	if(_id == "SoftSlaveryPunishStocksAsk"):
		return [
			"Is that adorable slave available for use?",
			"Mind if I have a turn with your pretty toy?",
			"This one lookin' for some attention? Can I give it?",
			"Your property open for business?",
			"Can I borrow that fucktoy for a bit?",
			"That a well-trained cutie I see? Can I test {pc.him} out?",
			"Your slave looks like {pc.he} could use a lesson. Mind if I provide one?",
		]
	if(_id == "SoftSlaveryPunishStocksAskNope"):
		return [
			"My {npc.npcSlave} isn't free. <CREDITS> credits, and you can do as you please with {pc.him}.",
			"Good toys aren't cheap. <CREDITS> credits for a session with my {npc.npcSlave}.",
			"Everything has a price. <CREDITS> credits buys you some time with my property.",
			"<CREDITS> credits, and you can use my disobedient {npc.npcSlave} however you see fit.",
		]
	if(_id == "SoftSlaveryPunishStocksAskNoBuy"):
		return [
			"What if I don't feel like paying?",
			"I'm not paying for your used goods.",
			"That's a high price for damaged property.",
			"Your {npc.npcSlave} isn't worth that much.",
			"Not paying that for a disobedient whore.",
			"This one looks too used up to be worth that.",
			"Your price is too steep for broken merchandise.",
		]
	if(_id == "SoftSlaveryPunishStocksAskNoBuy2"):
		return [
			"Go away, don't waste my time.",
			"No credits, no fuck. It's simple. Now leave.",
			"Stop wasting my time then. Go away.",
			"Get lost if you can't afford quality.",
			"Come back when you have credits to spend.",
			"Then you get nothing.",
		]
	if(_id == "SoftSlaveryPunishStocksAskNoBuy3"):
		return [
			"I don't feel like leaving empty-handed.",
			"Maybe I'll just take what I want from your cute toy.",
			"Your property looks too tempting to walk away from.",
			"I think I'll help myself to your fucktoy anyway.",
			"Perhaps I'll use {pc.him} and let you watch me do it.",
			"I don't take no for an answer when I see something I want.",
			"Maybe a little force is the real price today.",
		]
	if(_id == "SoftSlaveryPunishStocksAskSure"):
		return [
			"Sure. A fair price for some fun.",
			"Fine by me. Here you go.",
			"There you go. Should be enough.",
			"Pleasure doing business.",
		]
	if(_id == "SoftSlaveryPunishStocksAfterSex"):
		return [
			"See how much better life is when you're useful, {npc.npcSlave}? Now stay put and reflect.",
			"That's what you're good for. Remember this feeling next time you consider disobedience.",
			"You served your purpose well. Maybe being a public toy suits you better than being mine? Yes.",
			"Finally found something you're good at, my little {npc.npcSlave}. Being a public use slut.",
			"Good {npc.npcSlave}. Now stay locked up and think about how much better obedience feels.",
			"You obey me, or you serve everyone. The choice is yours. Remember this.",
		]
	if(_id == "SoftSlaveryPunishStocksAfterBadSex"):
		return [
			"That was pathetic. I want my credits back.",
			"Your slut is terrible. Refund me.",
			"Worst fuck I've ever paid for. I want my money back.",
			"This one isn't worth the credits. Return them.",
			"Your slut fights too much. Not worth the price.",
			"Broken merchandise. Give me my credits back.",
			"Waste of good creds. Your fucktoy is useless.",
			"Terrible service. I demand a refund.",
		]
	if(_id == "SoftSlaveryPunishStocksAfterBadSex2"):
		return [
			"You used my property. No refunds.",
			"That's not how this works. You paid for access, not a guarantee.",
			"No refunds. You got what you paid for.",
			"My {npc.npcSlave} served you. The transaction is complete.",
			"You paid, you used. The deal is done. Now go.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerLost"):
		return [
			"Cute display.",
			"You fight like a soft slave yourself.",
			"Is that the best you can manage? Adorable.",
			"All that struggle for nothing. Kinda cute.",
			"You're even softer than I thought.",
			"All that anger, so little strength. Adorable.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerLost2"):
		return [
			"Much better. Two slaves in stocks. This is how it should be.",
			"Now you both know your place. Enjoy each other's company.",
			"Both of you, locked up where you belong. Perfect.",
			"Learn your place alongside your slave. You're no better.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerLost3"):
		return [
			"Much better. And now your cute fucktoy will watch as I punish you.",
			"Good. Now your softie gets to see what happens to disobedient owners.",
			"Perfect. Your soft toy will learn from your mistakes.",
			"Much better. Your cutie will remember this.",
			"Good. Your softie gets to see proper punishment.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerWon"):
		return [
			"Know your place.",
			"You're weak. Know your place.",
			"Pathetic. Know your place.",
			"All that anger, and for what? Know your place.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerWon2"):
		return [
			"And you're on very thin ice, {npc.npcSlave}. Don't think I've forgotten you.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerWon3"):
		return [
			"And now you're going to learn your place.",
			"You're weak. And now you're going to learn exactly where you belong.",
			"Pathetic. And now you're going to learn the price of your actions.",
			"All that struggle, and now you're going to learn your true purpose.",
		]
	if(_id == "SoftSlaveryPunishStocksOwnerWon4"):
		return [
			"And you watch closely, {npc.npcSlave}. This could be you.",
			"Pay attention, my {npc.npcSlave}. This is the consequence of disobedience.",
		]

	if(_id == "SoftSlaveryPunishSell"):
		return [
			"You've exhausted my patience, {npc.npcSlave}. I'm think I'm done with you, sadly.",
			"This is the final act of disobedience. I'm done with you. Sigh.",
			"You had every chance to be good, but you chose to rebel. Oh well, I tried.",
			"I tried to be firm but fair, but you're determined to be broken the hard way. Goodbye, {npc.npcSlave}.",
			"You could have been my perfect {npc.npcSlave}, but you refused to learn. Now you'll be someone else's problem.",
		]
	if(_id == "SoftSlaveryPunishSell2"):
		return [
			"Let's see how you handle an owner who won't tolerate you like I did.",
			"Maybe your next master will succeed where I failed.",
			"You're no longer my responsibility. Someone else can mold you into the {npc.npcSlave} you should have been.",
			"Good luck with your new owner. They won't be as forgiving as I was, softie.",
			"Another master will deal with your disobedience now. I hope for your sake they're more patient than I was.",
		]


	if(_id == "SoftSlaveryPunishGB"):
		return [
			"You've pushed me too far, {npc.npcSlave}. I think you need to be gangbanged.",
			"Disobedience has consequences. I will gangbang all the brattiness out of you",
			"Think you can refuse me? Let's see how long that attitude lasts when you're getting gangbanged.",
			"I've been too lenient with you. Time for a proper gangbang.",
			"You seem to have forgotten who owns you. A gangbang will refresh your memory.",
			"Every no you've said earns you another cock. Let's see how many you can take, {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryPunishGBGiveup"):
		return [
			"Pathetic. Can't even find enough people who want to bother with you.",
			"Nobody wants my disobedient {npc.npcSlave}. You're not even good enough for public use.",
			"Consider yourself lucky nobody's available to put you in your place today.",
			"Sad. You're lucky there is not enough people around.",
			"Aw, nobody wants to fuck you. Sad.",
			"Can't even find enough people who want your holes. What does that say about you?",
			"Too bad, seems like you're not even worth gangbanging right now.",
		]
	if(_id == "SoftSlaveryPunishGBOffer"):
		return [
			"Wanna gangbang my naughty {npc.npcSlave}?",
			"My {npc.npcSlave} needs to be gangbanged. Interested?",
			"Want to help break this disobedient {npc.npcSlave}?",
			"This {npc.npcSlave} needs to learn {pc.his} place. Want to help gangbang {pc.him}?",
			"My property needs to remember it's just holes for use. Care to help?",
			"Interested in using my {npc.npcSlave}?",
			"My pet needs to be put back in {pc.his} place. Want to gangbang {pc.him}?",
		]
	if(_id == "SoftSlaveryPunishGBSure"):
		return [
			"Sure. Why not.",
			"Always happy to fuck a cutie.",
			"Would love to.",
			"Yes-yes-yes.",
			"Gladly.",
			"Yes. Big yes."
		]
	if(_id == "SoftSlaveryPunishGBFollow"):
		return [
			"Follow my steps.",
			"This way. Let's find a good spot.",
			"Follow me.",
			"Come along.",
			"Follow me. Let's get this gangbang started soon.",
		]
	if(_id == "SoftSlaveryPunishGBSubOffer"):
		return [
			"I'd rather be the one taking all the cocks, if that's acceptable.",
			"Could I offer myself as an additional hole for use?",
			"Would you consider using me alongside your {npc.npcSlave}?",
			"Actually, I'd prefer to be the one being fucked.",
			"I want to be the punishment toy, not a participant.",
			"Perhaps I could serve as bonus fuckmeat for everyone?",
		]
	if(_id == "SoftSlaveryPunishGBSubOfferYes"):
		return [
			"Excellent. The more obedient sluts, the better.",
			"Fine by me. Extra willing holes are always welcome.",
			"Perfect. You can help demonstrate proper submission to my {npc.npcSlave}.",
			"Wonderful. Double the entertainment for everyone.",
			"Why not? Follow us.",
		]
	if(_id == "SoftSlaveryPunishGBSubOfferNo"):
		return [
			"Sorry, no space.",
			"Nah, can't. We already have an extra subby cutie.",
			"We already have an extra softie.",
		]
	if(_id == "SoftSlaveryPunishGBSubOfferNoAw"):
		return [
			"Such a shame. I do so love being used.",
			"That's disappointing. I live for being gangbang material.",
			"Damn. I really enjoy being properly punished.",
			"Disappointing. I love showing how obedient I can be.",
		]
	if(_id == "SoftSlaveryPunishGBNo"):
		return [
			"I'll decline, thank you.",
			"Not my preferred activity, thanks.",
			"I'll pass on participating.",
			"Not today, but thank you.",
			"I'd rather not be involved.",
			"Not for me, but I appreciate the offer.",
			"Not my area of interest, thanks.",
		]
	if(_id == "SoftSlaveryPunishGBNoReact"):
		return [
			"Your loss.",
			"Okay. No problem.",
			"I hear you. Okay.",
			"Mhm. We will find someone else.",
			"We will keep looking.",
		]
	if(_id == "SoftSlaveryPunishGBStart"):
		return [
			"Let the fun begin.",
			"Ready to have some fun?",
			"This is what disobedience earns you.",
			"Hope you're ready for your punishment. Don't smile.",
			"Let's see how many cocks you can take. We might not have enough, hah.",
		]
	if(_id == "SoftSlaveryPunishGBEnd"):
		return [
			"Remember this feeling every time you consider disobedience, {npc.npcSlave}.",
			"Next time you disobey, the punishment will be far less pleasant.",
			"Think about this every time you consider saying no to me.",
			"Your purpose is to serve. Don't make me reinforce this lesson again.",
		]

	if(_id == "SoftSlaveryResist"):
		return [
			"Really, {npc.npcSlave}? You think you have a say in this?",
			"Trying to resist me, {npc.npcSlave}? How adorably pathetic.",
			"So my sweet {npc.npcSlave} wants to be difficult? I enjoy breaking in stubborn pets.",
			"Is this your way of asking for a firmer hand, my dear {npc.npcSlave}?",
			"Such spirit. Let's see how long that lasts when I'm through with you.",
			"Fight all you want, {npc.npcSlave}. It just makes your submission sweeter.",
			"Your rebellion is pointless, {npc.npcSlave}. You belong to me.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtra"):
		return [
			"Hey! Can I fuck them too?",
			"Mind if I join in? Looks like fun.",
			"Can I get a turn with that nice toy?",
			"Room for one more? I'd love to use those cute holes.",
			"Think your fucktoy can handle two of us?",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraYes"):
		return [
			"Sure. Help me secure my {npc.npcSlave} properly.",
			"Yes. You can join. Let's do this.",
			"Perfect. Help me restrain {pc.him} completely.",
			"Certainly. Let's double team this brat.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraNo"):
		return [
			"No. Find someone else.",
			"No. I don't share what's mine.",
			"This {npc.npcSlave} belongs to me. Find your own plaything.",
			"Absolutely not. My {npc.npcSlave} serves only me.",
			"Find your own {npc.npcSlave}. This one answers to me.",
			"Get your own. This {npc.npcSlave} is mine to play with.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraNo2"):
		return [
			"Really? Do you think I need your permission, cutie?",
			"I wasn't requesting your opinion, softie.",
			"I don't care, dear. I want your pet.",
			"Try and stop me. It'll just make this more entertaining.",
		]
	if(_id == "SoftSlaveryFuckInStocksExtraFree"):
		return [
			"You're free, for now.",
			"Alright, that's enough for today. You can go.",
			"Get out of here. I'm done with you for now.",
			"That's all the attention you get today. Now go.",
			"Run along. We'll continue this another time.",
			"Go on, get out of here. I've had my fun.",
			"You're free to go. For now.",
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
			"That's a well-trained cutie you have there. I want to use {pc.him}.",
			"What a delicious looking piece of property. I wanna fuck {pc.him}.",
			"That softie looks like they need my attention.",
			"Your toy looks tempting. May I touch?",
			"What a pretty toy. I wanna play with {pc.him}.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferYes"):
		return [
			"You know what? Sure. Make my {npc.npcSlave} squirm for me.",
			"Fine by me. Just don't break my property completely, softie.",
			"Go on. You can use {pc.him}.",
			"You know what? Sure. Make that cutie squirm.",
			"Go ahead. {pc.He} could use some fun.",
			"Absolutely. Make sure everyone hears {pc.his} moans.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferYesThree"):
		return [
			"You know what? Sure. I will join as well.",
			"Actually, I think I'll participate too.",
			"Good idea. I could use some stress relief too.",
			"Perfect. I'll show you how to properly handle my {npc.npcSlave}.",
			"Fine, but I'm taking charge. Watch and learn how to train a {npc.npcSlave}.",
			"Yes, and I'll demonstrate the proper way to use this cute {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferNo"):
		return [
			"No. You can only watch.",
			"Nah. Find your own toy.",
			"Absolutely not. My property isn't free to use.",
			"No. You can watch.",
			"Nope. Watch, don't touch.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferNo2"):
		return [
			"Fine. Your loss, cutie.",
			"Your loss, softie.",
			"Suit yourself, cutie.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferGood"):
		return [
			"Good. Great even. Let's continue.",
			"See? You were made for this. Now let's go.",
			"Good. Now let's move.",
			"Let's continue now.",
			"Okay. Time to move.",
			"I haven't finished walking you around.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferFight"):
		return [
			"I see. You just need someone to teach you a lesson about ownership.",
			"Wrong answer. Time to show you how things work around here, softie.",
			"So that's how it is? Fine. I'll take what I want by force.",
			"Big mistake. Now I'm going to enjoy breaking both of you.",
			"You'll regret that decision. Prepare to lose your fucktoy.",
			"How cute. Time to make you regret challenging me.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferWon"):
		return [
			"You're not getting rid of me so easily, cutie.",
			"Another fool who thought they could take what's mine.",
			"Let that be a lesson for others. Nobody touches my {npc.npcSlave} but me.",
			"Another stupid asshole defeated. Let's go, my good {npc.npcSlave}.",
			"They thought they could take you? How adorable, my cute {npc.npcSlave}.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferLostWatch"):
		return [
			"You're mine now. Your cute owner can watch.",
			"I can fuck you now. Your owner gets front row seats to this show.",
			"I won. And so I will fuck you.",
		]
	if(_id == "SoftSlaveryParadeFuckOfferLostBoth"):
		return [
			"You're mine now. Actually.. I will fuck both of you.",
			"Two for the price of one. I will fuck both of you.",
			"Perfect. Two soft fucktoys for me to use.",
		]

	if(_id == "SoftSlaveryParadeGuard"):
		return [
			"Wait. Why is the inmate leashed. I need answers.",
			"Explain yourself. Now. Why {pc.isAre} {pc.he} leashed.",
			"This doesn't look right. What's going on?",
			"Hold up. I need to know what this is about.",
			"Hold it. Who gave you permission to do this?",
			"Stop right there. Explain what you're doing.",
			"Wait. Explain yourself.",
			"This looks suspicious. What are you doing?",
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
			"Carry on then. Enjoy your day.",
			"Very well. Proceed with the fun stuff.",
			"Fun. Continue with your duties.",
			"Alright then, don't let me stop you. Have fun.",
			"Have fun. Keep it moving.",
			"Right. Carry on with the fun.",
			"Sounds fun. I'll leave you to it.",
		]
	if(_id == "SoftSlaveryParadeGuardProblem"):
		return [
			"That's none of your business.",
			"Mind your own business, will you?",
			"Step aside, guard. This is private.",
			"You don't want to get involved in this.",
			"This is between me and my property.",
			"Not your problem. Walk away.",
			"I don't answer to you.",
		]
	if(_id == "SoftSlaveryParadeGuardProblem2"):
		return [
			"Really? That's cute.",
			"I see. I see. Cute.",
			"Adorable. Really. I'm so scared.",
			"Beep-beep. That was a wrong answer.",
			"Good try. Didn't work.",
		]
	if(_id == "SoftSlaveryParadeGuardWon"):
		return [
			"Now where were we? Oh right, let's go.",
			"Let that be a lesson to anyone who tries to mess with me.",
			"Come along, {npc.npcSlave}. We're not done here.",
			"Time to continue, {npc.npcSlave}.",
			"Nobody threatens my property and gets away with it.",
			"That's what happens when you threaten what's mine.",
			"Let that be a lesson to anyone who eyes my pet.",
			"Come along, {npc.npcSlave}. We have training to finish.",
		]
	if(_id == "SoftSlaveryParadeGuardLost"):
		return [
			"You can go, inmate.",
			"Consider yourself lucky. You can leave.",
			"You're free to go. Don't let me catch you like this again.",
			"Run along now. You've been given a second chance.",
			"Get moving before I change my mind.",
			"You're dismissed. Don't make me regret this.",
			"Consider this your lucky day. Now go.",
		]
