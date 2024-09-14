extends DialogueFiller

func _init():
	priority = 14

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
	var subby = personality.getStat(PersonalityStat.Subby)
	#var subby = personality.getStat(PersonalityStat.Subby)
	
	if(subby > -0.4):
		return false
	
	return true

func getText(_id:String, _args:Dictionary):
	if(_id == "FightLostGeneric"):
		return [
			"[[C_UGH]].. You got me, but I'll get you next time, slut.",
			"[[C_UGH]].. Enjoy this win while you can.",
			"[[C_UGH]].. Fuck.. Guess you earned that.. for now.",
			"[[C_UGH]].. Don’t get cocky, this isn’t over.",
			"[[C_UGH]].. Fine, you got lucky this time.",
			"[[C_UGH]].. You better enjoy this while it lasts, whore.",
		]
	if(_id == "FightWonGeneric"):
		return [
			"Too easy, cutie.",
			"Not even worth my time.",
			"Is that all you’ve got, little thing?",
			"I barely even had to lift a finger.",
			"That was pathetic. Should I make you get on your knees, huh..",
			"Hah, you call that a fight? You call yourself a challenge?",
			"You’ll need a lot more to handle me.",
			"I didn’t even have to break a sweat.",
			"Pathetic. Just like I thought.",
			"That’s all you’ve got, softie?",
			"You were barely worth the effort. I expected more from a whore like you.",
			"And stay the fuck down, unless you want me to pin you.",
		]
	if(_id == "FightSurrender"):
		return [
			"Fine. I give up.",
			"I'm not dumb. I know I can't win.",
			"I surrender. But not because I'm weak.",
			"On your knees if you're surrendering, whore!",
			"Fine, I’ll give up.. Maybe.",
			"You know you're nothing, don’t you? This means nothing..",
		]
	if(_id == "AttackStart"):
		return [
			"I’m gonna break you like the bitch you are.",
			"You’re gonna scream for me, softie.",
			"I’m going to make you bleed and beg.",
			"I’ll fuck you up and leave you begging for more.",
			"You’re gonna regret ever crossing me.",
			"I will fuck your world up, cutie.",
			"I'm about to put you in your place, right where you belong.",
			"I’m done playing nice. Time to make you my toy.",
		]
	if(_id == "AttackReact"):
		var attackerID = getCharID(_args, "target")
		var reacterID = getCharID(_args, "main")
		var affection:float = GM.main.RS.getAffection(attackerID, reacterID)
		var lust:float = GM.main.RS.getLust(attackerID, reacterID)

		if(affection > 0.1):
			return [
				"Is this foreplay for you, cutie? I could make it better.",
				"Hey, what the fuck? Want me to fuck you into submission?",
				"Didn't think you'd have the guts, but I like it.",
				"What are you playing at? You know you’re mine, right?",
				"You're asking for it. Careful what you wish for.",
			]
		if(affection < 0.0 && lust >= 0.9):
			return [
				"You dirty little whore. Let’s see what you’ve got.",
				"You're such a fuck-up.. but I like that about you.",
				"Come here, slut. Let me break you.",
				"You're really pissing me off, and I fucking love it.",
				"You are such a piece of shit. Turns me on so much, fuck..",
			]
		if(affection <= -0.4):
			return [
				"You fucked with the wrong person, asshole.",
				"Finally, you showed your true colors, bitch!",
				"I knew you were gonna be a problem. Now I get to break you.",
				"You think you can handle me? Think again, cutie.",
			]
		
		return [
			"Back off, bitch! Or do you want me to fuck you into submission?",
			"What’s your problem, slut? Trying to get my attention?",
			"You want to fight? Fine, let's see what you got.",
		]
	if(_id == "GuardCaughtOffLimits"):
		return [
			"Hey! You looking for trouble, cutie?",
			"Lost your way? Or did you come here to get fucked?",
			"Bold move sneaking in here. Too bad you’re caught, bitch.",
			"And just where the fuck do you think you're going?",
			"You're trespassing. Unless you're here to be my toy, get the fuck out.",
			"Sneaking around, huh? Guess you wanted to be punished.",
		]
	if(_id == "GuardCaughtOffLimitsFight"):
		return [
			"Oh, you wanna fight? Fine by me, sweetheart.",
			"I guess we’re doing this the hard way. Let’s dance, cutie.",
			"Alright then, I’ll beat some sense into you.",
			"Okay, slut. Time to show you your place.",
			"You’re only making this worse for yourself, sweetie.",
		]
	if(_id == "GuardInmateSurrender"):
		return [
			"That’s right, know your place, slut.",
			"Finally using that tiny brain of yours. Good.",
			"Smart move, cutie. You’ll thank me later.",
			"Best decision you’ve made all day, slut.",
			"About time you saw reason. I like you on your knees.",
			"Surrendering already, huh? Guess you're just a weak little bitch.",
			"Good choice, sweetie.",
		]
	if(_id == "GuardFrisk"):
		return [
			"Stand still and spread your legs, cutie.",
			"Hold still, this won’t take long.. unless I want it to.",
			"Hands up, sweetie. You know the drill.",
			"Spread those legs. Don’t make me force you.",
			"Against the wall, slut. You know you like it.",
			"Don’t make this hard, unless you want me to punish you.",
			"I’m frisking you, cutie. Try not to enjoy it too much.",
			"Don’t move, pet, or I’ll make sure you regret it.",
			"Hands up, legs apart, whore. Let’s get this over with.",
			"Stay still, slut. Or do you want me to get rough?",
		]
	if(_id == "GuardFriskFound"):
		return [
			"Well, well, look what we have here. Mine now, haha.",
			"This is contraband. You’re fucked, bitch.",
			"Caught breaking the rules? Too bad, it’s mine now~.",
			"You know this is against the rules, cutie. Hand it over.",
			"This isn’t allowed. Guess I’ll be keeping it~.",
			"You’re not supposed to have this, sweetie. I will keep it safe for you.",
			"Found something naughty, whore. Guess you’re in trouble.",
			"Contraband, huh? You’re gonna regret this.",
			"What’s this, slut? Not yours anymore~.",
			"Trying to hide this? Nice try, cutie. It’s mine.",
			"Trying to sneak this past me? Not a chance, sweetie.",
			"This breaks all the rules, slut. I’m confiscating it.",
			"Looks like you’ve been a bad {inmate.girl}. Guess I’ll take this.",
		]
	if(_id == "GuardFriskNoFound"):
		return [
			"Looks like you’re clean this time, cutie.",
			"Alright, you got lucky this time.",
			"Seems like you didn’t hide anything today.",
			"Fine, you’re clear. But don’t push your luck, slut.",
			"You’re clear. Stay that way, or next time I won’t be so nice.",
			"Nothing on you today, but I’ll be watching.",
		]
	if(_id == "GuardGoAway"):
		return [
			"Get the fuck out of here, slut.",
			"Keep walking, cutie, before I change my mind.",
			"You’re on thin ice, sweetie. Watch your step.",
			"Get the fuck out, and don’t let me catch you again.",
		]
	if(_id == "GuardKeepMoving"):
		return [
			"Keep moving, cutie. Don’t waste my time.",
			"Move your ass, sweetheart. I haven’t got all day.",
			"Keep walking. Or do you want me to drag you, pet?",
			"Don’t make me yank your leash, cutie.",
			"Step faster, cutie. Don’t make me wait.",
		]
	if(_id == "GuardFriskFailResist"):
		return [
			"Cutie.. You're disappointing me..",
			"Don't make me sad, sweetheart. I don't wanna be sad.",
			"We were doing so well. Why do you resist now, cutie?",
			"Such a brat.. I guess you want this.",
		]
	if(_id == "ReactBODYWRITINGS"):
		return [
			"Look at you, marked up like a good little pet.",
			"Those scribbles? They just scream 'use me'.",
			"You’re such a desperate little thing, letting them write all over you.",
			"I bet you begged for each and every filthy word on that body.",
			"Carrying those words like a badge of honor, aren’t you, cutie?",
			"How about I add my name to the list? Make it official.",
			"Aww, look at you.. nothing but a little canvas, always ready for more.",
			"Are those ads, sweet thing? Letting everyone know what they can do to you?",
			"You must love the attention..",
		]
	if(_id == "ReactTALLYMARKS"):
		return [
			"Quite the busy little slut, aren't you, pet?",
			"Lost track of all the dicks, huh? Guess keeping count helps.",
			"That’s a lot of work for such a tiny little whore, isn’t it?",
			"Your body’s a scoreboard now? Who’s winning, sweetie?",
			"Keeping count to brag, cutie? Or just to keep track of who owns you?",
			"Tell me, sweetheart, which one was the best?",
			"Running out of space, are we? I’ll find somewhere to put my mark.",
			"Can’t even keep track of how many times you’ve been used, huh?",
			"You're just a well-worn little toy, aren’t you?",
		]
	if(_id == "ReactCOVERED_IN_CUM"):
		return [
			"Mmm, wearing cum like it’s your new perfume. Classy.",
			"Bathed in it? Now that’s what I call dedication.",
			"Such a good little cumrag, all used up and ready for more.",
			"Dripping like the slut you are. Did you even try to swallow, or was that too much for you?",
			"Covered in cum, just like a well-used toy should be. Good pet.",
			"You smell like you’ve been used by half the station, sweet thing.",
			"Fucking mess.. but at least you're useful, aren't you, cutie?",
			"You’re a cum-bucket, through and through. Nothing more, nothing less.",
			"Keep your distance, cum dumpster, unless you want me to add more.",
			"Don't worry, sweet thing. You'll be wearing more soon enough.",
		]
	if(_id == "ReactCOVERED_IN_PISS"):
		return [
			"Took a little piss bath, huh, sweet thing?",
			"Look at you, reeking of piss like the good little bitch you are.",
			"You’re so fucking filthy, letting someone mark you like that.",
			"Pathetic.. letting someone piss all over you.",
			"How low will you go, sweetheart? Seems like there’s no limit.",
			"A piss-slut, through and through. What a disgrace.. and you love it, don’t you?",
			"You let someone treat you like that? You must really enjoy being a toilet.",
			"Smells like you belong on your knees in the gutter, piss-pet.",
			"Did you even try to clean up? Or do you like smelling like a public urinal?",
		]
	if(_id == "ReactNAKED"):
		return [
			"Parading yourself around like a needy little thing, aren’t you?",
			"Might as well just stay naked, slut. Everyone’s seen it anyway.",
			"Showing off that body again, cutie? No shame at all, huh?",
			"Looking for more eyes on you, pet? Such a good attention whore.",
			"You’re just begging for it, aren’t you, sweet thing?",
			"Forgot how to dress, or do you just love being exposed?",
			"That’s some cheap advertising, whore. But hey, it’s working.",
			"You’re practically screaming ‘fuck me’ with that naked little body of yours.",
		]
	if(_id == "ReactCAN_GRAB_AND_FUCK"):
		return [
			"All tied up and ready, just like the little fucktoy you are.",
			"Look at you, helpless and eager to be used. Such a perfect little slut.",
			"You’re a fucktoy..",
			"Tied up with nowhere to go.. exactly where you belong, sweetheart.",
			"Why even pretend to resist, slut? You know you want it.",
			"Bound up like a gift, waiting for someone to unwrap you.",
			"Just a helpless little doll, begging to be used. How cute.",
			"Anyone could fuck you right now, and you'd love every second of it, wouldn't you, pet?",
			"Tied up and begging for attention without even saying a word. Perfect.",
			"Just another piece of fuckmeat, all packaged up and ready to be used.",
		]
	if(_id == "ReactON_A_LEASH"):
		return [
			"Look at this pathetic little pet, being led around like a dog.",
			"Got yourself a new master, slut? You must be so proud.",
			"Leashed up like the obedient little whore you are. How cute.",
			"Such a good pet, following your master’s every command, aren’t you?",
			"Getting dragged around like the bitch you are.",
			"That leash looks so natural on you, sweet thing. It’s like it was made for you.",
			"Being walked like a dog to your next fuck. Adorable.",
			"Leashed up and loving it, aren’t you, pet? Such a good little slut.",
			"Getting dragged around like the good little cumslut you are. Love to see it.",
			"That leash suits you. Reminds you of your place, doesn’t it?",
		]
	if(_id == "ReactGETTING_FUCKED"):
		return [
			"Look at you, taking it like the good little slut you are.",
			"Getting fucked in front of everyone? You must love being the center of attention.",
			"Such a good whore, taking it for everyone to see.",
			"Fucking in public? You just can't help yourself, can you, pet?",
			"Nice, a free show for everyone. Keep taking it like the slut you are.",
			"Let them see just how much you love being used.",
			"Such a desperate little thing, fucking out in public like this.",
			"Not even hiding it? Guess you’re just a shameless little slut.",
			"Bet you’re loving all these eyes on you, aren’t you, cutie?",
			"Getting fucked in public like the free-use toy you are. Perfect.",
			"Not a care in the world, just a slut who craves attention. You’re adorable.",
			"Nothing like a slut who loves to put on a show for everyone.",
			"Everyone can see just how much of a needy little slut you are.",
			"You just can’t get enough, can you, pet?",
			"Bet you’d let anyone here take their turn, wouldn’t you, sweetheart?",
			"Enjoying yourself? Don’t stop now, slut.",
			"You’re just a free-use toy, ready for anyone to enjoy.",
			"Bet you’re getting off on all the attention, you filthy little thing.",
		]
	if(_id == "ReactLEASHING_SOMEONE"):
		return [
			"Got yourself a cute little pet on a leash. How adorable.",
			"Look at you, parading that little slut around.",
			"Taking your obedient little whore for a walk, huh? Lucky thing.",
			"So, who’s your little plaything today, sweetie?",
			"What a sight.. so much control. I like it.",
			"Dragging your little fucktoy around like a trophy. Impressive.",
			"Quite the catch you’ve got there.",
			"Leashing up a slut like that.. now that’s how you handle a whore.",
			"That leash looks good in your hands. Keep a tight grip.",
			"That’s how you keep a worthless little slut in line. Good job.",
			"Look at you, leading that cute little slut around like a proper pet.",
			"That leash suits them.. but you wear the control even better.",
			"Looks like you’ve trained your little slut well. Impressive.",
		]
	if(_id == "ReactFUCKING_SOMEONE"):
		return [
			"Look at you, such an alpha..",
			"Don’t stop now, cutie, I'm loving the show..",
			"Bet you’re getting off on all the attention.",
			"Nice, a free show for everyone",
		]
	if(_id == "AskKeyCanYouUnlock"):
		return [
			"I kinda want out already. Please, sweet thing?",
			"I'm a little tired of being locked up. Please?",
			"I think I deserve to be unlocked. Pretty please?",
			"I'm not gonna be to be free.. but please?",
			"I might look good locked up.. but I kinda wanna get it off already. Please?",
		]
	if(_id == "AskKeyDeny"):
		return [
			"Not yet, pet. You're not done being useful.",
			"Maybe later, if I feel like it.",
			"You’ll stay locked until I’m done having fun with you.",
			"Patience, darling. You’ll get free when I say so.",
			"Not happening, slut. You stay mine for now.",
			"I’m not done with you yet, brat.",
			"Stay put, pet. You’ll stay locked for a while longer.",
			"Just wait, sweet thing. I’m in control here.",
			"You can wait, slut. I’m not in a hurry.",
		]
	if(_id == "AskKeyGive"):
		return [
			"Alright, you've earned a break. For now.",
			"Fine, I’ll let you out. Don’t get too comfortable, though.",
			"Alright, you’ve been good enough. Time to unlock you.",
			"I suppose you’ve earned a little freedom, for now.",
			"Okay, sweet thing. But you better make it worth it later.",
			"You’ve been patient, I’ll give you that. I’ll unlock you.",
			"Alright, I’ll free you... but don't think it's over.",
			"You've behaved, so I'll unlock you. This time.",
		]
	if(_id == "AskKeyChallenge"):
		return [
			"Sure, pet, but only after you show me how good you can be.",
			"You want the key? Then crawl over here and earn it, slut.",
			"Maybe after you let me break you properly.",
			"If you want out, you’ll have to make me want to let you out. On your knees.",
			"Unlock you? Let’s see how well you handle being fucked senseless first.",
			"Only if you prove you’re nothing but a good little toy for me.",
			"You’ll have to make me cum first, sweetheart. Then we’ll talk about unlocking.",
			"You want out? Let’s see how much you can take first, cutie.",
			"If you make me feel good enough, I’ll think about giving you the key, slut.",
		]
	if(_id == "AskKeyChallengeUnlock"):
		return [
			"Good slut. That’s what I like to see.",
			"You’ve earned this key. For now.",
			"I’m impressed. You did well, pet.",
			"Good job. Maybe you’re worth unlocking after all.",
			"Alright, sweetheart, you’ve earned your little freedom.",
			"Good work, slut. Here’s your reward.",
			"I like when you work for it, pet. You’ve earned this.",
			"Good little toy. I’ll unlock you for now.",
		]
	if(_id == "AskKeyChallengeFail"):
		return [
			"Pathetic. You’re staying locked, slut.",
			"That was weak. You don’t deserve to be free.",
			"You call that trying? Stay locked, you worthless whore.",
			"That was nothing. You’ll stay locked, slut.",
			"You didn’t even come close. You’re staying locked.",
			"Not good enough, pet. Back in your place.",
			"Disappointing. Stay locked, brat.",
			"That was pathetic. You’re not getting out anytime soon, slut.",
		]
	if(_id == "AskKeyChallengeRefuse"):
		return [
			"No chance, slut.",
			"I don’t think so.",
			"Not happening.",
			"I refuse.",
			"Forget it.",
			"Absolutely not.",
			"No way.",
			"No.",
		]
	if(_id == "AskKeyChallengeRefuseStay"):
		return [
			"Fine, stay locked, whore. It’s what you deserve.",
			"Suit yourself. You’re staying locked like the filthy pet you are.",
			"Stay locked, brat. I don’t care.",
			"Whatever you say, pet. You’re not getting free.",
			"You made your choice. Now live with it, slut.",
			"Fine, stay locked. I prefer you that way anyway.",
			"Your loss, slut. Enjoy your restraints.",
		]
	if(_id == "HelpRestraintsAsk"):
		return [
			"Think you can handle helping me out of these, darling?",
			"How about you be useful and get me out of these?",
			"Be a good pet and help me with these restraints, hmm?",
			"Why don’t you make yourself useful for once and help me?",
			"Be a sweetheart and get these off me.",
			"Come on, brat, help me out of these. You wouldn’t want to disappoint me.",
		]
	if(_id == "HelpRestraintsAgree"):
		return [
			"Sure, I can help a pet like you.",
			"Of course, sweetheart. Hold still.",
			"Such a good little thing, let me help you.",
			"Alright, I’ll get you out. Don’t get too excited.",
			"Fine, I’ll help. You’ll owe me, though.",
			"Sure, I’ll take care of it. But you better remember who’s in charge.",
		]
	if(_id == "HelpRestraintsAltStart"):
		return [
			"Sit tight, cutie, let me help you.",
			"Don’t move, sweet thing, I’ll handle these toys that you got.",
			"Be a good slut and let me take care of those.",
			"Keep still, pet. I’ll get you out in a second.",
		]
	if(_id == "HelpRestraintsDeny"):
		return [
			"Oh no, sweetheart. You’re staying locked up.",
			"Nah, you’re not going anywhere, slut.",
			"Not a chance, pet. I like you restrained too much.",
			"No, stay locked. It suits you, don’t you think?",
			"Not happening, cutie. You belong like this.",
			"I’ll pass, brat. Stay the way you are.",
		]
	if(_id == "HelpRestraintsFinished"):
		return [
			"That’s all you get, be thankful, slut.",
			"That’s all for now, brat. Maybe next time I’ll do more.",
			"That’s it. You’re welcome.",
			"We’re done here. Don’t waste my time again.",
			"That’s all I’ll do for you. Don’t push it.",
		]
	if(_id == "HelpRestraintsPaid"):
		return [
			"That’s enough. I’m done with you for now.",
			"Alright, I’m satisfied. You’re free.. for now.",
			"Good enough, I’m off.",
			"I’ve got what I needed. See you around, slut.",
			"That’ll do. Stay out of trouble.. or don’t.",
		]
	if(_id == "HelpRestraintsRefusePay"):
		return [
			"You think that’s worth paying for? Ha!",
			"No way I’m giving you anything for that, brat.",
			"Not paying. You’re lucky I even let you touch me.",
			"I’m not giving you shit, whore.",
			"Forget it. You barely did a thing.",
			"No chance I’m paying for such a pathetic effort.",
			"You didn’t even earn a single credit, slut.",
			"Keep dreaming if you think you’re getting paid.",
			"Not happening, darling. That wasn’t worth it.",
			"You call that help? You get nothing.",
		]
	if(_id == "HelpRestraintsRefusePayWhatever"):
		return [
			"Fine, stay worthless.",
			"Whatever. Go on and whine.",
			"Sure, have it your way. Still pathetic.",
			"Alright, cry about it.",
			"Yeah, whatever, not my problem.",
		]
	if(_id == "SlutwallStealCredits"):
		return [
			"Not like a slut like you needs these credits.",
			"You don’t deserve a single one of these, cutie.",
			"I’ll take those, pet. You’ve earned nothing.",
			"Credits? For you? Don’t make me laugh.",
			"These belong to me now. You don’t need them, whore.",
			"A slut like you doesn’t need credits. You’ll get used either way.",
			"These are better off with me, slut.",
			"Not like you’ll notice they’re gone, pet.",
			"Credits for a used-up whore like you? Nah.",
			"I’ll take these. You can stay in the wall.",
		]
	if(_id == "SlutwallAddTip"):
		return [
			"There’s something for being a good little pet.",
			"Good whore. You earned this, for once.",
			"You’re such a good fucktoy. Here’s a reward.",
			"That’s for being a nice, obedient slut.",
			"Here’s something for taking it like a good little whore.",
		]
	if(_id == "StocksShout"):
		return [
			"Anyone want to help? I’m not going anywhere!",
			"Come on, someone’s gotta be nearby. Help me out!",
			"Anyone out there? Get me out of this, now!",
			"I could use a little assistance here, if anyone’s feeling generous!",
			"Hey, get over here! I need help!",
			"Anyone around? I’m not exactly going anywhere, help!",
			"Someone’s gotta be nearby, come help me!",
			"Help me out, I’m stuck in here!",
		]
	if(_id == "ProstitutionStart"):
		return [
			"Looking for a good time, sweet thing?",
			"Want me and you to have some fun?",
			"Ready to be satisfied in a good way?",
			"Wanna feel good, sweetheart?",
			"How about you and me have some fun?",
			"Looking for a real fuck?",
			"Care for a rough time, sweetheart?",
		]
	if(_id == "ProstitutionOffer"):
		return [
			"What filthy little fantasy do you have for me?",
			"What are you begging for this time?",
			"Tell me what you’re willing to do, slut.",
			"So, what kind of dirty fun do you want?",
			"What filthy game are you ready for?",
			"How much are you willing to give up for me, pet?",
			"What’s your pathetic offer, brat?",
			"How do you want to be used?",
		]
	if(_id == "ProstitutionUsual"):
		var creds = str(getVar(_args, "credits", 0))
		return [
			"The usual. I will let you fuck me for "+creds+" credits.",
			"The usual. "+creds+" credits, and I'm yours. For a bit.",
			"For "+creds+" credits, you get to have some fun with my body.",
		]
	if(_id == "ProstitutionServiceDom"):
		var creds = str(getVar(_args, "credits", 0))
		return [
			"I’ll make you beg, just "+creds+" credits.",
			"I’ll break you and make you love it. "+creds+" credits.",
			"For "+creds+" credits, I’ll take total control of you.",
			"You’ll be mine to toy with for "+creds+" credits.",
			"I’ll make you scream my name for "+creds+" credits.",
			"Give me "+creds+" credits and I’ll make you my bitch.",
			"For "+creds+" credits, I’ll dominate you like you’ve never known.",
		]
	if(_id == "ProstitutionPricySlut"):
		var creds = str(getVar(_args, "credits", 0))
		return [
			"I’m worth every credit, pet. Just "+creds+" credits and I’ll show you why.",
			"For "+creds+" credits, I’ll make you forget your own name.",
			"You know you want this, slut. "+creds+" credits.",
			"Pay the price, brat. "+creds+" credits and I’ll make you mine.",
			"I cost more because I’m better. "+creds+" credits and I’ll prove it.",
			"You’ll pay, because I’m worth it. "+creds+" credits.",
			"Expensive? Maybe. Worth it? Definitely. "+creds+" credits.",
			"You’ll love it, sweet thing. "+creds+" credits.",
			"Pleasure like mine comes at a price. "+creds+" credits.",
		]
	if(_id == "ProstitutionDenied"):
		return [
			"Nah, sorry cutie.",
			"Not today, sweetheart. Got places to be.",
			"Not today, sweetheart. I'm a little busy.",
			"Sounds fun. But maybe some other time.",
		]
	if(_id == "ProstitutionDeniedWhatever"):
		return [
			"Whatever, I don’t have time for weaklings.",
			"Fine, someone else deserves this anyway.",
			"Your loss, I’d have made you scream.",
			"Whatever, you weren’t worth my attention anyway.",
			"Suit yourself, I’ll find someone better.",
			"Fine, brat. You’re not worth it.",
			"Your loss, someone else will get ruined tonight.",
			"I don’t need you anyway, loser.",
		]
	if(_id == "ProstitutionAccept"):
		return [
			"Alright, let’s see if you can handle this, cutie.",
			"Let’s see if you can keep up, sweetheart.",
			"Okay, show me if you’re worth the credits.",
			"Sure, let’s see what you’re packing, cutie.",
		]
	if(_id == "ProstitutionDemandCreds"):
		return [
			"That was pathetic. Give me my fucking credits back.",
			"You call that a fuck? Give me my credits.",
			"That wasn’t even close to worth it. Credits, now.",
			"That was a joke. Hand over my credits.",
			"Terrible. Give me my money back, slut.",
			"Not worth it at all. Credits, now.",
			"That sucked. Hand over my credits, brat.",
			"You failed. I want a refund.",
			"That was embarrassing. Credits back, now.",
			"I’m done. Give me my fucking credits back.",
		]
	if(_id == "ProstitutionRefuseReturnCreds"):
		return [
			"Not a fucking chance. Get lost.",
			"No refunds, you pathetic bitch.",
			"You got what you paid for, loser.",
			"Not happening. You should be grateful I even touched you.",
			"You wish. Now fuck off, brat.",
			"Not a chance. I earned every credit.",
			"I’m keeping it. Now get the fuck out of my face.",
			"Fuck off. The credits are mine.",
			"Not happening. You should be paying more.",
			"Nope. Get lost, slut.",
		]
	if(_id == "ProstitutionScam"):
		return [
			"Actually, my price just went up. 5 more credits, slut~.",
			"You know what? You’re gonna pay more. 5 extra credits.",
			"Price increase, brat. 5 more credits or get lost.",
			"Decided I’m worth more, sweetheart~. 5 more credits.",
			"You’ll have to cough up more. 5 extra credits.",
			"I changed my mind. 5 more credits if you want to keep going.",
			"I’m raising the price, slut. 5 more credits.",
			"On second thought, I’m worth more~. 5 more credits.",
			"I’m upping the price. 5 more credits, now.",
		]
	if(_id == "PunishDecide"):
		return [
			"Hmm... What should I do with a pathetic little slut like you?",
			"Time to decide what kind of fun I’ll have with you, brat.",
			"Let’s see what a naughty pet like you deserves.",
			"Decisions, decisions... What’s the best way to make you squirm?",
			"How shall I break you today, sweet thing?",
		]
	if(_id == "PunishDecideStocks"):
		return [
			"The stocks will make sure you’re right where I want you.",
			"You’ll look perfect squirming in the stocks, whore.",
			"Stocks are fitting for a brat like you. Let’s see you struggle.",
			"Time to lock you up nice and tight, slut.",
			"The stocks will keep that pretty ass in place for me.",
		]
	if(_id == "PunishAboutToStocks"):
		return [
			"Bend over, slut. It’s time.",
			"Ass up, brat. Let’s get you in position.",
			"Bend over, sweet thing. Time to learn your place.",
			"Spread those legs and bend over. I want to see every inch.",
			"Bend that pretty little ass over now.",
		]
	if(_id == "PunishLockIntoStocks"):
		return [
			"All locked up, just how I like you.",
			"Nice and secure, sweetheart. Now the fun begins.",
			"Hope you enjoy your new view, because you’re not going anywhere.",
			"Locked tight. Now let’s see who’ll take advantage of you first.",
			"You’re not going anywhere, whore. Let’s see how long you last.",
			"Welcome to your new reality, slut.",
		]
	if(_id == "PunishSex"):
		return [
			"I’m going to ruin you, slut.",
			"You’re mine, and I’ll make sure you feel it.",
			"Time to fuck you senseless, sweet thing.",
			"I’ll enjoy breaking you down piece by piece.",
			"Let’s see how loud I can make you scream, pet.",
			"You’re nothing but a toy for me to play with.",
		]
	if(_id == "PunishSubSex"):
		return [
			"On second thought, I’ll let you take control.. if you can handle it.",
			"Changed my mind. Do your worst, if you can even manage that.",
			"I’ll let you pretend you’re in charge. Have your fun, pet.",
			"Guess what? I’m yours for now. Let’s see what you can do, sweetheart.",
			"Fine, I’ll let you have a taste of being in control. Don’t waste it.",
			"I’ll be your plaything this time. Try not to disappoint me, brat.",
			"You know what.. Go ahead, I’m all yours.. for now.",
			"I’ll let you fuck me if you think you’re up to the task.",
		]
	if(_id == "PunishDecidedSlutwall"):
		return [
			"Your ass will look so good mounted in the slutwall for all to use~.",
			"Let’s put that pretty little ass where it belongs — in the slutwall~.",
			"You’ll look perfect in the slutwall, begging to be used~.",
			"The slutwall is exactly where a whore like you belongs~.",
			"Can’t wait to see you stuffed and squirming in the slutwall~.",
			"Slutwall’s calling your name. Let’s see how many use you~.",
			"You were made for the slutwall. Let’s put that mouth and ass to work~.",
			"You’ll fit perfectly in the slutwall. Let’s make sure everyone knows it~.",
		]
	if(_id == "PunishLockIntoSlutwall"):
		return [
			"All set, slut. Enjoy your new home.",
			"Locked in, nice and tight. Ready for anyone who wants you.",
			"Get comfortable, whore. You’re gonna be here for a while.",
			"Hope you like being a public toy, because you’re not going anywhere.",
			"Locked in and ready to be used. Let’s see how long it takes for them to break you.",
			"Enjoy your stay, slut. You’re exactly where you belong.",
		]
	if(_id == "TalkChatWhat"):
		return [
			"What’s on your mind, cutie?",
			"Got something important to say, or just wasting my time?",
			"Spit it out, cutie. I don't have all day.",
			"What's on your dirty little mind?",
			"Go ahead, entertain me, sweetheart.",
			"Are you finally ready to speak, brat?",
		]
	if(_id == "TalkChatCancel"):
		return [
			"I changed my mind. Sorry cutie.",
			"Oh, right. Never mind, sweetie.",
			"Oops, I forgot something. Sorry.",
			"Yeah, forget it, my bad.",
		]
	if(_id == "TalkChatLeaving"):
		return [
			"Alright. I gotta go, cutie.",
			"I'm leaving, this is boring, sorry.",
			"Gotta run off, can't stay here forever.",
			"I’m done playing with you for now. Gotta go.",
		]
	if(_id == "TalkChatAgree"):
		return [
			"Yes, good. Great even.",
			"That's right. I agree.",
			"Yeah. Yeah!",
			"Yep, exactly.",
			"I like the way you think, cutie.",
			"Yes. Big yes.",
			"I agree wtih you, sweetie.",
		]
	if(_id == "TalkChatDisagree"):
		return [
			"You’re wrong, brat. And deep down, you know it.",
			"I disagree.",
			"Oh, you’re so wrong. It’s cute.",
			"Keep talking like that, and I’ll put you back in your place.",
			"Nah. That is such a bad take.",
			"That mouth of yours is going to get you into trouble.",
			"Nu huh. Not even close.",
			"Wrong. Very much wrong.",
		]
	if(_id == "TalkChatWhatever"):
		return [
			"Whatever, sweet thing.",
			"Say what you want, pet. I don't care much.",
			"This doesn't matter to me. As long as they obey..",
		]
	if(_id == "TalkChatPickupLine"):
		return [
			"Are you a leash? Because you keep me tied up thinking about you.",
			"If I had a collar for every time I thought of you, you'd never get out of it.",
			"Is that body for free use? Because I could claim it all night.",
			"Are you a good little slut, or do I have to make you one?",
			"You're cute, but you'd look better on your knees.",
			"You must be exhausted. You've been running through my mind. You just need someone to tie you down.",
			"You'd look cute with my hand around your throat.",
			"Are you a naughty pet? Or should I make you one?",
			"Be careful, sweet thing. I might just keep you.",
			"I’m not just into looks.. I’m into breaking brats like you.",
		]
	if(_id == "TalkChatPickupLineFail"):
		return [
			"That was embarrassing. Try harder, slut.",
			"Wow, that was bad. Stick to begging.",
			"You're awful at this. Better let me take control.",
			"Don’t quit your day job, brat.",
			"Yikes, that was painful. Stick to moaning for me.",
			"That was pathetic. You’d better be better at other things.",
			"Terrible. You’re lucky you're cute.",
		]
	if(_id == "TalkFlirtAccept"):
		return [
			"Maybe you’re not as useless as you look, cutie.",
			"Yeah, you’ve got potential. I could mold you into something.",
			"I like that confidence, brat. Let’s see how long it lasts.",
			"You’re charming, but remember, you’re still mine.",
			"I like the way you talk. Let’s see if you can back it up.",
		]
	if(_id == "TalkFlirtDeny"):
		return [
			"Not interested in that, pet. But nice try.",
			"You’re cute, but not cute enough for me.",
			"Sweetheart, I don’t play with just anyone.",
			"You're barking up the wrong tree, brat.",
		]
	if(_id == "TalkSexOffer"):
		return [
			"Let’s get dirty, right now. No need for pleasantries.",
			"I’m gonna ruin you, slut.",
			"How about I take what’s mine?",
			"You know you want to be fucked, don’t you?",
			"I’m going to use every inch of you until you can’t think.",
			"Let’s not waste any more time. I’ll fuck you hard.",
		]
	if(_id == "TalkSexOfferAccept"):
		return [
			"I’m down. Let’s see what you can do.",
			"Good. Get ready, because I want all of it.",
			"I’ll fuck you me. Just this time~.",
			"You’re gonna regret offering that. In the best way.",
		]
	if(_id == "TalkSexOfferDeny"):
		return [
			"I’m not in the mood for a brat like you.",
			"You? Nah, you couldn’t handle me.",
			"Not tonight, sweet thing.",
			"I’ll pass. Maybe another time.",
		]
	if(_id == "TalkSexOfferSelf"):
		return [
			"How about you bend me over and claim what’s yours?",
			"I’m all yours, if you can handle me.",
			"You wanna fuck me, don’t you? Take me now.",
			"I’ll be yours, just don’t disappoint me.",
			"Take me right here. Show me what you’ve got.",
		]
	if(_id == "TalkSexOfferSelfAccept"):
		return [
			"You’re getting fucked, right now.",
			"Good. You’re about to find out what it means to be mine.",
			"I’ll fuck you senseless.",
			"I’ll make sure you remember this for a long time.",
		]
	if(_id == "TalkSexOfferSelfDeny"):
		return [
			"Not tonight, pet. Try harder next time.",
			"You’re cute, but not enough.",
			"Not right now, maybe later.",
			"I’ll pass. You’re not ready for me.",
		]
	if(_id == "TalkGrabAndFuck"):
		return [
			"You’re mine now, slut. Don’t even think of resisting.",
			"You’re not leaving until I’ve had my fun with you.",
			"Stay still, I’m about to fuck you into submission.",
			"I’m gonna break you, slut.",
			"You're not going anywhere until I'm satisfied.",
			"That gear looks good on you. Now let's see what else I can do to you.",
			"You’re staying right here, where you belong. Beneath me.",
		]
	if(_id == "TalkAboutToKidnap"):
		return [
			"You’re mine now, pet. Got that?",
			"You belong to me. Understand?",
			"From now on, you do as I say. Understood?",
			"I own you now, sweet thing. Got it?",
			"Get used to it, you’re mine from now on. Understand?",
		]
	if(_id == "TalkAboutToKidnapReact"):
		return [
			"O-Okay.. I understand..",
			"Y-Yes.. W-whatever you want..",
			"F-fine.. You’re in charge..",
			"O-Okay.. Please don’t hurt me..",
		]
