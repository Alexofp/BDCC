extends RecruitSceneBase

var gentle = false
var mean = false
var inPublic = false
var bondage = false
var anal = false

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
		saynn("You enter Rahi's cell and grab her leash. Then you lead her out, past the roaring crowd of the arena. Rahi's rear paws shuffle across the cold floor, her tail curls low.")

		saynn("There aren't really any truly private spots here.. So it's good that you're not looking for one. This spot that's a few meters away from the crowd is perfect.")

		saynn("You stop, turn around, and then pull the chain gently. As soon as Rahi grabs onto you for support, your hand slides down into her shorts, your sneaky digits pulling a cute moan out of the feline as they start teasing away at her clit.")

		saynn("[say=rahi]H-here?.. Meow.. ah.. people can see..[/say]")

		saynn("[say=pc]"+str(ch1("Shh. Just relax. I've got you.", "Quiet, cat. This is happening. Just moan instead.", "You don't get a vote, kitty. I'm gonna make you scream."))+"[/say]")

		saynn("Her breath hitches, her legs try to close around your hand.. but you make her spread her legs. Rahi's big blue eyes watch you as you pleasure her, more and more little cute noises escape her. Still not enough to drown out the crowd.")

		saynn("By now, you have gotten quite hard.. Time to have some fun.")

		addButton("Continue", "See what happens next", "sex_prepare")
	if(state == "sex_prepare"):
		saynn("You pull your hand out of her shorts, your digits slick with her wetness. Rahi is blushing, her hips swaying, thighs brushing against each other involuntarily. Cute.")

		saynn("[say=pc]"+str(ch1("Turn around for me, like a good kitty would.", "Face the crowd. Now. Eyes forward, ass against me.", "Turn around, little slut. Now."))+"[/say]")

		saynn("She hesitates for a second.. but then obeys, spinning slowly, her back pressing against your chest, her tail curling around your leg, her butt rubbing against your {pc.penis}..")

		saynn("Her shirt is first, your hands swiftly unbuttoning it and letting it fall. You can sense the trembling in her.. as her perky tits are now visible to the unaware crowd.")

		saynn("[say=rahi]M-maybe that's enough..[/say]")

		saynn("That's when you pull her shorts down and hook your arms under her knees in one motion. And then you lift her up.")

		saynn("[say=rahi]Me-eow![/say]")

		saynn("Her legs are spread open wide, her pink vulnerable slit on full display on anyone who would turn around. And some actually do..")

		saynn("Your cock is already lined up, brushing against the folds, its tip is prodding the opening..")

		addButton("Continue", "See what happens next", "sex_part")
	if(state == "sex_part"):
		saynn("Then you push inside.")

		saynn("[say=rahi]Aah-! M-meow.. F-full..[/say]")

		saynn("She grabs onto your arms, her claws digging into your skin.")

		saynn("You don't rush it. You draw back slowly.. allowing the slick love tunnel to close up a bit.. before pushing deep inside again! Slow thrusts of your hips are met with your hands lowering her onto your {pc.penis}!")

		saynn("[say=rahi]Nnn.. ah.. ahh..[/say]")

		saynn("Someone whistles towards you. And a few more heads turn around. They're watching Rahi getting fucked right in front of them. The feline's cheeks glow red.")

		saynn("[sayMale]Break that whore![/sayMale]")

		saynn("Each next thrust fucks a soft moan out of her, the fluffy tail still wrapped tightly around you. Her toes curl up repeatedly as you run your length inside her again and again.")

		saynn("More inmates are watching now. Some begin stroking themselves.. some begin rubbing their slits instead. Looks like the arena fight is not the main source of entertainment down here anymore.")

		addButton("Continue", "See what happens next", "sex_fast")
	if(state == "sex_fast"):
		saynn("You pick up the pace, railing that pussy faster. Rahi's moans get louder, her body squirming in your grip, her inner walls clenching tightly around you.")

		saynn("[say=rahi]Please.. ah.. they're all.. ah-.. looking at her..[/say]")

		saynn("[say=pc]"+str(ch1("They're just enjoying the show. You're doing great, kitty..", "Good. I want them to look at you as I fuck you.", "Shut up and cum on my cock, cat."))+"[/say]")

		saynn("Seconds later, her pussy begins to spasm around you as your cock hammers away at something.. a particular spot that makes her whole body go rigid.. and then the opposite.")

		saynn("[say=rahi]Ahhh-h..[/say]")

		saynn("A loud cry of passion echoes around the arena, Rahi's eyes rolling back, her lips parted wide, tongue out and drooling.")

		saynn("The crowd cheers.. some of them groaned and finished too.")

		saynn("But you're not done..")

		addButton("Cum inside", "Breed the kitty!", "sex_cum")
	if(state == "sex_cum"):
		saynn("You keep fucking Rahi through her orgasm, through her squirming.. until she is whimpering and pushing back into you. The pressure builds in your {pc.penis}..")

		saynn("As soon as you reach your peak, you bury yourself to the hilt! Her walls squeeze tight as you spill inside her.. thick ropes of your {pc.cum} begin flooding her, pumping her womb full of it. Rahi mewls, her body shivering from every pulse, her tail spazzing wildly.")

		saynn("[say=pc]"+str(ch1("Yes.. This feels so good.", "Take it all.. Like a good kitty..", "Breeding bitch.. getting her cunt stuffed in public."))+"[/say]")

		saynn("After a few more quick thrusts, you stay inside her, letting her clenching slit milk you dry. Lots of lusty eyes are watching you. Some inmates clap even.")

		saynn("Rahi is breathing heavily.. and so do you.")

		if (gentle):
			saynn("After you're done.. you pull out.. slowly and carefully. And then, just as carefully, you set the feline down onto her hind paws. Her legs are shaky, your seed dripping out of her used pussy.")

			saynn("[say=pc]There you go. Wasn't this fun?[/say]")

			saynn("[say=rahi]M-meow..[/say]")

		elif (mean):
			saynn("After you're done.. you yank your cock out hard, leaving Rahi's pussy hole to gape and gush with your seed. Since you're done, you set her down swiftly, her shaky legs touching the floor. You bite her neck, forcing another moan out of her.")

			saynn("[say=pc]There you go, whore. You're mine.[/say]")

		else:
			saynn("After you're done.. you pull your cock out, leaving Rahi's pussy to drip your seed onto her thighs. You set her down and give her a little bite on the neck.")

			saynn("[say=pc]Good girl.. Very good girl.[/say]")

		saynn("Time to go back.. before the crowd surrounds you.")

		addButton("Continue", "See what happens next", "back_to_cell")
	if(state == "back_to_cell"):
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

	if(_action == "sex_part"):
		processTime(3*60)

	if(_action == "sex_fast"):
		processTime(3*60)

	if(_action == "sex_cum"):
		getCharacter("rahi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("rahi")

	if(_action == "back_to_cell"):
		processTime(10*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["gentle"] = gentle
	data["mean"] = mean
	data["inPublic"] = inPublic
	data["bondage"] = bondage
	data["anal"] = anal

	return data

func loadData(data):
	.loadData(data)

	gentle = SAVE.loadVar(data, "gentle", false)
	mean = SAVE.loadVar(data, "mean", false)
	inPublic = SAVE.loadVar(data, "inPublic", false)
	bondage = SAVE.loadVar(data, "bondage", false)
	anal = SAVE.loadVar(data, "anal", false)
