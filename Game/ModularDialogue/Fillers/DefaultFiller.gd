extends DialogueFiller

func getFormIDs() -> Array:
	return [
		"FightLostGeneric",
		"FightWonGeneric",
		"FightSurrender",
		"AttackStart",
		"AttackReact",
		
		"GuardCaughtOffLimits",
		"GuardCaughtOffLimitsFight",
		"GuardInmateSurrender",
		"GuardFrisk",
		"GuardFriskFound",
		"GuardFriskNoFound",
		"GuardGoAway",
		"GuardKeepMoving",
		"GuardFriskFailResist",
		
		"ReactBODYWRITINGS",
		"ReactTALLYMARKS",
		"ReactCOVERED_IN_CUM",
		"ReactCOVERED_IN_PISS",
		"ReactNAKED",
		"ReactCAN_GRAB_AND_FUCK",
		"ReactON_A_LEASH",
		"ReactGETTING_FUCKED",
		
		"ReactLEASHING_SOMEONE",
		"ReactFUCKING_SOMEONE",
		
		"AskKeyCanYouUnlock",
		"AskKeyDeny",
		"AskKeyGive",
		"AskKeyChallenge",
		"AskKeyChallengeUnlock",
		"AskKeyChallengeFail",
		"AskKeyChallengeRefuse",
		"AskKeyChallengeRefuseStay",
		
		"HelpRestraintsAsk",
		"HelpRestraintsAgree",
		"HelpRestraintsAltStart",
		"HelpRestraintsDeny",
		"HelpRestraintsFinished",
		"HelpRestraintsPaid",
		"HelpRestraintsRefusePay",
		"HelpRestraintsRefusePayWhatever",
		
		"SlutwallStealCredits",
		"SlutwallAddTip",
		"StocksShout",
		
		"ProstitutionStart",
		"ProstitutionOffer",
		"ProstitutionUsual",
		"ProstitutionServiceDom",
		"ProstitutionPricySlut",
		"ProstitutionDenied",
		"ProstitutionDeniedWhatever",
		"ProstitutionAccept",
		"ProstitutionDemandCreds",
		"ProstitutionRefuseReturnCreds",
		"ProstitutionScam",
		
		"PunishDecide",
		"PunishDecideStocks",
		"PunishAboutToStocks",
		"PunishLockIntoStocks",
		"PunishSex",
		"PunishSubSex",
		"PunishDecidedSlutwall",
		"PunishLockIntoSlutwall",
		
		"TalkChatWhat",
		"TalkChatCancel",
		"TalkChatLeaving",
		"TalkChatAgree",
		"TalkChatDisagree",
		"TalkChatWhatever",
		"TalkChatPickupLine",
		"TalkChatPickupLineFail",
		"TalkFlirtAccept",
		"TalkFlirtDeny",
		"TalkSexOffer",
		"TalkSexOfferAccept",
		"TalkSexOfferDeny",
		"TalkSexOfferSelf",
		"TalkSexOfferSelfAccept",
		"TalkSexOfferSelfDeny",
		"TalkGrabAndFuck",
		"TalkAboutToKidnap",
		"TalkAboutToKidnapReact",
		]

