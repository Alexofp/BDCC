extends RecruitSceneBase

var mean = false
var degrading = false

func _init():
	sceneID = "FerriRecSceneMilkingOverstim"

func _reactInit():
	putOn("ferri", "inmatewristcuffs")
	putOn("ferri", "basketmuzzle")

func _run():
	if(state == ""):
		addCharacter("ferri", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		mean = (c1 == 1)
		degrading = (c1 == 2)
		playAnimation(StageScene.Grope, "grope", {pc="ferri", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You enter the cell and find Ferri. She is naked, cuffed and muzzled, her collar leashed to one of the pipes.")

		saynn("She is visibly upset, her tail flicking behind her.")

		saynn("As you step closer, she tries to kick you even. But the restraints throw her off balance, making her stumble instead.")

		saynn("[say=pc]"+str(ch1("We're going to have some fun, you and I.", "If you're gonna resist, I'm gonna make you regret it.", "Look at you. Naked. Chained. Muzzled like the animal you are."))+"[/say]")

		saynn("[say=ferri]When I get out of here, I will enjoy sinking my fangs into your neck![/say]")

		saynn("You reach out and catch one of her horns. Her whole body stiffens.")

		saynn("[say=ferri]Nnh.. quit it![/say]")

		saynn("Your other hand slides up along the curves of her hips and belly, palm brushing against her fur for a bit until it finds her breast. Warm and soft. You make it bounce a bit, there is quite a bit of weight to it, her cyan nipple jiggles as you do that.")

		saynn("[say=ferri]Get your hand off my..[/say]")

		saynn("Now you start kneading her chest instead, your hand cupping her breast and squeezing it, forcing a soft moan out of the dracat.")

		saynn("[say=ferri]Mew..[/say]")

		saynn("As you play with her chest, her nipples start getting visibly stiffer.")

		saynn("[say=pc]"+str(ch1("Your body doesn't seem to mind. Look at those cute nips.", "Look how fast those nipples perk up. What a slut.", "Pathetic. Getting turned on this quick."))+"[/say]")

		saynn("You pull your hands away and look at her reaction. She takes some time to recover..")

		saynn("[say=ferri]Huff. I will bite you.[/say]")

		saynn("Her eyes are quick to regain that rebellious spark.")

		saynn("[say=pc]"+str(ch1("Asking for more, I see. Cute.", "Try to bite me and you will be biting concrete next.", "You're just a subby slut and nothing else, admit it."))+"[/say]")

		addButton("Continue", "See what happens next", "do_grope_more")
	if(state == "do_grope_more"):
		playAnimation(StageScene.BreastGroping, "grope", {pc="pc", npc="ferri", npcBodyState={naked=true, hard=true}})
		saynn("You bring Ferri down to her knees by tugging on her horns and then position yourself behind her, both of your hands landing on her tits.")

		saynn("[say=ferri]Grr-![/say]")

		saynn("She snaps her teeth at you.. but that's the best she can do with that muzzle on.")

		saynn("Your hands squeeze both of her breasts and proceed to knead them, squeezing tightly and then releasing multiple times.")

		saynn("[say=ferri]Mmhh..[/say]")

		saynn("[say=pc]"+str(ch1("Still want to bite me, huh~? Now where is that milk.", "Brats like you are easy to handle. Let's see if I can bully these tits into giving me something.", "Why are you acting like a dog if you're clearly a cow."))+"[/say]")

		saynn("Your fingers dig into the soft flesh, massaging and caressing. Each squeeze pushes her perky tits together.. before you let them bounce back. Ferri's back arches against your chest, her tail keeps thrashing.. until you just trap it under your leg.")

		saynn("[say=ferri]Mmf.. nghh..[/say]")

		saynn("You roll her nipples between pairs of your fingers, playing with her hard little buds that have clearly gotten quite sensitive. You switch between squeezing, pinching, twisting and pulling on them..")

		saynn("Ferri jerks against you, a muffled moan escaping her.")

		saynn("[say=pc]"+str(ch1("That's it. Let me hear you, cutie.", "Melting already? I haven't even started.", "These slutty sounds tell me everything."))+"[/say]")

		saynn("Your palms cup the undersides of her breasts and lift them up.. before letting them drop and bounce up again. The dracat's squirming becomes more prominent, more and more cute noises escaping her.")

		saynn("One of your hands decides to focus on her left nipple, pinching and rubbing it.")

		saynn("[say=ferri]Nnngh..[/say]")

		saynn("Her whole body shudders. And then..")

		saynn("A bead appears on the nipple's tip. Of a white color. It traces a slow path down the curve of her breast. You catch and taste it. It's milk.")

		saynn("[say=pc]"+str(ch1("There we go.. there's the good stuff.", "Well, well. What do we have here?", "Look at that. You really are a cow."))+"[/say]")

		saynn("Ferri's eyes go wide. Your other hand pinches the right nipple too.. and sure enough.. a thin stream of that same fluid spawns at its tip.")

		saynn("[say=ferri]M-mew..[/say]")

		saynn("You squeeze both of her breasts again.. harder this time. And this makes both of her nips squirt! And so you keep going, pressing and releasing, gently milking her. You see lots of little thin, white arcs of milk that catch the dim light.")

		saynn("[say=pc]"+str(ch1("Good girl. Now let's see how much you can give me.", "I want more. All of it. Hm.", "I'm curious if I can make this room into your personal milking stall now."))+"[/say]")

		saynn("You look around. Yeah, there is a perfect pipe here for what you want to do.")

		addButton("Continue", "See what happens next", "get_ferri_into_stall")
	if(state == "get_ferri_into_stall"):
		playAnimation(StageScene.MilkingStallDuo, "milk", {pc="ferri", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You step out for a second to ask if anyone in your team has any big fluid containers. The best one seems to be a plain metal bucket. It will do.")

		saynn("When you return with the bucket, Ferri is back to looking mean.. but the blushing cheeks give her away.")

		saynn("[say=ferri]A bucket?[/say]")

		saynn("[say=pc]"+str(ch1("Yes, you know why I need it.", "To collect your milk, don't be dumb, slut.", "Why is a cow still talking? I will have to fix that."))+"[/say]")

		saynn("You grab Ferri and cuff her paws to one of the pipes that is roughly at your waist height. This makes the dracat bend forward, her butt sticking out while her breasts are now dangling beneath her, still looking heavy.")

		saynn("[say=ferri]Hey.. I'm not a cow..[/say]")

		saynn("You don't answer and just place the bucket beneath her chest. Then you crouch beside her. From this angle, her cyan pussy slit is looking quite wet, all the juices have given her fluffy crotch area a darker tone. You slide your hand between her legs and rub her slit, caressing her clit and spreading her folds a bit.")

		saynn("[say=ferri]Ah..[/say]")

		saynn("[say=pc]"+str(ch1("Not a cow? But look how wet you've gotten after milking.", "You're soaked down there. You are a slutty milky cow.", "Shut up, you're dripping like a broken faucet. Gonna milk you hard, cow."))+"[/say]")

		saynn("After teasing her slit, your hands move to her chest. You cup her dangling breasts.. and squeeze. Some milk dribbles out, lonely drops hitting the bottom of the metal bucket with a ding.")

		saynn("[say=ferri]..huff.. m-mow..[/say]")

		saynn("And so you settle into a rhythm. Squeeze. Release. Squeeze. Release. Each time you put pressure on her breasts, you draw out more and more of that sweet white fluid that always finds its way into the fluid container below.")

		saynn("Her legs shift, her thighs pressing together.. rubbing against each other. She clearly likes it.")

		saynn("[say=ferri]Mmhh..[/say]")

		saynn("While you're milking Ferri, her tail lashes between her legs to brush against her own slit momentarily.. before flicking away when noticed.")

		saynn("[say=pc]"+str(ch1("Such a needy little girl. Focus on the milking.", "I see that tail. Stop it or I'm gonna chain it to the ceiling. Just focus on the milking.", "Quit it, you dumb bitch. Focus on the milking."))+"[/say]")

		saynn("You squeeze more and more, harder this time. It leads to little constant streams of Ferri's milk appearing all across her cyan areolas before flowing down to the tips of her nips and escaping into the bucket. Splat, splat splat..")

		saynn("Ferri's head hangs low, her ears are flat, her breathing comes in short, shaky gasps, her body squirming more and more.")

		addButton("Continue", "See what happens next", "ferri_cums")
	if(state == "ferri_cums"):
		playAnimation(StageScene.MilkingStallDuo, "cum", {pc="ferri", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You twist her nipples gently between your fingers, rolling them while also pulling. Ferri's whole body jerks, her hips thrusting back and forth, grinding against nothing. She is humping the air now, so desperate.")

		saynn("You pick up the pace, both hands working on her dangling breasts like they're udders. Milk arcs out in steady white ropes, filling the bucket bit by bit. Ferri's cute noises turn into proper moans, her claws scraping against the pipe that she is cuffed to, her legs trembling.")

		saynn("[say=ferri]Nn.. m-mow.. S-something.. is happening.. ah.. I'm gonna..[/say]")

		saynn("[say=pc]"+str(ch1("Let it happen. Let go for me. If you moo, the milk is gonna be better.", "Cum, cow. Cum like the whore that you are.", "Go on. Cum while I drain your tits. Your milk is all you're good for."))+"[/say]")

		saynn("You squeeze and pinch her nips again.. and this time..")

		saynn("Ferri's back arches hard. Her mouth opens to produce a passionate..")

		saynn("[say=ferri]M-moo-o-o..[/say]")

		saynn("Her pussy starts clenching, sensitive folds pulsing.. until she suddenly squirts. Clear fluid sprays from her slit, hitting the concrete floor. Her whole body shakes, legs shivering.")

		saynn("[say=ferri]Mmhh.. m-moo.. ahh..[/say]")

		saynn("She cums hard, multiple little milk fountains appearing on her areolas! You're quick to take advantage of that opportunity, your hands keep milking her udders, each squeeze drawing out more and more milk.. together with her moans.")

		saynn("Ferri's head begins thrashing side to side.")

		saynn("[say=ferri]T-too much.. ahh.. t-this is too much..[/say]")

		saynn("But you keep going, pinching her nips.. rolling them.. pulling on them.. until the second pleasure wave suddenly hits her before the first one even gets a chance to fully fade.")

		saynn("Ferri's body jerks as her pussy gushes again, her legs shaking violently, barely holding her up. Her nips are spraying milk again, increasing the fluid level in the bucket to way above the half!")

		saynn("[say=ferri]Ah.. moo-.. hahh.. moo-o..[/say]")

		saynn("[say=pc]"+str(ch1("Keep going. You're doing so well. So much milk..", "I want to hear you break, slut. Keep giving me milk.", "Scream for me, cow. I'm gonna leave your tits dry."))+"[/say]")

		saynn("You increase the pressure still, your hands now occasionally sliding off the slick nips.. but you're quick to catch yourself and put them back on her tits.")

		saynn("You keep milking the poor dracat, whose moans begin to get weaker, her breathing overpowering them.")

		saynn("And yet.. you manage to push her over the edge again, for the third time. Her eyes roll back, her tongue slides out and drools as milk flows from her tits in erratic spurts.")

		saynn("[say=ferri]M-moo.. moo-o..[/say]")

		saynn("Her thighs are soaked, her pussy barely even squirts by now, but her body keeps spasming. The milk keeps coming.. and so you keep going.")

		saynn("Fourth and fifth orgasms come together. Ferri lets out a loud moo and slumps against her cuffed paws, held up only by the pipes.. The flow keeps going.. filling the bucket almost until the border now..")

		saynn("You squeeze one last time. A few last beads appear on her nips. You catch them onto your finger and bring it to her lips.")

		saynn("[say=pc]"+str(ch1("Taste yourself. You earned it.", "Last drop. Swallow it.", "Worthless as a person. But not the worst cow. Taste it."))+"[/say]")

		saynn("Ferri's glazed eyes focus just enough to part her lips. You press the milk to her tongue. She swallows weakly.")

		saynn("Then you look at her breasts. Her nipples are no longer cyan. They're clearly sore, now with a prominent red glow. Her areolas are puffy and irritated, clearly overworked.")

		saynn("The bucket sits beneath her, full to the brim with dracat milk.")

		saynn("[say=pc]"+str(ch1("Look at that. A full bucket from one needy cow.", "Not bad for your first real milking.", "Not bad."))+"[/say]")

		saynn("You move the bucket out of the way and then uncuff her paws from the pipe.. causing Ferri to collapse instantly onto the floor, her breathing is still messy.. just like her fur. Her eyes struggle to focus on you.. they struggle to focus on anything really.")

		saynn("[say=ferri]M-mew..[/say]")

		saynn("[say=pc]"+str(ch1("If you want more of that, you should obey us. Now have some rest.", "Do what I tell you to do.. and you might just get more of this. Now rest.", "Not bad. You're gonna obey me, cow. Now rest."))+"[/say]")

		saynn("You grab the bucket and head out.")

		saynn("[say=pc]Hey, I got us some grade-A milk.[/say]")

		saynn("Your team might not be very excited about it yet.. but they will certainly grow to like it.")

		addButton("Kait", "Go see what Kait thinks", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["mean"] = mean
	data["degrading"] = degrading

	return data

func loadData(data):
	.loadData(data)

	mean = SAVE.loadVar(data, "mean", false)
	degrading = SAVE.loadVar(data, "degrading", false)
