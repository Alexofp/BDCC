extends SceneBase

var kickedMask = false

func _init():
	sceneID = "GivingElizaPlantForAvyFightScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="sit"})
		saynn("There are nurses around so you try to be sneaky about it.")

		saynn("[say=pc]Hey, I've got what you wanted, doctor Quinn.[/say]")

		saynn("The feline leans over the counter and sees the pink glow in your hands. Her eyes widened with excitement.")

		saynn("[say=eliza]Just call me Eliza. Let's go, patient~. Risha will arrive soon so let's do this quickly.[/say]")

		saynn("Eliza stands up and gets hidden by one of the walls as she walks off somewhere before appearing out of one of the staff-only doors.")

		addButton("Follow", "See where she brings you", "follow_to_lab")
	if(state == "follow_to_lab"):
		aimCameraAndSetLocName("med_researchlab")
		playAnimation(StageScene.Duo, "sit", {npc="eliza", npcAction="stand"})
		GM.pc.setLocation("med_nearlab")
		saynn("You follow the feline as she walks you through some sterile corridor.")

		saynn("[say=eliza]I wrote a whole paper about that plant.. Luckily there isn't a lack of test subjects in this prison~. Sometimes unwilling. But they come around.[/say]")

		saynn("She is so.. cheeky.")

		saynn("You two enter the research lab. It's a spacious white room with a special computerized table in the middle and all sorts of machinery, placed around the walls. The feline points you to sit at the edge of the table and so you do that.")

		saynn("[say=eliza]Don't touch anything. Or I will know~.[/say]")

		saynn("Eliza starts preparing her chemistry station, a little table with a bunch of beakers, heaters and vials.")

		saynn("[say=eliza]The plant is quite toxic if you just eat it.. But with the right combination of chemicals I can create the most potent aphrodisiac out of it. One that will poison the brain in all the right ways..[/say]")

		saynn("Eliza puts on her latex gloves and walks up to you before you hand her the glowing pink plant. She carefully takes it and puts it into a little machine that produces a glowing extract out of it, pink juice.")

		saynn("The feline mixes it with some other chemicals and puts the beaker on a little heater. But then she starts to look concerned.")

		saynn("[say=eliza]Huh. Where did I put my.. breather mask.. It will create fumes while heating up, I shouldn't breathe them..[/say]")

		saynn("You look around and notice that the mask is on the floor near her table but just out of sight for her.")

		saynn("What should you do?")

		addButton("Help her", "Help Eliza find the mask", "help_find_mask")
		addButton("Hide mask", "Kick the mask under the table", "hide_mask")
	if(state == "help_find_mask"):
		saynn("You point at the mask on the floor.")

		saynn("[say=pc]It's there, under the table.[/say]")

		saynn("Eliza finally finds it and puts it on before turning on the heater.")

		saynn("[say=eliza]Oh yeah, thanks. You won't be affected as we have a good ventilation system here. But me standing right above it.. yeah.[/say]")

		saynn("The feline carefully mixes everything together and adds more water and some kind of other chemical that gives the whole solution a blue color.")

		saynn("[say=eliza]Gotta make it look like that muscle stimulant.[/say]")

		saynn("Now it's just a waiting game..")

		saynn("[say=eliza]I hope it will work, to be honest I never tested.. this particular amount of plant extract.[/say]")

		saynn("She looks at you.")

		saynn("[say=eliza]But we gotta be sure, right~?[/say]")

		saynn("[say=pc]What if Risha decides to use it too?[/say]")

		saynn("Eliza sighs, her little smile disappearing.")

		saynn("[say=eliza]What about it? She will.. get horny too then. I don't care..[/say]")

		saynn("The feline turns away and just controls the preparation while talking to herself quietly so you only hear a few words.")

		saynn("[say=eliza]..Risha.. a bitch.. ..she.. it..[/say]")

		saynn("Huh.")

		addButton("Continue", "See what happens next", "no_lewds_ready")
	if(state == "no_lewds_ready"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand"})
		GM.pc.setLocation("med_nearlab")
		saynn("The drug is finally ready so Eliza carefully turns off the heater and fills a few syringes with the result before marking them as muscle stimulants.")

		saynn("[say=eliza]Great~. I will give these to Risha. Give it some time and pay your inmate a visit. Make sure you have fun, okay?[/say]")

		saynn("You nod and prepare to leave.")

		addButton("Continue", "Time to go", "endthescene")
	if(state == "hide_mask"):
		saynn("[say=pc]Mask? I think I saw it behind the..[/say]")

		saynn("You get and slowly approach the table, your leg sneakily kicks the mask under it.")

		saynn("[say=pc]Oh, never mind, that's not a mask.[/say]")

		saynn("Eliza tilts her head slightly at you but then turns towards her station again.")

		saynn("[say=eliza]Fine, whatever, I can do it without one. Just gotta be careful and also do this.[/say]")

		saynn("The feline turns on the heater and then puts a lid on the beaker, meaning all the fumes are trapped under it.")

		saynn("The feline grabs a little straw and carefully mixes everything together under the lid and also adds more water and some kind of other chemical that gives the whole solution a blue color.")

		saynn("[say=eliza]Gotta make it look like that muscle stimulant.[/say]")

		saynn("Huh. You are kinda curious to see what will happen if she breathes in those fumes.. Now would be a good time to do something.. Or not..")

		addButton("Stay still", "You'd rather not mess with Eliza", "no_lewds_ready")
		addButton("Distract her", "(Sex) Distract the feline and remove the lid off the beaker to see what happens..", "distract_and_lewd")
	if(state == "distract_and_lewd"):
		saynn("Eliza is looking away, at her chemistry station. And you're sitting on a table.. with a computer attached to it.. Huh..")

		saynn("You decide to reach your hand out and tap a few buttons on the keyboard. The mechanical arms that were hidden under the table suddenly spring to life with a loud mechanical whirl. They just hover in the air, awaiting further command while you quickly return to your sitting spot while pretending that it's not you.")

		saynn("[say=pc]Um.. Eliza?[/say]")

		saynn("Eliza turns around and gasps.")

		saynn("[say=eliza]Did you do that?[/say]")

		saynn("She rushes to the computer and starts trying to figure out how to disable that.")

		saynn("[say=pc]Nope, it did that on its own.[/say]")

		saynn("All the while you sneakily approach her chemistry station and move the lid off the beaker just enough for the fumes to start escaping. You make sure to hold breath and just return back.")

		saynn("[say=eliza]Damn old ass crappy machinery, I always say we need better equipment..[/say]")

		saynn("[say=pc]Well, we're just inmates, who cares about us.[/say]")

		saynn("The feline finally turns off the mechanical arms and points at you while walking past.")

		saynn("[say=eliza]Exactly. You're still people though. You can still bring value to the world. They shouldn't forget about that.[/say]")

		saynn("You shrug and just watch Eliza return to the table.")

		saynn("[say=eliza]Anyway, now we just wait.[/say]")

		saynn("Some time passes. The solution seems to be close to being done.. And Eliza.. is holding onto the collar of her labcoat while also panting ever so slightly.")

		saynn("[say=eliza]Don't you think that it's.. kinda hot in here?[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Dunno, I don't think so.[/say]")

		saynn("Eliza nods but still breathes deeply. At some point it becomes too much for her and she takes off her labcoat, only leaving her long skirt and a blue blouse.")

		saynn("It seems to be working..")

		saynn("As more time passes, Eliza is panting yet again. She undoes the top button of her blouse and turns around, seeing that you are completely alright.")

		saynn("[say=eliza]Something is.. not right..[/say]")

		saynn("[say=pc]I don't understand what you mean, Eliza. Are you feeling alright?[/say]")

		saynn("Eliza's eyes look so.. lusty. She bites her lip and slowly undoes another button, causing her black lacy bra to start peeking out.")

		saynn("[say=eliza]I.. I'm not sure.. I feel.. warmth.. spreading..[/say]")

		addButton("Continue", "See what happens next", "eliza_understands_but_too_late")
	if(state == "eliza_understands_but_too_late"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand", npcBodyState={underwear=true}})
		saynn("It looks like Eliza just can't endure it anymore, she completely takes off her blouse and lets her skirt fall onto the floor, revealing her beautiful black lingerie underneath. But even that doesn't help, she is still panting, her cheeks red..")

		saynn("[say=eliza]Why is it so fucking hot here..[/say]")

		saynn("[say=pc]Want some help.. kitty?[/say]")

		saynn("You decide that now is probably a good time to help her solve that.. feeling. But when you get up, the feline's emotion changes.")

		saynn("[say=eliza]Wait a second.. Huff..[/say]")

		saynn("She turns around and notices the misplaced lid. That makes her.. angry.. to say the least. But the lust doesn't disappear from her eyes. She walks up to you and clings onto you, her claws digging into your skin.")

		saynn("[say=eliza]It was you..[/say]")

		saynn("She huffs warmly into your face, her ears turned out but the tail is wagging. You can feel.. heat.. radiating from her. Seeing you squirm from her claws makes her do it more, dragging her clawed paws over your {pc.masc} curves.")

		saynn("[say=eliza]You hid the mask.. And turned on the table.. And then moved the lid..[/say]")

		saynn("[say=pc]Ow.. ow.. I don't know what you are talking about, Eliza.[/say]")

		saynn("She parts her lips and shows you her fangs before moving her mouth to your neck and threatening to bite.. Her gorgeous body brushing against yours.")

		saynn("[say=eliza]All that.. to get me horny.. Such a great plan..[/say]")

		saynn("Suddenly, she pushes you back onto the table.")

		saynn("[say=eliza]But I saw right through it.[/say]")

		saynn("You can't deny it, catching her aroused scent makes you needy as well. What do you want to happen next?")

		addButtonWithChecks("Cowgirl", "Eliza will ride you", "sex_cowgirl", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Chastity tease", "Eliza will 'ride' you", "sex_chastity_tease", [], [ButtonChecks.IsWearingChastityCage])
		addButtonWithChecks("Tribadism", "Some lesbian fun", "sex_tribadism", [], [ButtonChecks.HasReachableVagina])
		addButton("Watch her", "Just see what Eliza will do on you", "sex_generic")
	if(state == "sex_cowgirl"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="eliza", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("As you fall onto the sturdy 'research' table, Eliza pounces you and straddles your waist, her eyes meeting yours. Her paws get a grasp on your {pc.penis} while she positions herself just above it's head.")

		saynn("[say=eliza]Can't fool me.. Can't hide from me..[/say]")

		saynn("Her paw grabs onto her lace panties and shifts them to the side, exposing her slick pink folds that already spawn a long string of juices to hang from them.")

		saynn("[say=eliza]And now.. It's my turn to play with you..[/say]")

		addButton("Continue", "See what happens next", "cowgirl_go")
	if(state == "cowgirl_go"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="eliza", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("With a sexy sway of her hips, Eliza lowers herself onto your member, gasping softly as she feels your shaft stretching her wide, creating empty volume inside her before filling it. Her paws rest on your chest, providing balance as she begins to move, bouncing up and down, riding you with a slow steady rhythm.")

		saynn("[say=eliza]Oh yes.. That dick is.. khm.. fuck..[/say]")

		saynn("You decide to put your hands on the feline's hips, guiding her movement ever slightly until your bodies start to harmonize. Eliza arches her back, her bouncing breasts pushed forward, her bra proudly displayed to you. You can already feel her inner walls clenching around you..")

		addButton("Faster", "See what happens next", "cowgirl_faster")
	if(state == "cowgirl_faster"):
		playAnimation(StageScene.SexCowgirl, "fast", {npc="eliza", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("As Eliza's tempo quickens, the lab fills with your moans and needy panting. Her juices coat your dick while it slides between her slick and inviting walls, all of that allowing her to take you deeper, the tip of your member pressing against her natural barricade.")

		saynn("[say=eliza]You thought you could control my desires..[/say]")

		saynn("Each time she brings herself down along your dick, you can feel the heat building within her, a burning need that demands release. Her paws are shivering slightly, her walls pulsing around you, the sensations slowly bringing her closer to the edge.. But she keeps riding you harder, panting, desperate to tip over that edge.. and let the climax take over..")

		saynn("[say=eliza]But I'm always one step ahead.. Ah-h~..[/say]")

		addButton("Cum", "She forgot to use a condom.. Sounds like it's her problem", "cowgirl_cum")
	if(state == "cowgirl_cum"):
		playAnimation(StageScene.SexCowgirl, "inside", {npc="eliza", pc="pc", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("As Eliza's body trembles from the release that is about to happen, your hands roam over her, caressing her fluffy thighs, hips, cupping breasts under that bra. Her breath hitches from your touches, her nails dig into your chest. And with a lusty cry, Eliza succumbs to the overwhelming pleasure and brings herself down with full force, letting your dick as deep as her pussy allows.")

		saynn("[say=eliza]Yes-s-s..[/say]")

		saynn("Her body shakes from the many waves of ecstasy, her inner muscles clenching around your dick which is what brings you over the edge too. She throws her head back, a primal sound escaping her lips as your throbbing cock starts filling her womb full of your hot sticky {pc.cum}. Her whole body is pulsing with satisfaction.")

		saynn("[say=eliza]So good-d..[/say]")

		saynn("You spend some time like that, enjoying your orgasms. Eliza slowly catches her breath and looks down at you, still with your full length inside her. You can see a little smile.. She probably doesn't even realize that this was your plan all along..")

		saynn("[say=eliza]In the end.. It is I who holds the power.[/say]")

		addButton("Continue", "See what happens next", "after_cowgirl_sex")
	if(state == "after_cowgirl_sex"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand", npcBodyState={underwear=true}})
		saynn("The solution inside the beaker is boiling loudly, meaning that it's probably ready.")

		saynn("[say=eliza]This scratched an itch I had.. But it's time to get back to work.. At least you've been.. very cooperative.[/say]")

		saynn("Eliza slowly dismounts from you, using her paw to cover her used leaking slit. After that she just pulls her lace panties over it and turns off the heater, before filling a few syringes. Then she puts some stickers on them, marking the syringes as muscle stimulants.")

		saynn("[say=eliza]I will give these to Risha. Give it some time and pay your inmate a visit. Make sure you have fun, okay?[/say]")

		saynn("You nod and prepare to leave.")

		addButton("Continue", "Time to go", "endthescene")
	if(state == "sex_chastity_tease"):
		playAnimation(StageScene.SexCowgirl, "inside", {npc="eliza", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("As you fall onto the sturdy 'research' table, Eliza pounces you and straddles your waist, her eyes meeting yours. Her paws cup the balls of your locked dick while she positions herself just above your chastity cage.")

		saynn("[say=eliza]Can't fool me.. Can't hide from me..[/say]")

		saynn("Her paw grabs onto her lace panties and shifts them to the side, exposing her slick pink folds that already spawn a long string of juices to hang from them.")

		saynn("[say=eliza]And now.. It's my turn to play with you..[/say]")

		saynn("Her playful grin reveals a hint of mischief. She slowly lowers herself, allowing her moist folds to press against the cold metal of your cage. With a sensual sway of her hips, she begins to grind against it, enjoying the friction and teasing stimulation. All the while you.. can't feel anything.. but your cage getting slightly pulled back and forth.. But the thought of such a cute doctor grinding you.. it alone makes you incredibly aroused..")

		saynn("[say=eliza]Oh yes.. This feels so good..[/say]")

		saynn("Eliza leans forward and rests her paws on your chest for support. She watches intently as you begin to squirm under her, your breath hitching from with restrained pleasure. The sight fuels her own excitement, making her bolder in her movement, causing her to grind you harder. Feeling her pussy juices drip onto your dick through the holes in your cage makes you oh so desperate..")

		saynn("Maybe this wasn't such a good idea to trick her.. but it's too late now.. You are at her mercy, surrendered to her pleasure.. You don't get stimulated but seeing and hearing her makes you moan too, your poor member struggling to get hard under the cage.")

		saynn("[say=eliza]You thought you could control my desires..[/say]")

		saynn("Her body starts to shiver, her dripping pussy visibly pulsating with increasing frequency. You can easily feel the orgasm building within her.. and all just from grinding her folds against your cage. Passionate moans escape from her until she finally succumbs to the overwhelming pleasure..")

		saynn("[say=eliza]But I'm always one step ahead.. Ah-h~..[/say]")

		addButton("Continue", "See what happens next", "chastity_cum")
	if(state == "chastity_cum"):
		saynn("Eliza arches her body back as the orgasm reaches its peak, her legs and arms shaking from how intense this sensation is. Her inner walls contract and release as a sudden fountain of girlcum erupts from her depths. The overstimulation is strong enough to make her squirt onto your cage.")

		saynn("[say=eliza]Yes!..[/say]")

		saynn("The sight of Eliza's arousal coating your chastity cage intensifies your desire, your need to cum growing with each passing second, your breathing becoming ragged. But no matter what you do, you can't get that release, all you can do is look at Eliza's flushed face and share the intensity of her climax..")

		saynn("[say=eliza]So good-d..[/say]")

		saynn("You spend some time like that, enjoying your orgasms. Eliza slowly catches her breath and looks down at you.")

		saynn("[say=eliza]In the end.. It is I who holds the power.[/say]")

		saynn("The feline gets off your waist, her clawed fingers lingering on the cool wet metal for a few seconds more. She leans in, leaving a little kiss on your lips.")

		addButton("Continue", "See what happens next", "after_tease")
	if(state == "after_tease"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand", npcBodyState={underwear=true}})
		saynn("The solution inside the beaker is boiling loudly, meaning that it's probably ready.")

		saynn("[say=eliza]This scratched an itch I had.. But it's time to get back to work.. At least you've been.. very cooperative.[/say]")

		saynn("Eliza just pulls her lace panties over her pussy and then turns off the heater, before filling a few syringes. She puts some stickers on them, marking the syringes as muscle stimulants.")

		saynn("[say=eliza]I will give these to Risha. Give it some time and pay your inmate a visit. Make sure you have fun, okay?[/say]")

		saynn("You nod and prepare to leave.")

		addButton("Continue", "Time to go", "endthescene")
	if(state == "sex_tribadism"):
		playAnimation(StageScene.SexTribadism, "tease", {pc="eliza", npc="pc", bodyState={exposedCrotch=true}, npcBodyState={naked=true}})
		saynn("As you fall onto the sturdy 'research' table, Eliza pounces you and straddles your waist, her eyes meeting yours.")

		saynn("[say=eliza]Can't fool me.. Can't hide from me..[/say]")

		saynn("Her paw grabs onto her lace panties and shifts them to the side, exposing her slick pink folds that already spawn a long string of juices to hang from them.")

		saynn("[say=eliza]And now.. It's my turn to play with you..[/say]")

		saynn("With a gentle yet firm touch, Eliza guides you onto your back. Then she positions herself between your legs, aligning bodies in such a way that your pussies are almost kissing, heat radiating between them.")

		addButton("Continue", "See what happens next", "trib_start")
	if(state == "trib_start"):
		playAnimation(StageScene.SexTribadism, "sex", {pc="eliza", npc="pc", bodyState={exposedCrotch=true}, npcBodyState={naked=true}})
		saynn("Eager to begin, Eliza finally presses her crotch against yours, letting your sensitive folds exchange juices. Warm waves of pleasure begin pulsing through you as that doctor starts grinding her pussy against yours, overwhelming your senses.")

		saynn("[say=eliza]Oh yes.. This feels so good..[/say]")

		saynn("Eliza reaches her hand out and grabs yours before intertwining fingers with it. She establishes a passionate rhythm, your combined wetness creates a little puddle of juices underneath you as your bodies collide with raw passion in this little dance of love.")

		saynn("Cute moans escape from the feline, her breath quickens, her grinding becoming more deliberate, making your bodies move in harmony.")

		addButton("Continue", "See what happens next", "trib_cum")
	if(state == "trib_cum"):
		playAnimation(StageScene.SexTribadism, "fast", {pc="eliza", npc="pc", pcCum=true, npcCum=true, bodyState={exposedCrotch=true}, npcBodyState={naked=true}})
		saynn("Feeling lusty and needy, Eliza rubs pussies with you faster, your clits constantly bumping against each other. Each grinding motion sends a surge of ecstasy through both of you, bringing you closer to the edge.")

		saynn("[say=eliza]You thought you could control my desires..[/say]")

		saynn("You can feel Eliza's body trembling, she grasps your hand firmer and moans like a kitty in heat. You can't help but to moan too, your own release drawing near.")

		saynn("[say=eliza]But I'm always one step ahead.. Ah-h~..[/say]")

		saynn("With a loud cry of ecstasy, Eliza's body tenses up, she arches her back, her muscles contracting as waves of pleasure crash over her. Almost in sync, your orgasm happens too, your pussies pulsating tightly against each other before suddenly squirting, your girlcum mixing together and washing over your sexes..")

		saynn("[say=eliza]So good-d..[/say]")

		saynn("You spend some time like that, enjoying your orgasms, your bodies still intertwined. Eliza slowly catches her breath and at you.")

		saynn("[say=eliza]In the end.. It is I who holds the power.[/say]")

		saynn("She finally lets go of your hand and gets up, the powerful orgasm leaving her a little lightheaded.")

		saynn("That felt good..")

		addButton("Continue", "See what happens next", "after_tease")
	if(state == "sex_generic"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="eliza", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("As you fall onto the sturdy 'research' table, Eliza pounces you and straddles your waist, her eyes meeting yours.A glimmer of mischief shines in her eyes as she asserts her control over you.")

		saynn("[say=eliza]Can't fool me.. Can't hide from me..[/say]")

		saynn("Eliza's fingers find their way to her lace panties and shift them to the side before landing on her clit and rubbing it with a deliberate slow rhythm, wet noises of her masturbation filling the lab, igniting the desire within both of you. You try to reach your hand out and 'help' her but she slaps it away, clearly just wanting you to watch.")

		saynn("[say=eliza]And now.. It's my turn to play with you..[/say]")

		saynn("Eliza's hips sway in a little mesmerizing dance of pleasure while she hives above your waist, her eyes locked with yours. Moans begin to escape from her as her pleasure builds, making you feel a little desperate..")

		saynn("[say=eliza]Oh yes.. This feels so good..[/say]")

		saynn("Her digits shift a little lower, finding the sensitive folds that she spreads just for you, letting one of the hanging strings of juices land on your crotch. You can feel.. heat.. radiating from that spread pussy.. And Eliza is eager to satisfy it herself, slipping two of her digits inside her wet sex and proceeding to finger herself.")

		saynn("[say=eliza]You thought you could control my desires..[/say]")

		saynn("It seems she has found her pleasure spot because very soon Eliza starts shivering, her hips tremble, a sign of her imminent release. Her inner walls clench around her probing fingers, her pussy is pulsating until the feline finally cums..")

		saynn("[say=eliza]But I'm always one step ahead.. Ah-h~..[/say]")

		saynn("Eliza arches her back as a huge torrent of ecstasy washes over her, causing her girlcum to hit your crotch. Her body shakes so she has to use your chest for support.")

		saynn("[say=eliza]Yes-s-s..[/say]")

		saynn("As she withdraws her fingers from her quivering sex you get a good look at how her insides are clenching and releasing in a mesmerizing way. She brings her slick digits to her lips, tasting her own juices with a seductive smirk.")

		saynn("[say=eliza]In the end.. It is I who holds the power.[/say]")

		saynn("She finally stops straddling you and slowly gets up, the recent orgasm making her lightheaded.")

		addButton("Continue", "See what happens next", "after_tease")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "follow_to_lab"):
		processTime(2*60)

	if(_action == "help_find_mask"):
		kickedMask = false
		processTime(5*60)

	if(_action == "hide_mask"):
		kickedMask = true
		processTime(5*60)

	if(_action == "no_lewds_ready"):
		processTime(10*60)
		addMessage("Task updated")

	if(_action == "distract_and_lewd"):
		processTime(5*60)

	if(_action == "eliza_understands_but_too_late"):
		processTime(3*60)

	if(_action == "sex_chastity_tease"):
		GM.pc.addLust(50)

	if(_action == "sex_generic"):
		processTime(10*60)
		GM.pc.addLust(20)
		GM.pc.cummedOnBy("eliza", FluidSource.Vagina)

	if(_action == "cowgirl_go"):
		processTime(5*60)

	if(_action == "cowgirl_faster"):
		processTime(3*60)

	if(_action == "cowgirl_cum"):
		processTime(2*60)
		getCharacter("eliza").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("eliza")
		GM.pc.addSkillExperience(Skill.SexSlave, 50)

	if(_action == "after_cowgirl_sex"):
		addMessage("Task updated")

	if(_action == "chastity_cum"):
		processTime(5*60)
		GM.pc.cummedOnBy("eliza", FluidSource.Vagina)
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "after_tease"):
		addMessage("Task updated")

	if(_action == "trib_start"):
		processTime(3*60)
		GM.pc.rubsVaginasWith("eliza")

	if(_action == "trib_cum"):
		processTime(5*60)
		GM.pc.orgasmFrom("eliza")
		GM.pc.addSkillExperience(Skill.SexSlave, 50)

	setState(_action)

func saveData():
	var data = .saveData()

	data["kickedMask"] = kickedMask

	return data

func loadData(data):
	.loadData(data)

	kickedMask = SAVE.loadVar(data, "kickedMask", false)

func getDevCommentary():
	return "This scene.. was supposed to be quite simple. Maybe even just one screen where you give Eliza the plant or whatever ^^\n\nBut I had this idea.. wouldn't it be cool to use this plant against Eliza too somehow? And this is how this scene was born. I dunno, I should have finished this update long time ago but I just can't stop myself when I get a good idea, I just gotta write it.. The idea of Eliza getting incredibly horny but still trying to be as confident as she can sounded hot to me ^^\n\nI wrote all 4 sex scenes in one sitting.. 2k words in like.. 5 hours. But they were fairly simple ^^. Before I used to write half a scene a day instead.. and then I had to manually code it into the game.. But now I'm using a little scene converter tool that lets me turn text into a scene in one click ^^. It even supports adding code to buttons and stuff like writing dev commentary. I'm writing this text in google docs for example ^^"

func hasDevCommentary():
	return true
