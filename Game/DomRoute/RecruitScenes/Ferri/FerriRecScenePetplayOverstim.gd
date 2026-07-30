extends RecruitSceneBase

func _init():
	sceneID = "FerriRecScenePetplayOverstim"

func _reactInit():
	putOn("ferri", "inmatewristcuffs")
	putOn("ferri", "basketmuzzle")

func _run():
	if(state == ""):
		addCharacter("ferri", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="ferri", npcBodyState={naked=true}})
		saynn("You ask your team for some special restraints.. And get provided with them!")

		saynn("Then, you step inside the cell and see Ferri. She is still naked, cuffed, muzzled and leashed to the pipe. Good.")

		saynn("Her eyes lock onto you.")

		saynn("[say=ferri]Finally.. Took you long enough. Unlock me.[/say]")

		saynn("You just hold up the puppy restraints that you've got. It looks like a set of black leather caps that would go onto someone's elbows and knees.")

		saynn("[say=ferri]No! Mew.. I'm not wearing that.[/say]")

		saynn("[say=pc]"+str(ch1("You don't have a choice. You will wear this.", "You will, slut.", "You'll wear what I tell you to wear, bitch."))+"[/say]")

		saynn("Ferri bares her fangs more behind the muzzle. They click against the metal basket.")

		saynn("[say=ferri]Make me, meanie![/say]")

		addButton("Continue", "See what happens next", "ferri_flops")
	if(state == "ferri_flops"):
		playAnimation(StageScene.Duo, "stand", {npc="ferri", npcAction="defeat", npcBodyState={naked=true, leashedBy="pc"}})
		saynn("You grab her leash and pull her towards the center of the cell. She tries to jerk away but you just yank harder, causing her to collapse.")

		saynn("[say=ferri]Grr-r.. EEP![/say]")

		saynn("She flops awkwardly, her tail slams against the floor. It looks like the legs are gonna be easier to restrain so you start with them.")

		saynn("Ferri squirms and kicks, her tail whipping your arm. You ignore it, forcing the leather restraints onto her knees, making it so her rear paws are pressed against her butt.")

		saynn("[say=ferri]I will bite you so hard![/say]")

		saynn("Not with that muzzle she won't.")

		saynn("Her arms are next. You take off her cuffs and quickly bind her before she does too much scratching. Perfect.")

		addButton("Continue", "See what happens next", "ferri_all_fours")
	if(state == "ferri_all_fours"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc="pc", npc="ferri", npcAction="walk", npcBodyState={naked=true, hard=true, leashedBy="pc"}})
		saynn("It's done. After putting all the bits on, you pull on the leash again, making Ferri get up and follow you around the cell. She is panting, her eyes furious.")

		saynn("She does look kinda cute like this. Her butt is swaying, her breasts are hanging low, bouncing with each step.")

		saynn("[say=ferri]Huff! Why are you doing this?[/say]")

		saynn("[say=pc]"+str(ch1("I want you to be a good puppy.", "I want you to obey. Like a slutty puppy.", "I want to turn you into a drooling mindless pet."))+"[/say]")

		saynn("She growls.. but her tail gives a little wag.")

		saynn("[say=ferri]Never.[/say]")

		saynn("You crouch in front of her.")

		saynn("[say=pc]"+str(ch1("Sit. Can you do that for me?", "Sit, bitch.", "Sit. Now."))+"[/say]")

		saynn("She stares at you, her cyan eyes burning.")

		saynn("[say=ferri]No.[/say]")

		saynn("You reach out and boop her nose, sneaking your digit between the metal bars of the muzzle.")

		saynn("She blinks and goes cross-eyed for a second.")

		saynn("[say=pc]"+str(ch1("I'm not afraid of you, brat. Just sit, it's not that hard.", "I'm not afraid of you, silly. Just sit, it's not that hard.", "You're such a dumb pup. Just sit, it's not that hard."))+"[/say]")

		saynn("Her rear lowers.. just a bit.")

		saynn("You reach out to scratch behind her left ear and under her chin. It makes her shudder.")

		saynn("[say=ferri]Stop it.. mew..[/say]")

		saynn("[say=pc]"+str(ch1("Good puppy. Keep going.", "C'mon, keep going.", "Show me some obedience, c'mon. I know that you're nothing but a subby pup."))+"[/say]")

		addButton("Continue", "See what happens next", "ferri_sits")
	if(state == "ferri_sits"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc="pc", npc="ferri", npcAction="paw", npcBodyState={naked=true, hard=true, leashedBy="pc"}})
		saynn("Ferri sits all the way down.. and then pushes her front paws off of the floor.")

		saynn("[say=ferri]..there.. mew..[/say]")

		saynn("[say=pc]"+str(ch1("Now give me your paw.", "Now give me your paw. Now.", "Now give me your paw, pup."))+"[/say]")

		saynn("She huffs and hesitates. So you give her some pats on her head, making her eyes flutter half-closed. A purr starts in her chest.")

		saynn("[say=ferri]Mnnn..[/say]")

		saynn("She lifts her paw!")

		saynn("[say=pc]"+str(ch1("Good girl.", "What a good little slut.", "Most of the time you're a worthless stupid whore. But you know some tricks it seems."))+"[/say]")

		saynn("You hold her paw, shaking it gently.")

		saynn("[say=ferri]Mew.. this is humiliating..[/say]")

		saynn("[say=pc]"+str(ch1("You look adorable, though.", "You look like such an adorable slutty pet though.", "You look like an adorable slutty pet. Why do you even pretend to be a person."))+"[/say]")

		saynn("She shakes her head, still resisting a bit.")

		saynn("So you reach and grab her horns, sending a shiver down her spine.")

		saynn("[say=ferri]Eep.. mmh..[/say]")

		saynn("As you start stroking them, her lips part and a soft noise starts escaping her.")

		saynn("[say=ferri]Ah..[/say]")

		saynn("Her body squirms as your hand slides along her ridged horns. More and more cute noises escape her, her eyes keep wanting to roll up.")

		saynn("[say=ferri]Nnhh.. meanie..[/say]")

		saynn("You can see it clearly. Her cyan nips are stiff and perky, her little pussy slit dripping juices onto the floor. Her tail begins to wag a little more.")

		saynn("[say=ferri]Hff.. ah..[/say]")

		addButton("Continue", "See what happens next", "more_pats")
	if(state == "more_pats"):
		playAnimation(StageScene.PuppySexStart, "pat", {pc="pc", npc="ferri", npcBodyState={naked=true, hard=true, leashedBy="pc"}})
		saynn("You let Ferri get on all fours again.")

		saynn("[say=pc]"+str(ch1("Look at you. You're melting, cutie.", "Look at you. You're melting, little slut.", "Look at you. You're melting. Pathetic really."))+"[/say]")

		saynn("[say=ferri]Nn.. shush..[/say]")

		saynn("You trust that she won't bite you and take off her muzzle.")

		saynn("And Ferri.. just stays still, looking up at you.")

		saynn("[say=pc]"+str(ch1("Aww. You don't wanna bite me anymore.", "I see that you don't wanna bite me anymore. Cute.", "Already gave up trying to bite me. I expected that."))+"[/say]")

		saynn("You put both of your hands on her head and sink your digits into her fur, giving her scritches everywhere! Ferri's breath hitches.")

		saynn("[say=ferri]Huff.. ffhh.. hhf..[/say]")

		saynn("You scratch behind her ears too.. and then switch to rubbing her horns again.. you find a spot that makes her hips twitch, her tail wagging visibly.. Thump-thump-thump against the concrete.")

		saynn("[say=ferri]Stohohop.. mew..[/say]")

		saynn("Her body sure doesn't want you to stop. You give that puppy many headpats, really flattening her ears in the process. Then you lean forward and give her belly and back some long strokes, making her arch it.")

		saynn("[say=ferri]Nyaa-ah..[/say]")

		saynn("She squirms and shivers, her tongue rolls out as she pants.")

		saynn("[say=pc]"+str(ch1("You're a cute little puppy.", "You're a slutty little pup.", "Dumb little pup."))+"[/say]")

		saynn("[say=ferri]Woof.. hff.. ahh..[/say]")

		saynn("Oh yeah, her pussy slit is like a little fountain, dripping non-stop. But you don't give that area any attention, you just focus on giving her scritches and pats.")

		saynn("When you stop and offer her your hand.. she automatically starts nuzzling it, purring escaping her throat. You lean closer to her ear and whisper.")

		saynn("[say=pc]"+str(ch1("Puppy, puppy, puppy.", "Puppy, puppy, puppy.", "Puppy, puppy, puppy. Nothing but a stupid puppy."))+"[/say]")

		saynn("[say=ferri]Woof.. woof.. mhh..[/say]")

		saynn("You give her even more headpats and belly rubs!")

		saynn("After so much praise and stimulation.. her brain visible short-circuits, her mouth hangs open, her tongue drooling onto the floor. Her eyes became unfocused, her pupils blown wide. The only sounds she makes now are soft, rhythmic little pants and puppy barks. Her tail wags so much it could easily destroy a piece of furniture if it was near.")

		saynn("No fight left in that puppy. No resistance.")

		saynn("You keep her in this state for a while longer, continuing to shower her with nice words that keep any normal thoughts out of her mind.")

		saynn("[say=pc]"+str(ch1("Yes. You're my puppy. My good little puppy.", "That's right. You're a puppy. My puppy.", "Worthless little thing. You know your place, right? Yes, you do."))+"[/say]")

		saynn("But now it's time to wrap it up.")

		addButton("Continue", "See what happens next", "put_things_back")
	if(state == "put_things_back"):
		playAnimation(StageScene.Beg, "pat", {pc="ferri", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You strip the puppy gear from Ferri and put her old things back on.. the muzzle and the cuffs.")

		saynn("She is still looking quite spaced out.")

		saynn("[say=ferri]Woof..[/say]")

		saynn("You give her some more pats!")

		saynn("And then.. you leave her be. Time to see what Kait thinks.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ferri_all_fours"):
		putOff("ferri", "inmatewristcuffs")

	if(_action == "more_pats"):
		putOff("ferri", "basketmuzzle")

	if(_action == "put_things_back"):
		putOn("ferri", "inmatewristcuffs")
		putOn("ferri", "basketmuzzle")

	setState(_action)
