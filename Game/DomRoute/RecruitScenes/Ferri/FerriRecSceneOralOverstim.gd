extends RecruitSceneBase

var straponUsed = false
var vagVariant = false

func _init():
	sceneID = "FerriRecSceneOralOverstim"

func _reactInit():
	putOn("ferri", "inmatewristcuffs")
	putOn("ferri", "basketmuzzle")

func _run():
	if(state == ""):
		addCharacter("ferri", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		straponUsed = (extra("strapon", "") != "") && (extra("variant", "") == "strapon")
		vagVariant = (extra("variant", "") == "vaginal")
		playAnimation(StageScene.Duo, "stand", {npc="ferri", npcBodyState={naked=true}})
		saynn("You ask your team for a ring gag.. and something special just for this occasion. Kait gives you both, the restraint and some kind of.. aphrodisiac drug. Apparently she just mixed some random ones. What's the worst that could happen?")

		saynn("And so you step inside the cell. Ferri is still here, naked, cuffed, muzzled and leashed to the pipe.")

		saynn("Her cyan eyes lock onto you the second you step inside.")

		saynn("[say=ferri]Finally. You took your sweet time, meanie.. Unlock me already..[/say]")

		saynn("You hold up the ring gag. Her pupils shrink.")

		saynn("[say=ferri]Mew?! No way. I'm not putting that thing in my mouth.[/say]")

		saynn("[say=pc]"+str(ch1("You don't get to say no.", "Shut up and open wide, slut.", "You're mine to use and abuse. Accept it."))+"[/say]")

		saynn("[say=ferri]I'll bite your fingers off![/say]")

		saynn("She can't do that with the muzzle currently, the metal basket stops her fangs. But you gotta replace it somehow.")

		saynn("So you grab Ferri by the horns. She yelps, a shiver going down her spine as you get a good grip on them.")

		saynn("[say=ferri]M-mew.. don't.. don't touch those..[/say]")

		saynn("Right. Seems like you just gotta touch them more.")

		saynn("[say=pc]"+str(ch1("Then behave.", "Too late, bitch.", "You're so sensitive. Pathetic."))+"[/say]")

		saynn("While Ferri is busy squirming from you rubbing her horns, you take off her muzzle and shove the ring gag between her teeth. She is quick to try to spit it out but you buckle it tight behind her head.")

		saynn("[say=ferri]I'm.. not.. g-good.. with.. huff..[/say]")

		saynn("That's all she manages to say before you gag her.")

		addButton("Continue", "See what happens next", "pp_start")
	if(state == "pp_start"):
		playAnimation(StageScene.SexOralForced, "tease", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Her jaw is now locked open, drool already starts pooling at the corners of her lips.")

		saynn("Her eyes go wide as you pull out a small vial, the liquid inside is pink and glowing faintly. You pour it into Ferri's mouth, causing her to cough. But the gag and your hold on her horns makes her unable to spit all of it out.")

		saynn("[say=pc]"+str(ch1("Just enjoy it, cutie.", "Enjoy it, little slut.", "Enjoy it, whore."))+"[/say]")

		saynn("You grab her leash and yank her forward, making her stumble onto her knees. Then, you unlock her cuffs for a second, so that you could grab her arms and bring them high above her head.")

		saynn("[say=ferri]Mmnh..[/say]")

		if (straponUsed):
			saynn("You swiftly secure a strapon harness around your waist, the tip hovering near her maw. Good luck biting now.")

			addButton("Continue", "See what happens next", "pp_fuck")
		elif (!vagVariant):
			saynn("Your cock is already out and hard, hovering near her maw. Good luck biting now.")

			addButton("Continue", "See what happens next", "pp_fuck")
		else:
			saynn("Your pussy is already exposed, hovering near her maw. Good luck biting now.")

			addButton("Continue", "See what happens next", "vag_fuck")
	if(state == "pp_fuck"):
		playAnimation(StageScene.SexOralForced, "suck", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("And so you slide your "+str("cock" if !straponUsed else "rubber shaft")+" through the convenient ring, forcing yourself into Ferri's mouth.. and going deeper too, past her teeth and straight into her throat.")

		saynn("[say=ferri]Ggk-![/say]")

		saynn("Her eyes water instantly. She gags, her tail slams against the floor.")

		saynn("[say=pc]"+str(ch1("Breathe through your nose.", "Shut up and take it.", "There we go. Good little hole."))+"[/say]")

		saynn("You start slow, letting her throat walls convulse around "+str("you" if !straponUsed else "the toy")+". Then you get a better grip and shove all the way to the base! Her nose presses against your crotch.")

		saynn("[say=ferri]Mrrrrnngh..![/say]")

		saynn("[say=pc]"+str(ch1("That's it. Take all of it.", "Such a good little cock sleeve.", "Your throat was made for this."))+"[/say]")

		saynn("You begin to fuck her face. Hard and rough. Each thrust slams the ring gag against her teeth. Drools is quick to spay out of her mouth, her tears mixing with it. Her raised cuffed arms are forcing her to stay in one place for you. She can't do anything, can't even bite.")

		saynn("Whatever that drug is, it seems to be doing something. It certainly makes it so fucking her throat is much pleasurable for you. Every inch of her lips, her tongue, her throat.. they all wrap around your "+str("member" if !straponUsed else "rubber cock")+" so well.")

		saynn("You feel her start to shake, her gagged wet noises getting louder.")

		saynn("[say=pc]"+str(ch1("There it is. Feel good?", "You're clenching around me. Dirty bitch.", "You like it. The bratty little slut likes it."))+"[/say]")

		saynn("Suddenly, Ferri's hips begin to jerk. Her tail smacks against the floor again. Seconds later, a wet, gushing sound comes from between her thighs. She is orgasming.. hard.")

		saynn("[say=ferri]HNNNN-!..[/say]")

		saynn("Her whole body arches, her eyes roll back, her pussy spraying the floor. And you don't stop. You keep pounding her throat through the whole thing.")

		addButton("Continue", "See what happens next", "pp_cum")
	if(state == "pp_cum"):
		playAnimation(StageScene.SexOralForced, "suckfast", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You pick up the pace, sliding your "+str("cock" if !straponUsed else "strapon")+" in and out of that throat faster!")

		saynn("Ferri barely has time to breathe before the next orgasm hits.. and then the third one too, stacking with the second. Her body keeps trying to convulse, her tail thrashing, her muffled noises turning into wet, desperate squeals around your cock.")

		saynn("[say=ferri]Hfff.. hff.. MMM-! MMPH-![/say]")

		saynn("Her eyes are just constantly rolled up by this point, her pussy keeps making a puddle of juices underneath her.")

		if (!straponUsed):
			saynn("And so you feel your own climax building.")

			saynn("[say=pc]"+str(ch1("You're gonna swallow every drop.", "Get ready, slut", "Take it like the worthless whore you are."))+"[/say]")

			saynn("You bury yourself to the hilt, your cock pulsing. Thick ropes of {pc.cum} shoot straight down her throat. She gags more.. but is forced to swallow, she has no choice. The ring gag keeps her mouth wide open while you're pumping her full of your stuff, the drug is making her cum for the fourth time, her pussy pulsing around nothing, squirting nothing too..")

			saynn("[say=ferri]Glk.. glk.. nnngh..[/say]")

			saynn("You make sure your balls are drained by that brat, staying inside as long as possible. It does look like she is about to pass out though.. so it's time to stop.")

		else:
			saynn("You feel like you gotta end on a high note..")

			saynn("[say=pc]"+str(ch1("Get ready.", "Get ready, slut", "Take it like the worthless whore you are."))+"[/say]")

			saynn("And so you bury the rubber toy to the hilt, really testing that brat's throat. She gags more.. but is forced to endure it, she has no choice. The ring gag keeps her mouth wide open while you're stretching her out, the drug is making her cum for the fourth time, her pussy pulsing around nothing, squirting nothing too..")

			saynn("[say=ferri]Glk.. glk.. nnngh..[/say]")

			saynn("You make sure to stay inside as long as possible. It does look like she is about to pass out though.. so it's time to stop.")

		addButton("Continue", "See what happens next", "pp_pullout")
	if(state == "pp_pullout"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="ferri", bodyState={naked=true, hard=true}})
		saynn("When you finally pull out, Ferri collapses. Her body twitches with small aftershocks, her tail lies limp.")

		saynn("You pick up the basket muzzle and replace the ring gag with it. Her fangs click against the metal.")

		saynn("[say=ferri]Ghk.. ugh..[/say]")

		saynn("Her voice is weak, hoarse.")

		saynn("[say=pc]"+str(ch1("Good girl. Rest now.", "That's what you get for being a brat.", "You're lucky I didn't go longer."))+"[/say]")

		saynn("You step out of the cell to see what Kait thinks.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "vag_fuck"):
		playAnimation(StageScene.SexOralForced, "lick", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("And so you shove your pussy into Ferri's face, pressing your slick folds against her parted lips. Her mouth is forced open and her tongue is out, she has no choice but to lick you.")

		saynn("[say=ferri]Ghh..[/say]")

		saynn("You start slowly, sliding your slit against her face, letting her tongue do some work.")

		saynn("[say=ferri]Mrhhh..[/say]")

		saynn("[say=pc]"+str(ch1("That's it. Lick all of it.", "Such a good little cunt licker.", "Your tongue was made for this."))+"[/say]")

		saynn("Soon, you begin to just grind her face, hard and rough. Each thrust of your hips brings you immense pleasure, causing you to start moaning. Her drool and your juices are mixing together. Her raised cuffed arms force her to stay in one spot for you. She can't do anything, can't even bite.")

		saynn("Whatever that drug is, it seems to be doing something. It certainly makes it so riding her face is much more fun for you. Every flick of her tongue, every desperate suck of her parted lips sends waves of heat through you.")

		saynn("You feel her start to shake, her gagged wet noises getting louder.")

		saynn("[say=pc]"+str(ch1("There it is. Feel good?", "You're getting off this, dirty bitch.", "You like it. The bratty little slut likes it."))+"[/say]")

		saynn("Suddenly, Ferri's hips begin to jerk. Her tail smacks against the floor again. Seconds later, a wet, gushing sound comes from between her thighs. She is orgasming.. hard.")

		saynn("[say=ferri]HNNNN-!..[/say]")

		saynn("Her whole body arches, her eyes roll back, her pussy spraying the floor. And you don't stop. You keep grinding against her face through the whole thing.")

		addButton("Continue", "See what happens next", "vag_cum")
	if(state == "vag_cum"):
		playAnimation(StageScene.SexOralForced, "lickfast", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You pick up the pace, grinding your pussy against her mouth faster and harder!")

		saynn("Ferri barely has time to breathe before the next orgasm hits.. and then the third one too, stacking with the second. Her body keeps trying to convulse, her tail thrashing, her muffled noises turning into wet, desperate squeals against your folds.")

		saynn("[say=ferri]Hfff.. hff.. MMM-! MMPH-![/say]")

		saynn("Her eyes are just constantly rolled up by this point, her pussy keeps making a puddle of juices underneath her.")

		saynn("And so you feel your own climax getting close..")

		saynn("[say=pc]"+str(ch1("You're gonna swallow every drop.", "Get ready, slut.", "Take it like the worthless whore you are."))+"[/say]")

		saynn("As soon as you push yourself over the peak, you bury her face between your legs, pressing her parted lips against pulsing yours.. Your muscles clench.. and then you squirt! Thick jets of your juices shooting straight past the ring gag and into her throat. She gags.. but is forced to swallow, she has no choice. The ring gag keeps her mouth wide open while you're just letting go.. the drug making her cum for the fourth time, her own pussy pulsing around nothing, squirting nothing too..")

		saynn("[say=ferri]Glk.. glk.. nnngh..[/say]")

		saynn("You make sure your orgasm ends.. And eventually it does.")

		addButton("Continue", "See what happens next", "vag_pullout")
	if(state == "vag_pullout"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="ferri", bodyState={naked=true, hard=true}})
		saynn("When you finally pull your slit away from her face, Ferri collapses. Her body twitches with small aftershocks, her tail lies limp.")

		saynn("You pick up the basket muzzle and replace the ring gag with it. Her fangs click against the metal.")

		saynn("[say=ferri]Ghk.. ugh..[/say]")

		saynn("Her voice is weak, hoarse.")

		saynn("[say=pc]"+str(ch1("Good girl. Rest now.", "That's what you get for being a brat.", "You're lucky I didn't go longer."))+"[/say]")

		saynn("You step out of the cell to see what Kait thinks.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "pp_start"):
		putOff("ferri", "basketmuzzle")
		putOn("ferri", "ringgag")
		if(straponUsed):
			recWearStrapon()

	if(_action == "pp_cum"):
		if(straponUsed):
			getCharacter("ferri").cummedInMouthBy("pc", FluidSource.Strapon)
		else:
			getCharacter("ferri").cummedInMouthBy("pc", FluidSource.Penis)
		GM.pc.orgasmFrom("ferri")

	if(_action == "pp_pullout"):
		putOff("ferri", "ringgag")
		putOn("ferri", "basketmuzzle")
		recRemoveStrapons()

	if(_action == "vag_cum"):
		getCharacter("ferri").cummedInMouthBy("pc", FluidSource.Vagina)
		GM.pc.orgasmFrom("ferri")

	if(_action == "vag_pullout"):
		putOff("ferri", "ringgag")
		putOn("ferri", "basketmuzzle")

	setState(_action)

func saveData():
	var data = .saveData()

	data["straponUsed"] = straponUsed
	data["vagVariant"] = vagVariant

	return data

func loadData(data):
	.loadData(data)

	straponUsed = SAVE.loadVar(data, "straponUsed", false)
	vagVariant = SAVE.loadVar(data, "vagVariant", false)
