extends SceneBase

var isStrapon = false
var hasCumInStrapon = false
var straponHasCum = false
var sexDidPullout = false

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
		addButton("Continue", "Enough fun for now", "vag_sex_pullout")
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

		addButton("Pull out", "Enough fun for now", "vag_sex_pullout")
	if(state == "scarlet_menu"):
		var scarletProgress = getFlag("ElizaModule.scarletProgress", 0)
		saynn("What do you wanna do with Eliza and Scarlet?")

		saynn("Keep in mind that this will include soft incest..")

		addButton("Intro", "Ask Eliza where her mother is currently", "s1_start")
		if (scarletProgress >= 1):
			addButton("Milking", "Let them milk each other", "s123_milking")
		else:
			addDisabledButton("Milking", "You haven't reached this point yet")
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
		processTime(3*60)

	if(_action == "vag_sex_cum_strapon"):
		processTime(10*60)
		getCharacter("eliza").cummedInVaginaBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("pc")
		setState("vag_sex_cum")
		return

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

	setState(_action)

func saveData():
	var data = .saveData()

	data["isStrapon"] = isStrapon
	data["hasCumInStrapon"] = hasCumInStrapon
	data["straponHasCum"] = straponHasCum
	data["sexDidPullout"] = sexDidPullout

	return data

func loadData(data):
	.loadData(data)

	isStrapon = SAVE.loadVar(data, "isStrapon", false)
	hasCumInStrapon = SAVE.loadVar(data, "hasCumInStrapon", false)
	straponHasCum = SAVE.loadVar(data, "straponHasCum", false)
	sexDidPullout = SAVE.loadVar(data, "sexDidPullout", false)
