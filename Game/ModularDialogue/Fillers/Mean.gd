extends DialogueFiller

func _init():
	priority = 12

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

func canBeUsed(_id:String, _args:Dictionary, _form) -> bool:
	var guard = getChar(_args, _form.mainRole)
	var personality:Personality = guard.getPersonality()
	var meanness = personality.getStat(PersonalityStat.Mean)
	#var subby = personality.getStat(PersonalityStat.Subby)
	
	if(meanness < 0.4):
		return false
	
	return true

func getText(_id:String, _args:Dictionary):
	if(_id == "FightLostGeneric"):
		return [
			"[[C_UGH]].. you got lucky, fucker..",
			"[[C_UGH]].. fine, you win.. for now.",
			"[[C_UGH]].. fuck.. you better hope we don’t meet again..",
			"[[C_UGH]].. you got me.. this time..",
			"[[C_UGH]].. shit.. I’ll get you back, slut..",
			"[[C_UGH]].. enjoy it while it lasts, bitch..",
		]
	if(_id == "FightWonGeneric"):
		return [
			"Pathetic. I barely tried.",
			"Not even worth my fucking time.",
			"Is that the best you’ve got, bitch?",
			"I barely had to lift a finger. You’re weak.",
			"That was a fucking joke.",
			"Hah! You call that a fight? You’re nothing.",
			"You’ll have to try harder, slut.",
			"I didn’t even break a sweat. Pathetic.",
			"That was fucking embarrassing.",
			"You’re just a fucking toy for me.",
			"You really thought you stood a chance? Laughable.",
			"Is that all you can do, you weak fuck?",
			"Stay down, and maybe I’ll go easy on you next time.",
		]
	if(_id == "FightSurrender"):
		return [
			"Fucking pathetic, I ain't fighting you. Fuck you.",
			"You piece of shit, I'm not gonna give you the pleasure of beating me up.",
			"Fuck you. Fuck you for doing this.",
			"What? Really? You know, fuck you, I ain't doing this.",
		]
	if(_id == "AttackStart"):
		return [
			"I’m going to make you bleed, fucktoy.",
			"You’re nothing but fuck meat, slut.",
			"I’m gonna break you in half, you worthless whore.",
			"You're gonna regret crossing me, bitch.",
			"I’m about to turn you into a fucking mess.",
			"Get ready, because I’m gonna wreck you.",
			"I’ll make you beg for me to stop, and I won’t.",
			"Hope you like pain, because that’s all you're getting from me.",
		]
	if(_id == "AttackReact"):
		var attackerID = getCharID(_args, "target")
		var reacterID = getCharID(_args, "main")
		var affection:float = GM.main.RS.getAffection(attackerID, reacterID)
		var lust:float = GM.main.RS.getLust(attackerID, reacterID)

		if(affection > 0.1):
			return [
				"Why the fuck are you attacking me, huh?",
				"You really wanna go, asshole?",
				"What the fuck, I thought we were something.",
				"Seriously? What the fuck are you doing?",
				"I can’t believe you’d pull this shit on me.",
			]
		if(affection < 0.0 && lust >= 0.9):
			return [
				"You filthy fucker, come here and finish this!",
				"You’re a piece of shit, and I fucking love it.",
				"You piss me off, sweetheart, I hate you so much.",
				"Damn you. Go ahead and fuck me up, cutie.",
				"Fucking asshole. If you're gonna wreck me, you better not stop half-way.",
			]
		if(affection <= -0.4):
			return [
				"Bring it on, you worthless fuck!",
				"I fucking knew you'd try something, you coward!",
				"You think you’re tough, bitch? Let’s go.",
				"I’m going to enjoy wrecking you, slut.",
			]

		return [
			"Back the fuck off, you waste of space!",
			"What’s your fucking problem, huh?!",
			"Touch me and I’ll break you, slut.",
		]
	
	if(_id == "GuardCaughtOffLimits"):
		return [
			"What’s a filthy [[SLUT]] like you doing sneaking around here?",
			"Look what we have here – a sneaky little [[SLUT]] thinking she can go wherever she wants.",
			"You think you’re clever, [[SLUT]]? This area’s off-limits to sluts like you.",
			"Another day, another [[SLUT]] trying to step out of line.",
			"Did you lose your way, you dumb [[SLUT]]? This is no place for a little bitch like you.",
			"What’s a little [[SLUT]] like you doing in a place like this? Trying to get some attention?",
			"I see we have a nosy little [[SLUT]] here, trying to see what she’s not supposed to.",
			"Did you think I wouldn’t catch you, you useless piece of trash?",
			"How stupid can you be? This area is off-limits, and you’re too dumb to know that?",
			"You’ve got to be the dumbest inmate here. Trespassing? Really?",
			"Lost, little [[SLUT]]? Or just looking to get into trouble?",
			"Caught you red-handed, [[SLUT]]. This area’s off-limits, you know.",
			"Trying to get fucked in a restricted zone, huh?",
			"Sluts like you don’t belong here. You wanna get punished, don’t you?",
			"Sneaking around, huh? I bet you were hoping someone would catch you.",
			"Do I need to fuck some sense into you, [[SLUT]]?",
			"Got a thing for breaking rules, [[SLUT]]?",
		]
	if(_id == "GuardCaughtOffLimitsFight"):
		return [
			"You’re in deep trouble now, you [[SLUT]]. I’m going to make you regret this.",
			"I’ve got a special punishment lined up for [[SLUTS]] like you who can’t follow simple rules.",
			"You should have crawled back to your cell while you could have.",
			"I’m sick of dealing with pests like you. Time to put you back in your place.",
			"You’re just a dumb prisoner who doesn’t know {inmate.his} place. I’ll teach you a lesson.",
			"You’re in for a world of pain, you stupid little [[SLUT]].",
			"You’re not just lost, you’re a complete waste of space, and I’m here to correct that.",
		]
	if(_id == "GuardInmateSurrender"):
		return [
			"Smart move, slut.",
			"That’s right, you know your place.",
			"Good little slut. Now stay down where you belong.",
			"Finally seeing sense, huh? On your knees like a good [[SLUT]].",
			"About time you surrendered, [[SLUT]].",
			"Giving up already? You really are a weak little whore.",
			"Huh. Finally a good decision from a bad bitch.",
			"Smart decision, slut. Things are about to get rough.",
			"You made the right choice, [[SLUT]].",
			"Knew you'd fold. Sluts like you always do.",
		]
	if(_id == "GuardFrisk"):
		return [
			"Stand still, [[SLUT]], or I’ll make you.",
			"Hands where I can see them, or I’ll pin you down myself.",
			"Spread those legs, slut. You know the drill.",
			"Up against the wall, you filthy [[SLUT]].",
			"Don't try to resist, [[SLUT]]. We both know you want this.",
			"I’ll enjoy feeling you up. Now hold still.",
			"Make one move, and I’ll fuck the defiance out of you.",
			"Stay still, slut, or this is going to get ugly.",
			"You know you like it when I search you. Now don’t move.",
		]
	if(_id == "GuardFriskFound"):
		return [
			"Well, well, what do we have here? Nothing, in fact. You never had this, you [[SLUT]].",
			"Looks like someone’s been naughty. This is mine now, slut.",
			"This is contraband, and you know what that means, slut.",
			"You knew this wasn’t allowed, didn’t you, [[SLUT]]? Guess now it's mine.",
			"I’m taking this, slut. Maybe I’ll punish you while I’m at it.",
			"You’ve got some nerve. I’m gonna enjoy taking this from you.",
			"Trying to sneak this past me? Not happening, [[SLUT]].",
		]
	if(_id == "GuardFriskNoFound"):
		return [
			"Looks like you’re clean, for now, [[SLUT]].",
			"Guess you weren’t stupid enough to hide anything today. Lucky you.",
			"Surprising. No contraband? Maybe you’re not as dumb as you look.",
			"You’re clean this time. But I’ll be watching you, [[SLUT]].",
			"Nothing today, huh? Guess you want to keep that tight little ass out of trouble.",
			"Clean today, but you’re not fooling me, [[SLUT]].",
		]
	if(_id == "GuardGoAway"):
		return [
			"Now get lost, [[SLUT]].",
			"Run along, [[SLUT]], before I make you regret sneaking around.",
			"You’re on thin ice, [[SLUT]]. Don’t let me catch you again.",
		]
	if(_id == "GuardKeepMoving"):
		return [
			"Keep moving, slut, unless you want me to put you on your knees.",
			"Get moving, or I’ll give you something to run from, [[SLUT]].",
			"Move your ass, [[SLUT]]. You’re not here to stand around.",
			"Don’t make me drag you by the hair, [[SLUT]].",
			"Step faster, slut, or you’ll regret it.",
			"I don’t have time for lazy whores like you. Move.",
		]
	if(_id == "GuardFriskFailResist"):
		return [
			"Ugh, fine. You’ll regret that, [[SLUT]].",
			"Think you’re funny, [[SLUT]]? You’re gonna get what’s coming.",
			"Can’t even stand still, can you? Pathetic.",
			"Why can’t you just behave? Guess I’ll have to break you.",
		]
	if(_id == "ReactBODYWRITINGS"):
		return [
			"Only a filthy slut would let someone scrawl filth all over her.",
			"Those degrading scribbles suit you perfectly, cumdump.",
			"Advertising what a fucking whore you are? Smart move, slut.",
			"Bet you begged like the desperate slut you are for every dirty word on your skin.",
			"You wear those filthy insults with pride, don’t you, you shameless little whore.",
			"Let me add some more—there’s plenty of room left, slut.",
			"Your body’s just a billboard for how fucking used up you are.",
			"Are those ads for your free-use holes? Pathetic.",
			"Bet you love showing off those slutty scribbles, don’t you?",
		]
	if(_id == "ReactTALLYMARKS"):
		return [
			"That’s a well-fucked ass you’ve got there, slut. Keeping score?",
			"Lost count of all the dicks, haven’t you? No surprise, you filthy whore.",
			"So that’s how you count your holes getting stretched out, slut?",
			"Your body looks like a fucktoy scoreboard. Who’s winning?",
			"Collecting trophies, are we? What a shameless little cum dumpster.",
			"Which one was the best, slut? Oh wait, you’re too fucked out to remember.",
			"Running out of space for all those dicks, huh? Let me add a few more for you.",
			"Can’t even keep track of how many cocks you’ve taken? What a fucking disgrace.",
			"Your body’s just a public-use mess now, isn’t it, slut?",
		]
	if(_id == "ReactCOVERED_IN_CUM"):
		return [
			"Wearing cum like the desperate cumrag you are. Perfect, slut.",
			"Drenched in cum, just how a filthy whore should be.",
			"Look at you, nothing but a two-legged cumdump.",
			"Covered in cum, but I bet you didn’t swallow a drop, did you, slut?",
			"All that cum? Guess they put your holes to good use, cumdump.",
			"You stink of every cock on the block, you fucking whore.",
			"You’re such a mess, but at least you’re useful for once, slut.",
			"Just a cum-bucket, aren’t you? Good for nothing else.",
			"Pathetic cum dumpster, that’s all you’ll ever be.",
			"Keep your distance, slut. You reek of cum and desperation.",
		]
	if(_id == "ReactCOVERED_IN_PISS"):
		return [
			"Did you beg to get pissed on, slut? How fucking low can you go?",
			"You filthy bitch, bathed in piss like the worthless whore you are.",
			"Stinking of piss? You really are the bottom of the barrel, aren’t you?",
			"Letting someone mark you like a pathetic animal. What a disgrace, slut.",
			"You’re nothing but a piss-soaked toy now, whore.",
			"What a piss-slut. You’ve really outdone yourself this time.",
			"You actually let someone do that to you? Fucking pathetic, slut.",
			"You smell like you belong in the gutter, piss-slut.",
			"Did you even bother cleaning up, or do you like smelling like a used toilet?",
		]
	if(_id == "ReactNAKED"):
		return [
			"Showing off that slutty body for everyone to see, huh?",
			"You might as well be naked all the time, whore. You’re just asking for it.",
			"Flaunting yourself again? You’ve got no shame, do you, slut?",
			"You want all eyes on you, don’t you, filthy whore?",
			"Parading around like a bitch in heat. You’re practically begging for cock, slut.",
			"Can’t even dress yourself anymore, huh? What a fucking tease.",
			"Advertising that used-up body, hoping someone takes a bite? Pathetic.",
			"You’re practically screaming 'fuck me' with the way you’re showing off, slut.",
		]
	if(_id == "ReactCAN_GRAB_AND_FUCK"):
		return [
			"All trussed up and ready to be used like the fucktoy you are.",
			"Helpless, tied up, and just waiting to be fucked like a proper whore.",
			"Bet you’re used to being a useless little fucktoy, huh, slut?",
			"All those restraints and you can’t even fight back. What a perfect little fuckdoll.",
			"Why even bother resisting, slut? You’re here to be used.",
			"All bound up, just waiting for someone to use you like the slut you are.",
			"You’re just a helpless piece of fuckmeat now, aren’t you?",
			"Anyone could take you right now, whore. You’re nothing but free-use trash.",
			"Tied up and silently begging for cock. What a pathetic sight.",
			"Just another useless slut, waiting to be stuffed and fucked.",
		]
	if(_id == "ReactON_A_LEASH"):
		return [
			"Look at this pathetic bitch, being led around like the dumb whore she is.",
			"Got yourself a new owner, slut? Lost count of them yet?",
			"Leashed up like the obedient slave you are. How fitting.",
			"Such a good little pet, doing everything your master tells you.",
			"Dragged around like the worthless slave you are. Perfect.",
			"You look so natural on a leash, like the slutty pet you’ve always been.",
			"Being taken off to get fucked, slut? That’s all you’re good for.",
			"A leash really suits you, slave. Reminds you of your place.",
			"Getting dragged around like the pathetic slave you are.",
		]
	if(_id == "ReactGETTING_FUCKED"):
		return [
			"Getting railed like the slut you are. You fucking love this, don’t you?",
			"That’s exactly where a whore like you belongs—getting fucked in front of everyone.",
			"Such a good little slut, taking cock in public for all to see.",
			"Fucking in the open? No shame, just a dirty whore begging for it.",
			"Nice, a free show! Pound that slut until she’s nothing but a drooling mess.",
			"That’s it, slut, let everyone see what a filthy fucktoy you really are.",
			"Public-use whore, taking cock wherever you can get it. Disgusting.",
			"Not even trying to hide how much of a slut you are, huh? Shameless.",
			"Bet you love all these eyes watching you get used like a whore.",
			"Getting fucked like the public toy you’ve always been. Pathetic.",
			"Everyone knows now—you’re nothing but a shameless cock-hungry whore.",
			"Love getting fucked in public, don’t you, slut? Everyone can see how desperate you are.",
			"You can’t get enough cock, can you, slut? Just another hole to fill.",
			"Bet you’d let anyone here take a turn, wouldn’t you? Filthy whore.",
			"Getting fucked for all to see? You really are a slut, aren’t you?",
			"Enjoying yourself, whore? Keep it up. You’re not done yet.",
			"Just another free-use slut, spreading her legs for anyone who’ll take her.",
			"Bet you’re loving all the attention, you disgusting little cumdump.",
		]
	if(_id == "ReactLEASHING_SOMEONE"):
		return [
			"Got yourself a little pet slut, huh? What a cute little bitch.",
			"Look at you, dragging that whore around like she belongs to you.",
			"Taking your slut for a walk? Make sure she doesn’t run off to get fucked.",
			"Who’s the pathetic whore on the leash today? Lucky them.",
			"Nice leash. Really showing off who’s in control here, huh?",
			"Dragging your slut around like she’s your prized fucktoy. Good job.",
			"Impressive catch you’ve got there, slut’s practically begging for it.",
			"Oh, holding on nice and tight, I see. Keep that whore in line.",
			"Leashes are perfect for handling dumb sluts like that.",
			"That’s how you handle a worthless little whore—keep them on a leash.",
			"Look at you, parading that bitch around like the good pet she is.",
		]
	if(_id == "ReactFUCKING_SOMEONE"):
		return [
			"Fucking in the open? No shame, huh.",
			"You love fucking in the public, slut?",
			"Bet you’re loving all the attention.",
			"Bet you love all these eyes watching you.",
			"Nice, a free show! About time.",
			"You fucking love this, don’t you?",
		]
	if(_id == "AskKeyCanYouUnlock"):
		return [
			"Think you could let me out of these, you fuck?",
			"Can you unlock me already, fucker? I hate it.",
			"Hey, mind freeing me from this? This fucking joke isn't funny anymore.",
			"Unlock me, right now. Or I will snap your neck.",
			"Can you get these off? The faster, the better, you fuck.",
			"Let me out of these. I fucking hate it.",
			"I need you to unlock me. Right the fuck now.",
			"Unlock me, you prick.",
		]
	if(_id == "AskKeyDeny"):
		return [
			"Not a fucking chance.",
			"Why would I unlock a filthy bitch like you?",
			"Stay locked, cunt. You haven’t earned freedom yet.",
			"I’m not done with you, slut.",
			"You stay locked, you dirty whore.",
			"Not now. Maybe never.",
			"Pathetic. Stay locked where you belong.",
			"You’re nothing but a toy, and toys stay locked.",
			"Later? Maybe. But I doubt it, slut.",
		]
	if(_id == "AskKeyGive"):
		return [
			"Fine, I'll let you out, slut. Don’t get used to it.",
			"You’ve earned a break, bitch. I’ll unlock you.",
			"Guess you behaved well enough. I’ll unlock you, for now.",
			"Alright, I’ll let you out. But don’t think you're free, whore.",
			"Whatever. I’ll unlock you. For now.",
			"You can be unlocked, slut. But don’t expect it to last.",
			"Fine. Hold still, cunt.",
			"Alright, I’ll unlock you, but you'll be back in soon enough.",
		]
	if(_id == "AskKeyChallenge"):
		return [
			"Sure, slut. But first, you're gonna have to earn it.",
			"You want out? Then prove you're a good fucktoy first, slut.",
			"I’ll unlock you after I’m done using that filthy body of yours.",
			"Earn it, slut. Then we will talk.",
			"Get on your knees and show me how much you want it, whore.",
			"You think you deserve freedom without pleasing me first? Beg like the worthless bitch you are.",
			"Earn it, slut. Show me you’re a good little fucktoy first.",
			"I’ll unlock you, slut. But first, you will show me what you're good for.",
		]
	if(_id == "AskKeyChallengeUnlock"):
		return [
			"Good job, slut. You’ve earned your freedom. For now.",
			"That’s more like it. Here’s your key, whore.",
			"Well done, fucktoy. I’m letting you out.",
			"You took it like a good slut. Time to unlock you.",
			"That was good. You’ve earned this, whore.",
			"Good slut. Now you can be free. For now.",
			"Nice work, whore. You’re free.",
			"You pleased me, slut. You can be unlocked.",
		]
	if(_id == "AskKeyChallengeFail"):
		return [
			"Pathetic, slut. Stay locked where you belong.",
			"That was shit, whore. You’re staying locked.",
			"Is that all you’ve got? You don’t deserve freedom, slut.",
			"Not even close, you useless bitch. Stay locked.",
			"That was pathetic. You’re not getting free anytime soon, cunt.",
			"You failed, slut. Stay in those restraints.",
			"That performance was shit. No key for you, whore.",
			"Disappointing, as always, slut. Stay locked up.",
		]
	if(_id == "AskKeyChallengeRefuse"):
		return [
			"Not a fucking chance, slut.",
			"Don’t even try, whore. I’m not interested.",
			"Not happening, slut.",
			"Forget it, bitch.",
			"You’re refusing me? You’ll regret that.",
			"No way.",
			"Fuck off, whore. I’m not doing that.",
			"Not a chance, cunt.",
			"Absolutely not, slut.",
		]
	if(_id == "AskKeyChallengeRefuseStay"):
		return [
			"Fine. Stay locked like the pathetic slut you are.",
			"Then rot in those restraints, whore.",
			"Stay locked, cunt. That’s where you belong.",
			"Your choice, bitch. Stay locked up tight.",
			"Suit yourself, slut. Enjoy your restraints.",
			"Stay chained, slut. That’s where you deserve to be.",
			"Good. You’re not getting out anyway, bitch.",
			"Whatever, whore. You’re staying locked.",
			"Fine by me, cunt. Stay locked up.",
		]
	if(_id == "HelpRestraintsAsk"):
		return [
			"Ugh, I hate asking, but can you get me out of these?",
			"I need help with these restraints, you gonna step up or what?",
			"Get over here and help me, I’m stuck.",
			"Mind helping me out before I lose my patience?",
			"Do I really have to beg? Help me with these!",
			"Get me out of these restraints, now.",
		]
	if(_id == "HelpRestraintsAgree"):
		return [
			"Fine, I’ll help, but you owe me.",
			"Yeah, I’ll get you out, but don’t get used to it.",
			"Alright, but don’t think this makes you special.",
			"Sure, I’ll help you out. You better be grateful, slut.",
			"Alright, but you better pay me back later, slut.",
			"Yeah, I can do that. Just stop whining.",
		]
	if(_id == "HelpRestraintsAltStart"):
		return [
			"Hold still, slut. I’ll get you out of those, if you behave.",
			"Don’t move a muscle, I’ll deal with your pathetic situation.",
			"I’ll help you out, but don’t you dare move a fucking inch.",
			"Sit tight, I’ll handle it. You’re lucky I’m feeling generous.",
			"Stay put, slut. I’m in control now.",
		]
	if(_id == "HelpRestraintsDeny"):
		return [
			"Fuck no, you’re staying locked up, whore.",
			"Not a chance, slut. You stay bound.",
			"Why would I help? You deserve to stay like this, locked and helpless.",
			"Hell no. You’re staying in those restraints, slut.",
			"Not happening, whore. You’re better off stuck like that.",
		]
	if(_id == "HelpRestraintsFinished"):
		return [
			"That’s all I’m doing for you, slut.",
			"That’s it. If you want more, too fucking bad.",
			"You’re lucky I did this much. Don’t ask for more.",
			"That’s as much as you’re getting from me, whore.",
			"You’re done. Don’t expect anything more from me.",
		]
	if(_id == "HelpRestraintsPaid"):
		return [
			"Good enough. I’m out of here.",
			"That’ll do, I’ve wasted enough time.",
			"That’s it. I’m leaving, slut.",
			"You’re good. I’m done with you.",
			"Alright, we’re done. Get lost.",
			"That’s all you’re worth. I’m out.",
		]
	if(_id == "HelpRestraintsRefusePay"):
		return [
			"I’m not paying for that! You barely lifted a finger.",
			"Fuck off, I’m not paying for that weak-ass help.",
			"That wasn’t worth a damn. No way I’m paying.",
			"You didn’t do shit. Don’t expect credits from me.",
			"I’m not giving you shit for that, loser.",
			"Yeah, no. You didn’t do enough to deserve payment.",
			"I’m keeping my credits. You don’t deserve shit.",
			"Why would I pay you for that half-assed effort?",
			"No payment for you, slut. You didn’t even help.",
			"I’m not giving you anything, you useless fuck.",
		]
	if(_id == "HelpRestraintsRefusePayWhatever"):
		return [
			"Whatever, loser.",
			"Fine, stay broke then.",
			"Yeah, whatever. Like I care.",
			"Whatever, fuck off already.",
			"Sure, whatever, get lost.",
		]
	if(_id == "SlutwallStealCredits"):
		return [
			"You don’t deserve a single credit, you filthy [[SLUT]].",
			"These are wasted on a whore like you.",
			"You’re not worth even this. I’ll take it, slut.",
			"Credits for a dumb slut? I don’t think so.",
			"I’ll make better use of these than a fucktoy like you.",
			"A slut like you doesn’t need credits, you need cock.",
			"These are better off with me than some prison whore.",
			"Not like a fuckhole like you will miss this, [[SLUT]].",
			"Think of it as a tip for putting up with your pathetic self, slut.",
		]
	if(_id == "SlutwallAddTip"):
		return [
			"Here’s a little something for being such a hungry slut.",
			"You earned this, you filthy fucking toy.",
			"That’s for being my obedient fuckhole.",
			"Take this and remember, you’re just a slut with a price tag.",
			"That’s for keeping your mouth full like a good little whore.",
			"You’ve been such a good breeding bitch, here’s your reward.",
		]
	if(_id == "StocksShout"):
		return [
			"Hey! Anyone! Someone come fuck me already!",
			"Need a little help over here, unless you wanna keep me stuck like a good slut!",
			"Anyone out there? I’m fucking ready!",
			"Can someone get me out, or just use me already!",
			"I’m stuck and ready for a pounding. Help!",
			"Hey, I’m locked in and wet, anyone want this?",
			"Get me out or come use me, your choice!",
			"Help! Or come fuck me in these stocks, you choose!",
		]
	if(_id == "ProstitutionStart"):
		return [
			"Looking for a tight hole to fill?",
			"Wanna fuck me like the cumdump I am?",
			"Need a little slut to blow off some steam?",
			"How about you ruin this hole tonight?",
			"Want to fuck me till I can’t walk?",
			"Looking for a wet hole to unload in?",
			"Wanna see how much of a slut I really am?",
			"Care for a rough fuck?",
		]
	if(_id == "ProstitutionOffer"):
		return [
			"What do you have in mind, slut?",
			"What's on the whore's menu?",
			"What are you offering, slut?",
		]
	if(_id == "ProstitutionUsual"):
		var creds = str(getVar(_args, "credits", 0))
		return [
			"Just the usual. "+creds+" credits for my holes.",
			"Nothing special. For "+creds+" credits, you get to fuck me raw.",
			"Only "+creds+" credits and I’m yours to destroy.",
		]
	if(_id == "ProstitutionServiceDom"):
		var creds = str(getVar(_args, "credits", 0))
		return [
			"I’ll make you beg like a little bitch, for only "+creds+" credits.",
			"I’ll dominate you, you’ll be my toy, just "+creds+" credits.",
			"For "+creds+" credits, I’ll have you on your knees, worshipping my body.",
			"I’ll make you whimper and crawl, for only "+creds+" credits.",
			"Want me to break you? "+creds+" credits and you’re mine.",
			"I’ll make you my bitch for "+creds+" credits. Ready?",
			"I’ll take full control, you’ll be begging for mercy. "+creds+" credits.",
		]
	if(_id == "ProstitutionPricySlut"):
		var creds = str(getVar(_args, "credits", 0))
		return [
			"I’m worth every single fucking credit, "+creds+" and you’ll know it.",
			"You get what you pay for, and I’m the best. "+creds+" credits.",
			"I’m pricey because sluts like me know how to make you scream, "+creds+".",
			"You want the best whore? Then pay up. "+creds+" credits.",
			"You’re paying for the best fuck of your life. "+creds+" credits.",
			"I don’t come cheap, but once you’re done, you’ll understand why. "+creds+".",
			"It costs extra to fuck the best, and that’s me. "+creds+" credits.",
		]
	if(_id == "ProstitutionDenied"):
		return [
			"Not fucking interested.",
			"No thanks, you’re not worth my time.",
			"I’d rather fuck a wall than you.",
			"Not even if you paid me double.",
			"No, I don’t fuck sluts.",
			"Not today, whore.",
			"Maybe if you were actually worth it.",
			"I’ll pass, go fuck yourself instead.",
		]
	if(_id == "ProstitutionDeniedWhatever"):
		return [
			"Whatever, I don’t fuck losers anyway.",
			"Suit yourself.",
			"Your choice, but you’re missing out.",
			"Whatever, like I care.",
			"Fine, keep being pathetic.",
			"Whatever, I wouldn’t waste my holes on you anyway.",
			"Fine, someone else will get to use me.",
			"Whatever, I’ve got better clients anyway.",
		]
	if(_id == "ProstitutionAccept"):
		return [
			"Alright, let’s see if you can handle this.",
			"Let’s see if you can keep up, slut.",
			"Okay, show me if you’re worth the credits.",
			"Sure, let’s see what you’re packing, slut.",
		]
	if(_id == "ProstitutionDemandCreds"):
		return [
			"That was fucking pathetic. Give me my credits back.",
			"You call that fucking? I want my money back, loser.",
			"That was trash. Hand over the credits, slut.",
			"Pathetic. Pay up, or I’ll take the credits myself.",
			"That wasn’t even worth the sweat. Refund, now.",
			"You didn’t even make me moan. Give me the credits back, pussy.",
			"I’ve had better from a toy. Pay up, bitch.",
			"That sucked. You owe me credits, you pathetic little bitch.",
			"That wasn’t even close to worth it. Credits, now.",
			"That was garbage. I want my fucking credits back.",
		]
	if(_id == "ProstitutionRefuseReturnCreds"):
		return [
			"Not a fucking chance, loser. Get lost.",
			"No way, I earned that. Now beat it.",
			"Not happening, you weak little bitch.",
			"Forget it, those are my credits. Now fuck off.",
			"No refunds for pathetic fucks. Now get out of here.",
			"You wish. I’m keeping it. Now get lost.",
			"I’m not giving a single credit back, now piss off.",
			"Get fucked, you’re not getting a thing back.",
			"You’re dreaming if you think I’m refunding you. Get out.",
			"No way I’m giving it back. Crawl away, loser.",
		]
	if(_id == "ProstitutionScam"):
		return [
			"Actually, the price just fucking went up. 5 more credits.",
			"You know what? I’m worth more than that. 5 more credits.",
			"Price increase, slut. 5 more credits now.",
			"I’m charging more. Hand over 5 extra credits.",
			"Pay more, slut. 5 more credits, or I walk.",
			"You’ll have to pay more now, loser. 5 more credits.",
			"I looked at you and decided that I’m worth more. 5 extra credits.",
			"Price hike. 5 more credits, now. Or go away.",
			"Actually, I’m charging more now after seeing you. 5 extra credits.",
			"On second thought, it’s more. 5 more credits.",
			"I’m upping the price. 5 more credits. Is that too much for a loser like you?",
		]
	if(_id == "PunishDecide"):
		return [
			"What should I do with a filthy whore like you..",
			"Time to decide how to break you, slut.",
			"Hmm... how should I make you scream, bitch?",
			"Let’s figure out the best way to ruin you, slut.",
		]
	if(_id == "PunishDecideStocks"):
		return [
			"The stocks will break that filthy little ass of yours.",
			"Let’s see how you squirm in the stocks, slut.",
			"Stocks are perfect to show off a used-up whore like you.",
			"You deserve to be bent over in the stocks like the trash you are.",
			"The stocks are fitting for a worthless fucktoy like you.",
		]
	if(_id == "PunishAboutToStocks"):
		return [
			"Bend over, bitch. I want you vulnerable.",
			"Get your whore ass ready, slut.",
			"Assume the position, you fucktoy.",
			"Time to bend over and get what you deserve, slut.",
			"Spread your legs and bend over, whore.",
		]
	if(_id == "PunishLockIntoStocks"):
		return [
			"All locked up and ready to be used like the trash you are.",
			"Locked up tight, no escape for a slut like you.",
			"Enjoy your time being nothing but a fuckhole.",
			"You’re not going anywhere until you’re completely used up.",
			"All set for everyone to have their way with you, whore.",
			"Hope you like being a public toy, because that’s all you are now.",
		]
	if(_id == "PunishSex"):
		return [
			"I’m going to ruin you, slut.",
			"You’re mine to use however I want.",
			"Let’s see just how much of a filthy whore you are.",
			"This is gonna be fun for me, not for you.",
			"Let’s break you properly, you fucktoy.",
			"Time to fuck you like the cumdump you are.",
		]
	if(_id == "PunishSubSex"):
		return [
			"Fuck it, use me however you want. I don’t care.",
			"Changed my mind. Do whatever you want with me, you filthy slut.",
			"Guess you can be in control. For now.",
			"Fine, take the lead, but make it count.",
			"Fuck it, I’ll be your personal fucktoy for now.",
			"Whatever, just use me, I don’t give a shit.",
			"Fine, you can fuck me. But don’t think I’ll be gentle.",
			"Whatever, just do what you want. I won’t fight it.",
		]
	if(_id == "PunishDecidedSlutwall"):
		return [
			"Your worthless holes belong in the slutwall, slut.",
			"You’re perfect for the slutwall. That’s all you’re good for.",
			"The slutwall’s where whores like you belong.",
			"I want to see you stretched out in that slutwall, whore.",
			"You’ll fit right in at the slutwall, getting fucked like you deserve.",
			"I want to see every inch of you used up in the slutwall.",
			"Get your filthy ass ready. The slutwall’s your new home.",
			"Perfect place for a cumdump like you. The slutwall’s waiting.",
		]
	if(_id == "PunishLockIntoSlutwall"):
		return [
			"Get comfy, slut. You’re gonna be here a while.",
			"Enjoy being a fucktoy, whore. It’s all you’ll ever be.",
			"Locked in tight, ready to be used until you break.",
			"All set for the whole station to fuck you, you filthy bitch.",
			"Hope you enjoy being used like a slut, because that’s all you are now.",
			"Get ready, you’re about to be everyone’s fuckhole.",
		]
	if(_id == "TalkChatWhat"):
		return [
			"What do you want now, slut?",
			"Spit it out, I don’t have all day.",
			"Got something to say, or just wasting my time?",
			"Hurry up and speak, whore.",
			"Better be good, or I’ll shut you up myself.",
			"What the fuck do you want?",
		]
	if(_id == "TalkChatCancel"):
		return [
			"Changed my mind..",
			"Forget it.",
			"Whatever.",
			"Never mind.",
		]
	if(_id == "TalkChatLeaving"):
		return [
			"Fine, get lost.",
			"Go ahead, no one’s begging you to stay.",
			"Whatever, fuck off then.",
			"Good, I was done with you anyway.",
		]
	if(_id == "TalkChatAgree"):
		return [
			"Yeah, obviously.",
			"Finally, you’re making sense.",
			"Of course.",
			"Yeah, true.",
			"Sure, you're not wrong.",
		]
	if(_id == "TalkChatDisagree"):
		return [
			"Are you fucking serious? You’re wrong.",
			"You’re so full of shit, shut up.",
			"I don’t care what you think. You’re wrong.",
			"Shut the fuck up before I make you.",
			"Wrong, whore.",
			"I don’t give a shit what you think.",
		]
	if(_id == "TalkChatWhatever"):
		return [
			"Whatever, I don’t give a fuck.",
			"Meh, doesn’t affect me either way.",
			"Eh, who gives a shit?",
			"It’s all the same to me.",
			"Doesn’t matter to me.",
		]
	if(_id == "TalkChatPickupLine"):
		return [
			"Are you a slut? Cause you sure act like one.",
			"You’re like trash, always getting caught under my feet.",
			"Are you a hole? Because I’ve got something to fill you with.",
			"You’ve got a body that screams 'use me.'",
			"If being easy were a crime, you’d be on death row.",
			"Let’s cut the bullshit. You want me, don’t you?",
			"With a body like yours, I’m surprised you’re not on your knees already.",
			"Are you lost? Because I can show you the way, to my bed.",
			"Is that slutty look on purpose or are you just that desperate?",
			"With an ass like that, you should be paying me to fuck you.",
		]
	if(_id == "TalkChatPickupLineFail"):
		return [
			"Wow, that was fucking pathetic.",
			"You should be ashamed of yourself. That was shit.",
			"Really? That’s all you got?",
			"That was fucking awful. Try again.",
			"God, you’re embarrassing yourself.",
			"Did you seriously just say that? Pathetic.",
			"That was so bad, I almost feel sorry for you.",
			"Shut up before you embarrass yourself further.",
			"That was weak as fuck.",
		]
	if(_id == "TalkFlirtAccept"):
		return [
			"Yeah, I know you want me.",
			"Not bad, for a slut like you.",
			"You’ve got potential.. maybe.",
			"You’re cute when you’re desperate.",
			"You’re not bad. I could have some fun with you.",
			"Looks like you’re worth my time, for now.",
		]
	if(_id == "TalkFlirtDeny"):
		return [
			"Not a fucking chance.",
			"Yeah, you wish.",
			"I’m not wasting time on someone like you.",
			"Dream on, slut.",
			"Don’t embarrass yourself, I’m way out of your league.",
			"Fuck off, not interested.",
		]
	if(_id == "TalkSexOffer"):
		return [
			"Let’s fuck, right here, right now.",
			"I’m gonna use you until I’m satisfied.",
			"You want me to fuck you? Say it like you mean it.",
			"Why waste time talking when I could be fucking you?",
			"You’re just begging to be fucked, aren’t you?",
			"Get ready to be ruined, slut.",
		]
	if(_id == "TalkSexOfferAccept"):
		return [
			"Good. Now show me a real fucking.",
			"Finally, let’s get this started.",
			"Fuck yeah, Just don't ruin my body, you fuck.",
			"Hope you’re ready for a rough one.",
		]
	if(_id == "TalkSexOfferDeny"):
		return [
			"I’d rather not waste my time on you.",
			"You? Not worth it.",
			"I’m passing on that.",
			"Not interested in a slut like you.",
			"I don’t fuck with just anyone, you know.",
		]
	if(_id == "TalkSexOfferSelf"):
		return [
			"Take me, you know you want to.",
			"I’m all yours. Fuck me like I deserve.",
			"Come on, fuck me already.",
			"I know you want to use me. Just do it.",
			"You can have me, if you think you can handle it.",
			"I’m here for you, use me however you like.",
			"Fuck me like the dirty slut I am.",
			"Come on, don’t be shy. Take me.",
		]
	if(_id == "TalkSexOfferSelfAccept"):
		return [
			"Good. Now I’m gonna fuck you hard.",
			"Get ready, you’re in for a rough one.",
			"I’m gonna ruin you.",
			"Fuck yeah, I’m gonna use you until you can’t walk.",
		]
	if(_id == "TalkSexOfferSelfDeny"):
		return [
			"I’m not interested in fucking you.",
			"I’m passing, you’re not worth my time.",
			"Not right now. Maybe never.",
			"I don’t feel like it. Try harder next time.",
		]
	if(_id == "TalkGrabAndFuck"):
		return [
			"Look at you, all helpless. I’m gonna enjoy this.",
			"Don’t even think about running, you’re mine now.",
			"Stay still while I fuck you, slut.",
			"I’m gonna take what I want, and you’re gonna like it.",
			"You’re not going anywhere until I’m done with you.",
			"Can't resist, can you? You filthy little fucktoy.",
			"You're just a helpless hole, and I'm gonna use you.",
			"You’re mine until I say otherwise, slut.",
		]
	if(_id == "TalkAboutToKidnap"):
		return [
			"You belong to me now. Understand, whore?",
			"You’re mine now, you little slut. You hear?",
			"Say goodbye to your freedom, slut. You’re all mine now. Understand?",
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
