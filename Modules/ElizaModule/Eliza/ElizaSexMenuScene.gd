extends SceneBase

func _init():
	sceneID = "ElizaSexMenuScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("What kinky stuff do you want to do with Eliza?")

		if (!getCharacter("eliza").hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			addButton("Milk her", "Why should you be the one who provides all the fluids? Time to milk Eliza!", "sex_milkher")
		else:
			addDisabledButton("Milk her", "Eliza's nips are sore. Give her some rest")
		addButton("Back", "You changed your mind", "cancethescene")
	if(state == "sex_milkher"):
		saynn("[say=pc]Just wanted to tell you, we're running low on milk.[/say]")

		saynn("You're hoping that she will be too lazy to check it.")

		saynn("Eliza raises a brow.")

		saynn("[say=eliza]Well, uh, do you need my help? I can milk you or someone else that you bring.[/say]")

		saynn("You hum, a little sly smile illuminates your expression. You lean in over the counter, closer to Eliza.")

		saynn("[say=pc]I think I can indeed use your help.[/say]")

		saynn("Your gaze lowers down to her breasts. Eliza tilts her head a bit while you are blatantly staring at her blouse's neckline.")

		saynn("[say=pc]You know.. I think it's only fair that you.. contribute too.[/say]")

		saynn("A slight blush shows up on the doctor's face.")

		saynn("[say=eliza]Hmm.. That's an interesting proposition, not gonna lie.[/say]")

		saynn("You lean closer to her twitching ear, whispering.")

		saynn("[say=pc]Ever drank coffee with your own milk in it~?[/say]")

		saynn("Eliza shifts in her place a bit.")

		if (getCharacter("eliza").canBeMilked()):
			saynn("[say=eliza]Fuck.. Let's do this.[/say]")

			addButton("Milking room", "Find a milking stall for Eliza", "milking_stall")
		else:
			saynn("[say=eliza]Fuck.. Let's do this. The only problem is..[/say]")

			saynn("Her paw slides along the side of her body.")

			saynn("[say=eliza]I'm not really lactating.. but that will just require a small detour~.[/say]")

			addButton("Detour", "See what Eliza will do about this problem", "in_lab")
	if(state == "in_lab"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		aimCameraAndSetLocName("med_researchlab")
		saynn("You follow Eliza into her lab.")

		saynn("She puts on some latex gloves and begins working on something. You watch as she fills a break with clean water, adds a few plants and.. substances.. before carefully putting it on a small burner.")

		saynn("Soon, the fluid inside begins to change color.. Eliza grabs a filter and uses it to separate the final result from all the gunk..")

		saynn("[say=eliza]Done~. Look at me go.[/say]")

		saynn("She takes off the gloves and grabs a shiny-new syringe, filling it with the resulting cyan drug. Seeing her grab an alcohol wipe and start rubbing her neck with it, making you a bit concerned.")

		saynn("[say=pc]Wait, you're just gonna inject this strange..[/say]")

		saynn("Before you can even finish your sentence, she lets the needle of that syringe ger under her skin. One small push of her thumb and the cyan fluid enters her bloodstream.")

		saynn("[say=eliza]I've done this a thousand times~. Well, just not on myself..[/say]")

		saynn("The syringe goes into the trash bin.")

		saynn("[say=eliza]Now we just wait.[/say]")

		saynn("There is no effect at first.. but it doesn't take long.")

		saynn("You watch in awe as Eliza's breasts begin to visibly swell under her blouse, putting some extra pressure onto the cloth.. Did you just hear something rip?")

		saynn("[say=eliza]Mhh-h..[/say]")

		saynn("She bites her lip, looking down at herself. Her paws slide along her new curves.")

		saynn("[say=eliza]They're itching..[/say]")

		saynn("A cute smile gets directed towards you.")

		saynn("[say=eliza]I'm all yours, assistant~..[/say]")

		saynn("Perfect.")

		addButton("Milking room", "Find a milking stall for Eliza", "milking_stall")
	if(state == "milking_stall"):
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcBodyState={exposedChest=true}})
		GM.pc.setLocation("med_milkingroom")
		saynn("You bring Eliza out into the big room that is fully dedicated to one special activity..")

		saynn("Along one of the walls there are many huge fluid tanks.. with connected pipes that are running all across the ceiling.")

		saynn("The opposite wall is dedicated to stalls, special little rooms that are divided by some thin metal separator walls.")

		saynn("You guide the feline into one of these stalls and begin preparing her. Your hands reach out of her lab coat.")

		saynn("[say=pc]May I?[/say]")

		saynn("[say=eliza]Sure. I give you full power over my body~. Just for now.[/say]")

		saynn("She trusts you.. makes you feel good.")

		saynn("You carefully take off her lab coat and hang it out of the way. Blue top and skirt are next, revealing her sexy black lingerie. Eliza's {eliza.breasts} are emphasized greatly by her bra.. a bra that is clearly too small for her in her current state.")

		saynn("The feline licks her lips while you slip behind her and undo the clasps, setting her girls free.")

		saynn("[say=eliza]Mmm~..[/say]")

		saynn("No points in taking off her panties.. it'd require you to mess with her garter belt.. should be enough, for now at least.")

		saynn("You just walk around her again and admire the view. Eliza stands perfectly still with arms slightly behind her, proudly displaying you her plump chest. Her nips look stiff and have a dark shade of pink to them, the areolas seem slightly enlarged. The gravity is making them sag.. but not too much.")

		saynn("[say=pc]Let's get you locked up.[/say]")

		addButton("Lock her", "Lock Eliza in the milking stall", "do_lock")
	if(state == "do_lock"):
		playAnimation(StageScene.MilkingStallDuo, "start", {pc="eliza", npc="pc", bodyState={exposedChest=true}})
		saynn("Eliza puts some extra sway into her hips as you bring her closer to the spot. Your hand lands on her fluffy back.. and begins putting some pressure, inviting the feline to bend forward. She obeys, following your touch with great interest sparking in her eyes.")

		saynn("[say=eliza]Mhh~..[/say]")

		saynn("You grab her paws and carefully set them down into the special restraints. They're just simple cuffs.. but they are attached to the stall, meaning you can't move. You lock the cuffs around her wrists with a satisfying click, leaving Eliza to stand in this.. quite exposed.. position.. where her full breasts are dangling free.")

		saynn("After locking her up, you take one of the small milk tanks.. ones that have a big seal lid at the top.. and position it under the feline. Seeing it sends a ripple through her, making her rub her thighs together already.")

		saynn("She just bites her lip.. completely helpless in this state.")

		addButton("Begin", "Begin the process", "begin_milking")
	if(state == "begin_milking"):
		playAnimation(StageScene.MilkingStallDuo, "milk", {pc="eliza", npc="pc", bodyState={exposedChest=true}})
		saynn("Slowly and carefully, you reach your hands out and gently cup her breasts. You feel their weight as your fingers trace along them, exploring the softness and teasing the perky, swollen nips. A deep but quiet noise escapes from Eliza.. Her lusty eyes watching your hands.")

		saynn("As soon as you squeeze a little, you get an instant reaction.. All around her areolas appear little white cascades of sweetness.. shining in the harsh sterile lighting as they drip down into the empty fluid container underneath.. plap.. plap..")

		saynn("[say=eliza]..ah-..[/say]")

		saynn("It didn't take much to start the process.. But that's not a surprise with how heavy her chest feels, basically leaking on its own. With each gentle squeeze, little bursts of milk spawn all around her nips.. You don't stop, your digits kneading and massaging her breasts.. that look more like udders in this position.")

		saynn("[say=eliza]Nhh~.. mmh~..[/say]")

		saynn("While you're busy hand-milking her chest, Eliza lets out more cute little moans, panting softly in between all the noises that she is making. Her body squirms ever so slightly under your touch, little twitches appear all throughout it.. but the cuffs hold her still for you.")

		addButton("Milking..", "Help take off the weight off of Eliza's chest..", "do_milk_first")
	if(state == "do_milk_first"):
		playAnimation(StageScene.MilkingStallDuo, "fast", {pc="eliza", npc="pc", bodyState={exposedChest=true}})
		saynn("Gradually, your touches grow more insistent.. groping and fondling her swollen bosom with a steady rhythm. Eliza's breast milk, warm and juicy, splatters into the open milk tank below.. the fluid level inside it slowly rises.")

		saynn("[say=eliza]Y-yes~.. ah.. ahh..[/say]")

		saynn("Her eyes are closed by now, Eliza is rubbing her thighs together more while letting out more passionate moans, her body squirming while her breasts produce a steady flow of milk.. It's like she has completely surrendered to the moment, her mind reduced down to a state of pure, mindless pleasure.")

		saynn("[say=eliza]Ah.. nhhh~..[/say]")

		saynn("Her breasts are not overflowing anymore.. but pinching her nips delicately still yields some more of that tasty nectar, her milk squirting out.")

		saynn("After collecting a fair amount of it.. you take a pause.")

		saynn("[say=pc]How do you feel?[/say]")

		saynn("[say=eliza]Mmhh.. it feels good.. to be milked..[/say]")

		saynn("You can push her a little further.. or end it here.")

		addButton("Enough", "You collected some milk.. might as well stop here", "stop_milking")
		addButton("More", "Milk Eliza's breasts more", "milk_more")
	if(state == "stop_milking"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcBodyState={exposedChest=true}})
		saynn("You decided to end it there and help Eliza to get out of that stall, unlocking her wrists.")

		saynn("Her eyes.. pure lust.. little moans still escaping her. She looks down at her chest.. one that still maintains most of its volume.. but now not as heavy or itchy anymore.")

		saynn("[say=eliza]I needed that..[/say]")

		saynn("She then directs her gaze into the milk tank.")

		saynn("[say=eliza]Good job.. you did such a good job..[/say]")

		saynn("[say=pc]I think it's me who should praise you.[/say]")

		saynn("A soft chuckle makes her breasts bounce..")

		saynn("[say=eliza]Well thank you.. I will be going now~.[/say]")

		saynn("She grabs her clothes and puts them on.. already heading towards the exit.")

		saynn("You nod and use the tank to fill your lab's reservoirs.")

		saynn("Perfect.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "milk_more"):
		playAnimation(StageScene.MilkingStallDuo, "cum", {pc="eliza", npc="pc", bodyState={exposedChest=true}})
		saynn("After this small break, your hands return back to milking Eliza's breasts, kneading and squeezing them.. like they're udders. You manage to get a small flow of her milk going again.. but it quickly begins to subside. The feline is squirming and moaning.. but also occasionally lets out a short hiss.. her nips clearly becoming sore from so much stimulation.")

		saynn("But you can tell that she craves it.. you can just feel it.. she has more in her, this kitty. So you lean closer to her ear and begin whispering.")

		saynn("[say=pc]I love what I'm seeing. You are such a good cow, Eliza. Look at those udders, you're making so much milk. I could milk you all night long.[/say]")

		saynn("Your words send a shiver down her spine. Almost immediately, she responds, her moans deepening as the flow of milk begins to build once more.")

		saynn("[say=pc]That's it, baby.[/say]")

		saynn("[say=eliza]Mhhh-h.. ahh.. hhh-hah.. yes-s..[/say]")

		saynn("You resume your gentle yet insistent squeezes, your hands firmly pressing and massaging her swollen breasts, coating out streams of warm milk that cascade into the tank below.")

		saynn("[say=pc]Let it flow. You're a great cow, and I'm here to help you give it all to me.[/say]")

		saynn("Her body continues to squirm as your fingers keep milking her.. pinching, kneading and fondling her in a steady rhythm that pushes her deeper into this abyss of pleasure.")

		saynn("[say=pc]Don't have to worry about anything. Just focus on this. Focus on being the best cow you can.[/say]")

		saynn("Her eyes flutter closed as her breathing becomes ragged.. and soon..")

		saynn("[say=eliza]Moo~..[/say]")

		saynn("A surprised, delighted moo punctuates the air.. showing her full surrender. Her panties, the only garment keeping her modest, became soaked, a few strings of her juices hanging between her wet thighs.")

		saynn("[say=pc]Good girl.. good cow..[/say]")

		saynn("[say=eliza]..moo.. ah.. m-moo..[/say]")

		saynn("Scent of her arousal and milk fills the stall.. making you quite horny too. Every squeeze, every fondle, forces more milk from her engorged breasts. The sound of her soft, continuous moans and occasional playful 'moo's reverberates around the space.")

		saynn("The fluid level in that tank raises higher and higher, milk trickling into it.. a very high-quality milk. Eliza is shivering, panting deeply into your face, her submissive side shining brightly.")

		saynn("[say=eliza]Moo.. mhh.. h-h..[/say]")

		saynn("As the flow begins to subside again, you decide to take another pause.")

		saynn("With no stimulation to her breasts, Eliza just keeps producing quiet noises, breathing heavily.")

		saynn("[say=pc]Good girl. You produced so much.[/say]")

		saynn("A few scritches under her chin makes her start purring.. poor kitty must be exhausted from standing for so long.")

		saynn("You look around.. and notice that one of the neighbour stalls is configured for a different kind of milking.. it has a grated platform with a sybian machine on it.")

		addButton("Enough", "That was enough for now", "stop_milking")
		addButton("Sybian", "Milk Eliza's pussy as well", "sybian_milking")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sex_milkher"):
		processTime(3*60)

	if(_action == "cancethescene"):
		endScene()
		runScene("ElizaTalkScene")
		return

	if(_action == "in_lab"):
		getCharacter("eliza").induceLactation()
		processTime(15*60)
		getCharacter("eliza").fillBreasts()

	if(_action == "do_lock"):
		processTime(3*60)

	if(_action == "begin_milking"):
		processTime(5*60)

	if(_action == "do_milk_first"):
		processTime(3*60)
		GM.main.SCI.doMilkCharacterCustom(getCharacter("eliza"), BodypartSlot.Breasts)
		GM.pc.addSkillExperience(Skill.Milking, 20)

	if(_action == "stop_milking"):
		processTime(3*60)
		getCharacter("eliza").addEffect(StatusEffect.SoreNipplesAfterMilking)

	if(_action == "milk_more"):
		getCharacter("eliza").fillBreasts(RNG.randf_range(0.7, 1.0))
		GM.main.SCI.doMilkCharacterCustom(getCharacter("eliza"), BodypartSlot.Breasts)
		GM.pc.addSkillExperience(Skill.Milking, 20)

	if(_action == "sybian_milking"):
		processTime(3*60)

	setState(_action)
