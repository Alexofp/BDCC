extends RecruitSceneBase

func _init():
	sceneID = "FerriRecSceneMilkingDeny"

func _reactInit():
	putOn("ferri", "inmatewristcuffs")
	putOn("ferri", "basketmuzzle")

func _run():
	if(state == ""):
		addCharacter("ferri", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Grope, "grope", {pc="ferri", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You enter the cell and find Ferri. She is naked, cuffed and muzzled, her collar leashed to one of the pipes.")

		saynn("She is visibly upset, her tail flicking behind her.")

		saynn("As you step closer, she tries to kick you even. But the restraints throw her off balance, making her stumble instead.")

		saynn("[say=pc]"+str(ch1("We're going to have some fun, you and I.", "If you're gonna resist, I'm gonna make you regret it.", "Look at you. Naked. Chained. Muzzled like the animal you are."))+"[/say]")

		saynn("[say=ferri]When I get out of here, I will enjoy sinking my fangs into your neck![/say]")

		saynn("You reach out and catch one of her horns. Her whole body stiffens.")

		saynn("[say=ferri]Nnh.. quit it![/say]")

		saynn("Your other hand slides up along the curves of her hips and belly, palm brushing against her fur for a bit until it finds her breast. Warm and soft. You make it bounce a bit, there is quite a bit of weight to it.")

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

		saynn("Her legs shift, her thighs pressing together.. rubbing against each other. Her breath hitches. You can see something building in her.. the way her hips start to rock, the way her tail quivers.")

		saynn("[say=ferri]M-mmf.. something.. something is happening..[/say]")

		saynn("She is close. Already.")

		saynn("And so..")

		saynn("You suddenly stop.")

		saynn("Your hands leave her breasts entirely. Ferri is quick to notice it, her eyes needy.")

		saynn("[say=ferri]Wha.. why did you.. mow..[/say]")

		saynn("[say=pc]"+str(ch1("Not yet, cow. You don't get to cum that easily.", "Did I say you could cum? No.", "Oh no. You thought I'd let you? How cute."))+"[/say]")

		saynn("Ferri whines through the muzzle, her tail lashing, her hips keep twitching.")

		saynn("[say=ferri]Meanie..[/say]")

		saynn("You laugh and return your hands to her chest, resuming the milking. Her body is quick to respond again, the milk starts flowing, her breathing becoming deep.")

		saynn("[say=ferri]Ah.. ah..[/say]")

		saynn("Each time you pinch her nipple, she squirms a little, her eyes losing focus gradually.")

		saynn("You feel her getting tense again, her pussy dripping juices onto the floor. And so.. you stop again.")

		saynn("[say=ferri]Nngh! Y-you're an asshole..[/say]")

		saynn("She tries to kick you but the cuffs make it very awkward. Her claws scrape against the pipe as her lust gets ignored, her arousal fading. A frustrated growl leaves her maw.")

		saynn("[say=pc]"+str(ch1("Beg me.", "You want to cum? Then beg like the cow you are.", "Say please. Maybe I'll let you. Maybe."))+"[/say]")

		saynn("[say=ferri]Please.. I wanna cum..[/say]")

		saynn("You hear that and return to milking, squeezing her tits. Your fingers play with her nips more, rolling and tugging on them. The milk arcs into the bucket in many thin streams, raising the fluid level to about half.")

		saynn("[say=ferri]M.. h-..[/say]")

		saynn("She starts holding her moans now, her maw closed shut. But it's easy to tell, her hips start grinding against nothing, her eyes closing, breathing gets louder.")

		saynn("You don't let her trick you. You wait until the last moment and stop before she gets to her peak. Ferri instantly lets out a frustrated noise.")

		saynn("[say=ferri]F-fuck you..[/say]")

		saynn("You just smirk and idly caress her breasts, keeping her on the edge.")

		saynn("[say=ferri]Huff.. M-mow.. Mow.. Please let me cum.. Please. I really wanna cum..[/say]")

		saynn("Her tone switches so fast. You ignore her pleading, letting her cool down.")

		saynn("But you do notice something. It's her tail. It's trying to sneakily rub her pussy slit, out of view.")

		saynn("[say=pc]I see that.[/say]")

		saynn("You yank on that tail and smack Ferri's ass hard, leaving a glowing hand print.")

		saynn("[say=ferri]Agh.. so mean..[/say]")

		saynn("When she calms down, you resume the milking. Ferri's moans begin to sound desperate, it's like she knows. But she still has some hope. She doesn't dare to cheat anymore.")

		saynn("The milk still flows, her tits are producing nicely, areolas spawning lots of little thin fountains as you knead the heavy orbs. The bucket is close to being full.")

		saynn("[say=ferri]Mm.. moo.. hh..[/say]")

		saynn("She is making cow noises. That's cute.")

		saynn("Ferri is slowly approaching the edge again.")

		saynn("[say=ferri]Please.. I will moo for you.. I will make more milk.. I will do anything.. just.. just let me cum.. once.. mow.. please.. please![/say]")

		saynn("Her voice is broken now. Her thighs are soaked. Tears begin running down her glowing cheeks.")

		saynn("[say=pc]"+str(ch1("Anything? That's interesting.", "Interesting.", "Of course you will do anything. You're just a slave."))+"[/say]")

		saynn("You wait until the bucket is full.. and then.. you stop.")

		saynn("Ferri feels the source of stimulation going away.. and lets out a loud annoyed mewl.")

		saynn("[say=ferri]Mo-o-ow.. I hate you-u-u..[/say]")

		saynn("You move the bucket out of the way, clearly signaling that the milking is over. Your face expression is constant.")

		saynn("Ferri is squirming hard, trying to catch her release.")

		saynn("[say=ferri]I hate this so mu-uch.. Why.. No..[/say]")

		saynn("She throws her head back and whines into the air. All the while her body is slowly losing its aroused state.. slowly and painfully.")

		saynn("[say=pc]"+str(ch1("If you want to cum, you're gonna do what I need you to do.", "If you want to cum, you're gonna learn to obey me completely, whore.", "I get to choose if you cum or not, you stupid whore. You better learn that."))+"[/say]")

		saynn("[say=ferri]Huff-f-f.. f-fuck you..[/say]")

		saynn("You uncuff her paws from the pipe, making Ferri collapse to the floor, her breathing still messy. Her nipples look a bit red and swollen, her pussy still dripping..")

		saynn("You grab the bucket of milk and head out.")

		saynn("[say=pc]Fresh milk. Still warm. I think this one will contain a very unique taste.[/say]")

		saynn("Behind you, Ferri lets out a broken, frustrated moan.")

		addButton("Kait", "Go see what Kait thinks", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
