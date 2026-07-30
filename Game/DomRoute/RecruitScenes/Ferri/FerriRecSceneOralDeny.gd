extends RecruitSceneBase

var straponUsed = false
var vagVariant = false

func _init():
	sceneID = "FerriRecSceneOralDeny"

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
		saynn("You ask your team for a ring gag.. and something a little different. Kait raises an eyebrow but hands you a small pink toy.. a bullet egg.. and some tape.")

		saynn("And so you step inside the cell. Ferri is still here, naked, cuffed, muzzled and leashed to the pipe.")

		saynn("Her cyan eyes lock onto you the second you step inside.")

		saynn("[say=ferri]Finally. You took your sweet time, meanie.. Unlock me already..[/say]")

		saynn("You hold up the ring gag. Her pupils shrink.")

		saynn("[say=ferri]Mew?! No way. I'm not putting that thing in my mouth.[/say]")

		saynn("[say=pc]"+str(ch1("You don't get to say no.", "You'll wear what I give you.", "Open up, silly kitten."))+"[/say]")

		saynn("[say=ferri]I'll bite your fingers off![/say]")

		saynn("She can't do that with the muzzle currently, the metal basket stops her fangs. But you gotta replace it somehow.")

		saynn("So you grab Ferri by the horns. She yelps, a shiver going down her spine as you get a good grip.")

		saynn("[say=ferri]M-mew.. don't.. don't touch those..[/say]")

		saynn("Right. That works in your favor.")

		saynn("[say=pc]"+str(ch1("Then behave.", "Too late for that.", "You're so sensitive. Cute."))+"[/say]")

		saynn("While Ferri is busy squirming from you rubbing her horns, you take off her muzzle and shove the ring gag between her teeth. She tries to spit it out but you buckle it tight behind her head.")

		saynn("[say=ferri]I'm.. not.. g-good.. with.. huff..[/say]")

		saynn("That's all she manages before you gag her.")

		addButton("Continue", "See what happens next", "pp_start")
	if(state == "pp_start"):
		playAnimation(StageScene.ChairOral, "tease", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Her jaw is now locked open, drool already pooling at the corners of her lips.")

		saynn("You kneel down and part her thighs. She tries to close them, but you just force-spread them.")

		saynn("[say=ferri]Mmmph?![/say]")

		saynn("You press a small pink bullet vibrator against her clit and then you use tape to make it stick to her crotch. The toy rests right on her sensitive nub. The remote is now in your hand.")

		saynn("[say=ferri]Mmmph..[/say]")

		saynn("[say=pc]"+str(ch1("Shh. It's just a little helper.", "You'll thank me later.", "Don't worry, silly kitten."))+"[/say]")

		saynn("You click the button.")

		saynn("The toy starts buzzing between her legs!")

		saynn("Ferri jolts, a muffled squeak escaping her gag, her hips twitch.")

		saynn("After that, you sit on the chair that was always here and pull Ferri closer by using her leash.")

		if (straponUsed):
			saynn("You also quickly secure a strapon harness around your waist too, its rubber tip already hovering near Ferri's lips.")

		elif (vagVariant):
			saynn("Your pussy is already exposed, slick and waiting.")

		else:
			saynn("Your {pc.penis} is already out, half-hard, resting not that far from Ferri's lips.")

		saynn("[say=pc]"+str(ch1("You know what to do.", "Don't keep me waiting, slut.", "Get to work, worthless."))+"[/say]")

		saynn("Ferri glares up at you, but her tail gives a nervous flick. She slowly leans forward.")

		saynn("You get a grip on one of her horns. Might as well encourage her.")

		if (straponUsed):
			addButton("Continue", "See what happens next", "pp_fuck")
		elif (!vagVariant):
			addButton("Continue", "See what happens next", "pp_fuck")
		else:
			addButton("Continue", "See what happens next", "vag_fuck")
	if(state == "pp_fuck"):
		playAnimation(StageScene.ChairOral, "suck", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Ferri lets the tip of your "+str("member" if !straponUsed else "shiny member")+" go through her ring gag and starts sucking on it."+str(" You don't feel a single thing.. but it looks pretty hot." if straponUsed else "")+"")

		saynn("You raise the toy's power a bit, making it buzz louder.")

		saynn("[say=ferri]Mrrrph![/say]")

		saynn("She tries to jerk away but your hand is quick to pull her back. Her tongue swirls around your"+str(" rubber" if straponUsed else "")+" shaft on instinct.")

		saynn("[say=pc]"+str(ch1("That's it. Keep sucking.", "Don't stop. Use that tongue, little slut.", "Good slut. So obedient."))+"[/say]")

		saynn("You stroke her horns slowly, sending more shivers down her spine. Her hips start to rock, the toy working hard against her clit.")

		saynn("She bobs her head, taking you deeper, drool running down your shaft, her tail curling.")

		saynn("You watch her face. Her breathing gets faster, more desperate, her thighs already clench.")

		saynn("[say=ferri]Hff.. hfff.. mmngh..[/say]")

		saynn("She is close, you can tell. And so you click the remote, making the buzz go away.")

		saynn("[say=ferri]Mmm?..[/say]")

		saynn("She pulls back, gasping through her nose, her eyes wide and angry.")

		saynn("[say=pc]"+str(ch1("Too fast, kitty. Too fast.", "I decide when you cum. Not yet.", "You don't get to cum. Not until I allow it."))+"[/say]")

		saynn("Ferri growls softly.")

		saynn("[say=pc]"+str(ch1("Back to work.", "Don't make me wait, slut.", "You want the vibrations back? Then earn them, you stupid cunt."))+"[/say]")

		saynn("She glares but lowers her head again, taking your "+str("cock" if !straponUsed else "strapon")+" deeper this time. More aggressively. Her tongue presses flat against the underside.")

		saynn("You click the remote.")

		saynn("[say=ferri]Nngh-..[/say]")

		saynn("She moans around your shaft, the vibrations hitting her clit directly. You stroke her horns faster, rougher.")

		saynn("Her hips grind against the air. Drool spills down her chin.")

		saynn("Soon her body gets all tense again, her tail goes rigid. That's when you turn off the toy again.")

		saynn("[say=ferri]Huff-f-f![/say]")

		saynn("She pulls her mouth off your "+str("cock" if !straponUsed else "rubber shaft")+" and whines.. a high, pathetic, desperate sound.")

		saynn("[say=pc]"+str(ch1("No, kitty.", "Not yet.", "Begging already? How cute."))+"[/say]")

		saynn("Her eyes are wet, her pussy soaked. You can see it glistening between her thighs, the pink bullet still taped to her cyan clit.")

		saynn("[say=pc]"+str(ch1("Don't stop sucking if you wanna cum.", "Keep sucking if you wanna cum.", "Keep sucking if you wanna cum, silly."))+"[/say]")

		saynn("Ferri nods frantically.")

		addButton("Continue", "See what happens next", "pp_fast")
	if(state == "pp_fast"):
		playAnimation(StageScene.ChairOral, "suckfast", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("She dives back onto your"+str(" shiny" if straponUsed else "")+" cock, taking it to the base. Her throat works around you, gagging but determined.")

		saynn("You click the remote and continue stroking her horns idly.")

		saynn("[say=ferri]Hrrrnmhh..[/say]")

		saynn("Her hips buck wildly. The vibrations are on full power now.. her clit getting stimulated hard. All the while you let your digits slide along the ridges of her horns.")

		saynn("[say=pc]"+str(ch1("That's it. Take all of it.", "Don't stop. Don't you dare stop.", "Suck. Suck like the desperate kitten you are."))+"[/say]")

		saynn("Ferri's whole body shakes. Her tail thrashes. Tears and drool mix on her chin.")

		saynn("Her moans turn into frantic, wet slurps around your shaft.")

		saynn("She is about to cum."+str(" And so are you." if !straponUsed else "")+"")

		addButton("Continue", "See what happens next", "pp_cum")
	if(state == "pp_cum"):
		playAnimation(StageScene.ChairOral, "suckinside", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Feeling incredibly mean, you turn off the toy.")

		saynn("[say=ferri]H-Huff![/say]")

		saynn("And before she tries to pull away, you use her horns to shove her down onto your "+str("cock" if !straponUsed else "shiny shaft")+", forcing it deep into her throat.")

		saynn("[say=ferri]GGHHHK-![/say]")

		saynn("She gags and thrashes against her restraints.. but she can't escape. Your hips thrust to meet her mouth, your hands drag her face along your length!")

		if (!straponUsed):
			saynn("[say=pc]"+str(ch1("You don't get to cum. But I do.", "Get denied, slut. Take it. Take all of it.", "No cumming for stupid brats. Swallow. Now."))+"[/say]")

			saynn("Her throat clenches hard.. Your orgasm hits fast. Your dick starts pulsing.. and shooting thick ropes of {pc.cum} directly down her throat. She has no choice but to swallow it all, gagging and choking in the process, her eyes streaming tears.")

			saynn("[say=ferri]Glk.. glk.. nngh..[/say]")

			saynn("You hold her there until the last spasm, your balls empty.")

		else:
			saynn("[say=pc]"+str(ch1("You don't get to cum. Just choke.", "Get denied, slut. Just choke on this.", "No cumming for stupid brats. Choke on this instead."))+"[/say]")

			saynn("Her throat clenches hard.. She is indeed choking and gagging on your toy, her eyes streaming tears. You don't feel a thing but it looks hot as fuck.")

			saynn("[say=ferri]Ghh.. ghh.. nngh..[/say]")

			saynn("You hold her there until she starts losing it.")

		saynn("Then you release her horns and push her back.")

		addButton("Continue", "See what happens next", "pp_pullout")
	if(state == "pp_pullout"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="ferri", bodyState={naked=true, hard=true}})
		saynn("Ferri collapses onto her back, gasping for air. Drool"+str(" and your seed are" if !straponUsed else " is")+" dripping from her lips. Her body is trembling after getting denied so many times, her pussy is drenched in her juices, the toy slowly sliding off, the tape getting too wet by now.")

		saynn("You pick up the basket muzzle and replace the ring gag with it. Her fangs click against the metal. Her body is slowly cooling down."+str(" You take off your strapon harness.." if straponUsed else "")+"")

		saynn("[say=ferri]You.. MEANIE! You bitch.. huff-f.. I hate you..[/say]")

		saynn("Her voice is weak, hoarse.")

		saynn("[say=pc]"+str(ch1("Obey and you might get what you want.", "Obey and you might get what you want, whore.", "Obey and you might get what you want, worthless."))+"[/say]")

		saynn("You grab the toy off the floor and step out of the cell to see what Kait thinks.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "vag_fuck"):
		playAnimation(StageScene.ChairOral, "lick", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Ferri's tongue hesitates at the entrance of your pussy. Her breath is hot and shaky. The ring gag keeps her mouth open wide.")

		saynn("You click the remote. The bullet egg between her legs buzzes to life, stimulating her clit.")

		saynn("[say=ferri]Nngh..[/say]")

		saynn("She jolts, her hips jerking forward. Her tongue finally darts out through the ring and swipes across your slit.")

		saynn("[say=pc]"+str(ch1("That's it. Lick.", "Use that tongue, kitten.", "Don't make me wait."))+"[/say]")

		saynn("You use her horn to guide her face closer. Her nose brushes against your clit. She inhales sharply.")

		saynn("Then she starts licking your slit.. doing wet strokes from your entrance up to your hood. The ring gag makes it messy.. drool and your wetness mix together, dripping down her chin.")

		saynn("[say=ferri]Mrrph.. lck.. lck..[/say]")

		saynn("You lean back, spreading your legs wider. The toy buzzes against her clit, making her whine into your cunt. Her hips grind against the air, chasing the vibration.")

		saynn("[say=pc]"+str(ch1("Good girl. Keep going.", "Faster. Use the whole tongue.", "You like the taste, don't you, slut?"))+"[/say]")

		saynn("Ferri's tail wags despite herself. She buries her face deeper, her tongue pushing inside you, curling up to stroke your walls.")

		saynn("You stroke her horns slowly, feeling her shiver with each touch.")

		saynn("[say=ferri]Mmm.. mmmph![/say]")

		saynn("Her hips start bucking a bit. She's getting close, you can tell by the way her thighs clench, the desperate muffled moans.")

		saynn("You click the remote, stealing the buzzing.")

		saynn("[say=ferri]Hnng?![/say]")

		saynn("She pulls her face back, gasping through her nose, eyes wide and pleading.")

		saynn("[say=pc]"+str(ch1("Not yet.", "I decide when you cum.", "You don't get to cum that easily."))+"[/say]")

		saynn("Ferri growls softly.")

		saynn("[say=pc]"+str(ch1("Back to work.", "Keep licking if you want the vibration back.", "You want to cum? Earn it, worthless."))+"[/say]")

		saynn("She glares but lowers her head again, tongue plunging back into your wet sex. This time she's more aggressive too, lapping at your clit in tight circles, flicking the tip rapidly.")

		saynn("You click the remote back on.")

		saynn("[say=ferri]Nnnh-![/say]")

		saynn("Her whole body shudders. Her tongue keeps pleasuring your slit, getting some passionate moans out of you. You stroke her horns harder, pulling her face against your pussy. It feels good.")

		saynn("Her hips are grinding the air like a bitch in heat. Drool and your arousal smear across her muzzle.")

		saynn("Soon her body tenses again, tail going rigid. You turn off the toy.")

		saynn("[say=ferri]Hff-f-f![/say]")

		saynn("She pulls back, a wet string of saliva and your juices connecting her lips to your cunt. She whines.. making loud, frustrated noises.")

		saynn("[say=pc]"+str(ch1("No, kitty.", "Not yet.", "Begging already? How cute."))+"[/say]")

		saynn("Her eyes are getting wet, her pussy soaked. The pink bullet still taped to her clit.")

		saynn("[say=pc]"+str(ch1("Don't stop licking if you wanna cum.", "Keep eating me out if you wanna cum.", "Keep licking if you wanna cum, silly."))+"[/say]")

		saynn("Ferri nods frantically.")

		addButton("Continue", "See what happens next", "vag_fast")
	if(state == "vag_fast"):
		playAnimation(StageScene.ChairOral, "lickfast", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("She dives back in, tongue plunging deep, then dragging up to suck on your clit through the ring gag. Her nose presses against your mound.")

		saynn("You click the remote to full power. The bullet buzzes mercilessly against her clit.")

		saynn("[say=ferri]Hrrrnmhh![/say]")

		saynn("Her hips buck wildly. Her tongue works in frantic, sloppy circles. You stroke her horns faster, rougher, pulling her hair.")

		saynn("[say=pc]"+str(ch1("That's it. Eat me out.", "Don't stop. Don't you dare stop.", "Lick. Lick like the desperate kitten you are."))+"[/say]")

		saynn("Ferri's whole body shakes. Her tail thrashes. Tears and drool mix on her chin.")

		saynn("Her moans vibrate against your pussy. She is about to cum. And so are you.")

		saynn("But.. feeling incredibly mean.. you decide to turn off the toy!")

		saynn("[say=ferri]H-Huff![/say]")

		saynn("And before she can pull away, you grab her horns and shove her face hard against your pussy, grinding her nose and tongue into your clit.")

		saynn("[say=ferri]Hfff-![/say]")

		saynn("She squeals into your cunt, but she can't escape. Your hips buck against her face, smearing your wetness across her fur. The ring gag keeps her mouth open and her tongue trapped for you..")

		saynn("[say=pc]"+str(ch1("You don't get to cum. But I do.", "Get denied, slut. Make me cum.", "No cumming for stupid brats. Lick. Now."))+"[/say]")

		saynn("Your orgasm crashes over you. Your thighs clamp around her head. Your pussy pulses, releasing a flood of your juices directly onto her tongue and down her throat. She has no choice but to swallow, gagging as you grind against her face.")

		saynn("[say=ferri]Glk.. glk.. nngh..[/say]")

		saynn("You hold her there until the last spasm, your body trembling.")

		saynn("Then you release her horns and push her back.")

		addButton("Continue", "See what happens next", "vag_pullout")
	if(state == "vag_pullout"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="ferri", bodyState={naked=true, hard=true}})
		saynn("Ferri collapses onto her back, gasping for air. Drool and your juices are dripping from her lips. Her body is trembling after getting denied so many times, her pussy is drenched in her own juices, the toy slowly sliding off, the tape getting too wet by now.")

		saynn("You pick up the basket muzzle and replace the ring gag with it. Her fangs click against the metal. Her body is slowly cooling down.")

		saynn("[say=ferri]You.. MEANIE! You bitch.. huff-f.. I hate you..[/say]")

		saynn("Her voice is weak, hoarse.")

		saynn("[say=pc]"+str(ch1("Obey and you might get what you want.", "Obey and you might get what you want, whore.", "Obey and you might get what you want, worthless."))+"[/say]")

		saynn("You grab the toy off the floor and step out of the cell to see what Kait thinks.")

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

	if(_action == "vag_fast"):
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
