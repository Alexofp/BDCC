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
		]

func getText(_id:String, _args:Dictionary):
	if(_id == "FightLostGeneric"):
		return [
			getPainNoise()+".. I can't..",
			getPainNoise()+".. you win this round..",
			getPainNoise()+" I.. I.. fuck..",
			getPainNoise()+", I guess you got me..",
			getPainNoise()+".. I thought I had you..",
			getPainNoise()+".. you really got me there..",
		]
	if(_id == "FightWonGeneric"):
		return [
			"That was easy.",
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
	
func getPainNoise():
	return RNG.pick([
		"Argh",
		"Ugh",
		"Ghh",
		"Ahhh!",
		"Gah",
		"Fuck",
	])
