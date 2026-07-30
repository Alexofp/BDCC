extends RecruitSceneBase

var gentle = false
var mean = false
var inPublic = false
var bondage = false
var anal = false
var condomType = ""
var condomUsed = false
var condomBroke = false
var straponUsed = false
var cameInsideRahi = false

func _init():
	sceneID = "RahiRecSceneSex"

func _run():
	if(state == ""):
		addCharacter("rahi")
		gentle = (c1 == 0)
		mean = (c1 == 2)
		inPublic = (c3 == 0)
		bondage = (c3 == 1)
		anal = (c3 == 2)
		condomType = extra("condom", "no")
		condomUsed = (condomType != "no")
		straponUsed = (extra("strapon", "") != "")
		playAnimation(StageScene.SexStealth, "rub", {pc="pc", npc="rahi"})
		aimCameraAndSetLocName("fight_corner_ne")
		saynn("You enter Rahi's cell and grab her leash. Then you lead her out, past the roaring crowd of the arena. Rahi's rear paws shuffle across the cold floor, her tail curls low.")

		saynn("There aren't really any truly private spots here.. So it's good that you're not looking for one. This spot that's a few meters away from the crowd is perfect.")

		saynn("You stop, turn around, and then pull the chain gently, making the feline step in front of you. As soon as she does, you embrace her from behind, your hand slides down into her shorts, your sneaky digits pulling a cute moan out of the feline as they start teasing away at her clit.")

		saynn("[say=rahi]H-here?.. Meow.. ah.. people can see..[/say]")

		saynn("[say=pc]"+str(ch1("Shh. Just relax. I've got you.", "Quiet, cat. This is happening. Just moan instead.", "You don't get a vote, kitty. I'm gonna make you scream."))+"[/say]")

		saynn("Her breath hitches, her legs try to close around your hand.. but you make her spread her legs. Rahi's big blue eyes watch you as you pleasure her, more and more little cute noises escape her. Still not enough to drown out the crowd.")

		if (!straponUsed):
			saynn("By now, you have gotten quite hard.. Time to have some fun.")

		else:
			saynn("You have the strapon ready.. Time to have some fun.")

		addButton("Continue", "See what happens next", "sex_prepare")
	if(state == "sex_prepare"):
		playAnimation(StageScene.SexFreeStanding, "tease", {pc="pc", npc="rahi", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true}})
		saynn("You pull your hand out of her shorts, your digits slick with her wetness. Rahi is blushing, her hips swaying, thighs brushing against each other involuntarily. Cute.")

		saynn("[say=pc]"+str(ch1("I'm just offering you some fun. Let me know if I should stop.", "I know you like it. Stand still. Eyes forward, ass against me.", "I know that you're nothing but a little whore. You're not even resisting."))+"[/say]")

		saynn("She mewls softly, her back pressing against your chest, her tail curling around your leg, her butt rubbing against"+str(" your {pc.penis}" if !straponUsed else "you")+"..")

		saynn("Her shirt is first, your hands swiftly unbuttoning it and letting it fall. You can sense the trembling in her.. as her perky tits are now visible to the unaware crowd.")

		saynn("[say=rahi]M-maybe that's enough..[/say]")

		saynn("That's when you pull her shorts down completely, the fabric hitting the floor. Rahi instinctively tries to crouch and cover herself but you're quick to catch her paws and pull 'em behind her back.")

		saynn("[say=rahi]Me-eow![/say]")

		saynn("Her legs are spread wide, chest bent forward, pink private bits on full display on anyone who would turn around. And some actually do..")

		if (!straponUsed):
			saynn("Your cock is already lined up, brushing against the folds, its tip is prodding the opening.."+str(" You take some extra time to put a condom on.. Might as well stay safe." if condomUsed else "")+"")

		else:
			saynn("You quickly secure the strapon around your waist, the shiny tip already brushing against her folds, prodding the opening.")

		addButton("Continue", "See what happens next", "sex_part")
	if(state == "sex_part"):
		playAnimation(StageScene.SexFreeStanding, "sex", {pc="pc", npc="rahi", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true}})
		saynn("Then you push inside.")

		saynn("[say=rahi]Aah-! M-meow.. F-full..[/say]")

		saynn("She grabs onto your wrists as much as she can, her claws digging into your skin.")

		saynn("You don't rush it. You draw back slowly.. allowing the slick love tunnel to close up a bit.. before pushing deep inside again! Slow thrusts of your hips are met with your hands pulling her onto your "+str("{pc.penis}" if !straponUsed else "rubber cock")+"!")

		saynn("[say=rahi]Nnn.. ah.. ahh..[/say]")

		saynn("Someone whistles towards you. And a few more heads turn around. They're watching Rahi getting fucked right in front of them. The feline's cheeks glow red.")

		saynn("[sayMale]Break that whore![/sayMale]")

		saynn("Each next thrust fucks a soft moan out of her, the fluffy tail still wrapped tightly around you. Her toes curl up repeatedly as you run your length inside her again and again.")

		saynn("More inmates are watching now. Some begin stroking themselves.. some begin rubbing their slits instead. Looks like the arena fight is not the main source of entertainment down here anymore.")

		addButton("Continue", "See what happens next", "sex_fast")
	if(state == "sex_fast"):
		playAnimation(StageScene.SexFreeStanding, "fast", {pc="pc", npc="rahi", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true}})
		saynn("You pick up the pace, railing that pussy faster. Rahi's moans get louder, her body squirming in your grip, her inner walls clenching tightly around you.")

		saynn("[say=rahi]Please.. ah.. they're all.. ah-.. looking at her..[/say]")

		saynn("[say=pc]"+str(ch1("They're just enjoying the show. You're doing great, kitty..", "Good. I want them to look at you as I fuck you.", "Shut up and cum on my cock, cat."))+"[/say]")

		saynn("Seconds later, her pussy begins to spasm around you as your"+str(" cock" if !straponUsed else " strapon")+" hammers away at something.. a particular spot that makes her whole body go rigid.. and then the opposite.")

		saynn("[say=rahi]Ahhh-h..[/say]")

		saynn("A loud cry of passion echoes around the arena, Rahi's eyes rolling back, her lips parted wide, tongue out and drooling.")

		saynn("The crowd cheers.. some of them groaned and finished too.")

		saynn("But you're not done..")

		addButton("Cum inside", "Breed the kitty!", "sex_cum")
	if(state == "sex_cum"):
		playAnimation(StageScene.SexFreeStanding, "inside", {pc="pc", npc="rahi", pcCum=cameInsideRahi, bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true}})
		saynn("You keep fucking Rahi through her orgasm, through her squirming.. until she is whimpering and pushing back into you."+str(" The pressure builds in your {pc.penis}.." if !straponUsed else "")+"")

		if (straponUsed):
			saynn("As soon as her peak begins to fade, you slam the strap to the hilt! Her walls squeeze tight around the shaft again as you grind deep inside her.. the harness presses flush against her butt, every inch of the toy buried to the base. Rahi mewls, her body shivering from each deep thrust, her tail spazzing wildly.")

			saynn("[say=pc]"+str(ch1("Yes.. This feels so good.", "Take it all.. Like a good kitty..", "Little bitch.. getting fucked in public with a rubber cock."))+"[/say]")

		elif (condomUsed && !condomBroke):
			saynn("As soon as you reach your peak, you bury yourself to the hilt! Her walls squeeze tight as you spill inside her.. thick ropes of your {pc.cum} begin flooding that condom inside her, pumping it full to the brim. Looks like it held! Rahi mewls, her body shivering from every pulse, her tail spazzing wildly.")

			saynn("[say=pc]"+str(ch1("Yes.. This feels so good.", "Take it all.. Like a good kitty..", "Breeding bitch.. getting her cunt fucked in public."))+"[/say]")

		else:
			saynn("As soon as you reach your peak, you bury yourself to the hilt!"+str(" Oh no, looks like the [b]condom broke![/b]" if condomBroke else "")+" Her walls squeeze tight as you spill inside her.. thick ropes of your {pc.cum} begin flooding her, pumping her womb full of it. Rahi mewls, her body shivering from every pulse, her tail spazzing wildly.")

			saynn("[say=pc]"+str(ch1("Yes.. This feels so good.", "Take it all.. Like a good kitty..", "Breeding bitch.. getting her cunt stuffed in public."))+"[/say]")

		saynn("After a few more quick thrusts, you stay inside her"+str(", letting her clenching slit milk you dry" if cameInsideRahi else "")+". Lots of lusty eyes are watching you. Some inmates clap even.")

		saynn("Rahi is breathing heavily.. and so do you.")

		if (gentle):
			saynn("After you're done.. you pull out.. slowly and carefully. Her legs are shaky so you support her with your arms"+str(", your seed dripping out of her used pussy" if cameInsideRahi else ", her pussy dripping with juices")+".")

			saynn("[say=pc]There you go. Wasn't this fun?[/say]")

			saynn("[say=rahi]M-meow..[/say]")

		elif (mean):
			saynn("After you're done.. you yank your cock out hard, leaving Rahi's pussy hole to gape"+str(" and gush with your seed" if cameInsideRahi else " and drip with her juices")+". Her shaky legs can barely stand. You bite her neck, forcing another moan out of her.")

			saynn("[say=pc]There you go, whore. You're mine.[/say]")

		else:
			saynn("After you're done.. you pull your cock out, leaving Rahi's pussy"+str(" to drip your seed onto her thighs" if cameInsideRahi else " to drip juices onto her thighs")+". Her legs are shaky.. so you catch her with your arms and then give her a little bite on the neck.")

			saynn("[say=pc]Good girl.. Very good girl.[/say]")

		saynn("Time to go back.. before the crowd surrounds you.")

		addButton("Continue", "See what happens next", "back_to_cell")
	if(state == "back_to_cell"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={leashedBy="pc"}})
		aimCameraAndSetLocName("hideout_breakroom")
		saynn("You bring Rahi back into the cell. The chain is tied around the pipe again.")

		saynn("[say=pc]You're gonna work for me now, right?[/say]")

		if (perfect):
			saynn("[say=rahi]Of course.. she will do everything you want..[/say]")

		elif (success):
			saynn("[say=rahi]Yes.. she will do what you ask..[/say]")

		else:
			saynn("[say=rahi]Um.. uh.. well..[/say]")

			saynn("Hm.. It doesn't look like she will.")

		saynn("You step out of the cell to see what Kait thinks..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sex_prepare"):
		processTime(10*60)
		if(straponUsed):
			recWearStrapon()

	if(_action == "sex_part"):
		processTime(3*60)

	if(_action == "sex_fast"):
		processTime(3*60)

	if(_action == "sex_cum"):
		
		if(condomType == "worst"):
			if(GM.pc.shouldCondomBreakWhenFucking("rahi", GM.pc.useWorstCondom())):
				condomBroke = true
		if(condomType == "best"):
			if(GM.pc.shouldCondomBreakWhenFucking("rahi", GM.pc.useBestCondom())):
				condomBroke = true
		
		if(straponUsed):
			getCharacter("rahi").cummedInVaginaBy("pc", FluidSource.Strapon)
		if(!straponUsed && (!condomUsed || condomBroke)):
			cameInsideRahi = true
			getCharacter("rahi").cummedInVaginaBy("pc")
		if(condomUsed && !condomBroke):
			addFilledCondomToLootIfPerk(GM.pc.createFilledCondom())
		GM.pc.orgasmFrom("rahi")

	if(_action == "back_to_cell"):
		processTime(10*60)
		recRemoveStrapons()

	setState(_action)

func saveData():
	var data = .saveData()

	data["gentle"] = gentle
	data["mean"] = mean
	data["inPublic"] = inPublic
	data["bondage"] = bondage
	data["anal"] = anal
	data["condomType"] = condomType
	data["condomUsed"] = condomUsed
	data["condomBroke"] = condomBroke
	data["straponUsed"] = straponUsed
	data["cameInsideRahi"] = cameInsideRahi

	return data

func loadData(data):
	.loadData(data)

	gentle = SAVE.loadVar(data, "gentle", false)
	mean = SAVE.loadVar(data, "mean", false)
	inPublic = SAVE.loadVar(data, "inPublic", false)
	bondage = SAVE.loadVar(data, "bondage", false)
	anal = SAVE.loadVar(data, "anal", false)
	condomType = SAVE.loadVar(data, "condomType", "")
	condomUsed = SAVE.loadVar(data, "condomUsed", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
	straponUsed = SAVE.loadVar(data, "straponUsed", false)
	cameInsideRahi = SAVE.loadVar(data, "cameInsideRahi", false)