func getText(_id:String, _args:Dictionary):
	if(_id == "FightLostGeneric"):
		return [
			"[[C_UGH]].. I can't..",
			"[[C_UGH]].. you win this round..",
			"[[C_UGH]] I.. I.. fuck..",
			"[[C_UGH]], I guess you got me..",
			"[[C_UGH]].. I thought I had you..",
			"[[C_UGH]].. you really got me there..",
		]
	if(_id == "FightWonGeneric"):
		return [
			"That was[[kind= kinda]] easy.",
			"Not even a challenge.",
			"Is that all you've got?",
			"I barely broke a sweat.",
			"That was a nice warm-up.",
			"Hah, you call that a fight?",
			"You’ll have to do better than that.",
			"I didn’t even have to try.",
			"That was pathetic.",
			"That’s all you’ve got?",
			"That was barely a fight.",
			"I expected more from you.",
			"And stay down.",
		]
	if(_id == "FightSurrender"):
		return [
			"I give up! Please stop!",
			"Don’t hurt me, I surrender!",
			"I surrender! Please don’t hit me!",
			"I give up! Please don’t hurt me!",
			"Okay, I surrender! Don’t hurt me!",
			"Okay, you are stronger than me! Please don't hurt me!",
		]
	if(_id == "AttackStart"):
		return [
			"I’m about to mess you up.",
			"You’re gonna regret this.",
			"I’m going to make you bleed.",
			"I’ll break you.",
			"This is gonna hurt.",
			"I will fuck you up.",
			"I'm gonna mess you up.",
			"I'm sick of you.",
		]
	if(_id == "AttackReact"):
		var attackerID = getCharID(_args, "target")
		var reacterID = getCharID(_args, "main")
		var affection:float = GM.main.RS.getAffection(attackerID, reacterID)
		var lust:float = GM.main.RS.getLust(attackerID, reacterID)
		
		if(affection > 0.1):
			return [
				"Hey, what’s gotten into you?",
				"Why the hell are you attacking me?!",
				"What the fuck, I thought we were cool!",
				"What are you doing?",
				"Hey, back off! It’s me!",
			]
		if(affection < 0.0 && lust >= 0.9):
			return [
				"You piece of shit, come here!",
				"You’re such an asshole. I fucking love you for it.",
				"You piss me off.",
				"Damn you.",
				"You’re the worst.",
			]
		if(affection <= -0.4):
			return [
				"Bring it on, asshole!",
				"I knew you’d try something, fucker!",
				"You think you can take me?",
				"You’re gonna regret this.",
			]
		
		return [
			"Back off, you fuck!",
			"What’s your problem?!",
			"What the fuck?",
		]
	
	if(_id == "GuardCaughtOffLimits"):
		return [
			"Hey! What are you doing in there?",
			"You seem lost, inmate. This isn't a place for someone like you.",
			"You’ve wandered into the wrong area. Do I need to remind you of the rules?",
			"And just where do you think you're going? This section is restricted!",
			"You're trespassing in a restricted zone. Care to explain yourself?",
			"Sneaking around where you don’t belong? That’s a bold move, inmate.",
		]
	if(_id == "GuardCaughtOffLimitsFight"):
		return [
			"You wanna fight? Alright.",
			"I guess we are doing this the hard way.",
			"Fine, I will teach you a lesson.",
			"Okay, let's see what you got.",
			"You're only making it worse for yourself.",
		]
	if(_id == "GuardInmateSurrender"):
		return [
			"That was the right choice.",
			"Seeing sense, are we? That’s more like it.",
			"Probably the best decision you’ve made today.",
			"Wise choice to surrender. Things could have gotten a lot worse.",
			"Finally, some compliance.",
			"Surrendering already? Good, that’ll make things easier for both of us.",
			"Smart choice, inmate. Maybe you’ll learn to stay in line.",
		]
	if(_id == "GuardFrisk"):
		return [
			"Stand still and keep your hands where I can see them.",
			"Hold still, this won’t take long.",
			"Keep your feet apart and your hands behind your head.",
			"Spread your legs and don’t make any sudden moves.",
			"Place your hands against the wall and don’t move.",
			"Don’t make this difficult. Just stand still.",
			"I’m going to need to pat you down. Stay calm.",
			"Any funny business, and you’ll regret it. Stay still.",
			"You know the drill. Hands up, feet apart.",
			"Let’s make this easy. Don’t move while I search you.",
		]
	if(_id == "GuardFriskFound"):
		return [
			"Well, well, what do we have here? This is coming with me.",
			"This is contraband. I’m confiscating it.",
			"Looks like someone’s been breaking the rules. This is mine now.",
			"You know this is against the rules. Consider it gone.",
			"This isn’t allowed. I’m taking it.",
			"You’re not supposed to have this. I’ll be taking it.",
			"Found something you shouldn’t have.",
			"Contraband, eh? You’re going to lose this.",
			"What’s this? Not anymore, it’s not.",
			"You know the rules.. And so do I.",
			"Trying to sneak this past me? Not happening. It’s mine now.",
			"This is against regulations. I’m confiscating it immediately.",
			"This is prohibited. I’ll be taking it for safekeeping.",
		]
	if(_id == "GuardFriskNoFound"):
		return [
			"Looks like you’re clean this time.",
			"Alright, nothing here.",
			"Seems like you’re not hiding anything.",
			"No contraband found. Consider yourself lucky.",
			"You’re clear. Keep it that way.",
			"Nothing on you today. Stay out of trouble.",
		]
	if(_id == "GuardGoAway"):
		return [
			"Now go away, inmate.",
			"You’re on thin ice, inmate. Watch yourself.",
			"Get out of here, and don’t let me catch you sneaking around again.",
		]
	if(_id == "GuardKeepMoving"):
		return [
			"Keep moving, inmate.",
			"Move your ass.",
			"Keep walking.",
			"Don't make me yank on the leash.",
			"Step faster.",
			"Don't be lazy, inmate.",
		]
	if(_id == "GuardFriskFailResist"):
		return [
			"Ugh, I give up.",
			"Ugh, fine. You will regret this.",
			"Think you're funny? We will see..",
			"Why can't you just stand still?",
		]
	if(_id == "ReactBODYWRITINGS"):
		return [
			"Only a desperate slut would let someone scribble all over her body.",
			"Those scribbles match your reputation perfectly.",
			"Letting everyone know what you are? Smart, slut.",
			"I bet you begged for every word written on you.",
			"You wear those filthy words like a badge of honor, don’t you.",
			"Can I write some new ones?",
			"Oh wow, you're like a canvas.. a very slutty one.",
			"Are those like.. ads?",
			"You must be proud, huh.",
		]
	if(_id == "ReactTALLYMARKS"):
		return [
			"That’s one busy cunt you’ve got there, slut.",
			"Lost track of all the dicks, huh? No wonder.",
			"Is that how you count, whore?",
			"That ass looks like a scorecard. Who’s winning?",
			"Keeping count for bragging rights? What a fucking slut.",
			"So, which one of those was the best? Oh wait, you wouldn’t know.",
			"Running out of space for all those marks, huh? I bet I can squeeze in a few more.",
			"Can’t even keep track of how many times you’ve been fucked anymore?",
			"You’re just a used-up piece of meat, aren’t you?",
		]
	if(_id == "ReactCOVERED_IN_CUM"):
		return [
			"Wearing it like a slut’s perfume, aren’t you?",
			"Bathed in cum, just the way a whore should be.",
			"You’re a fucking cumrag with legs.",
			"Dripping like the slut you are. Did you even swallow any?",
			"Looks like you’ve been put to good use, cumdump.",
			"You smell like every cock on this station, slut.",
			"Fucking mess. At least you’re good for something, slut.",
			"What a disgusting cum-bucket.",
			"Excuse me, cum dumpster.",
			"Don't get close to me, you cum slut.",
		]
	if(_id == "ReactCOVERED_IN_PISS"):
		return [
			"Did you take a bath in piss, whore?",
			"Ew, that’s one filthy bitch right there.",
			"You reek of piss, you disgusting slut.",
			"So pathetic, letting someone mark you like the dog you are.",
			"How low can you get?",
			"What a piss-slut..",
			"You really let someone do that to you? What a fucking disgrace.",
			"Smells like you belong in the gutter, piss-slut.",
			"Did you even try to clean up, or do you like smelling like a toilet?",
		]
	if(_id == "ReactNAKED"):
		return [
			"Begging for attention, huh?",
			"Might as well walk around naked, whore.",
			"Showing off again? No shame at all.",
			"You want more eyes on you, slut?",
			"You’re just asking for it, aren’t you, whore?",
			"Forgot how to dress yourself, slut? Or is this on purpose?",
			"That’s some cheap advertising, whore.",
			"You’re practically begging to be fucked, showing off like that.",
		]
	if(_id == "ReactCAN_GRAB_AND_FUCK"):
		return [
			"All tied up and ready to go. Just the way a whore should be.",
			"Look at you, all helpless and waiting to be fucked.",
			"Guess you’re used to being a fucktoy, slut.",
			"So many restraints, so little resistance. Perfect.",
			"Why even bother resisting, whore? You’re just asking for it.",
			"Bound up like the slut you are, waiting to be used.",
			"Just a helpless little fuckdoll, aren’t you?",
			"Anyone could have their way with you right now, whore.",
			"Tied up and begging for it without even speaking, slut.",
			"Just another piece of fuckmeat, all wrapped up for us.",
		]
	if(_id == "ReactON_A_LEASH"):
		return [
			"Look at the pathetic whore, being dragged around like a dog.",
			"Got a new owner, slut? Can’t keep track anymore?",
			"Leashed up like the obedient whore you are.",
			"Such a good little pet, following your master’s orders.",
			"Dragged off like the bitch you are. Good riddance.",
			"You look so natural on a leash, slut.",
			"Being taken to your next client, whore?",
			"A leash suits you, slut. Reminds you of your place.",
			"Getting dragged around like the obedient cumslut you are.",
		]
	if(_id == "ReactGETTING_FUCKED"):
		return [
			"Getting your fill, slut? You love this, don’t you?",
			"That’s where you belong, whore - under someone, getting fucked.",
			"Such a good little whore, taking it in front of everyone.",
			"Fucking in public? Guess you don’t care who watches.",
			"Nice, a free show! Keep fucking her like the slut she is.",
			"That’s it, slut. Let everyone see what a whore you are.",
			"Such a desperate whore, getting fucked out in public.",
			"Not even trying to hide it? What a shameless slut.",
			"Bet you get off on all these eyes watching, slut.",
			"Getting fucked out here like the public toy you are.",
			"No shame at all, just a whore who craves attention.",
			"Nothing like a slut who loves an audience.",
			"Everyone can see how much of a whore you are.",
			"You just can't get enough, can you, slut?",
			"Bet you’d let anyone take a turn, wouldn’t you?",
			"Enjoying yourself, slut? Don’t stop now.",
			"You’re just a free-use slut for everyone to enjoy.",
			"Bet you’re loving all the attention, you filthy whore.",
		]
	if(_id == "ReactLEASHING_SOMEONE"):
		return [
			"Got yourself a pet slut, huh? How cute.",
			"Look at you, parading that bitch around like she’s yours.",
			"Taking your little whore for a walk? How sweet.",
			"So, who's on the leash today?",
			"What a sight..",
			"Dragging your slut around like a trophy.",
			"Impressive catch.",
			"Oh wow, what a tight grip..",
			"Leashes are nice..",
			"That’s how you handle a worthless whore.",
			"Look at you, leading that bitch around like the good pet they are.",
			"That leash suits them.",
			"Looks like you’ve tamed that little slut well.",
		]
	if(_id == "ReactFUCKING_SOMEONE"):
		return [
			"Oh wow, what a slut.",
			"Taking it like a good little slut.",
			"Nice, a free show!",
			"Yeah, fuck that slut!",
			"Can I be next? No?.. Aw.",
			"Oops, I shouldn't be here.",
			"Wow, lewd..",
			"Impressive..",
			"Show me some good action!",
		]
	if(_id == "AskKeyCanYouUnlock"):
		return [
			"Think you could let me out of these?",
			"Can you unlock me already? Been long enough.",
			"Hey, mind freeing me from this? I can't take it off myself.",
			"Unlock me, would you?",
			"Can you get these off? Why did you even lock it on me.",
			"Let me out of these, okay? Enough is enough.",
			"I need you to unlock me. Right now.",
			"Any chance you could unlock me?",
			"Can you take these off, please?",
			"Do you think you could unlock me?",
		]
	if(_id == "AskKeyDeny"):
		return [
			"Not right now.",
			"Maybe later, slut.",
			"You'll have to wait.",
			"Not happening.",
			"I'm busy.",
			"You'll stay locked for now.",
			"Not yet, whore.",
			"You'll just have to wait.",
			"Later, maybe.",
		]
	if(_id == "AskKeyGive"):
		return [
			"Fine, I’ll unlock you.",
			"Alright, let’s get those off.",
			"Okay, I'll unlock you.",
			"I guess you’ve earned it.",
			"Sure, I’ll unlock you.",
			"Let’s get you out of those.",
			"Alright, hold still.",
			"Fine, you can be unlocked.",
		]
	if(_id == "AskKeyChallenge"):
		return [
			"Sure, but you’ve gotta earn it. Bend over.",
			"Only if you can take it like a good little whore.",
			"I’ll unlock you after you give me what I want.",
			"How about I fuck you first, then we'll see?",
			"You'll have to beg and take it like a slut first.",
			"Maybe if you please me, slut.",
			"Let’s see if you’re worth unlocking after I use you.",
			"I’ll unlock you after I’m done fucking you.",
			"Prove you're a good fucktoy, and I’ll unlock you.",
			"Take it like a good bitch, and I might unlock you.",
		]
	if(_id == "AskKeyChallengeUnlock"):
		return [
			"That was good. You’ve earned it.",
			"Well done, slut. Here’s your key.",
			"Good slut, you can be unlocked.",
			"You did well. Time to unlock you.",
			"That was fun. You can go free.",
			"You’ve earned this key, slut.",
			"Good job, whore. You’re free.",
		]
	if(_id == "AskKeyChallengeFail"):
		return [
			"That was pathetic. Stay locked, whore.",
			"You call that a performance? You stay locked.",
			"That was disappointing. You're not getting free.",
			"You didn’t earn it. Stay locked.",
			"You suck, slut. You’re staying locked.",
			"You’ve failed, so you stay locked.",
			"That was awful. No key for you.",
			"You didn’t please me. Stay locked.",
		]
	if(_id == "AskKeyChallengeRefuse"):
		return [
			"No way.",
			"I’m not doing that.",
			"Absolutely not.",
			"No chance.",
			"Forget it.",
			"I won’t.",
			"Not gonna happen.",
			"I refuse.",
			"No.",
		]
	if(_id == "AskKeyChallengeRefuseStay"):
		return [
			"Fine, stay locked like the slut you are.",
			"Then you can stay locked, bitch.",
			"Stay locked then, whore.",
			"Your choice, slut. Stay locked.",
			"Suit yourself. You’re staying locked.",
			"Stay in those restraints, slut.",
			"Have it your way, you’re staying locked.",
			"If that’s your choice, stay locked.",
			"Whatever, you stay locked.",
		]
	if(_id == "HelpRestraintsAsk"):
		return [
			"Can you help me out of these?",
			"Mind helping me with these restraints?",
			"I could use some help with these, please.",
			"Can you assist me with my gear?",
			"Would you help me get out of these?",
			"Do you think you could help me with these?",
		]
	if(_id == "HelpRestraintsAgree"):
		return [
			"Sure thing, let’s see what I can do.",
			"Alright, let me help you out.",
			"Poor thing. Sure, I’ll give it a shot.",
			"Okay, let's take care of that.",
			"Alright, I’ll help you out.",
			"Sure, I can try.",
		]
	if(_id == "HelpRestraintsAltStart"):
		return [
			"Hey there, let me help you with those. Hold still.",
			"Let me help you with your gear.",
			"I want to help you with those. Hold tight.",
			"I’ll help with those. Don’t move.",
			"I’m going to help you out with those. Hang on.",
		]
	if(_id == "HelpRestraintsDeny"):
		return [
			"No can do, you’re staying locked up.",
			"Nah. You’re staying in those.",
			"Nope, you’ll have to stay restrained.",
			"I’m not helping you out of those. It's your problem.",
			"Not happening. You stay locked, slut.",
		]
	if(_id == "HelpRestraintsFinished"):
		return [
			"That’s all I can do for you.",
			"That’s as much as I can help.",
			"We’re done here.",
			"That’s all I’ve got for you.",
			"That’s all I can manage.",
		]
	if(_id == "HelpRestraintsPaid"):
		return [
			"Good enough. I’m out.",
			"Alright, that’ll do.",
			"That’s it. I’m heading out now.",
			"That’ll do. I’m leaving.",
			"Okay, that’s enough.",
			"That’ll suffice. I’m out of here.",
			"We’re done. I’m heading off.",
		]
	if(_id == "HelpRestraintsRefusePay"):
		return [
			"I’m not paying for that! You barely did anything.",
			"No way I’m paying for that. You hardly helped.",
			"I’m not paying! That wasn’t worth it.",
			"I refuse to pay. You didn’t do much.",
			"No payment for you. That was nothing.",
			"I’m not paying for that.",
			"Forget it. I’m not paying for that.",
			"You didn’t do enough for payment.",
			"I’m not giving you anything for that.",
			"You don’t get paid for that little bit.",
		]
	if(_id == "HelpRestraintsRefusePayWhatever"):
		return [
			"Fine, whatever.",
			"Alright, fuck you then.",
			"Whatever, it’s not worth arguing.",
			"Whatever, have it your way.",
			"Okay, whatever, I don’t care.",
		]
	if(_id == "SlutwallStealCredits"):
		return [
			"You don’t deserve these credits, [[SLUT]].",
			"These are wasted on you, [[SLUT]].",
			"You’re not worth this. I’ll take it.",
			"Credits for a slut? I don’t think so.",
			"These are better off with me, [[SLUT]].",
			"A [[SLUT]] like you doesn’t need these.",
			"I’ll take these. You don’t deserve them.",
			"These are better spent elsewhere, [[SLUT]].",
			"Not like you’ll miss these, [[SLUT]].",
		]
	if(_id == "SlutwallAddTip"):
		return [
			"Here’s something for being a good slut.",
			"That’s for being a good little whore.",
			"You earned this, fucktoy.",
			"That’s for being such a good slut.",
		]
	if(_id == "StocksShout"):
		return [
			"Anyone around? I could use some help!",
			"Over here! A little help, please!",
			"Can anybody help me out?",
			"Anyone? I could use some assistance!",
			"Help! Is anyone out there?",
			"Can someone get me out of this?",
			"Hey! I’m stuck here! Help!",
			"I need some help! Anyone?",
		]
	if(_id == "ProstitutionStart"):
		return [
			"Looking for a good time?",
			"How about some fun, sweetie?",
			"Want to have some real fun?",
			"Need some company tonight?",
			"Looking to blow off some steam?",
			"Wanna play with me?",
			"How about a little pleasure?",
			"Looking for a hot time?",
			"Want a night to remember?",
			"Care for a good time, darling?",
		]
	if(_id == "ProstitutionOffer"):
		return [
			"What do you have in mind?",
			"What's on the menu?",
			"What are you offering?",
			"What can I get for my credits?",
			"So, what’s the deal?",
			"What’s on offer?",
			"What do you have for me?",
			"What’s your pitch?",
			"What are you selling?",
			"What's on the table?",
		]
	if(_id == "ProstitutionUsual"):
		var creds = str(getVar(_args, "credits", 0))
		return [
			"Just the usual. You get to fuck me for "+creds+" credits.",
			"Just the usual, "+creds+" credits.",
			"Nothing special, you can fuck me for "+creds+" credits.",
		]
	if(_id == "ProstitutionServiceDom"):
		var creds = str(getVar(_args, "credits", 0))
		return [
			"I’ll take control and make you beg, just "+creds+" credits.",
			"Let me dominate you, only "+creds+" credits.",
			"I’ll be in charge, "+creds+" credits.",
			"I’ll make you submit, "+creds+" credits.",
			"You want me to take control? "+creds+" credits.",
			"I’ll take the lead, "+creds+" credits.",
			"Let me show you how it’s done, "+creds+" credits.",
		]
	if(_id == "ProstitutionPricySlut"):
		var creds = str(getVar(_args, "credits", 0))
		return [
			"I’m worth every credit, just "+creds+" credits and I'm yours.",
			"I’m pricey, but you’ll love it, "+creds+" credits.",
			"I’m expensive, but I’m the best, "+creds+" credits.",
			"Quality comes at a price, "+creds+" credits.",
			"You’ll get your money’s worth, "+creds+" credits.",
			"I cost more, but you’ll see why, "+creds+" credits.",
			"It’s not cheap, but it’s worth it, "+creds+" credits.",
			"I’m the best you’ll get, "+creds+" credits.",
		]
	if(_id == "ProstitutionDenied"):
		return [
			"Not interested.",
			"I’ll pass.",
			"No thanks.",
			"Not today.",
			"I’m good.",
			"Nope.",
			"Maybe another time.",
			"I’m not feeling it.",
			"I’m gonna pass.",
		]
	if(_id == "ProstitutionDeniedWhatever"):
		return [
			"Whatever, your loss.",
			"Suit yourself, loser.",
			"Your choice, not mine.",
			"Whatever, I don’t care.",
			"Fine, keep walking.",
			"Whatever, I’m too good for you anyway.",
			"Your loss, honey.",
			"Fine, someone else will appreciate this.",
		]
	if(_id == "ProstitutionAccept"):
		return [
			"Alright, let’s do this.",
			"Let’s see what you’ve got.",
			"Alright, show me what you can do.",
			"Okay, let’s get started.",
			"Sure, let’s see how good you are.",
		]
	if(_id == "ProstitutionDemandCreds"):
		return [
			"That was weak. Give me my credits back.",
			"You call that service? I want my money back.",
			"That wasn’t worth it. Hand over the credits.",
			"I’m not satisfied. Give me my credits back.",
			"That was disappointing. I want a refund.",
			"You didn’t deliver. Credits, now.",
			"I’m not happy with that. Pay up.",
			"That sucked. Give me my credits back.",
			"I want a refund. That was bad.",
			"That wasn’t worth the price. I want my credits back.",
		]
	if(_id == "ProstitutionRefuseReturnCreds"):
		return [
			"Not a chance. Now get lost!",
			"No way, I earned that. Get out of here!",
			"Not happening. You got what you paid for.",
			"Forget it! You’re not getting a refund.",
			"No refunds. Beat it!",
			"I’m keeping it. Now scram!",
			"Not giving anything back. Get lost!",
			"You wish! Now fuck off!",
			"No way I’m giving it back. Get out!",
			"Forget it. That credits are mine!",
		]
	if(_id == "ProstitutionScam"):
		return [
			"Actually, the price just went up. 5 more credits.",
			"You know what, I need more. 5 more credits.",
			"Price increase. 5 more credits, please.",
			"I’m raising the price. 5 more credits.",
			"You’ll have to pay more. 5 more credits.",
			"I’ve decided I’m worth more. 5 extra credits.",
			"Price hike. 5 more credits, now.",
			"Actually, I’m charging more. 5 extra credits.",
			"On second thought, it’s more. 5 more credits.",
			"I’m upping the price. 5 more credits.",
		]
	if(_id == "PunishDecide"):
		return [
			"What should I do with a slut like you..",
			"Time to decide how to deal with you..",
			"Hmm... what should I do with you..",
			"Let’s figure out how to handle you.",
		]
	if(_id == "PunishDecideStocks"):
		return [
			"Stocks will put you in your place.",
			"Let’s see how you like the stocks.",
			"Stocks are perfect for a slut like you.",
			"The stocks will do just fine.",
			"I think the stocks are fitting.",
		]
	if(_id == "PunishAboutToStocks"):
		return [
			"Bend over, it’s time.",
			"Get ready, slut.",
			"Assume the position.",
			"Time to bend over.",
			"Bend over, now.",
		]
	if(_id == "PunishLockIntoStocks"):
		return [
			"Locked and ready.",
			"All locked up.",
			"Enjoy your time here.",
			"You’re not going anywhere.",
			"Locked in and ready for use.",
			"Have a nice time.",
		]
	if(_id == "PunishSex"):
		return [
			"I’m going to enjoy this.",
			"You’re mine now.",
			"Let’s have some fun.",
			"This is going to be good.",
			"Let’s see what you’ve got.",
			"Time to play.",
		]
	if(_id == "PunishSubSex"):
		return [
			"I changed my mind. I’m yours to use..",
			"I changed my mind. Do what you want with me..",
			"You know what.. You can take control.",
			"You know what.. You can take control this time.",
			"Fuck it, I’ll be your plaything.",
			"Fuck it, you can do anything you like.",
			"Fuck it, you can fuck me if you want.",
			"Whatever, I don't feel like dominating..",
		]
	if(_id == "PunishDecidedSlutwall"):
		return [
			"Your ass will look good in a slutwall.",
			"You’ll look good in a slutwall.",
			"The slutwall is perfect for you.",
			"I want to see you used in the slutwall.",
			"I want to see you used in the slutwall.",
			"I want to see your ass used in the slutwall.",
			"You’ll fit perfectly in the slutwall. Your ass will.",
			"The slutwall will be your new home.",
		]
	if(_id == "PunishLockIntoSlutwall"):
		return [
			"Time to get comfortable.",
			"Enjoy your new position.",
			"All set, slut.",
			"Locked in and ready for use.",
			"Have fun, whore.",
			"You’re all set for them.",
		]
	if(_id == "TalkChatWhat"):
		return [
			"What's on your mind?",
			"What do you wanna talk about?",
			"Huh? What's up?",
			"Got something to say?",
			"What do you wanna chat about?",
			"What’s up? Spill it.",
		]
	if(_id == "TalkChatCancel"):
		return [
			"Never mind, forget it.",
			"Actually, forget it.",
			"You know what, never mind.",
			"Changed my mind, not worth it.",
			"Eh, whatever. I don’t wanna chat anymore.",
			"On second thought, never mind.",
			"Forget I said anything.",
		]
	if(_id == "TalkChatLeaving"):
		return [
			"Fine, I’m out.",
			"Whatever, I’m leaving.",
			"I’m done here. See ya.",
			"Screw this, I’m out.",
			"I’m outta here.",
		]
	if(_id == "TalkChatAgree"):
		return [
			"Yeah, I agree.",
			"Totally.",
			"Right, I agree.",
			"You’re right.",
			"Agreed.",
			"Absolutely.",
			"I’m with you on that.",
			"Yep, I agree.",
			"Couldn’t agree more.",
			"I’m on the same page.",
		]
	if(_id == "TalkChatDisagree"):
		return [
			"Nah, I don’t agree. Fuck you.",
			"I disagree. Go fuck yourself.",
			"Nope, you’re wrong.",
			"Nope, you’re wrong. Very wrong.",
			"Not at all, fuck that.",
			"You’re full of shit.",
			"I disagree, fuck off.",
			"Fuck that, I don’t agree.",
			"You’re wrong, end of story.",
		]
	if(_id == "TalkChatWhatever"):
		return [
			"Whatever, I don’t care.",
			"It’s whatever, honestly.",
			"Eh, doesn’t matter to me.",
			"Whatever, I’m over it.",
			"Meh, whatever.",
			"I’m indifferent, whatever.",
			"Whatever, doesn’t bother me.",
			"It’s all the same to me.",
			"Whatever, who cares.",
		]
	if(_id == "TalkChatPickupLine"):
		return [
			"You must be out of stamina, because you’ve been running through my mind all day.",
			"Do you have a map? I keep getting lost in your eyes.",
			"You make me feel like trash. Maybe you should pick me up.",
			"Are you a donut? Because you look like a snack with a hole.",
			"If beauty were a crime, you’d be serving a life sentence.",
			"Are you a thief? Because you just stole my heart.",
			"Are you a guard? Because you’ve caught my attention.",
			"Are you a cell door? Because you’re always on my mind, and I can’t wait to be behind you.",
			"Are you serving time for stealing hearts? Because you’ve definitely stolen mine.",
			"Are you a magician? Because whenever I look at you, everyone else disappears",
			"If you were an elevator, what button would I have to push to make you go down?",
			"I think we've met before. Actually, never mind — I think it was just in my dreams.",
			"Would you mind giving me a pinch? You're so cute, I must be dreaming.",
			"No pen, no paper but you still draw my attention.",
		]
	if(_id == "TalkChatPickupLineFail"):
		return [
			"That was awful!",
			"Seriously? That’s your best?",
			"That was terrible!",
			"Wow, that was bad.",
			"That was so lame!",
			"You’ve gotta do better than that.",
			"That was painful.",
			"I think I need to go to the medical. That was painful.",
			"Yikes, that was bad.",
		]
	if(_id == "TalkFlirtAccept"):
		return [
			"You’ve got something special.",
			"You’re not so bad yourself.",
			"You’re cute.",
			"You’re pretty charming.",
			"You’re definitely my type.",
			"I'm liking this actually.",
		]
	if(_id == "TalkFlirtDeny"):
		return [
			"Not my type.",
			"I’m not really feeling it.",
			"Sorry, not interested.",
		]
	if(_id == "TalkSexOffer"):
		return [
			"Let’s have some fun, right now.",
			"How about we get dirty?",
			"I wanna fuck, right now.",
			"Let’s fuck, no time to waste.",
			"How about we skip the talk and fuck?",
			"Wanna get fucked right here?",
		]
	if(_id == "TalkSexOfferAccept"):
		return [
			"I’m down, let’s do it.",
			"Hell yes.",
			"Sure thing, you can fuck me.",
			"I’m down for that.",
			"You know what.. I’m down for that.",
		]
	if(_id == "TalkSexOfferDeny"):
		return [
			"I’d rather not.",
			"I’m good, thanks.",
			"I’ll pass, thanks.",
			"I’m gonna pass on that.",
		]
	if(_id == "TalkSexOfferSelf"):
		return [
			"Wanna take me right now?",
			"How about you fuck me? Right here, right now.",
			"I’m all yours if you want.",
			"Wanna fuck me?",
			"Take me, right now.",
			"How about you fuck me good?",
			"You can fuck me if you want.",
			"Wanna have some fun with me?",
		]
	if(_id == "TalkSexOfferSelfAccept"):
		return [
			"You bet, I’ll fuck you real good.",
			"You’re getting fucked right now.",
			"I’ll fuck you real good.",
			"Sure, I can fuck you.",
		]
	if(_id == "TalkSexOfferSelfDeny"):
		return [
			"I’d rather not right now.",
			"I’m gonna pass on that.",
			"I’m not up for it.",
			"I’m good, thanks.",
		]
	if(_id == "TalkGrabAndFuck"):
		return [
			"Who do we have here.. What a slut..",
			"You’re not going anywhere until I’m finished with you.",
			"Stay put, I’m gonna fuck you hard.",
			"I’m gonna have my way with you, slut.",
			"You’re staying right here until I’m satisfied.",
			"Can't resist, huh? What a shame.",
			"What? Your restraints prevent you from escaping? What a poor little fucktoy.",
			"You’re not going anywhere, slut.",
		]
	if(_id == "TalkAboutToKidnap"):
		return [
			"You belong to me now. Understand?",
			"You’re mine now, understand?",
			"You’re mine now, got it?",
			"I own you now, you understand?",
			"You belong to me from now on. Understand?",
			"I’m taking you with me, got it?",
		]
	if(_id == "TalkAboutToKidnapReact"):
		return [
			"O-Okay..",
			"Y-Yes.. w-whatever you say..",
			"F-fine.. O-okay..",
			"A-Alright.. I u-understand..",
		]
