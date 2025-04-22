extends SceneBase

var isStrapon = false
var hasCumInStrapon = false
var straponHasCum = false
var sexDidPullout = false
var isAnal = false
var hasPP = false
var isKnot = false
var isBarbs = false
var isHorse = false
var isHuman = false

func _init():
	sceneID = "ElizaSexMenuScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("What kinky stuff do you want to do with Eliza?")

		if (GM.pc.hasReachablePenis()):
			addButtonWithChecks("Vaginal", "Lock Eliza to the fancy table and fuck her!", "vag_start", [], [[ButtonChecks.HasReachablePenis]])
		else:
			addButtonWithChecks("Vaginal", "Lock Eliza to the fancy table and fuck her with one of your strapons!", "vag_start_strapon", [], [[ButtonChecks.HasStraponAndCanWear]])
		if (!getCharacter("eliza").hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			addButton("Milk her", "Why should you be the one who provides all the fluids? Time to milk Eliza!", "sex_milkher")
		else:
			addDisabledButton("Milk her", "Eliza's nips are sore. Give her some rest")
		if (getFlag("ElizaModule.storyCompleted")):
			addButton("Scarlet..", "(Soft Incest) Show what fun things you could do with Eliza and her mother", "scarlet_menu")
		else:
			addDisabledButton("Scarlet..", "(Soft Incest) Complete Eliza's storyline first to unlock this")
		if (getCharacter("eliza").hasReachablePenis()):
			if (GM.pc.hasReachableVagina()):
				addButtonWithChecks("Get fucked!", "Allow Eliza to fuck your pussy", "futa_sex", [], [[ButtonChecks.HasReachableVagina]])
			addButton("Get pegged!", "Allow Eliza to fuck your ass", "futa_sex_anal")
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

			addButton("Detour", "See what Eliza will do about this problem", "in_lab_milking")
	if(state == "in_lab_milking"):
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
		addCharacter("eliza", ["naked"])
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

		addButton("Lock her", "Lock Eliza in the milking stall", "do_lock_milking")
	if(state == "do_lock_milking"):
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
		addButton("Pussy milking", "Milk Eliza's pussy as well by using that sybian", "sybian_milking")
	if(state == "sybian_milking"):
		playAnimation(StageScene.Beg, "beg", {pc="eliza", npc="pc", bodyState={naked=true, hard=true}})
		saynn("There is one more thing you wanna do with that milky feline.")

		saynn("First, you gotta get her out of this stall. Eliza is panting and nuzzles her cheek against your hands as you unlock her wrists.")

		saynn("[say=eliza]That was fun..[/say]")

		saynn("[say=pc]The fun is not over yet.[/say]")

		saynn("[say=eliza]Ohh..[/say]")

		saynn("Her body barely listens to her.. leaving her kneeling in front of you after being unlocked.")

		saynn("[say=pc]Let me see something.[/say]")

		saynn("You lean down and begin pulling off her garter belt and the lace panties, what's left of her clothes.")

		saynn("[say=eliza]M-moo?..[/say]")

		saynn("[say=pc]Spread your legs for me.[/say]")

		saynn("Eliza's obedience shines through, making her fulfil your order, revealing.. some careful pink pussy lips that have been soaking that black cloth with her juices this whole time. Eliza is looking.. needy.. with multiple beads of her juices hanging off of her neglected folds.")

		saynn("[say=pc]Let's get you to a different stall.[/say]")

		saynn("She doesn't even need a leash, crawling by your side as you head towards the stall with a different setup, swaying her hips and letting her udders dangle beneath her.")

		saynn("Eliza's eyes light up when sees the sybian. The machine that looks like a comfy seat.. but with a ridged little platform and a small dildo in a place exactly where someone's private bits would be.")

		saynn("[say=eliza]Oh my..[/say]")

		saynn("[say=pc]Gonna milk you for everything you've got, understand?[/say]")

		saynn("She bites her lip as you begin chaining her up to the machine.")

		saynn("[say=eliza]..of course.. yes..[/say]")

		saynn("You notice that there is also a set of electric breast pumps hanging nearby, with bendable tubes that are connected to all the ceiling piping. This place is such a milking heaven.. Might as well fully automate it all, right?")

		addButton("Sybian", "Prepare Eliza..", "milking_tie_to_sybian")
	if(state == "milking_tie_to_sybian"):
		playAnimation(StageScene.SybianOral, "ride", {pc="eliza", npc="pc", chained=true, bodyState={naked=true, hard=true}})
		saynn("You secure Eliza to the machine with some cuffs and chains, making her completely helpless yet again. Her neck also receives a collar with a metal leash that's connected to the floor.. all to make sure her body is positioned perfectly for what will come next.")

		saynn("You grab and carefully attach 2 automatic breast pumps to her sensitive breasts.. which get glued to her swollen nips after they suck out some air.")

		saynn("[say=eliza]I don't think I have any milk in my udders l-left..[/say]")

		saynn("[say=pc]We will see, little cow.[/say]")

		saynn("You turn them out.. and they respond instantly, proceeding to do slow rhythmic suctions, eager to pull the creamy fluids out.")

		saynn("[say=eliza]Ah..[/say]")

		saynn("Repetitive mechanical noise of sucking gets mingled with Eliza's cute moans as the pumps visibly tug on her nips.. again and again.. There are some drops of white milky stuff that your hand milking has missed.. but most of it seems fruitless.")

		saynn("It makes Eliza squirm a lot though, her body pushing against the chains, her eyes looking slightly spaced out, her tongue out as her breasts get stimulated again and again.")

		saynn("[say=eliza]Mhh.. ah.. please.. I w-wanna cum so much..[/say]")

		saynn("Her neglected pussy begins to coat the sybian under her with her juices. She tries to hump the little dildo that she is sitting on.. but the chains limit her range of actions to pretty much nothing.")

		addButton("Turn sybian on", "See what happens..", "milking_sybian_turn_on")
	if(state == "milking_sybian_turn_on"):
		playAnimation(StageScene.SybianOral, "intense", {pc="eliza", npc="pc", chained=true, bodyState={naked=true, hard=true}})
		saynn("You grab a little remote.. and twist a knob.. sending the sybian machine into action. Its deep, steady vibrations begin to work against Eliza's already aroused pussy. Her clit gets stimulated by the moving ridges pressed against it.. while a small, vibrating dildo, strategically placed to tease her inner walls, sends a whole wave of pleasure pulses that mix with the unyielding pumping of her breasts.")

		saynn("[say=eliza]Ah f-fuck.. ah.. Ah-h.. ah..[/say]")

		saynn("Her body reacts instantly, her face switches to pure bliss as loud moans begin to slip past her lips, one after another. Her every muscle seems to be trembling, her hips bucking against the restraints as the sybian's vibrations push her deeper into this crazy den of pleasure.")

		saynn("[say=eliza]I'm g-gonna.. gg-gonna.. Ah-h-h..[/say]")

		saynn("[say=pc]Cum for me, cow.[/say]")

		saynn("The relentless stimulation makes her squirm.. and soon.. she reaches an explosive climax. Eliza throws her head back and lets out a passionate love noise while her pulsing pussy gushes with girlcum, overstimulation making her body give up and completely let go.")

		saynn("So much wetness.. it all begins to sip through the grated platform, collected by the giant fluid hopper underneath.")

		saynn("The pumps are still working on her tits.. And as soon as her body gets pushed into this climactic state, her udders suddenly burst with two steady rivers of milk. The pumps just keep drawing more and more of that juice out, working on her stiff nips.")

		saynn("[say=pc]See? You're such a good cow.[/say]")

		saynn("[say=eliza]Ah.. moo-o-o..[/say]")

		saynn("You see no thoughts behind her green eyes.. only.. pleasure.. complete submission.")

		saynn("It doesn't take long for the next orgasm.. Eliza throws her head back again, letting the chains catch her body while her pussy squirts again, muscles throbbing while a little fountain of juices spawns between her wet legs, all neatly collected by the contraption beneath.")

		saynn("And each time it happens, her milk flow increases again.. a cycle that keeps Eliza in her state of complete and total sensory overload. No thinking.. no distractions.. only constant, mindless milking.")

		saynn("[say=eliza]Moo.. hh.. nhh-.. moo..[/say]")

		saynn("Orgasm after orgasm, the machines are slowly wearing Eliza out, exhausting her already tired body until her eyes begin to shut on their own.")

		saynn("A good place to stop, probably. For real, this time.")

		addButton("Enough", "Stop milking the poor kitty", "stop_milking_after_all")
	if(state == "stop_milking_after_all"):
		playAnimation(StageScene.SybianOral, "ride", {pc="eliza", npc="pc", chained=true, bodyState={naked=true, hard=true}})
		saynn("Finally, you turn off the sybian machine.. as well as the breast pumps.")

		saynn("As the constant stimulation stops, Eliza is left panting heavily.")

		saynn("[say=eliza]Mhh.. h-.. h..[/say]")

		saynn("Barely making any noise.. she is just.. spent..")

		saynn("Gently, you pull each pump off of her breasts.. Her nips are looking more red than pink after all this milking.")

		saynn("[say=pc]How are you feeling?[/say]")

		saynn("[say=eliza]I'mma.. ammakay..[/say]")

		saynn("She certainly doesn't look so. You give her some scritches behind the ears.. and feel her raspy purr.")

		saynn("[say=pc]You made a lot of milk for us. Such a good cow.[/say]")

		saynn("[say=eliza]Moo~..[/say]")

		saynn("You give her time to come back to her senses. There isn't any comfortable furniture around.. so this seat that she is sitting on will have to do.")

		saynn("[say=eliza]You.. really milked me.. wow..[/say]")

		saynn("[say=pc]I picked up a few tricks from being your assistant.[/say]")

		saynn("A small, tired smile appears on her face.")

		saynn("[say=pc]Gotta say, I like you with a collar.[/say]")

		saynn("[say=eliza]Pff.. I will pat you.. after I'm done riding your face..[/say]")

		saynn("She throws her head back and lets out a silly giggle, her tits bouncing slightly.")

		saynn("[say=eliza]Every muscle hurts, hah.. I might need a stronger coffee today..[/say]")

		addButton("Unchain her", "Might as well", "milking_unchain_after_all")
	if(state == "milking_unchain_after_all"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcBodyState={naked=true}})
		saynn("You begin to undo the chains, slowly freeing Eliza's limbs one by one.")

		saynn("As much as you don't wanna do it, you also unlock the collar and take it off of her neck.")

		saynn("Her body barely listens to her.. so you help her to get up.")

		saynn("[say=pc]There we go. Thank you for your contribution, let's hope it won't be the last one.[/say]")

		saynn("She squints at your playful tone.. and reaches her paw to pat you on the head.")

		saynn("[say=eliza]You're welcome. I really need a shower now.. so, if you excuse moo~..[/say]")

		saynn("Her cheeks blush deeply.")

		saynn("[say=eliza]I mean.. Me.. excuse me..[/say]")

		saynn("She slowly walks past you. You only hear..")

		saynn("[say=eliza]..fuck that was amazing..[/say]")

		saynn("..before Eliza steps out of the stall and heads towards the exit.. still naked..")

		saynn("That was fun.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "vag_start"):
		saynn("You ask Eliza a question without much thought.")

		saynn("[say=pc]How about a quickie?[/say]")

		saynn("Eliza arches an eyebrow and smirks, the tip of her tongue licking her fang.")

		saynn("[say=eliza]Oh yeah? Think you can handle me~?[/say]")

		saynn("She puts her coffee mug away.")

		saynn("[say=pc]Yes.[/say]")

		saynn("A soft chuckle is heading your way. That cheeky cat..")

		addButton("Grab her", "Bring her somewhere more secluded", "vag_table")
	if(state == "vag_table"):
		playAnimation(StageScene.SexPinnedBehind, "tease", {pc="pc", npc="eliza", npcBodyState={underwear=true}})
		addCharacter("eliza", ["naked"])
		aimCameraAndSetLocName("med_researchlab")
		GM.pc.setLocation("med_researchlab")
		saynn("Without hesitation, you hop over the counter and grab Eliza by that fancy necklace that she has, using it as a short leash.")

		saynn("[say=eliza]Eek![/say]")

		saynn("You pull her through the sterile corridors of the medical wing and push her into the lab room. In a flurry of fast and authoritative movements, you pin her against one of the walls and begin undressing her. Her lab coat, pencil skirt and blue top fall away, leaving her sexy underwear exposed...")

		saynn("[say=eliza]You weren't kidding about this being a 'quickie'..[/say]")

		saynn("Your hand lands on her neck and gives it a firm squeeze, sending shivers through her back.")

		saynn("[say=pc]Already too much for you, kitty?[/say]")

		saynn("She holds her chin high, exposing more of her neck for you.")

		saynn("[say=eliza]Not at all.[/say]")

		saynn("[say=pc]Good.[/say]")

		saynn("Because you weren't done yet. There is this smart medical table in the middle of the lab.. Perfect for tying some unruly test subjects to.. but not only them.")

		if (isStrapon):
			addButton("Table", "Put the feline onto the table and wear a strapon", "vag_on_table_pickstrapon")
		else:
			addButton("Table", "Put the feline onto the table", "vag_on_table")
	if(state == "vag_on_table_pickstrapon"):
		saynn("Pick which strapon you wanna wear.")

		addStraponButtons("vag_on_table_pickstrapon_dopick")
		if (false):
			addButton("Nope", "You shouldn't see this", "vag_on_table_pickstrapon_dopick")
	if(state == "vag_on_table"):
		playAnimation(StageScene.MilkingProstateFuck, "tease", {pc="eliza", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("The rest of Eliza's garments don't survive for long either, your hands pull her fancy panties and bra off, exposing her cute pink nips and a careful pink slit.. one that seems to be somewhat wet already.")

		saynn("You throw the feline onto the advanced-looking table.. and press some buttons that cause the manipulators to dart out towards Eliza's body with mechanical precision, grabbing her wrists and ankles, rendering her helplessly bound.")

		saynn("[say=eliza]Ohh. Kinky~. Reminds me of how I milk some inmates..[/say]")

		saynn("You notice a display hovering near you.. it seemingly shows Eliza's heartbeat.. as well as her rough pain and lust meters.. 0% and 60%.")

		saynn("Your hand delivers a firm smack on her fluffy butt, making Eliza let out a lustful noise while her body jerks forward, testing the restraints. The manipulators bring her frame back in one smooth motion, keeping her legs spread for you so that her slick, pink pussy is out on full display.")

		saynn("The display shows her pain briefly spiking to 15%.. but also her lust jumping up to 69%. Fascinating tech.")

		saynn("[say=eliza]Ah..[/say]")

		if (!isStrapon):
			saynn("[say=pc]You will be milking me indeed.[/say]")

			saynn("You expose your hard {pc.penis} and quickly align it with that inviting pussy hole. Pink folds kiss the tip of your member, leaving a thin layer of arousal on it.")

		else:
			saynn("[say=pc]And now I will be milking you with this.[/say]")

			saynn("You secure a strapon harness around your waist and catch some of Eliza's arousal onto your hand before spreading it along your new rubber shaft. You press the tip against her pink folds, making it kiss them..")

		saynn("[say=eliza]Mmh~.. You got me.. right where I wanted~.[/say]")

		saynn("Still so cheeky, this cat."+str(" Little does she know that your strapon has a secret to it.." if hasCumInStrapon else "")+"")

		addButton("Thrust inside", "Make her feel it", "vag_sex_sex")
	if(state == "vag_sex_sex"):
		playAnimation(StageScene.MilkingProstateFuck, "sex", {pc="eliza", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Her tail looks like a nice leash in this position. Your hand catches the wiggly snake and yanks on it while you push yourself forward, doing a rough, assertive thrust, burying your "+str("cock" if !isStrapon else "toy")+" between her velvet walls.")

		saynn("[say=eliza]Ah![/say]")

		saynn("All that roughness elicits a startled gasp from the feline, her pussy contracting slowly around you, savoring every inch of your"+str(" rubber" if isStrapon else "")+" shaft as you begin to build momentum, sliding in and out, using that bound kitty.")

		saynn("Your hand lets go of that tail and gropes her nice ass instead. You fuck her while looking at the screen, seeing her lust climbing higher and higher.. You know the exact point where it feels best for her.. almost cheating. You find the best angle to hit her g-spot and now keep hammering away at it.")

		saynn("[say=eliza]Ah.. ah.. fuck that feels good..[/say]")

		saynn("With every thrust, your cock pumps into her slick sex, the friction and pressure sending waves of pleasure pulsing through her body.")

		saynn("[say=pc]What does?[/say]")

		saynn("[say=eliza]Mmhh..[/say]")

		saynn("Another smack on her ass makes her throw her head back and moan, her inner walls hugging "+str("your shaft" if !isStrapon else "that shaft between your legs")+" oh so well.")

		saynn("[say=eliza]Your cock fucking me does..[/say]")

		saynn("Who knew that this doctor could be such a subby girl.")

		addButton("Faster", "Since she likes it so much", "vag_sex_faster")
	if(state == "vag_sex_faster"):
		playAnimation(StageScene.MilkingProstateFuck, "fast", {pc="eliza", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("The slaps begin echoing around the lab as the pace of your fucking intensifies, your movements becoming more eager and hard. The servos inside the table's manipulators whirl audibly as Eliza tries to squirm, bound by their will, forced to endure your onslaught on her cute pink slit.")

		saynn("[say=eliza]Mm.. ah.. I'm gonna.. g-gonna..[/say]")

		saynn("[say=pc]Cum, little slut.[/say]")

		saynn("She tries to huff in your direction and bap you with her tail.. but misses.. the tension inside her peaks and her body starts trembling uncontrollably.")

		saynn("[say=eliza]Nhh-hhhahhh..[/say]")

		saynn("Her pussy clenches and relaxes in rapid succession, each contraction sucking you in deeper, allowing your"+str(" cock" if !isStrapon else " strapon")+" to pound away at her slightly-less-firm cervix. She cums hard, her body trying to thrash against the restraints while waves of pure ecstasy wash over her.")

		if (!isStrapon):
			saynn("Her tight slit is pushing you to your limit as well..")

			addButton("Cum inside", "Breed the slut", "vag_sex_cum")
			addButton("Pull out", "You'd rather not risk it", "vag_sex_pullout")
		else:
			saynn("You get a strong desire to shove the whole length in..")

			addButton("Do it", "Breed the slut with that toy", "vag_sex_cum_strapon")
	if(state == "vag_sex_pullout"):
		playAnimation(StageScene.MilkingProstateFuck, "tease", {pc="eliza", npc="pc", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("The desire to just breed this slut is strong.. but you'd rather play it safe. As soon as you feel your orgasm taking over, you pull out!")

		saynn("[say=eliza]Ah..[/say]")

		saynn("Eliza's pussy hole is pulsing open while your {pc.penis} throbs and shoots waves of sticky stuff all over her naked fluffy butt and back, multiple strings of your spunk landing on her fur, creating lewd patterns.")

		saynn("Both, you and her, are left panting. The display shows her lust rapidly going down..")

		saynn("[say=pc]You're pretty easy to handle, as it turned out.[/say]")

		if (getCharacter("eliza").isVisiblyPregnant()):
			saynn("[say=eliza]Pff.. mhh-h.. Also.. I'm pregnant already, why didn't you cum inside~.[/say]")

			saynn("[say=pc]I just wanted to mark this ass of yours.[/say]")

			saynn("[say=eliza]..fair.[/say]")

		else:
			saynn("[say=eliza]Pff.. mhh-h.. Also.. too scared to cum inside~?[/say]")

			saynn("[say=pc]You're saying I should have?[/say]")

			saynn("[say=eliza]I'm saying that you're too scared~.[/say]")

			saynn("You find a spot on her ass that didn't get messy and spank it.")

			saynn("[say=eliza]Ow![/say]")

		saynn("Might as well end the quickie here.")

		sexDidPullout = true
		addButton("Continue", "Enough fun for now", "vag_sex_enoughfun")
	if(state == "vag_sex_cum"):
		playAnimation(StageScene.MilkingProstateFuck, "inside", {pc="eliza", npc="pc", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Driven by the raw, relentless desire, you slam your"+str(" rubber" if isStrapon else "")+" cock deep into her, the tip forcefully breaking through into her womb, claiming it.")

		saynn("[say=eliza]AHhhh-..[/say]")

		if (!isStrapon || hasCumInStrapon):
			saynn("The display shows that Eliza's pain and lust are both spiking through the roof.. while your"+str(" strapon [b]suddenly begins to throb inside her[/b]" if isStrapon else " member throbs inside her")+", shooting lines of thick, virile seed straight into her babymaker, pumping it full.")

			saynn("Waves of "+str("your {pc.cum}" if !isStrapon else "that stuff")+" keep erupting within her, almost like a tide, flooding her insides, already overflowing and creating lewd, messy patterns on the fur of her thighs. Eliza's slick, hot pussy clenches tightly around your pulsing shaft, "+str("milking your balls with each desperate, rhythmic squeeze" if !isStrapon else "trying to milk it with each desperate, rhythmic squeeze")+".")

			saynn("[say=eliza]Mhh-h.. f-fuck.. ah.. ahhh-.. ah~.. hhhff..[/say]")

		else:
			saynn("The display shows that Eliza's pain and lust are both spiking through the roof.. with the full length of your new rubber cock inside her. Eliza's slick, hot pussy clenches tightly around your shaft, trying to milk it with each desperate, rhythmic squeeze.")

			saynn("[say=eliza]Mhh-h.. f-fuck.. ah.. ahhh-.. ah~.. hhhff..[/say]")

		saynn("Mechanical whirl is mingling with her loud moans and huffs, the manipulators barely able to contain her passion.")

		saynn(""+str("As you pass over your peak" if !isStrapon else "After all this")+".. you just stay inside her, enjoying the slick tightness.")

		saynn("Both, you and her, are left panting. The display shows her lust rapidly going down.. while the pain stays mostly at the same level.")

		saynn("[say=pc]You're pretty easy to handle, as it turned out.[/say]")

		saynn("[say=eliza]Pff.. mhh-h.. yeah, you're lucky this feels good..[/say]")

		saynn("[say=pc]Doesn't it hurt?[/say]")

		saynn("[say=eliza]It does, yes..[/say]")

		saynn("Her body is shivering.. but she seems to be handling it well. Looks like she had worse experiences than this.")

		saynn("Might as well end the quickie here.")

		addButton("Pull out", "Enough fun for now", "vag_sex_enoughfun")
	if(state == "vag_sex_enoughfun"):
		playAnimation(StageScene.Grope, "watchrub", {pc="eliza", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (!isStrapon || hasCumInStrapon):
			if (sexDidPullout):
				saynn("The manipulators let go of her limbs.. without you pressing anything.. huh.")

				saynn("Eliza gets off the table and turns towards you, her paws exploring her pink slit and the messy butt.")

				saynn("[say=eliza]So much.. I gotta take a shower..[/say]")

			else:
				saynn("You pull your"+str(" rubber" if isStrapon else "")+" cock out.. making her used pussy start to pulse your seed out..")

				saynn("The manipulators let go of her limbs.. without you pressing anything.. huh.")

				saynn("Eliza gets off the table and turns towards you, her paws exploring her pink, creamed slit.")

				if (hasCumInStrapon):
					saynn("[say=eliza]Wow.. what is this stuff? I gotta take a shower or I'm gonna be dripping all over the floor..[/say]")

				else:
					saynn("[say=eliza]So much.. I gotta take a shower or I'm gonna be dripping all over the floor..[/say]")

			saynn("You get close and scritch her under the chin.")

			saynn("[say=pc]But do you actually need to do that?[/say]")

			saynn("Eliza bites her lip softly.")

			saynn("[say=eliza]Perhaps not..[/say]")

			saynn("[say=pc]Good girl.[/say]")

			saynn("You give her a pat and help her pull her panties back to cover her "+str("stuffed slit" if !sexDidPullout else "wet slit and a messy butt")+".")

			saynn("[say=eliza]Thankies~.[/say]")

			saynn("[say=pc]Cumslut.[/say]")

			saynn("[say=eliza]Wow, now you're pushing it! I'm not that subby![/say]")

			saynn("You smack her ass, making her moan.. your seed dripping through the dark fabric.")

			saynn("[say=pc]You're the one pushing right now.[/say]")

			saynn("[say=eliza]Pff. Fair point..[/say]")

		else:
			saynn("You pull your rubber cock out.. letting her used slit to gape for a few seconds.")

			saynn("The manipulators let go of her limbs.. without you pressing anything.. huh.")

			saynn("Eliza gets off the table and turns towards you, her paws exploring her pink, wet slit.")

			saynn("[say=eliza]Felt great.. but I gotta take a shower..[/say]")

			saynn("You get close and scritch her under the chin.")

			saynn("[say=pc]But do you actually need to do that?[/say]")

			saynn("Eliza bites her lip softly.")

			saynn("[say=eliza]Perhaps not..[/say]")

			saynn("[say=pc]Good girl.[/say]")

			saynn("You give her a pat and help her pull her panties back to cover her dripping slit.")

			saynn("[say=eliza]Thankies~.[/say]")

			saynn("[say=pc]Slut.[/say]")

			saynn("[say=eliza]Wow, now you're pushing it! I'm not that subby![/say]")

			saynn("You smack her ass, making her moan.. her juices dripping through the dark fabric.")

			saynn("[say=pc]You're the one pushing right now.[/say]")

			saynn("[say=eliza]Pff. Fair point..[/say]")

		saynn("She puts on the rest of her clothes back.")

		saynn("[say=eliza]This was fun~.[/say]")

		saynn("Indeed.")

		saynn("And just like that, she heads off, swaying her hips seductively in the process.")

		addButton("Continue", "See what happens next", "endthescene_unequipstrapon")
	if(state == "scarlet_menu"):
		var scarletProgress = getFlag("ElizaModule.scarletProgress", 0)
		saynn("What do you wanna do with Eliza and Scarlet?")

		saynn("Keep in mind that this will include soft incest..")

		addButton("Intro", "Ask Eliza where her mother is currently", "s1_start")
		if (scarletProgress >= 1):
			addButton("Milking", "Watch them milk each other", "s2_milking")
		else:
			addDisabledButton("Milking", "You haven't reached this point yet")
		if (scarletProgress >= 2):
			addButton("Double trouble", "Let them both to have fun with you", "s3_start")
		else:
			addDisabledButton("Double trouble", "You haven't reached this point yet")
		addButton("Back", "You changed your mind", "")
	if(state == "s1_start"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("A spark of curiosity shines in your eyes.")

		saynn("[say=pc]I wonder, is Scarlet still here, on this station?[/say]")

		saynn("Eliza offers you a dismissive shrug.. then stops doing whatever she was doing and looks at you while wearing a little cunning smile.")

		saynn("[say=eliza]Yeah, she is probably in her quarters. Royalty like her isn't gonna be rotting down here, with us.[/say]")

		saynn("You nod softly, trying not to show any emotion.. but those green eyes read you like a book.")

		saynn("[say=eliza]I answered a question. Now it's my turn~.[/say]")

		saynn("You blink innocently.")

		saynn("[say=pc]Hm?[/say]")

		saynn("Eliza tilts her head slightly, her smug smile getting wider.")

		saynn("[say=eliza]Why are you asking that~?[/say]")

		saynn("[say=pc]Well, you know.. just wondering if I can ask her a few questions..[/say]")

		saynn("She nods after your every word.")

		saynn("[say=eliza]Mhm, mhm, yep, yep~.[/say]")

		saynn("[say=pc]What?[/say]")

		saynn("Eliza leans over the counter and stares you directly into the eyes.")

		saynn("[say=eliza]Did you like her~? C'mon, you can tell me~. You think my mom is hot, don't you~?[/say]")

		saynn("[say=pc]That's more than one question.[/say]")

		saynn("The feline pouts.. but still with a small cute smile.")

		saynn("[say=eliza]How about this. If you admit to it, I might just take you to her~.[/say]")

		saynn("What a choice.")

		addButton("Admit it", "Scarlet is a nice woman", "s1_admit")
		addButton("Refuse", "That's too much for you", "s1_refuse")
	if(state == "s1_refuse"):
		saynn("You just slowly shake your head.")

		saynn("[say=eliza]Aww, I know you're bullshitting me~. No mom for you then![/say]")

		saynn("Oh well. Was worth a shot.")

		addButton("Continue", "See what happens next", "")
	if(state == "s1_admit"):
		saynn("[say=pc]Scarlet is a nice woman. Happy?[/say]")

		saynn("Eliza looks like she is about to jump out of her skirt, grinning wildly.")

		saynn("[say=eliza]You little motherfucker~.[/say]")

		saynn("[say=pc]Hey![/say]")

		saynn("[say=eliza]I know, I know, you aren't one yet~. Let's go![/say]")

		saynn("Eliza steps out from behind her counter and walks up to the elevator, inviting you to follow.")

		addButton("Follow", "See where she will bring you", "s1_follow")
	if(state == "s1_follow"):
		aimCameraAndSetLocName("cd_near_office2")
		setLocationName("Private Quarters")
		saynn("You step into the elevator. Eliza presses her badge against the control panel and picks one of the highest floors..")

		saynn("After the doors open, you see a comfy-looking hallway.. with a bunch of closed doors leading into different rooms.")

		saynn("Eliza guides you through this labyrinth until you arrive somewhere. The feline presents you the door.")

		saynn("[say=eliza]Here it is~.[/say]")

		saynn("She knocks on it.")

		saynn("No reaction.")

		saynn("[say=eliza]Hm.[/say]")

		saynn("[say=pc]You're sure she is here?[/say]")

		saynn("[say=eliza]Well.. yeah? Where else would she be..[/say]")

		saynn("She knocks more.. and more..")

		saynn("[say=eliza]I thought she was done talking with the captain. Hm..[/say]")

		saynn("Her cunning smile gets witched for a slightly concerned expression. After a few nervous attempts, she decides to grab her badge and press it against the door.")

		saynn("Door happily opens.. Eliza rushes inside.. you follow.")

		addButton("Continue", "See what happens next", "s1_reveal")
	if(state == "s1_reveal"):
		aimCameraAndSetLocName("cd_office2")
		setLocationName("Scarlet's room")
		removeCharacter("eliza")
		addCharacter("elizaMom", ["naked"])
		addCharacter("eliza")
		playAnimation(StageScene.Grope, "tease", {pc="eliza", npc="elizaMom", npcBodyState={underwear=true}})
		saynn("Stepping inside reveals quite a sight..")

		saynn("In the middle of the fancy private quarters room.. stands Scarlet.. Eliza's mother.. wearing nothing but her lingerie. The delicate fabric is accentuating every counter of her feminine body. Her black bra is supporting the weight of her ample, firm breasts.. barely.. Her panties follow the curves of her waist.. and a garter belt is tracing the lines of her long, shapely legs, adding a touch of sexy elegance.. Even despite two pairs of eyes staring at her.. she is emitting a lot of confidence.. but her stance is still relaxed.")

		saynn("[say=elizaMom]Oh, hey there, sweetie, welcome. My bad, I was in the other room, didn't hear the knocks.[/say]")

		saynn("Eliza's eyes widen in surprise, her lips slightly parted as she takes in the sight of Scarlet's stunning form.")

		saynn("[say=eliza]Uh.. yeah, hai.. uh..[/say]")

		saynn("Poor kitty is stammering like she forgot how to talk, her cheeks blushing so much there is probably no blood left for the rest of her body.")

		saynn("Scarlet notices you too.")

		saynn("[say=elizaMom]Oh hey, you brought your assistant. Something happened?[/say]")

		saynn("Eliza blinks a lot, her paw scratching her nose, her ears flipping down, her tail wrapped up around her leg. The atmosphere in the room is.. tense.")

		saynn("[say=eliza]Um.. {pc.He} wanted.. to.. um.. ask you?.. something.. maybe.. um..[/say]")

		saynn("Scarlet takes note of the obvious signs and smiles.")

		saynn("[say=elizaMom]What's wrong, sweetie?[/say]")

		saynn("Slowly, she starts stepping towards Eliza.. while she steps back.")

		saynn("[say=eliza]You're.. naked.. mom.. I'm sorry, I should leave you two alone.. um..[/say]")

		saynn("She was so cheeky back there.. but now she is nothing but a blushy mess. It's quite entertaining to watch.")

		saynn("[say=elizaMom]I'm not naked, dear~. And since when is that a problem, you probably saw thousands of naked people here during medical checkups, being the prison's doctor. The best doctor if I might add~.[/say]")

		saynn("Scarlet's voice is quite soothing.. while Eliza is still struggling to find a place for herself, her shy gaze recoiling away each time she accidentally looks at her mother.")

		saynn("[say=eliza]Well.. uhh.. thank you.. I'm still feeling a bit.. uncomfortable..[/say]")

		saynn("Scarlet gracefully closes the distance with her daughter, her every step exuding both authority and a teasing intimacy. She gently catches Eliza's wrist..")

		saynn("[say=elizaMom]Your assistant seems fine~. But you're being all flustered and shy. It's not nudity. I think I know the real reason~.[/say]")

		saynn("Her voice is soft, yet laced with a playful edge. It's best to just let the scene unfold it seems.. You take a spot in the corner of the room and watch the show.")

		saynn("[say=elizaMom]Nothing to be embarrassed about. Look at me, dear.[/say]")

		saynn("Eliza swallows audibly. Her gaze refuses to move, shaking all over the room. Scarlet's soft hand cups her daughter's chin and raises it.. up to her eye level.")

		saynn("[say=elizaMom]Maybe you just like my lingerie?[/say]")

		saynn("Eliza's lowered gaze sneakily checks it out.")

		saynn("[say=eliza]It does fit you..[/say]")

		saynn("A soft chuckle escapes Scarlet's lips.")

		saynn("[say=elizaMom]Does it, hah. It feels like my breasts are gonna burst out of this bra at any point. I forgot my breast pump at home like a silly cat.[/say]")

		saynn("[say=eliza]Mo-o-om..[/say]")

		saynn("[say=elizaMom]What~? I'm trying to ease the tension. I don't want you to remember this as an awkward moment between us.[/say]")

		saynn("Things get more and more interesting..")

		addButton("Continue", "See what happens next", "s1_cuddle")
	if(state == "s1_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="elizaMom", npc="eliza", bodyState={underwear=true}})
		saynn("In one fluid gesture, Scarlet pulls Eliza onto her sofa into a close embrace. Eliza's expression, still flushed from the initial shock, melts further as she feels the warmth of Scarlet's full, generous breasts pressed against her.")

		saynn("[say=eliza]Ah..[/say]")

		saynn("[say=elizaMom]It's okay, dear. You know, you can't even breed me~.[/say]")

		saynn("[say=eliza]MOM![/say]")

		saynn("Scarlet's index finger crosses Eliza's lips while she makes a quiet 'tshhh-h' noise.")

		saynn("[say=elizaMom]If I'm making you feel weird, just let me know. I can stop any second.[/say]")

		saynn("[say=eliza]Mphhm.. but.. we're not alone..[/say]")

		saynn("Both, Eliza and Scarlet, turn their heads towards you.. ohh.. their stares are so similar.")

		saynn("[say=elizaMom]It's okay. I think it's better this way~. Haha~.[/say]")

		saynn("Scarlet's hands slip under the lab coat and trail lightly along Eliza's back.. her touch is both reassuring and teasing.")

		saynn("[say=elizaMom]Do you like this, sweetie?[/say]")

		saynn("Oh how the tables have turned. Somehow you managed to find someone who is more.. kinky.. than Eliza.. and it's her mother.")

		saynn("Eliza breathes deeply while Scarlet's digits gently caress her sides and knead any tension out of her back.")

		saynn("[say=elizaMom]My touch?[/say]")

		saynn("[say=eliza]..feels nice..[/say]")

		saynn("Scarlet gently places her chin on Eliza's shoulder and purrs quietly.")

		saynn("[say=elizaMom]I'm glad, sweetheart. We're just having some nice family bonding time..[/say]")

		saynn("Her hands keep exploring Eliza's fluffy body, gently sliding along the fluffy belly.")

		saynn("[say=elizaMom]May I take your lab coat.. It's getting in the way.[/say]")

		saynn("[say=eliza]I.. um.. I gotta.. get back to my shift..[/say]")

		saynn("[say=elizaMom]I'm sorry if I pushed you too hard.[/say]")

		saynn("[say=eliza]No.. it's.. it's okay.. really.. I just gotta.. before I..[/say]")

		saynn("Scarlet lands two small smooches on Eliza's neck and cheek and then stops hugging her.")

		saynn("[say=elizaMom]You can run, sweetie.[/say]")

		addButton("Continue", "See what happens next", "s1_run")
	if(state == "s1_run"):
		removeCharacter("eliza")
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="elizaMom", npcBodyState={underwear=true}})
		saynn("Eliza takes off and dashes out of the room, her cheeks burning bright red.")

		saynn("Scarlet smiles while watching her.. but then her stare locks on with yours.")

		saynn("[say=elizaMom]I don't know what happened to me. But I think Eliza doesn't know what happened to her either.[/say]")

		saynn("[say=pc]I think it went well..[/say]")

		saynn("She raises a brow.. and hums.")

		saynn("[say=elizaMom]Bring her when you find a good time for it.[/say]")

		saynn("Her eyes are gazing into your soul as she approaches you, her clawed digits catching your chin.")

		saynn("[say=elizaMom]I won't forget it~.[/say]")

		saynn("You nod softly. How can you say no to such a woman..")

		saynn("Scarlet grabs and quickly puts on a robe.")

		saynn("[say=elizaMom]Let me get back to your floor. Hope you don't mind.[/say]")

		saynn("Scarlet brings you back to the elevator.. She presses the cellblock button and slips between the closing doors while she can.")

		saynn("Fun stuff..")

		GM.pc.setLocation("hall_mainentrance")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "s2_milking"):
		saynn("You're standing near Eliza's counter. She seems to be filling out some kind of reports, her mind distracted. But one close look from you is enough to make her blush.")

		saynn("[say=eliza]What?..[/say]")

		saynn("[say=pc]Nothing~.[/say]")

		saynn("She puts the reports away and pouts at you.")

		saynn("[say=eliza]I know what you're thinking.[/say]")

		saynn("[say=pc]And what is that?[/say]")

		saynn("[say=eliza]You're judging me![/say]")

		saynn("She is still quite tense about what happened.")

		saynn("[say=pc]Relax. It's up to you what you do with your mother.[/say]")

		saynn("Blush creeps onto her face as she lowers her gaze.")

		saynn("[say=pc]I'm an inmate here, I am the one who got judged.[/say]")

		saynn("[say=eliza]Pff![/say]")

		saynn("She sips some of her coffee.. her eyes pausing on the words that are written on it.")

		saynn("[say=pc]How do you feel about it?[/say]")

		saynn("[say=eliza]I don't know.. I'd rather not think about it..[/say]")

		saynn("[say=pc]Maybe you wanna go pay her a visit?[/say]")

		saynn("She squints at you.")

		saynn("[say=pc]What?[/say]")

		saynn("[say=eliza]You just wanna see us together![/say]")

		saynn("You smile and shrug.")

		saynn("[say=pc]You were pretty cute together.[/say]")

		saynn("Her lips are trembling, her fists clenched. Your smug smile makes her expression soften up a bit.")

		saynn("[say=pc]C'mon, you're trying to block these intrusive thoughts for some reason. Why not just talk it through with her.[/say]")

		saynn("Eliza blinks a lot.. then lowers her gaze again.")

		saynn("[say=eliza]She called me already..[/say]")

		saynn("[say=pc]And?[/say]")

		saynn("She stays quiet for a while.")

		saynn("[say=eliza]I didn't answer..[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("[say=eliza]I don't know! It's weird..[/say]")

		saynn("[say=pc]What is?[/say]")

		saynn("[say=eliza]You know what.. She's my mother..[/say]")

		saynn("It's a fair point.")

		saynn("[say=pc]I thought you're a kinky one.[/say]")

		saynn("[say=eliza]Well, I guess you found my limit.[/say]")

		saynn("The impossible has been achieved. Looks like you're not having another show today though..")

		saynn("[say=pc]Then just say no to her. I'm sure she will understand, she seemed like a smart woman.[/say]")

		saynn("Eliza stares somewhere into the distance, a million thoughts probably rushing through her mind.")

		saynn("Suddenly, the elevator doors open..")

		addButton("Continue", "See what happens next", "s2_scarlet_elevator")
	if(state == "s2_scarlet_elevator"):
		addCharacter("elizaMom")
		playAnimation(StageScene.Duo, "stand", {pc="elizaMom", npc="eliza"})
		saynn("The elevator doors reveal.. Scarlet Quinn. Alone this time, lacking her usual personal army.")

		saynn("[say=eliza]Speak of the devil..[/say]")

		saynn("Scarlet slowly approaches the counter, sending quick nods to both you and her daughter.")

		saynn("[say=elizaMom]Hello-o. I called you earlier, sweetheart.[/say]")

		saynn("Eliza sighs.")

		saynn("[say=eliza]Mom.. uh.. can we just not..[/say]")

		saynn("Scarlet's hand gently reaches out to scritch Eliza behind the ear. The feline doesn't pull away.. but doesn't lean into it either.")

		saynn("[say=elizaMom]I understand, sweetie. I was calling for a different reason.[/say]")

		saynn("Eliza looks at Scarlet and tilts her head subtly. Her blush returns when she notices that something is different about her.")

		saynn("[say=eliza]I think I see it..[/say]")

		saynn("Scarlet chuckles, her chest bounces a bit, the jiggle echoing in her ample breasts.")

		saynn("[say=elizaMom]Remember when I said I forgot my personal breast pump? Yeah, it's getting bad now. I'm itching there a lot..[/say]")

		saynn("[say=eliza]I can spare one from our reserves, hang on..[/say]")

		saynn("Scarlet catches Eliza's hand before she leaves. The gesture makes them both blush.")

		saynn("[say=elizaMom]I'd feel very weird using a pump that someone else used before. Even if it was cleaned a million times.[/say]")

		saynn("She looks around and shivers.")

		saynn("[say=elizaMom]This whole place is kinda.. yeah.. I'm sure you're taking good care of it. But it's far from a controlled, sterile environment that I'm used to.[/say]")

		saynn("Eliza blinks a few times.")

		saynn("[say=eliza]What do you propose then?..[/say]")

		saynn("Scarlet hums while tapping on her chin.")

		saynn("[say=elizaMom]I saw that you have a special room for this. Maybe I could use some of that.. famous personal touch.. you know?[/say]")

		saynn("Eliza's eyes go wide, her ears turning down as the blush invades her whole face again.")

		saynn("She takes her time, trying to come up with the right words.")

		saynn("[say=eliza]I don't think I can do that for you.. sorry..[/say]")

		saynn("Scarlet stares at her daughter with kind eyes, her tone casual.")

		saynn("[say=elizaMom]I still remember you suckling on my breasts when you were just a little kitten.. It was so cute. C'mon, you'd be just helping your mother with this.. annoying feeling.[/say]")

		saynn("Eliza's lips are trembling. Poor feline is put into such a weird spot. She gives you a quick look.")

		saynn("[say=eliza]Sorry.. I shouldn't..[/say]")

		saynn("Scarlet sighs, her hand gently pets Eliza.")

		saynn("[say=elizaMom]That's okay, my dear.[/say]")

		saynn("Her red eyes put their attention on you.")

		saynn("[say=elizaMom]Can you maybe help me then~?[/say]")

		saynn("Scarlet slowly closes the distance and leans in slightly, offering a great view. It catches you off-guard.")

		saynn("[say=pc]Uh..[/say]")

		saynn("[say=elizaMom]You're her assistant, right?[/say]")

		saynn("[say=pc]Yeah.[/say]")

		saynn("Eliza decides to bring herself back into the conversation.")

		saynn("[say=eliza]{pc.He} doesn't have access to all the equipment..[/say]")

		saynn("[say=elizaMom]But who does?[/say]")

		saynn("[say=eliza]..me..[/say]")

		saynn("Eliza blinks a lot while both, you and Scarlet, are looking at her.")

		saynn("[say=eliza]..I guess I can show it, follow me.[/say]")

		addButton("Follow", "See where Eliza brings you and Scarlet", "s2_in_milking_room")
	if(state == "s2_in_milking_room"):
		aimCameraAndSetLocName("med_milkingroom")
		GM.pc.setLocation("med_milkingroom")
		saynn("Eliza brings you to the big open space that has a very specific purpose. The ceiling has many pipes running through it, connecting the many stalls on one side of the room to the giant fluid tanks on the other.")

		saynn("She guides you and Scarlet into one of the stalls.. and then also brings a small milk tank.")

		saynn("[say=eliza]There you go.[/say]")

		saynn("Scarlet looks around, her hand slides along the metal pipes, catching some dust that she is quick to shake off.")

		saynn("[say=elizaMom]Can you make sure everything goes smoothly, sweetie?[/say]")

		saynn("Eliza blinks.")

		saynn("[say=eliza]Is that really needed?..[/say]")

		saynn("Scarlet approaches her daughter and leans in slightly, an innocent smile illuminating her face.")

		saynn("[say=elizaMom]I'm just asking you to watch. Can you do that for me, pretty please?[/say]")

		saynn("Eliza swallows audibly.")

		saynn("[say=eliza]I can do that..[/say]")

		saynn("[say=elizaMom]Thank you~.[/say]")

		saynn("Scarlet begins undressing..")

		addButton("Continue", "See what happens next", "s2_scarlet_naked")
	if(state == "s2_scarlet_naked"):
		addCharacter("elizaMom", ["naked"])
		playAnimation(StageScene.Duo, "stand", {npc="elizaMom", npcBodyState={naked=true}})
		saynn("She takes off her lab coat and hands it to her daughter. Next comes the pink top and pencil skirt, revealing her fancy underwear. And yeah, that bra that she has.. it feels like it will burst at any second.. The fabric can barely contain the giant overflowing breasts. Not the first time that you see her like this.")

		saynn("Eliza watches as Scarlet pulls off her bra, exposing the two beauties that bounce down and sag slightly after being set free. Her areolas have that dark red color to them.. with little drops of milk already showing up all around the sensitive surface.. Scarlet doesn't seem to mind you watching her.. closely..")

		saynn("She takes off her panties and the garter belt too.. ending up completely naked in front of you two.")

		saynn("[say=elizaMom]Well.. Guide me.[/say]")

		saynn("Eliza points at the special spot where she left the milk tank. Scarlet looks at you, slightly tilting her head and smiling.")

		addButton("Lock her up", "Prepare Scarlet to be milked", "s2_prepare_scarlet")
	if(state == "s2_prepare_scarlet"):
		playAnimation(StageScene.MilkingStallDuo, "start", {pc="elizaMom", npc="pc", bodyState={naked=true}})
		saynn("You bring Scarlet to the right spot.. where there are some pipes to hold onto. Although, in this particular case, the main pipe has special cuffs-like restraints attached to it. You unlock them.. and then begin to guide Scarlet to bend forward, gently putting pressure on her back.")

		saynn("[say=elizaMom]Kinky. I love the setup that you have here~.[/say]")

		saynn("Eliza blushes while Scarlet purrs softly and obeys your touch, obediently placing her wrists into the spots for them. You make sure everything is in its rightful place before locking the cuffs, restraining Eliza's mother in the stall.")

		saynn("[say=eliza]It was.. my idea..[/say]")

		saynn("[say=elizaMom]Maybe I should ask something like this to be built in my lab~.[/say]")

		saynn("You kneel in front of Scarlet and watch how her breasts, heavy and full, dangle underneath her.. from this angle.. they look more like.. something else..")

		saynn("Scarlet's eyes lock with yours.")

		saynn("[say=elizaMom]They're itching so much~.[/say]")

		saynn("Best not to keep her waiting then.")

		addButton("Milk Scarlet", "Proceed with the milking", "s2_pc_milks_scarlet")
	if(state == "s2_pc_milks_scarlet"):
		playAnimation(StageScene.MilkingStallDuo, "milk", {pc="elizaMom", npc="pc", bodyState={naked=true}})
		saynn("With a careful touch, you reach your hands out and begin to work on Scarlet's breasts. Your palms start by exploring her soft, heavy curves, gently massaging and cupping them, testing their weight. You hear Scarlet's breathing getting slightly deeper, she is biting her lip while watching you work your magic.")

		saynn("It doesn't take long.. As you apply some pressure on her swollen nipples, pinching them slightly, the milk begins to emerge from it.. spawning in little rivers all around her areolas. It drips down into the opened tank underneath.. plap.. plap.. plap-plap..")

		saynn("[say=elizaMom]Mmm~..[/say]")

		saynn("You keep the flow steady, gently kneading Scarlet's breasts, squeezing and occasionally pinching the stiff nips more. A series of quiet, almost imperceptible moans escape from the woman as the milking continues.. her eyes just keep watching you.. sparks of lust shining in them.")

		saynn("With the corner of your eyes, you notice Eliza. She is leaning against the wall of the stall, the tip of her tongue poking slightly, sliding along her lower lip. Her gaze is also quite.. interested.")

		saynn("[say=elizaMom]..mm.. yeah.. just like that.. milk those udders..[/say]")

		saynn("She is quite kinky, this woman.. But you obey, putting a little more pressure, squeezing those giant hanging udders, drawing out more of that white nectar. There is no end to it, seemingly.. the fluid level in the tank rising steadily.")

		saynn("You keep going as long as you can, kneading and massaging Scarlet's breasts.. milking them.. until you begin panting.")

		saynn("[say=pc]Wow, I think I'm getting tired.[/say]")

		saynn("[say=elizaMom]And I still feel like I'm full~.[/say]")

		saynn("Yeah.. as you weigh her breasts.. they're pretty much just as heavy.")

		saynn("[say=pc]We might need some breast pumps for those beauties.. industrial ones.[/say]")

		saynn("[say=elizaMom]Haha.[/say]")

		saynn("[say=eliza]Can I try?..[/say]")

		saynn("Eliza approaches you and Scarlet, her gaze low, tail wrapped around her leg.")

		saynn("[say=elizaMom]You wanna help, sweetie?[/say]")

		saynn("[say=eliza]..yeah..[/say]")

		saynn("[say=elizaMom]Please, I'd love you to do it.[/say]")

		saynn("Yay, your hands can get some rest now.")

		addButton("Continue", "See what happens next", "s2_eliza_takes_spot")
	if(state == "s2_eliza_takes_spot"):
		playAnimation(StageScene.MilkingStallDuo, "start", {pc="elizaMom", npc="eliza", bodyState={naked=true}})
		saynn("You get up and offer your spot for Eliza, instead just leaning against the stall's wall like she did.")

		saynn("Ohh.. the view from this spot.. Scarlet's tail is pulled to the side slightly, revealing her tasty-looking red flower.. her dripping, wet pussy.. Looks like the milking has made her quite horny.")

		saynn("Eliza kneels in front of Scarlet who is still bound into this prime milking position.. At first, the shy feline just admires the rich curves of her mother, her eyes wandering, her cheeks blushing when their stares meet.")

		saynn("[say=elizaMom]I ain't gonna bite you~.[/say]")

		saynn("[say=eliza]I know you won't..[/say]")

		saynn("Eliza's paw reaches out to gently cup Scarlet's chin, clawed digits softly scritching it. She forces eye contact and bravely holds it.")

		saynn("[say=eliza]You can't even if you wanted to..[/say]")

		saynn("Scarlet bites her lip.")

		saynn("[say=elizaMom]You're not wrong, sweetie.[/say]")

		saynn("Eliza switches her attention back to Scarlet's breasts.")

		addButton("Continue", "See what happens next", "s2_eliza_starts_milking_scarlet")
	if(state == "s2_eliza_starts_milking_scarlet"):
		playAnimation(StageScene.MilkingStallDuo, "milk", {pc="elizaMom", npc="eliza", bodyState={naked=true}})
		saynn("Eliza's skilled paws reach down to Scarlet's chest, digits shaking a little as they touch the ample forms for the first time. She just explores them at first, gently cupping and rubbing Scarlet's breasts, feeling their weight, teasing the swollen nips.")

		saynn("[say=eliza]You have some.. impressive breasts, mom..[/say]")

		saynn("[say=elizaMom]Thank you.[/say]")

		saynn("Just as gently, Eliza starts to put some pressure on Scarlet's forms, kneading and massaging. Her skill is undeniable, her soft touch is enough to coax the rich, warm milk to start spawning all around Scarlet's nips, creating little flows.")

		saynn("[say=elizaMom]Mm-..[/say]")

		saynn("Eliza watches her mother's reaction closely while applying a steady, rhythmic pressure to her chest, letting the milk stream steadily from the engorged nips, droplets spattering onto the waiting fluid tank below. The feline is being careful.. but each small squeeze is still enough to send a fresh burst of liquid out, Scarlet's creamy fluid glistening as it trickles down into the tank.")

		saynn("[say=elizaMom]Moo..[/say]")

		saynn("A playful cow noise escapes Scarlet's lips.. her daughter smiling after hearing it.")

		saynn("[say=eliza]You don't have to act like you're into it so much..[/say]")

		saynn("[say=elizaMom]But I am. For some reason.. I find it so hot that you're treating me like a milky cow.[/say]")

		saynn("Eliza pinches Scarlet's nips a little stronger.. making them squirt like little fountains.. there is so much more milk in them.")

		saynn("[say=eliza]Focus on that thought then. Helps to keep the milk quality high..[/say]")

		saynn("[say=elizaMom]Moo~..[/say]")

		addButton("Continue", "See what happens next", "s2_eliza_starts_milking_scarlet_fast")
	if(state == "s2_eliza_starts_milking_scarlet_fast"):
		playAnimation(StageScene.MilkingStallDuo, "fast", {pc="elizaMom", npc="eliza", bodyState={naked=true}})
		saynn("As Eliza begins to alternate between slow, deliberate squeezes and rapid, firm kneading, the flow of milk increases, the fluid level in that milk tank rising steadily..")

		saynn("[say=elizaMom]Ah..[/say]")

		saynn("Scarlet's entire body begins to betray her, showing pleasure. Her back arches further, emphasizing the curve of her breasts and they way they hang heavy and inviting. Her pussy, already, damp from earlier stimulation, now drips even more.. small beads of juices hanging from her red sensitive folds.")

		saynn("Every squeeze of Eliza's skilled hands causes Scarlet to shudder, little moans escaping from her lips as the rhythmic milking pushes her further into this cow mindset.")

		saynn("[say=eliza]Such a good cow.. producing so much milk for me..[/say]")

		saynn("[say=elizaMom]Moo-o~..[/say]")

		saynn("Eliza is completely focussed, her hands moving methodically, massaging Scarlet's udders with an intensity that draws out every last drop of milk. Scarlet's eyes no longer can focus on her daughter, instead closing as she loses herself in the sensation, her body lightly squirming against the restraints and Eliza's paws..")

		addButton("Continue", "See what happens next", "s2_eliza_starts_milking_scarlet_cum")
	if(state == "s2_eliza_starts_milking_scarlet_cum"):
		playAnimation(StageScene.MilkingStallDuo, "cum", {pc="elizaMom", npc="eliza", bodyState={naked=true}})
		saynn("Suddenly, Scarlet throws her head back and lets out a loud passionate moan as she completely lets go..")

		saynn("Her body is shuddering hard while her breasts begin eagerly squirting milk, the flow increasing to some very high levels.")

		saynn("[say=elizaMom]Ah~.. nhh-.. moo.. hhhah.. m.hh.. moo~.. moo-o~..[/say]")

		saynn("From your angle, you can see Scarlet's neglected pussy pulsing and gushing with juices, her whole body entering this orgasmic state.. triggered entirely by Eliza's milking her.. and with a bit of your help, of course.")

		saynn("[say=eliza]Did you really cum? That's.. cute~.[/say]")

		saynn("Eliza's steady smile remains as she continues her work, kneading and massaging her mother's breasts, almost like a hungry kitten, drawing out as much milk from those milky babies as she can.")

		saynn("By the end of it, the milk container is almost overflowing..")

		addButton("Continue", "See what happens next", "s2_after_eliza_milks_scarlet")
	if(state == "s2_after_eliza_milks_scarlet"):
		playAnimation(StageScene.MilkingStallDuo, "start", {pc="elizaMom", npc="eliza", bodyState={naked=true}})
		saynn("Eliza stops when the flow of milk finally begins to subside. She does a final weight check with her paws, cupping Scarlet's breasts.")

		saynn("[say=eliza]They certainly got less heavy.[/say]")

		saynn("Scarlet is still panting deeply, her whole body shivers with the aftershocks of that orgasm.")

		saynn("[say=elizaMom]I'm.. wow.. ah.. that was.. mhh.. I loved every second of it..[/say]")

		saynn("[say=eliza]I'm glad you did.. mom.[/say]")

		saynn("Scarlet smiles.")

		saynn("[say=elizaMom]Don't be so shy, sweetie.. You did great.[/say]")

		saynn("Eliza shrugs softly.")

		saynn("[say=eliza]I did have a lot of practice.[/say]")

		saynn("Eliza closes the lid on that milk tank and begins to uncuff Scarlet.")

		addButton("Continue", "See what happens next", "s2_cuddle")
	if(state == "s2_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="elizaMom", npc="eliza", bodyState={naked=true}, npcBodyState={underwear=true}})
		addCharacter("eliza", ["naked"])
		saynn("Scarlet's body is struggling to obey her commands.. making her collapse.")

		saynn("[say=elizaMom]Ohh.. that was exhausting..[/say]")

		saynn("Eliza tries to help her.. but Scarlet just pulls her in for some floor cuddles..")

		saynn("[say=eliza]Eek.[/say]")

		saynn("[say=elizaMom]You.. are precious.[/say]")

		saynn("Scarlet starts landing lots of little kisses along her daughter's neck.. making Eliza purr softly in return.. She decides to give in and just assumes a better pose, taking off the useless lab coat and resting against her mother's chest.")

		saynn("[say=eliza]Not gonna lie.. I felt a bit weird at first..[/say]")

		saynn("[say=elizaMom]Weird? Tell me why.[/say]")

		saynn("[say=eliza]When I saw you.. in that sexy lingerie.. all sorts of wrong thoughts began rushing through my head. I tried to push them away..[/say]")

		saynn("[say=elizaMom]I know what you mean, sweetie.. I felt the same way. It's wrong.[/say]")

		saynn("Scarlet's hands slowly take off Eliza's blue top and skirt, leaving her own lingerie exposed. Teasing touches then began to happen all around, Scarlet's digits traveling along the feminine body, cupping Eliza's breasts and sliding along the thighs.")

		saynn("[say=eliza]..but it feels good..[/say]")

		saynn("[say=elizaMom]Looks like we both have some screws loose in our minds.[/say]")

		saynn("Two crazy girls..")

		saynn("[say=eliza]Well.. I don't care.. I love you, mom.. I loved milking your giant udders..[/say]")

		saynn("[say=elizaMom]Aw.. I love you too, sweetheart. Maybe I can milk your little tits too~?[/say]")

		saynn("[say=eliza]They're not that small![/say]")

		saynn("Scarlet boldly puts her hands on Eliza's {eliza.breasts} and gives them a firm squeeze, drawing a soft moan from the smaller feline.")

		saynn("[say=elizaMom]Hmmm.. maybe you're right. Requires some further investigation though~.[/say]")

		saynn("Such a sweet scene. You feel a bit weird being here.. while they're busy bonding.")

		saynn("Scarlet notices your stare.")

		saynn("[say=elizaMom]Thank you, this wouldn't have happened without your help.[/say]")

		saynn("Makes you smile.")

		saynn("[say=elizaMom]Feel free to stay.. I have a hot idea I can't push out of my head.[/say]")

		setFlag("ElizaModule.scarletProgress", Util.maxi(2, getFlag("ElizaModule.scarletProgress", 0)))
		addButton("Let them be", "Let them cuddle and just leave", "s2_leavethembe")
		addButton("Breastfeeding", "Looks like they're gonna do something else..", "s2_breastfeeding")
	if(state == "s2_leavethembe"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You saw enough hot stuff for one day.. You excuse yourself and let them bond in peace.")

		addButton("Leave", "Time to go", "endthescene")
	if(state == "s2_breastfeeding"):
		playAnimation(StageScene.BreastFeeding, "tease", {pc="elizaMom", npc="eliza", bodyState={naked=true, hard=true}, npcBodyState={underwear=true}})
		saynn("You decide to take her up on that offer.. and stay for a little longer.")

		saynn("[say=eliza]What's your idea, mom..[/say]")

		saynn("Scarlet's eyes are sparking. With a slow, sultry smile, she leans closer and whispers into Eliza's ear.")

		saynn("[say=elizaMom]Would you like to.. breastfeed on me?[/say]")

		saynn("Eliza's eyes open wider.. but her initial shyness quickly gives way to eagerness. Nodding softly, she moves to face her mother, aligning her eyes with the alluring curves of Scarlet's chest. Her breasts, still heavy and with the residual flow, look even more enticing like this.")

		saynn("[say=eliza]I'd love to try..[/say]")

		saynn("Scarlet closes her arms around her breasts, squeezing them, making them look even more.. voluminous.")

		saynn("[say=elizaMom]Come, then~.[/say]")

		addButton("Continue", "See what happens next", "s2_breastfeed_feed")
	if(state == "s2_breastfeed_feed"):
		playAnimation(StageScene.BreastFeeding, "feed", {pc="elizaMom", npc="eliza", bodyState={naked=true, hard=true}, npcBodyState={underwear=true}})
		saynn("Eliza responds by pressing her lips to Scarlet's soft, sensitive nips. She works slowly at first, closing her lips around the swollen buds and doing little licks and suckles.. but it's still enough to make Scarlet's eyes flutter closed in pleasure for a second.")

		saynn("[say=elizaMom]Mmm.. adorable..[/say]")

		saynn("There is no milk coming at first.. but Eliza keeps at it, suckling on her mother's nipples more.. until she begins to feel a taste of Scarlet's milk in her mouth. You can tell because her eyes open wide, pupils becoming round and big.")

		saynn("[say=elizaMom]That's it, sweetie.. feed on me..[/say]")

		saynn("Eliza nods softly and keeps sucking her mother's nips.. drawing out milk. She begins to use her paws too, kneading and caressing those big breasts, stimulating them to give her more of that nectar.")

		saynn("[say=elizaMom]Mm.. ah-h..[/say]")

		saynn("Scarlet's soft moans fill the stall.. mixing with the noises of her daughter's eager suckling. Eliza's ears even twitch a little.. in tact with the work that she is doing.. her cheeks blushing brightly with a mix of desire and.. innocence. The sight of this tender, almost playful performance makes Scarlet smile.. one of her hands reaches out and moves Eliza's loose hair strand out of the way.")

		saynn("It's cute.. this scene.. You can't pull your eyes away. The soft sounds of their breathing.. the gentle suckling.. that adorable kitten-like kneading..")

		addButton("Continue", "See what happens next", "s2_after_feeding")
	if(state == "s2_after_feeding"):
		playAnimation(StageScene.BreastFeeding, "tease", {pc="elizaMom", npc="eliza", bodyState={naked=true, hard=true}, npcBodyState={underwear=true}})
		saynn("Finally, as the last traces of milk mingle on Eliza's tongue, she gives both of Scarlet's nips a lick and then pulls away. Their eyes meet..")

		saynn("[say=elizaMom]How did it taste, sweetie?[/say]")

		saynn("[say=eliza]..amazing..[/say]")

		saynn("Slowly, Scarlet cups her daughter's chin with her hand.. and pulls her closer.. until their lips share a long, deep kiss. During it, Scarlet boldly slips her tongue past Eliza's teeth and swirls it around hers.. getting a faint taint of her own milk in the process.")

		saynn("Scarlet's hand stops cupping the chin and slides down, along the curve of Eliza's neck.. and reaching her breasts. They keep the passionate kiss going.. while the mother gently rubs and fondles her daughter's breasts.. enjoying exploring the forms.. playing with the perky pink nipples.")

		saynn("As the kiss ends.. a line of saliva is left hanging between their lips..")

		saynn("[say=elizaMom]Love you, sweetie..[/say]")

		saynn("[say=eliza]Love you too, mom..[/say]")

		saynn("And now.. you probably saw everything.. seems like a good time to leave them be..")

		addButton("Leave", "Time to go..", "endthescene")
	if(state == "s3_start"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		setFlag("ElizaModule.scarletProgress", Util.maxi(3, getFlag("ElizaModule.scarletProgress", 0)))
		saynn("[say=pc]Hey, just curious. How are you and Scarlet doing?[/say]")

		saynn("Eliza pulls her gaze from her reports.")

		saynn("[say=eliza]Oh, yeah, we're doing just fine. We have bonded.. quite well..[/say]")

		saynn("A devious thought comes into your mind.")

		saynn("[say=pc]Want to maybe.. pay her a visit?[/say]")

		saynn("Scarlet did ask you to bring Eliza that one time.. Maybe it will work.")

		saynn("[say=eliza]Hmm.. Why?[/say]")

		saynn("Or maybe not.. You offer Eliza a shrug.")

		saynn("[say=pc]I don't know.[/say]")

		saynn("She squints, her eyes scanning your face while she is pouting slightly.")

		saynn("[say=eliza]Hmmm-m..[/say]")

		saynn("She really squints.. but then..")

		saynn("[say=eliza]Okay! Let's go see what she is doing![/say]")

		saynn("Eliza steps from behind the counter and invites you into the elevator.")

		saynn("That was easy..")

		addButton("Elevator", "Follow Eliza to Scarlet's quarters", "s3_near_quarters")
	if(state == "s3_near_quarters"):
		removeCharacter("eliza")
		playAnimation(StageScene.Solo, "stand")
		aimCameraAndSetLocName("cd_near_office2")
		setLocationName("Private Quarters")
		saynn("You ride the elevator with Eliza to one of the highest floors.. private quarters.")

		saynn("Eliza hums something quietly while guiding you through the many fancy corridors.. skipping quite a few doors until you arrive at the correct one.")

		saynn("[say=eliza]Well. That's the one.[/say]")

		saynn("She brings her paw up to knock on it..")

		saynn("..but then..")

		saynn("The door suddenly opens.")

		saynn("[say=eliza]Eek![/say]")

		saynn("A hand reaches out from it.. and.. with one smooth motion, pulls Eliza inside.")

		saynn("Right. That was.. something..")

		saynn("You are left standing outside.. before the closed door. You bring your ear to it.. silence..")

		saynn("With nothing better to do, you take Eliza's spot.. and bring your hand up to the door.. awaiting a similar fate.")

		saynn("But nothing happens this time. This door.. is being picky.")

		saynn("You wait for about half a minute.. and then, after losing enough patience, decide to knock on the door.")

		saynn("[say=elizaMom]Come in~.[/say]")

		saynn("Ohh..")

		saynn("Something is probably gonna happen when you step inside..")

		saynn("But what are you hoping will happen?")

		addButton("Ride&grind", "They will probably have some fun with you..", "s3_rideandgrind")
		addButton("Spitroast", "They will probably team up to fuck your holes.. Really hard..", "s3_spitroast")
		addButtonWithChecks("Love tower", "It doesn't matter what they have planned. You are gonna fuck them both", "s3_lovetower", [], [[ButtonChecks.HasReachablePenis]])
	if(state == "s3_rideandgrind"):
		addCharacter("elizaMom", ["naked"])
		addCharacter("eliza", ["naked"])
		aimCameraAndSetLocName("cd_office2")
		setLocationName("Scarlet's room")
		playAnimation(StageScene.Duo, "stand", {pc="eliza", npc="elizaMom", bodyState={underwear=true}, npcBodyState={underwear=true}})
		saynn("You open the door and step inside.")

		saynn("You are immediately met with a fancy sight.")

		saynn("Both, Eliza and Scarlet, are waiting for you.. wearing only their sexy lingerie. Their eyes shine with mischief as they tease and caress one another in your view.")

		saynn("[say=eliza]Welcome~.[/say]")

		saynn("[say=elizaMom]You look surprised.[/say]")

		saynn("Eliza pulls you in deeper into the room.. trapping you between her and her mother's bodies.")

		saynn("Four feline hands land on your {pc.masc} body.. exploring and stripping anything that's strippable.. You can feel their purring as they rub their bodies against you, Scarlet's giant breasts and Eliza's big ones pressed against your sides.")

		if (!GM.pc.hasReachablePenis()):
			saynn("[say=elizaMom]I got dibs on {pc.his} cock.[/say]")

			saynn("[say=eliza]Well.. what if {pc.he} doesn't have one.."+str(" One that isn't locked with a cute chastity cage.." if GM.pc.isWearingChastityCage() else "")+"[/say]")

			saynn("Scarlet smiles.")

			saynn("[say=elizaMom]Don't worry, I've got just the thing.[/say]")

			saynn("[say=eliza]{pc.His} face is mine to enjoy then...[/say]")

		else:
			saynn("[say=elizaMom]I got dibs on {pc.his} cock.[/say]")

			saynn("Scarlet smiles as her words instantly provoke a reaction in your body.. arousing you.")

			saynn("[say=eliza]{pc.His} face is mine to enjoy then..[/say]")

		saynn("Feels strange to not be part of the negotiations.. but you don't mind.. these two hot cuties might as well do anything they want with you.")

		addButton("Continue", "See what happens next", "s3_rng_tease")
	if(state == "s3_rng_tease"):
		playAnimation(StageScene.SexDoubleDown, "teasenohand", {pc="pc", npc="elizaMom", npc2="eliza", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("Before you can react, they push you gently onto a large, inviting bed. Scarlet throws her panties away and straddles your waist.. Eliza does the same but picks your face as the target for her butt.")

		if (!isStrapon):
			saynn("Your {pc.penis} gets trapped between Scarlet's thick thighs.. Her wet sensitive folds rest just above it, the tip of your member prodding away at the slick entrance.")

		else:
			saynn("Scarlet pulls out a strapon harness from under the bed and secures it around your waist. She also pours some lube onto its tip.. before trapping it between her thick thighs.. Her wet sensitive folds rest just above it, the rubber tip prodding away at the slick entrance.")

		saynn("[say=eliza]Will dad be okay with this, mom?[/say]")

		saynn("Your whole view is obstructed.. by a great view, actually. Eliza's hot, pink pussy.. hovering tantalizingly close to your face.. You can just feel the warmness emanating from those tasty flower petals.")

		saynn("[say=elizaMom]Don't worry. "+str("We're in an open relationship, darling~." if !isStrapon else "It's only a strapon. And also, we're in an open relationship, darling~.")+"[/say]")

		saynn("[say=eliza]Oh? Since when?[/say]")

		saynn("Scarlet laughs softly, her eyes gleaming with mischief.")

		addButton("Continue", "See what happens next", "s3_rng_sex")
	if(state == "s3_rng_sex"):
		playAnimation(StageScene.SexDoubleDown, "sex", {pc="pc", npc="elizaMom", npc2="eliza", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("Slowly, Scarlet lowers herself onto your "+str("cock" if !isStrapon else "new cock")+", allowing it to part her red, sensitive folds and slide down her tunnel of love. A soft noise escapes her as she starts riding you.. guiding her pussy along the length of "+str("your" if !isStrapon else "that")+" shaft up and down.. letting it explore her needy depths..")

		saynn("[say=elizaMom]There we go~..[/say]")

		saynn("On the other side, Eliza lowers herself onto your face, pressing her warm, inviting slit against your face and lips, giving you full permission to start pleasuring her. You wrap your arms around her hips and get to work, flicking your tongue out and proceeding to drag it along the pink folds, catching some of that wetness and drawing out little moans from her.")

		saynn("[say=eliza]Ah..[/say]")

		saynn("After establishing a rhythm, Scarlet reaches her hand out to cup her daughter's chin, connecting their gazes. Eliza is blushing deeply.. while you are working on her pussy, every flick and swirl of your tongue sending waves of pleasure rippling through her.")

		saynn("[say=elizaMom]Love you, sweetie..[/say]")

		saynn("[say=eliza]Me too..[/say]")

		saynn("Only a few moments later, Scarlet and Eliza lean in to share a heated, tender kiss. Their lips collide.. tongues slipping past the teeth and already doing a little dance, exchanging saliva.. all while Scarlet continues to bring her body down onto your "+str("hard" if !isStrapon else "rubber")+" cock, her wet inner walls kneading "+str("your shaft" if !isStrapon else "it")+" so well..")

		addButton("Continue", "See what happens next", "s3_rng_hold_hands")
	if(state == "s3_rng_hold_hands"):
		playAnimation(StageScene.SexDoubleDown, "sexhands", {pc="pc", npc="elizaMom", npc2="eliza", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("Before their deep kiss ends, Scarlet finds Eliza's paws and grabs them, their fingers intertwining.. You can feel that pussy becoming even more wet when that happens, her twitching slit dripping juices onto your tongue as you keep eating her out..")

		saynn("[say=eliza]Mmh~.. hhmmh..[/say]")

		saynn("Finally, their kiss ends.. leaving both girls panting and blushing.")

		saynn("[say=elizaMom]Let's try to cum together, dear?[/say]")

		saynn("[say=eliza]Yes.. that would be so hot..[/say]")

		saynn("You'd add your thoughts.. but you are too busy coating that pussy with your tongue, the tip finding the entrance and prodding away at it.. until the folds spread enough for you to start lapping at her inner walls.")

		addButton("Continue", "See what happens next", "s3_rng_fast")
	if(state == "s3_rng_fast"):
		playAnimation(StageScene.SexDoubleDown, "fast", {pc="pc", npc="elizaMom", npc2="eliza", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("Scarlet's pace becomes fierce.. she brings herself down onto "+str("your cock" if !isStrapon else "your strapon")+" harder and deeper, letting go of her daughter's hands so that she can support herself. "+str("You can feel her pussy walls clenching around you, offering you so much pleasurable friction, it makes you want to meet her motions with yours." if !isStrapon else "You can't really feel through the rubber.. but you do feel some pleasurable pressure that the friction puts on your crotch.. it makes you want to meet her motions with yours.")+"")

		saynn("[say=elizaMom]Ah.. mmhh~.. I can feel that "+str("cock" if !isStrapon else "toy")+" kissing my womb..[/say]")

		saynn("Eliza sees her mother's giant bouncing tits.. and moans louder while pressing her pussy into your face more.. letting your tongue penetrate her slit deeper..")

		saynn("[say=eliza]And I can feel {pc.his} tongue licking me inside.. hhah.. Nhh..[/say]")

		saynn("The tension builds higher and higher.. Both girls are pleasuring themselves with you.. pushing themselves to their peaks.."+str(" while yours is drawing close too.." if !isStrapon else "")+"")

		addButton("Orgasm", "All sorts of orgasms are about to happen..", "s3_rng_cum")
	if(state == "s3_rng_cum"):
		playAnimation(StageScene.SexDoubleDown, "inside", {pc="pc", npc="elizaMom", npc2="eliza", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		if (!isStrapon):
			saynn("And soon, all of you can't hold back any longer..")

		else:
			saynn("And soon, they lose the ability to hold back any longer..")

		saynn("Scarlet's body shudders as she reaches her climax, bringing her body down onto your "+str("{pc.penis}" if !isStrapon else "knotted rubber toy")+" hard, letting the whole length stay inside.. while her pulsing walls clench around your shaft in countless waves."+str(". the extreme pressure triggering something in your strapon!" if isStrapon else "")+"")

		saynn("[say=elizaMom]"+str("Breed me~.." if !isStrapon else "Get that knot in~..")+" Yes-s~.[/say]")

		saynn("Almost simultaneously, your tongue brings Eliza to a powerful, shuddering orgasm of her own. Her pussy twitching.. before showering your face with a fountain of her juices, overstimulation pushing her to squirt.")

		saynn("[say=eliza]Ah-h.. nh-hh..[/say]")

		if (!isStrapon):
			saynn("While that is happening, your own orgasm is messing with your perception. Your cock is throbbing inside Scarlet.. shooting long thick strings of your {pc.cum} inside her, pumping her womb full of it.. her needy pussy drains your balls completely..")

		else:
			saynn("While that is happening.. you realize that your strapon has begun throbbing inside Scarlet! It starts shooting long thick strings of creamy cum-like fluid, pumping her womb full of it.. her needy pussy drains your toy completely..")

			saynn("[say=elizaMom]Ohh.. I think I forgot to check it. Oh well. It's probably not real cum.[/say]")

		saynn("All three bodies shiver in unison, rubbing against each other.. the girls are breathless.. riding the rest of their orgasms..")

		saynn("[say=eliza]I.. I didn't know you're into breeding, mom~.[/say]")

		saynn("Scarlet tilts her head slightly, looking at her daughter.")

		saynn("[say=elizaMom]If I wasn't into breeding, you wouldn't be here, sitting on that face right now~.[/say]")

		saynn("[say=eliza]Fair.. I think all the pleasure.. that kiss.. your bouncing tits.. I think I'm spacing out..[/say]")

		saynn("To be fair.. The whole room smells of pure sex.. Your own perception is altered heavily too.")

		addButton("Continue", "See what happens next", "s3_rng_after")
	if(state == "s3_rng_after"):
		playAnimation(StageScene.SexDoubleDown, "tease", {pc="pc", npc="elizaMom", npc2="eliza", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("Scarlet holds hands with Eliza again.. and slowly lifts herself.. allowing some of that spunk to start oozing out of her stuffed red slit..")

		saynn("[say=eliza]You're such a slut, mom~.[/say]")

		saynn("[say=elizaMom]Wow, don't make me pull the whip out.[/say]")

		saynn("Eliza's eyes light up.")

		saynn("[say=eliza]Oh? Please?[/say]")

		saynn("Scarlet raises a brow.")

		saynn("[say=elizaMom]Right.. What other kinks do you have that I don't know about?[/say]")

		saynn("[say=eliza]Probably most of them..[/say]")

		saynn("[say=elizaMom]And I'm a slut here?[/say]")

		saynn("Eliza catches some of that seed"+str("-like substance" if isStrapon else "")+" onto her digits.. and brings them to her mother's lips. Scarlet flicks her tongue out and starts sucking on them..")

		saynn("[say=eliza]Yes~. My mom is a total cum slut~.[/say]")

		saynn("Scarlet squints at Eliza.. but keeps sucking on her digits.. her other hand holding Eliza's paw.")

		saynn("Better to let them figure out who's the biggest slut on their own..")

		addButton("Get up", "Slip from under them", "s3_rng_slipout")
	if(state == "s3_rng_slipout"):
		playAnimation(StageScene.Sleeping, "sleep", {pc="elizaMom", npc="eliza", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You slip from under them.. allowing them to collapse onto the bed, embracing each other. Eliza's face lands on her mother's breasts.. using them as big, soft pillows.")

		saynn("Watching them.. it's so cute.")

		saynn("Scarlet notices you heading towards the exit.")

		saynn("[say=elizaMom]Will you find the way out?[/say]")

		saynn("[say=pc]I will probably run into some guards. Don't worry about me.[/say]")

		saynn("She smiles.")

		saynn("[say=elizaMom]Thank you~. For everything.[/say]")

		saynn("Eliza is too busy suckling on her mother's tits to say anything.. Until Scarlet suddenly spanks her butt, making it jiggle.")

		saynn("[say=eliza]Ah~.. Harder mommy~. Oh.. I mean.. Thank you~.[/say]")

		saynn("What a journey..")

		saynn("But it was time to go.")

		addButton("Leave", "Time to go", "s3_leave")
	if(state == "s3_leave"):
		removeCharacter("eliza")
		removeCharacter("elizaMom")
		playAnimation(StageScene.Solo, "stand")
		aimCameraAndSetLocName("hall_mainentrance")
		GM.pc.setLocation("hall_mainentrance")
		saynn("Your journey back wasn't as interesting. You've walked into some guards.. who were quite confused about how you were able to get up there.")

		saynn("You managed to talk your way out.. and so they just threw you back into the cell block.")

		saynn("No more giant, comfy beds for you..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "s3_spitroast"):
		addCharacter("elizaMom", ["naked"])
		addCharacter("eliza", ["naked"])
		aimCameraAndSetLocName("cd_office2")
		setLocationName("Scarlet's room")
		playAnimation(StageScene.Duo, "stand", {pc="eliza", npc="elizaMom", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("As you open the door and step inside.. you are greeted by.. quite a scene.")

		saynn("In the soft, ambient light of the room, both Scarlet and Eliza stand waiting in alluring poses. Not a single piece of cloth is covering their curvy tits.. or feminine hips.. but that doesn't mean they don't have anything on.. Both of them sport a strapon harness fitted snugly around their waists. The sparks in their eyes.. and the confident tilt of their hips.. imminates pure power.. for real.. their biceps and abs look way more defined than usually..")

		saynn("Both women lock eyes with you.. their cunning smiles tell you so much..")

		saynn("[say=elizaMom]Welcome~.[/say]")

		saynn("Scarlet slowly approaches you, her rubber shaft bobbing up and down after her every step")

		saynn("[say=eliza]Hai~.[/say]")

		saynn("Eliza follows her mother. Together, they surround you, Scarlet pushing you further into the center of the space with a playful hip-bump.. her curvy body making it easy.")

		saynn("Their hands begin to wander over your {pc.masc} figure.. stripping you of anything that's strippable and teasing your curves.. "+str("Your cock has gotten hard in an instant.. but you get a feeling that you won't get to use it much.." if (hasPP && !GM.pc.isWearingChastityCage()) else "")+""+str("Your cock tries to get hard in its cage.. but the metal prevents it from doing so.." if (hasPP && GM.pc.isWearingChastityCage()) else "")+"")

		saynn("Scarlet leans close to your ear, her voice is close to purring..")

		saynn("[say=elizaMom]Fancy being our little fucktoy tonight?[/say]")

		saynn("Eliza does the same but to your other ear.. All the while Scarlet is pouring lube onto the two fancy knotted strapons..")

		saynn("[say=eliza]..And by the way.. That is not a question..[/say]")

		saynn("Oh no.. Any possible bits of dominance that you had before.. gone in an instant.. Their speech.. their giggle.. makes you lower your gaze and stare at their rubber cocks..")

		saynn("Suddenly, Eliza grabs your hair and pulls on it, making your chin skyrocket as high as it can.")

		saynn("[say=pc]Ahh..[/say]")

		saynn("[say=eliza]Little slutty bitch~. I can feel you shivering.[/say]")

		saynn("[say=elizaMom]Language, sweetie. Don't break our toy so soon.[/say]")

		saynn("Scarlet's hand smacks your butt, sending it jiggling.")

		if (isAnal):
			saynn("[say=elizaMom]Since I'm bigger, I will take that ass.[/say]")

		else:
			saynn("[say=elizaMom]Since I'm bigger, I will take that ass. Well, puss.[/say]")

		saynn("[say=eliza]Throat is fine by me~.[/say]")

		saynn("They're deciding how they're gonna fuck you.. While you're just acting like a subby mess, moaning softly..")

		if (GM.pc.isWearingChastityCage()):
			saynn("Eliza puts her free paw on your locked cock and squeezes your balls slightly..")

			saynn("[say=eliza]Your little locked toy is leaking so much already~.[/say]")

			saynn("Scarlet raises a brow.")

			saynn("[say=elizaMom]Never thought that you'd be into chastity.[/say]")

			saynn("You can't move a muscle.. while Eliza gently tugs on the cage.. making it shift and rub against your poor member.. that is forced to stay soft..")

			saynn("[say=eliza]Chastity is super hot, mom~.[/say]")

			saynn("Scarlet bites her lip, her hand scritches Eliza behind the ears.")

			saynn("[say=elizaMom]Maybe I should lock your little holes behind a metal belt then.. Get your little tits blocked by a heavy metal bra too.. and see how long it will take for you to start begging.[/say]")

			saynn("Eliza squirms a little.. while digging her claws into your balls a bit.. the discomfort only makes more blood start flowing to your member.. increasing the pressure behind your cage.")

			saynn("[say=eliza]Mo-o-om.. We're supposed to be dommies..[/say]")

			saynn("[say=elizaMom]I know, just something for the future~.[/say]")

		elif (GM.pc.hasReachablePenis()):
			saynn("[say=eliza]But first.. I gotta take care of something useless~. Hold {pc.his} hair.[/say]")

			saynn("Scarlet takes hold of your hair.. while Eliza crouches in front of your crotch. She pulls out a little metal object.. a cage..")

			saynn("[say=elizaMom]I never thought that you'd be into chastity.[/say]")

			saynn("You can't move a muscle.. while Eliza pushes your hard cock and balls through the cold metal ring..")

			saynn("[say=eliza]Chastity is super hot, mom~.[/say]")

			saynn("Scarlet bites her lip, her free hand scritches Eliza behind the ears.")

			saynn("[say=elizaMom]Maybe I should lock your little holes behind a metal belt then.. Get your little tits blocked by a heavy metal bra too.. and see how long it will take for you to start begging.[/say]")

			saynn("Eliza squirms a little.. while putting the second part of the chastity cage against the tip of your cock.. your precum leaks onto her clawed digits.")

			saynn("[say=eliza]Mo-o-om.. We're supposed to be dommies..[/say]")

			saynn("Eliza pushes on the second part.. forcing your hard dick to retract.. enough for her to lock the cage. The immense pressure is making you moan..")

			saynn("[say=elizaMom]I know, just something for the future~.[/say]")

		else:
			saynn("[say=eliza]Too bad I can't put a chastity cage on you. I totally would~.[/say]")

			saynn("Scarlet raises a brow.")

			saynn("[say=elizaMom]Never thought that you'd be into chastity.[/say]")

			saynn("You can't move a muscle.. while Eliza is dragging her paw near your crotch..")

			saynn("[say=eliza]Chastity is super hot, mom~.[/say]")

			saynn("Scarlet bites her lip, her hand scritches Eliza behind the ears.")

			saynn("[say=elizaMom]Maybe I should lock your little holes behind a metal belt then.. Get your little tits blocked by a heavy metal bra too.. and see how long it will take for you to start begging.[/say]")

			saynn("Eliza squirms a little..")

			saynn("[say=eliza]Mo-o-om.. We're supposed to be dommies..[/say]")

			saynn("[say=elizaMom]I know, just something for the future~.[/say]")

		saynn("Suddenly, they grab you..")

		addButton("Continue", "See what happens next", "s3_spitroast_tease")
	if(state == "s3_spitroast_tease"):
		playAnimation(StageScene.SexSpitroast, "tease", {pc="pc", npc="elizaMom", npc2="eliza", bodyState={naked=true, caged=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("The ground gets stolen from under you!")

		saynn("In a swift, coordinated motion, they catch your limbs and pull you off the floor. Somehow, these two girls are managing to hold you in the air.")

		saynn("[say=pc]Ah![/say]")

		saynn("[say=elizaMom]See? Told you it would work. I know my chemistry.[/say]")

		saynn("[say=eliza]Yeah, thanks for the recipe~.[/say]")

		saynn("Scarlet holds your hips and already aligns her smooth, rubber cock to your "+str("{pc.analStretch} anus" if isAnal else "{pc.pussyStretch} pussy")+".. prodding it.. while Eliza holds your chest, her toy positioned right at your mouth.. the tip brushing against your lips.")

		saynn("[say=eliza]Open that little cute mouth for me~.[/say]")

		saynn("[say=pc]..hh-h..[/say]")

		saynn("You.. caught between a pair of irresistible girls.. with irresistible cocks.. find yourself completely helpless.. as soon as you try to move your arm or leg, they are quick to wrestle it back into place.")

		saynn("Something tells you that Eliza's strapon won't fill in your mouth.. Your subby eyes look up at her.. pleading to not be too rough..")

		saynn("[say=elizaMom]Get ready, sweetie.[/say]")

		saynn("Oh no..")

		addButton("Continue", "See what happens to your holes next", "s3_spit_sex")
	if(state == "s3_spit_sex"):
		playAnimation(StageScene.SexSpitroast, "sex", {pc="pc", npc="elizaMom", npc2="eliza", bodyState={naked=true, caged=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("With one powerful burst of energy, Scarlet rams her strapon inside your "+str("asshole" if isAnal else "cunt")+", the tip stretching your "+str("anal ring" if !isAnal else "pussy folds")+" so wide you can't help but to gasp, your body thrashing against their grips..")

		saynn("[say=pc]AHh-hh![/say]")

		saynn("Eliza uses this moment to align her toy with your opened mouth.. and slide it past your teeth, forcing your lips to open wider.")

		saynn("[say=elizaMom]There you go, sweetie.[/say]")

		saynn("[say=eliza]Thank you, mom~.[/say]")

		saynn("The pounding begins gradually, each thrust deliberate and powerful. Eliza's strapon enters deeply, the tip quickly encountering the back of your mouth and bending down your throat, causing your muscles there to tense up.. hard..")

		saynn("You're already gagging on Eliza's toy while Scarlet is fucking your "+str("ass" if !isAnal else "slit")+", her pre-lubed strapon spreading your inner walls and kneading them, each forceful insertion sending shockwaves of pleasure through your body.")

		saynn("[say=pc]Nhh.. hh.. khh.. ghh!..[/say]")

		saynn("Eliza puts one of her paws around your throat, feeling her rubber cock traveling back and forth along it.. The wet noises and gagging of your throat and the slaps of Scarlet's hips against your butt fill the room."+str(" Your locked away cock squirts with precum as your prostate gets smashed.. again and again.." if (hasPP && isAnal) else "")+""+str(" Your locked away cock squirts with precum as your g-spot gets smashed.. again and again.." if (hasPP && !isAnal) else "")+"")

		saynn("[say=eliza]I can see that you love it~.[/say]")

		saynn("[say=elizaMom]What about you, sweetie? Do you like sharing that toy with me?[/say]")

		saynn("You can just feel that Eliza is blushing.. her thrusts becoming a little less rough.")

		saynn("[say=eliza]I love doing any kind of shared activity with you, mom..[/say]")

		saynn("[say=elizaMom]Aww, you're so sweet, you know that?[/say]")

		saynn("You'd add to the conversation.. but you can only produce muffled gags and stifled moans.. The double-pounding is making your eyes want to roll up already..")

		saynn("Their movements are synchronized.. two dommies stuffing your holes one at a time.. You feel close already..")

		addButton("Continue", "See what happens next", "s3_spit_fast")
	if(state == "s3_spit_fast"):
		playAnimation(StageScene.SexSpitroast, "fast", {pc="pc", npc="elizaMom", npc2="eliza", bodyState={naked=true, caged=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("As their pace quickens, the dual strapons begin to pound your throat and "+str("asshole" if !isAnal else "cunt")+" with increased urgency. With each rapid, forceful movement, the fat knots of their strapons smash against your lips and "+str("anal ring" if !isAnal else "pussy petals")+", trying to stretch them wide enough..")

		saynn("Scarlet's ample breasts are bouncing a lot while she is fucking you.. a sight that Eliza seems to be glued to. Both of their pussies are soaked with juices, the tight leather straps of the harnesses rub against their sensitive folds a little too much..")

		saynn("[say=eliza]If we ram our cocks deep enough, will our tips touch..[/say]")

		saynn("[say=elizaMom]Doubt it, sweetie. That's not how anatomy works.[/say]")

		saynn("[say=eliza]Aw..[/say]")

		saynn("[say=elizaMom]But I'm willing to test your hypothesis anyway~.[/say]")

		if (hasPP):
			saynn("Your poor caged cock is twitching eagerly in its little prison.. leaking transparent"+str(" prostate" if isAnal else "")+" fluid.. while your pleasure button keeps being milked by Scarlet's thick strap.. Your throat and "+str("asshole" if isAnal else "pussy")+" clench wildly around the intruding shafts.. all the while the girls keep going keeper and deeper..")

		else:
			saynn("All of your pleasure buttons keep being smashed by Scarlet's thick strap.. Your throat and "+str("asshole" if isAnal else "pussy")+" clench wildly around the intruding shafts.. all the while the girls keep going keeper and deeper..")

		saynn("You are on the edge..")

		addButton("Continue", "See what happens next", "s3_spit_cum")
	if(state == "s3_spit_cum"):
		playAnimation(StageScene.SexSpitroast, "inside", {pc="pc", npc="elizaMom", npc2="eliza", pcCum=true, npcCum=true, npc2Cum=true, bodyState={naked=true, caged=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("Their knots keep increasing the pressure on your holes.. until..")

		saynn("[say=elizaMom]Now, sweetie.[/say]")

		saynn("In one, synchronized moment, they throw their hips forward, ramming their rubber cocks inside you, the fat rubber knots meeting the resistance in the form of your lips and "+str("ass" if isAnal else "cunt")+".. but stretching them wide open enough to slip inside with a satisfying plop..")

		saynn("As their knots stretch you beyond belief, your body reaches its peak.. All your muscles begin to tense up and relax completely uncontrollably, you're gagging on that fat knot"+str(" as your locked cock shoots a weak torrent of {pc.cum} through that little hole in the cage, sending desperate strings of your seed that land on your belly" if hasPP else " hard")+".. The inner walls of your "+str("ass" if isAnal else "squirting pussy are")+" clenching hard around that huge orb, the sensation makes your mind go completely blank..")

		saynn("[say=elizaMom]It's not over yet~.[/say]")

		saynn("The extreme tightness that your body provides triggers something in their toys.. You can feel Eliza's and Scarlet's strapons throbbing inside you as they start pumping you full of some kind of thick cum-like lube. Waves after waves of that stuff floods your belly and "+str("ass" if isAnal else "womb")+".. their knots making sure that almost nothing escapes..")

		saynn("[say=elizaMom]Much better~.[/say]")

		saynn("[say=eliza]Ah.. Mhh~.. I think I just came..[/say]")

		if (hasPP):
			saynn("Your orgasm just keeps going and going.. your balls twitch as your locked dick dribbles with the remains of your seed.. your "+str("prostate" if isAnal else "g-spot")+" feels completely destroyed.. fat knot constantly squeezing it dry..")

		else:
			saynn("Your orgasm just keeps going and going.. Your pleasure spot feels completely destroyed.. while a fat knot is constantly squeezing it.."+str(" Your pussy is gushing with juices until there is nothing for it to squirt with.." if !isAnal else "")+"")

		saynn("Your throat is blocked too.. making you lose oxygen fast.. the world begins to look all rainbow-y..")

		saynn("[say=elizaMom]Let's pull out before {pc.he} blacks out.[/say]")

		saynn("[say=eliza]Yes, mom. One.. two..[/say]")

		addButton("Continue", "See what happens next", "s3_spit_after")
	if(state == "s3_spit_after"):
		playAnimation(StageScene.SexSpitroast, "tease", {pc="pc", npc="elizaMom", npc2="eliza", bodyState={naked=true, caged=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("[say=eliza]Mm.. Three![/say]")

		saynn("They yank their cocks out.. leaving your "+str("asshole" if isAnal else "cunt")+" gaping and your throat stretched wide..")

		saynn("You instantly start coughing and gagging on air, multiple gasps escape you while your pulsing "+str("ring" if isAnal else "slit")+" spawns a fountain of that thick, juicy cum-lube..")

		saynn("[say=pc]KH! KGHH!.. Khh.. gh.h.. hhh..[/say]")

		saynn("[say=elizaMom]Did we break {pc.him}?[/say]")

		saynn("[say=eliza]I hope not, that's my best assistant![/say]")

		saynn("You show a weak thumbs up.. while still struggling to get your breathing under control.")

		saynn("[say=elizaMom]I think {pc.he} just needs some rest.[/say]")

		saynn("[say=eliza]Yeah, I'm quite exhausted too. Was fun though~.[/say]")

		addButton("Continue", "See what happens next", "s3_spitroast_bed")
	if(state == "s3_spitroast_bed"):
		playAnimation(StageScene.Sleeping, "sleep", {pc="elizaMom", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("The two girls pull you into their comfy double-bed, letting you rest on top of their bodies.")

		saynn("[say=eliza]We got ourselves a cute blanket~.[/say]")

		saynn("You might be their blanket.. but Scarlet's breasts work surprisingly well as pillows..")

		saynn("[say=elizaMom]Not as cute as you.[/say]")

		saynn("[say=eliza]Whaaaa-at![/say]")

		saynn("Eliza blushes.. Scarlet decides to smooch her on the lips.")

		saynn("[say=elizaMom]My cute girl~.[/say]")

		saynn("[say=eliza]Hmpf..[/say]")

		saynn("You can feel their hands gently caressing your {pc.thick} curves.")

		saynn("Your eyes begin to close..")

		addButton("Nap..", "Take a small nap..", "s3_spitroast_nap")
	if(state == "s3_spitroast_nap"):
		removeCharacter("elizaMom")
		playAnimation(StageScene.Sleeping, "sleep", {pc="eliza", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You wake up lying on Eliza.")

		saynn("[say=eliza]Hey there, sleepy head~. How are you doing there?[/say]")

		saynn("[say=pc]Good..[/say]")

		saynn("[say=eliza]Up for more~?[/say]")

		saynn("Your face contorts in ways you never thought it could.")

		saynn("[say=eliza]Relax, I'm just teasing~. Thank you for being our little fucktoy. While mom is in the shower, let me get you back to your cellblock, okay?[/say]")

		saynn("You nod softly..")

		addButton("Follow", "Follow Eliza back to the cellblock", "s3_spit_back_to_cellblock")
	if(state == "s3_spit_back_to_cellblock"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		aimCameraAndSetLocName("hall_mainentrance")
		GM.pc.setLocation("hall_mainentrance")
		saynn("Your journey back wasn't as interesting. Eliza walks you back to the main elevator and brings you down to the cellblock..")

		saynn("[say=eliza]There we are. Have fun~.[/say]")

		saynn("[say=pc]Thanks..[/say]")

		saynn("[say=eliza]You're welcome! Now, if you excuse me.[/say]")

		saynn("No more giant, comfy pillows for you..")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "s3_lovetower"):
		addCharacter("elizaMom", ["naked"])
		addCharacter("eliza", ["naked"])
		aimCameraAndSetLocName("cd_office2")
		setLocationName("Scarlet's room")
		playAnimation(StageScene.Duo, "stand", {pc="eliza", npc="elizaMom", bodyState={underwear=true}, npcBodyState={underwear=true}})
		saynn("As you step inside the room, you are offered with.. quite a view.")

		saynn("The two women, Eliza and Scarlet, are standing near each other, wearing only their sexy lingerie. Scarlet's silky black lace and delicate garters highlight her ample tits and curvy ass.. while Eliza's accentuates her.. not so thick but still sexy.. figure.")

		saynn("[say=eliza]Hey there~.[/say]")

		saynn("[say=elizaMom]You look surprised.[/say]")

		saynn("They're entwined in a slow, teasing dance.. rubbing and caressing each other with some provocative touches.. cupping each other's breasts.. tugging on the panties.. groping the butts. Their eyes glimmer with mischief as they exchange teasing glances with you.")

		saynn("Soon, they pull you into the dance, pressing and rubbing their bodies against you. Their hands graze along your chest and shoulders, stripping anything that's strippable.. exposing your {pc.penis}..")

		saynn("[say=elizaMom]I've got dibs on {pc.his} cock.[/say]")

		saynn("[say=eliza]{pc.His} face is mine to have fun with then~.[/say]")

		saynn("But rather than letting them have it their way, you decide to take things into your hands. You face Scarlet and get a grasp on her hair.. while your other hand lands on her neck, catching her off-guard.")

		saynn("[say=elizaMom]Oh? What are you..[/say]")

		saynn("You lean in closer to her ear and, with a deep, dominant tone, start talking into it.")

		saynn("[say=pc]I don't know what you prepared for me. But, today, you.. and your little slutty daughter.. are both gonna be my cock sleeves. Understand?[/say]")

		saynn("Eliza's eyes are wide open as she watches you handling her mother so roughly.")

		saynn("[say=elizaMom]Uh..[/say]")

		saynn("Your digits squeeze Scarlet's throat, forcing out a quiet gasp out of her. Your strict gaze is drilling her.. making her ear turn down.. her lips are slightly parted..")

		saynn("[say=pc]On your knees.[/say]")

		saynn("You let go of Scarlet's hair and throat.. but smack her ass hard.. making it jiggle.")

		saynn("[say=elizaMom]Ah-..[/say]")

		addButton("Continue", "See what happens next", "s3_dom_kneel")
	if(state == "s3_dom_kneel"):
		playAnimation(StageScene.Duo, "kneel", {pc="eliza", npc="elizaMom", npcAction="kneel", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("Inspired by your words, Scarlet slides down to her knees before you. Sparks of shy obedience shine in her eyes.")

		saynn("[say=elizaMom]As you ordered..[/say]")

		saynn("Not bad. That cat is not that hard to tame.")

		saynn("You direct your gaze at Elize next. Her stare switches between you and her mother..")

		saynn("[say=eliza]Uh..[/say]")

		saynn("One step towards her.. and she drops to her knees as well. Your confidence alone is making her submit.")

		saynn("[say=pc]Good little slut.[/say]")

		saynn("[say=eliza]..meow..[/say]")

		saynn("You point at the spot in the middle of the room.")

		saynn("[say=pc]I want you both there.[/say]")

		saynn("Scarlet blinks at you.. while Eliza just gets on all fours and begins crawling to it, swaying her hips quite a bit. Her mother sees it and copies the idea, crawling to the same spot.")

		saynn("They kneel near each other, both facing you.")

		saynn("You close the distance.. your half-hard member is close to their faces.")

		saynn("[say=pc]Get my cock ready.[/say]")

		saynn("The two girls look at each other with shy gazes..")

		saynn("[say=eliza]Mom?..[/say]")

		saynn("Scarlet shrugs softly.")

		saynn("[say=elizaMom]I will lick the shaft..[/say]")

		saynn("And so she leans in and parts her lips, catching the head of your cock with them and then using her feline tongue to play with the tip, licking and sucking.")

		saynn("Eliza watches her mother work.. and swallows audibly.. her tongue peeks out too for a bit.. licking her own lip. Eventually, she decides to commit too, going lower than her mother and focussing on your balls instead, gently cupping them with her paws and dragging her tongue around.")

		saynn("With such service, it doesn't take long for your shaft to start getting hard and bigger, blood flowing to it while Scarlet expertly curls her tongue around its girth, coating it with her saliva.")

		saynn("[say=pc]Such good little whores. Take off what you're wearing.[/say]")

		saynn("Both, Eliza and Scarlet, take their bras off.. and pull their panties down.. exposing their slick slits.")

		saynn("[say=elizaMom]As you wish..[/say]")

		saynn("Your hands land on their hands, scritching them behind the ears while they lick and suck on your shaft and balls.. Scarlet catches some of your precum and swallows it.. Eliza sticks her nose into your ballsack and breathes in the scent.. her warm breath making your cock twitch.")

		saynn("Time to.. have some fun.")

		addButton("All fours", "Put them on all fours. One on top of another", "s3_tower_assemble")
	if(state == "s3_tower_assemble"):
		playAnimation(StageScene.ButtStackSex, "tease", {pc="elizaMom", npc="eliza", npc2="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("With a firm grip of Scarlet's hair, you pull her away.")

		saynn("[say=pc]I want to see you on all fours.[/say]")

		saynn("[say=elizaMom]Of course..[/say]")

		saynn("Without hesitation, she obeys, lowering her curvy frame until she is positioned on the cool floor. You nod towards Eliza next.")

		saynn("[say=pc]Get above her, on all fours, too.[/say]")

		saynn("Eliza tilts her head slightly.")

		saynn("[say=eliza]Meow..[/say]")

		saynn("You decide to help her, pulling her up and dropping her above Eliza.. creating a.. tower of sorts.. both of their their butts now available to you.")

		saynn("[say=eliza]That's what I was gonna do![/say]")

		saynn("A smack on the ass makes Eliza's body arch.")

		saynn("[say=eliza]Ah..[/say]")

		saynn("Then, your hands land on Scarlet's ass, spreading her cheeks, exposing her tight, red slit.. that's already glistening with arousal. She seems ready.. Still, you spit onto her folds and rub it in, making Scarlet moan softly as your digits brush against her sensitive folds..")

		saynn("[say=elizaMom]Mmm-.. h..[/say]")

		saynn("[say=pc]Mom is first.[/say]")

		saynn("[say=eliza]No fair..[/say]")

		saynn("Another spank makes Eliza writhle on top of Scarlet, her own pussy looking quite wet and inviting by now too..")

		addButton("Scarlet", "Start fucking Scarlet", "s3_tower_scarlet")
	if(state == "s3_tower_scarlet"):
		playAnimation(StageScene.ButtStackSex, "sexdown", {pc="elizaMom", npc="eliza", npc2="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("You waste no time, aligning your cock at Scarlet's pussy entrance and sliding it in, letting the tip of your member to part her folds.")

		saynn("[say=elizaMom]Mhh-h.. fuck~..[/say]")

		saynn("[say=eliza]Mom, language![/say]")

		saynn("[say=elizaMom]Shush, cutie~.. Your turn will come~..[/say]")

		saynn("You begin to pound her slit raw and hard, each thrust sending ripples of pleasure through her, echoing around into the girl above. Scarlet's soft walls are clenching around your cock with relentless intensity.. making fucking her feel quite nice.")

		saynn("At the same time, you decide to keep Eliza ready too. Your digits find their way to her slick, sensitive petals and begin rubbing them, your big thumb focussing on playing with her clit.")

		saynn("[say=eliza]Mhh-..[/say]")

		addButton("Faster", "Fuck Scarlet faster", "s3_tower_scarlet_faster")
	if(state == "s3_tower_scarlet_faster"):
		playAnimation(StageScene.ButtStackSex, "fastdown", {pc="elizaMom", npc="eliza", npc2="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("You increase the onslaught on Scarlet's pussy.. fucking her faster, driving your cock deeper down that hungry fuckhole, the tip of your member kissing her womb entrance each time, making her squirm.")

		saynn("[say=elizaMom]Mhh.. hhah.. ah.. Pinned by my daughter.. being used by her assistant.. like a sextoy..[/say]")

		saynn("[say=eliza]You kneeled first, you wanted this.. ah.. we're both sluts..[/say]")

		saynn("She gets tight fast.. but you push through, shoving your dick in and out, your hips slapping against her fluffy ass. The room is filled with the sounds of hard, raw fucking.. and the moans of two sluts, your digits fingering the daughter of the woman that you're pounding..")

		saynn("You feel your orgasm drawing near.. but you hold it back.. purposefully.. focusing on making that whore cum..")

		saynn("[say=elizaMom]Mhh.. ah.. I'm.. Ah~.. Ah-h~~.. I can feel your cock.. mhh-.. throbbing..[/say]")

		saynn("And soon, she does, Scarlet throws her head back and moans like a whore while her pussy starts to knead your shaft, all her muscles tensing up at random.")

		saynn("[say=elizaMom]Feels so g-good.. hh-hhahh..[/say]")

		saynn("[say=eliza]What about me-e-e..[/say]")

		saynn("That's a good point.")

		addButton("Eliza", "Switch to fucking Scarlet's daughter", "s3_tower_eliza_fast")
	if(state == "s3_tower_eliza_fast"):
		playAnimation(StageScene.ButtStackSex, "fastup", {pc="elizaMom", npc="eliza", npc2="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("You leave Scarlet to ride the rest of her orgasm and withdraw your cock from her depths, instead, rising up and aligning yourself with Eliza's eager pussy. You drive into her with equal force, her delicate walls spreading wide as she gasps.")

		saynn("[say=eliza]Ah!..[/say]")

		saynn("Scarlet daughter's pussy makes you feel at home.. allowing you to quickly reach the same pace. One of your hands gropes her ass while the second one reaches out and yanks on her ponytail, forcing her to keep her chin high.")

		saynn("[say=eliza]Ah.. f-fuck.. so fast.. my pussy.. ah..[/say]")

		saynn("[say=elizaMom]Mhh~.. language, sweetie..[/say]")

		saynn("[say=eliza]Sorry.. ah.. mom.. AHh-h~..[/say]")

		saynn("Wow, you can already feel her inner walls clenching around your cock, her whole body is shivering, her pussy trying to milk your shaft.")

		saynn("[say=eliza]I'm cumming..[/say]")

		saynn("[say=elizaMom]What a good girl.. Please, breed her slutty little slit.. You wanna be bred, right, sweetie?[/say]")

		saynn("[say=eliza]Ss..s-sure.. please.. p-pump my womb full..[/say]")

		saynn("You can feel your cock throbbing.. your own orgasm drawing..")

		saynn("You got a better idea..")

		addButton("Share the cum", "Start cumming inside Eliza but switch to Scarlet half-way through", "s3_dom_cum")
	if(state == "s3_dom_cum"):
		playAnimation(StageScene.ButtStackSex, "insidedown", {pc="elizaMom", npc="eliza", npc2="pc", npc2Cum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		saynn("You keep fucking the slutty feline and let the orgasm feeling take over. Your cock starts throbbing even harder.. and releasing the first few waves of {pc.cum} deep inside Eliza, her pussy tightening rhythmically around your shaft as you pump her full.")

		saynn("[say=eliza]Nyaa-a..[/say]")

		saynn("But before the ecstatic feeling ends, you yank your cock free and immediately shove it back into Scarlet's slick sex.")

		saynn("[say=elizaMom]Ah.. what is.. Nhh-h-..[/say]")

		saynn("Your cock keeps throbbing and shooting seed.. but now inside Eliza's mother, pumping that neglected slit with the rest of your spunk..")

		saynn("[say=elizaMom]Did you..[/say]")

		saynn("[say=eliza]I think {pc.he} just bred us both, mom~.[/say]")

		saynn("[say=elizaMom]That's.. hot..[/say]")

		saynn("[say=eliza]What will dad say?[/say]")

		saynn("[say=elizaMom]We're in an open relationship.. f-fuck.. my womb is being filled.. as we speak..[/say]")

		saynn("You stay inside Scarlet, making sure her pussy milks your balls until the very last drop of your seed. Eliza's stuffed cunt is already leaking with it.. some of the mess landing on her mother's butt.")

		saynn("[say=pc]You got good fuckholes, sluts. Couldn't resist stuffing them both.[/say]")

		saynn("You give Scarlet and Eliza a good smack on their asses.")

		saynn("[say=eliza]Ah..[/say]")

		saynn("[say=elizaMom]Nhh.. t-thank you..[/say]")

		saynn("You give Eliza another firm smack.. her butt now looks quite red.")

		saynn("[say=eliza]Nghh-.. y-yes.. t-thank you for breeding a whore.. and her daughter..[/say]")

		saynn("[say=elizaMom]Eliza! Spank her again.[/say]")

		saynn("You obey, delivering a few firm impacts on that soft, fluffy ass. Eliza is gasping and writhing around.")

		saynn("[say=eliza]Oww.. ahh.. ghh.. Two whores.. fine.. haha..[/say]")

		saynn("[say=elizaMom]I will show you a whore..[/say]")

		saynn("[say=eliza]Please do~.[/say]")

		saynn("After properly breeding the mother, you pull out, letting her slit to start dripping with {pc.cum} too..")

		saynn("You get up.")

		saynn("[say=pc]You're free now.[/say]")

		addButton("Continue", "See what happens next", "s3_tower_after_cum")
	if(state == "s3_tower_after_cum"):
		playAnimation(StageScene.SexStart, "start", {pc="elizaMom", npc="eliza", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You watch them climb off of each other. Eliza drops onto the floor and starts rubbing her glowing ass, her used pussy still fully exposed.")

		saynn("Scarlet sits down.. and watches her daughter squirm from the painful sensations. She bites her lip while watching that creamed slit.. Something makes Scarlet start to crawl towards Eliza..")

		saynn("[say=eliza]Mom?.. What are you..[/say]")

		saynn("Looks like the fun isn't over for them yet.")

		addButton("Continue", "See what happens next", "s3_tower_after_cum_69")
	if(state == "s3_tower_after_cum_69"):
		playAnimation(StageScene.Sex69, "tease", {pc="eliza", npc="elizaMom", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Scarlet pushes her daughter down onto her back.. and straddles her.. pushing her butt into her face..")

		saynn("[say=elizaMom]Time to put your slutty tongue to good use.[/say]")

		saynn("[say=eliza]Oh..[/say]")

		saynn("Eliza blushes while seeing Scarlet's creamed pussy from up so close.")

		saynn("Interesting.")

		addButton("Continue", "See what happens next", "s3_tower_after_cum_69_do")
	if(state == "s3_tower_after_cum_69_do"):
		playAnimation(StageScene.Sex69, "FF", {pc="eliza", npc="elizaMom", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Scarlet lowers her butt onto Eliza's face.. and moans softly as her daughter begins eating her out, using her tongue to lick the mess that's dripping out of her used pussy.")

		saynn("[say=elizaMom]Good girl..[/say]")

		saynn("Scarlet does the same, leaning in low to Eliza's crotch and using her long, rough tongue to start lapping away at that other stuffed slit.")

		saynn("Muffled, sweet moans begin to escape from the pair. Two girls eating each other out.. What a sight.")

		saynn("[say=pc]Looks like you know how to keep yourself entertained.[/say]")

		saynn("[say=eliza]Mmhh-h..[/say]")

		saynn("Better to leave them to their fun. You had your share.")

		saynn("Time to go..")

		addButton("Leave", "Time to go", "s3_tower_after_cum_69_leave")
	if(state == "s3_tower_after_cum_69_leave"):
		removeCharacter("eliza")
		removeCharacter("elizaMom")
		playAnimation(StageScene.Solo, "stand")
		aimCameraAndSetLocName("hall_mainentrance")
		GM.pc.setLocation("hall_mainentrance")
		saynn("Your journey back wasn't as interesting. You've walked into some guards.. who were quite confused about how you were able to get up there.")

		saynn("You managed to talk your way out.. and so they just threw you back into the cell block.")

		saynn("It was worth it.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "futa_sex"):
		aimCameraAndSetLocName("med_researchlab")
		addCharacter("eliza", ["naked"])
		isKnot = ((getFlag("ElizaModule.elizatf_cock", "") == "canine") || (getFlag("ElizaModule.elizatf_cock", "") == "dragon"))
		isBarbs = (getFlag("ElizaModule.elizatf_cock", "") == "feline")
		isHorse = (getFlag("ElizaModule.elizatf_cock", "") == "horse")
		isHuman = (getFlag("ElizaModule.elizatf_cock", "") == "human")
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="eliza", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Without saying much, you grab Eliza's hand and pull her into the research lab.")

		saynn("[say=eliza]Huh? New drug?[/say]")

		saynn("[say=pc]Better, we're testing something.[/say]")

		saynn("[say=eliza]I like testing~.[/say]")

		saynn("You make her raise a brow as your hands open her lab coat and pull it off of her shoulders.")

		saynn("[say=pc]All clothing needs to be removed for this one.[/say]")

		saynn("She smiles and lets you take off the rest of her fabric.. leaving the feline naked.. and with her {eliza.penis} out.")

		saynn("Your bits are exposed too, your hand reaches down and spreads your pussy for her, showing how wet you are.")

		saynn("[say=pc]Fuck me.. please.[/say]")

		saynn("[say=eliza]I see. My cock is a hell of a drug, I guess~.[/say]")

		saynn("A predatory smile curves her lips as she moves to close all the windows that lead out into the corridor.")

		saynn("Eliza turns towards you, her step light and delicate as she circles around you, her cock bouncing ever so slightly.")

		saynn("[say=eliza]Since I have the cock, we're doing it my way~.[/say]")

		saynn("Her paw darts out towards your collar.. and yanks you towards the nearest table surface.")

		addButton("Continue", "See what happens next", "futa_table")
	if(state == "futa_table"):
		playAnimation(StageScene.SexMatingPress, "tease", {pc="eliza", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Next moment you know it, you're on the table! Eliza uses her feline agility to climb on top of it and pin you down with the weight of her body. Her hands slide under your knees and raise them up to your shoulders, giving her member full access to your "+str("pussy" if !isAnal else "ass")+"..")

		saynn("You can feel the heat hovering so closely to your "+str("sex" if !isAnal else "anal star")+".. a few droplets of her pre already meeting with your sensitive "+str("folds" if !isAnal else "flesh")+".")

		saynn("[say=eliza]"+str("Since I have a pussy myself" if !isAnal else "Since I've been fucked before")+".. I know exactly what feels good~.[/say]")

		saynn("She aligns the tip with your "+str("slit" if !isAnal else "star")+" and lets it part your "+str("slick petals" if !isAnal else "needy fuckhole")+"."+str(" You can feel the soft barbs brushing against your flesh." if isBarbs else "")+"")

		addButton("Continue", "See what happens next", "futa_sex_sex")
	if(state == "futa_sex_sex"):
		playAnimation(StageScene.SexMatingPress, "sex", {pc="eliza", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Next moment you know it, she rams the rest of her shaft inside, making you arch your back, fingers grabbing onto the table's corner.")

		saynn("[say=pc]Ah.. ah..[/say]")

		saynn("She holds you pinned and rocks in and out of you, doing rough slow thrusts, letting you feel the full length of her cock, angled in such a way so that it can hit your "+str("g-spot" if !isAnal else "")+""+str("p-spot" if (isAnal && GM.pc.hasPenis()) else "")+""+str("pleasure spot" if (isAnal && !GM.pc.hasPenis()) else "")+".")

		saynn("[say=eliza]Yeah.. you like my cock, don't you?[/say]")

		saynn("Eliza purrs into your ear while fucking your "+str("{pc.vaginaStretch} pussy" if !isAnal else "{pc.anusStretch} tailhole")+", hot member coating your inner walls with her precum, making them nice and slick."+str(" Her barbs are gently scratching you on the inside, adding to the stimulation." if isBarbs else "")+"")

		addButton("Continue", "See what happens next", "futa_sex_fast")
	if(state == "futa_sex_fast"):
		playAnimation(StageScene.SexMatingPress, "fast", {pc="eliza", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("She puts way more energy into her next thrusts, the head of her cock "+str("grazing your cervix" if !isAnal else "reaching deep")+" with each rough motion. Her breath becomes deep as she really picks up the pace, driving her {eliza.penis} deep inside you again and again.")

		saynn("Your legs tremble, your "+str("pussy" if !isAnal else "anal ring")+" hugging that sliding member tightly. Your moans grow hotter.. Eliza has got you exactly where you want yourself to be.. vulnerable, spread wide, unable to do anything but to endure her relentless fucking."+str(" The knot at the base of her member inflates with blood.. and she is trying to squeeze it in." if isKnot else "")+"")

		saynn("[say=eliza]With how your "+str("pussy" if !isAnal else "needy hole")+" is clenching around me.. I think I have no choice~.. mhh-.. Might as well see what happens, right~?[/say]")

		addButton("Continue", "See what happens next", "futa_sex_cum")
	if(state == "futa_sex_cum"):
		playAnimation(StageScene.SexMatingPress, "inside", {pc="eliza", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("When your pussy pushes her over the edge, Eliza slams into you on final time, ramming her member as deep as your "+str("slit" if !isAnal else "ass")+" allows"+str(", her knot stretching you wide and slipping inside" if isKnot else "")+". Her cock starts to throb in time with her racing heartbeat."+str(" Her barbs are stiff like needles, preventing her from pulling out.." if isBarbs else "")+""+str(" The flat tip of her cock flares up inside you, becoming even more fat." if isHorse else "")+"")

		saynn("[say=eliza]Cum for me-..[/say]")

		saynn("She growls as she unloads inside you, her balls tensing up as her seed surges deep into your "+str("womb" if !isAnal else "nethers")+" in thick, hot ropes. You feel each pulse of her orgasm as her length twitches, buried completely within you. With a shudder, your own peak catches up with you, pleasure crashing over you in waves that tremble through your limbs"+str(", your own {pc.penis} shooting spurts of {pc.cum}, wasting it" if GM.pc.hasPenis() else "")+".")

		saynn("[say=pc]Ah-h.. mhh.ahh.. nhh..[/say]")

		saynn("For a long moment, Eliza holds you pinned, her throbbing cock lodged inside, both of you panting, exhausted.")

		saynn("[say=eliza]Hah.. Sorry I didn't last that long.. ohh.. I'm still sensitive.[/say]")

		saynn("You part your lips and continue panting.")

		saynn("[say=pc]All.. good.. ah..[/say]")

		saynn("She slowly withdraws, cum dripping from your stuffed "+str("slit, mingling with your juices on the table surface below." if !isAnal else "ass, pooling up on the table surface below.")+"")

		addButton("Continue", "See what happens next", "futa_cuddle")
	if(state == "futa_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="eliza", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("She sits beside you and pulls you into her arms for cuddles.")

		saynn("[say=eliza]There we go..[/say]")

		saynn("She rests her chin on your shoulder and purrs into your ear, her paws resting on your belly.")

		saynn("[say=eliza]Thank you for helping me drain my balls~.[/say]")

		saynn("[say=pc]You're welcome..[/say]")

		saynn("[say=eliza]Using your "+str("pussy" if !isAnal else "little tailhole")+" is much more fun than a penis pump.[/say]")

		saynn("She kisses your neck and gives it a gentle bite.")

		saynn("[say=pc]Mh..[/say]")

		saynn("You just rest together for a while.. until Eliza has to return back to her working spot. You follow her.")

		addButton("Continue", "See what happens next", "endthescene")
func addStraponButtons(thestate):
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), thestate, [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "vag_start_strapon"):
		isStrapon = true
		setState("vag_start")
		return

	if(_action == "sex_milkher"):
		processTime(3*60)

	if(_action == "futa_sex_anal"):
		isAnal = true
		setState("futa_sex")
		return

	if(_action == "cancethescene"):
		endScene()
		runScene("ElizaTalkScene")
		return

	if(_action == "in_lab_milking"):
		getCharacter("eliza").induceLactation()
		processTime(15*60)
		getCharacter("eliza").fillBreasts()

	if(_action == "do_lock_milking"):
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

	if(_action == "milking_tie_to_sybian"):
		getCharacter("eliza").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("BreastPump"))
		getCharacter("eliza").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("oldcollar"))
		getCharacter("eliza").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("inmatewristcuffs"))
		getCharacter("eliza").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("inmateanklecuffs"))

	if(_action == "milking_sybian_turn_on"):
		processTime(15*60)
		GM.main.SCI.doMilkCharacterCustom(getCharacter("eliza"), BodypartSlot.Vagina)
		getCharacter("eliza").fillBreasts(1.0)
		getCharacter("eliza").fillBreasts(1.0)
		GM.main.SCI.doMilkCharacterCustom(getCharacter("eliza"), BodypartSlot.Breasts)
		GM.pc.addSkillExperience(Skill.Milking, 20)

	if(_action == "stop_milking_after_all"):
		processTime(3*60)
		getCharacter("eliza").getInventory().clearSlot(InventorySlot.UnderwearTop)
		getCharacter("eliza").addEffect(StatusEffect.SoreNipplesAfterMilking)

	if(_action == "milking_unchain_after_all"):
		getCharacter("eliza").getInventory().clearSlot(InventorySlot.Neck)
		getCharacter("eliza").resetEquipment()

	if(_action == "vag_table"):
		processTime(3*60)

	if(_action == "vag_on_table"):
		processTime(3*60)

	if(_action == "vag_on_table_pickstrapon_dopick"):
		isStrapon=true
		setState("vag_on_table")
		var strapon = _args[0]
		GM.pc.getInventory().removeItem(strapon)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		var theFluids = strapon.getFluids()
		if(theFluids != null):
			if(theFluids.hasFluidType("Cum")):
				hasCumInStrapon = true
		return

	if(_action == "vag_sex_sex"):
		processTime(3*60)

	if(_action == "vag_sex_faster"):
		processTime(3*60)

	if(_action == "vag_sex_cum"):
		processTime(10*60)
		getCharacter("eliza").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("pc")

	if(_action == "vag_sex_pullout"):
		processTime(10*60)
		getCharacter("eliza").cummedOnBy("pc")
		GM.pc.orgasmFrom("pc")

	if(_action == "vag_sex_cum_strapon"):
		processTime(10*60)
		getCharacter("eliza").cummedInVaginaBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("pc")
		setState("vag_sex_cum")
		return

	if(_action == "vag_sex_enoughfun"):
		processTime(3*60)

	if(_action == "endthescene_unequipstrapon"):
		GM.pc.unequipStrapon()
		endScene()
		return

	if(_action == "s1_admit"):
		setFlag("ElizaModule.scarletProgress", Util.maxi(1, getFlag("ElizaModule.scarletProgress", 0)))

	if(_action == "s1_follow"):
		processTime(5*60)

	if(_action == "s1_reveal"):
		processTime(3*60)

	if(_action == "s1_cuddle"):
		processTime(3*60)

	if(_action == "s1_run"):
		processTime(3*60)

	if(_action == "s2_scarlet_elevator"):
		processTime(3*60)
		getCharacter("elizaMom").induceLactation()
		getCharacter("elizaMom").fillBreasts()
		getCharacter("elizaMom").fillBreasts()

	if(_action == "s2_in_milking_room"):
		processTime(3*60)

	if(_action == "s2_scarlet_naked"):
		processTime(3*60)

	if(_action == "s2_prepare_scarlet"):
		processTime(3*60)

	if(_action == "s2_pc_milks_scarlet"):
		processTime(3*60)
		GM.main.SCI.doMilkCharacterCustom(getCharacter("elizaMom"), BodypartSlot.Breasts, 0.3)
		GM.pc.addSkillExperience(Skill.Milking, 20)

	if(_action == "s2_eliza_takes_spot"):
		processTime(3*60)

	if(_action == "s2_eliza_starts_milking_scarlet"):
		processTime(5*60)
		getCharacter("elizaMom").fillBreasts()
		GM.main.SCI.doMilkCharacterCustom(getCharacter("elizaMom"), BodypartSlot.Breasts, 0.2)

	if(_action == "s2_eliza_starts_milking_scarlet_fast"):
		processTime(5*60)
		getCharacter("elizaMom").fillBreasts()
		GM.main.SCI.doMilkCharacterCustom(getCharacter("elizaMom"), BodypartSlot.Breasts, 0.4)

	if(_action == "s2_eliza_starts_milking_scarlet_cum"):
		processTime(5*60)
		getCharacter("elizaMom").fillBreasts()
		GM.main.SCI.doMilkCharacterCustom(getCharacter("elizaMom"), BodypartSlot.Breasts)

	if(_action == "s2_after_eliza_milks_scarlet"):
		processTime(3*60)

	if(_action == "s2_cuddle"):
		processTime(3*60)

	if(_action == "s2_breastfeeding"):
		processTime(3*60)
		getCharacter("elizaMom").fillBreasts(0.2)

	if(_action == "s2_breastfeed_feed"):
		processTime(3*60)

	if(_action == "s3_near_quarters"):
		processTime(10*60)

	if(_action == "s3_spitroast"):
		isAnal = true
		if(GM.pc.hasReachableVagina()):
			isAnal = false
		hasPP = GM.pc.hasPenis()
		var strapon = GlobalRegistry.createItem("StraponCanine")
		strapon.clothesColor = Color("E096C7")
		var fluids = strapon.getFluids()
		fluids.addFluid("CumLube", 526.0)
		getCharacter("eliza").getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		var strapon2 = GlobalRegistry.createItem("StraponCanine")
		strapon2.clothesColor = Color.darkred
		var fluids2 = strapon2.getFluids()
		fluids2.addFluid("CumLube", 571.0)
		getCharacter("elizaMom").getInventory().forceEquipStoreOtherUnlessRestraint(strapon2)

	if(_action == "s3_rng_tease"):
		processTime(3*60)
		if(!GM.pc.hasReachablePenis()):
			isStrapon = true
			var strapon = GlobalRegistry.createItem("StraponCanine")
			var fluids = strapon.getFluids()
			fluids.addFluid("CumLube", 534.0)
			GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)

	if(_action == "s3_rng_sex"):
		processTime(5*60)

	if(_action == "s3_rng_hold_hands"):
		processTime(3*60)

	if(_action == "s3_rng_fast"):
		processTime(3*60)

	if(_action == "s3_rng_cum"):
		processTime(3*60)
		if(!isStrapon):
			getCharacter("elizaMom").cummedInVaginaBy("pc")
		else:
			getCharacter("elizaMom").cummedInVaginaBy("pc", FluidSource.Strapon)
		GM.pc.cummedOnBy("eliza")
		GM.pc.orgasmFrom("elizaMom")

	if(_action == "s3_rng_after"):
		processTime(3*60)

	if(_action == "s3_rng_slipout"):
		processTime(3*60)
		GM.pc.removeStrapon()

	if(_action == "s3_leave"):
		processTime(10*60)

	if(_action == "s3_spitroast_tease"):
		processTime(5*60)

	if(_action == "s3_spit_sex"):
		processTime(5*60)

	if(_action == "s3_spit_fast"):
		processTime(5*60)
		GM.pc.gotThroatFuckedBy("eliza")
		GM.pc.gotAnusFuckedBy("elizaMom")

	if(_action == "s3_spit_cum"):
		processTime(5*60)
		if(GM.pc.hasPenis()):
			GM.pc.cummedOnBy("pc")
		GM.pc.gotThroatFuckedBy("eliza")
		GM.pc.orgasmFrom("elizaMom")
		GM.pc.cummedInMouthBy("eliza", FluidSource.Strapon)
		if(isAnal):
			GM.pc.gotAnusFuckedBy("elizaMom")
			GM.pc.cummedInAnusBy("elizaMom", FluidSource.Strapon)
		else:
			GM.pc.gotVaginaFuckedBy("elizaMom")
			GM.pc.cummedInVaginaBy("elizaMom", FluidSource.Strapon)

	if(_action == "s3_spit_after"):
		processTime(5*60)

	if(_action == "s3_spitroast_bed"):
		processTime(10*60)
		getCharacter("eliza").resetEquipment()
		getCharacter("elizaMom").resetEquipment()

	if(_action == "s3_spitroast_nap"):
		processTime(15*60)

	if(_action == "s3_spit_back_to_cellblock"):
		processTime(5*60)

	if(_action == "s3_dom_kneel"):
		processTime(3*60)

	if(_action == "s3_tower_assemble"):
		processTime(5*60)

	if(_action == "s3_tower_scarlet"):
		processTime(5*60)

	if(_action == "s3_tower_scarlet_faster"):
		processTime(5*60)

	if(_action == "s3_tower_eliza_fast"):
		processTime(5*60)

	if(_action == "s3_dom_cum"):
		processTime(5*60)
		getCharacter("eliza").cummedInVaginaBy("pc", FluidSource.Penis, 0.45)
		getCharacter("elizaMom").cummedInVaginaBy("pc", FluidSource.Penis)
		GM.pc.orgasmFrom("eliza")

	if(_action == "s3_tower_after_cum"):
		processTime(3*60)

	if(_action == "s3_tower_after_cum_69_do"):
		processTime(5*60)

	if(_action == "s3_tower_after_cum_69_leave"):
		processTime(5*60)

	if(_action == "futa_table"):
		processTime(3*60)

	if(_action == "futa_sex_sex"):
		processTime(3*60)

	if(_action == "futa_sex_fast"):
		processTime(3*60)

	if(_action == "futa_sex_cum"):
		processTime(5*60)
		if(isAnal):
			GM.pc.gotAnusFuckedBy("eliza")
			GM.pc.cummedInAnusBy("eliza")
		else:
			GM.pc.gotVaginaFuckedBy("eliza")
			GM.pc.cummedInVaginaBy("eliza")
		GM.pc.orgasmFrom("eliza")

	if(_action == "futa_cuddle"):
		processTime(5*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isStrapon"] = isStrapon
	data["hasCumInStrapon"] = hasCumInStrapon
	data["straponHasCum"] = straponHasCum
	data["sexDidPullout"] = sexDidPullout
	data["isAnal"] = isAnal
	data["hasPP"] = hasPP
	data["isKnot"] = isKnot
	data["isBarbs"] = isBarbs
	data["isHorse"] = isHorse
	data["isHuman"] = isHuman

	return data

func loadData(data):
	.loadData(data)

	isStrapon = SAVE.loadVar(data, "isStrapon", false)
	hasCumInStrapon = SAVE.loadVar(data, "hasCumInStrapon", false)
	straponHasCum = SAVE.loadVar(data, "straponHasCum", false)
	sexDidPullout = SAVE.loadVar(data, "sexDidPullout", false)
	isAnal = SAVE.loadVar(data, "isAnal", false)
	hasPP = SAVE.loadVar(data, "hasPP", false)
	isKnot = SAVE.loadVar(data, "isKnot", false)
	isBarbs = SAVE.loadVar(data, "isBarbs", false)
	isHorse = SAVE.loadVar(data, "isHorse", false)
	isHuman = SAVE.loadVar(data, "isHuman", false)
