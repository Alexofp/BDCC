extends DialogueFiller

func getFormIDs() -> Array:
	return [
		"FightLostGeneric",
		"FightWonGeneric",
		
		"GuardCaughtOffLimits",
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
	
