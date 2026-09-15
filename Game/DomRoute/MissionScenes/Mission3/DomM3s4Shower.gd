extends SceneBase

func _init():
	sceneID = "DomM3s4Shower"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("med_nearshower")
		saynn("Showers area.. it looks like you found it. And it looks like you got lucky, your ears are picking up on the soft sound of running water.")

		saynn("Before the showers themselves.. There is a room with staff lockers. The locks seem to be all rusty from the years of high humidity. It only takes a few hits before you manage to break one, revealing the contents.")

		saynn("There is a top and a labcoat with the badge inside. Perfect. But your eyes also catch glimpses of a skirt.. and a set of sexy black lingerie. Whoever is showering.. she certainly has a big cup size..")

		saynn("You could just take the badge and leave.. or you could take a quick peep at the showers area itself..")

		addButton("Just leave", "Grab the badge and leave!", "just_grab_badge")
		addButton("Take a peek", "See who is showering", "take_peek")
	if(state == "just_grab_badge"):
		GM.pc.setLocation("med_corridor7")
		saynn("You rip the badge off of the labcoat and make your exit before anyone sees you!")

		saynn("At least something is going right.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "take_peek"):
		aimCameraAndSetLocName("medical_shower")
		addCharacter("elizaMom")
		GM.pc.setLocation("med_corridor7")
		playAnimation(StageScene.Showering, "head", {pc="elizaMom", bodyState={naked=true, hard=true}})
		saynn("You step further and peek into the shower stalls. Through the haze.. you make out a figure.")

		saynn("A woman.")

		saynn("She stands under one of the shower heads, facing away, water cascading down her back. Rich yellow fur with some of the tips having a darker pink-ish accent. Her hair is pinned up in a ponytail bun..")

		saynn("You freeze.. watching.")

		saynn("She is tall.. clearly mature.. with wide hips and a heavy chest that sways gently as she works her fingers through her hair. Her tail curls lazily behind her, occasionally giving a glimpse of her pink naughty bits..")

		addButton("Just leave", "Leave while you can!", "leave_after_saw")
		addButton("Join her", "A crazy thought.. but why not", "do_join_her")
	if(state == "leave_after_saw"):
		removeCharacter("elizaMom")
		playAnimation(StageScene.Solo, "stand")
		GM.pc.setLocation("med_corridor7")
		aimCameraAndSetLocName("med_nearshower")
		saynn("Enough peeping! You return back to the lockers.")

		saynn("Then.. you rip the badge off of the labcoat and make your exit before anyone sees you!")

		saynn("At least something is going right.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_join_her"):
		playAnimation(StageScene.ShoweringDuo, "tease", {pc="elizaMom", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Quickly, you drop all your clothes on a bench and quietly step inside the stall.")

		saynn("The steam wraps around you as you approach. You haven't felt water this warm since forever.. What a strange sensation.")

		saynn("The woman hasn't noticed yet. She is humming softly, some tune you don't recognize, her hands have finished working through her hair and are now washing her forms.")

		saynn("You step under the spray behind her. The hot water hits your shoulders. You let it run for a moment.. watching her.")

		addButton("Embrace her", "Put your hands on her and see what happens", "embrace_scarlet")
	if(state == "embrace_scarlet"):
		playAnimation(StageScene.ShoweringDuo, "teasehug", {pc="elizaMom", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You reach out, your hands settling on her hips. The woman stiffens.. a gasp escaping her.")

		saynn("[say=elizaMom]Ohh-..[/say]")

		saynn("You don't say anything. Instead, you let your fingers slide up her sides, over the curve of her waist. You press yourself against her back, letting her feel your warmth.. and preventing her from turning around.")

		saynn("[say=elizaMom]May I ask.. if I know you?[/say]")

		if (getFlag("ElizaModule.s4hap")):
			saynn("It's Eliza's mom.. you saw her before. But it's best to pretend you don't know anyway.")

		else:
			saynn("She has a very familiar scent to her. But no.. this is the first time you see her.")

		saynn("[say=pc]Don't think so.[/say]")

		saynn("Your hands keep exploring her short fur, gently cupping her breasts and getting a feel for them. They're heavy.. full.. Another little gasp escapes her as you give her breasts a squeeze, your thumbs brushing over her perky nipples.")

		saynn("[say=elizaMom]A stranger. Just like in some of my dreams..[/say]")

		saynn("Even though you still feel her muscles being tense.. she doesn't pull away. A quiet purr coming from her chest gets overshadowed easily by the sound of running water.")

		saynn("[say=pc]Dreams do come true sometimes.[/say]")

		saynn("You press your face into the soft fur, breathing warmly into her neck. Your hands slide a bit lower and brush over her belly.")

		saynn("[say=elizaMom]Mmmh.. Are you.. gonna be rough with me?..[/say]")

		saynn("You don't have a lot of time.. but you could spare a few minutes.")

		addButton("Gentle shower", "Spend some time together", "just_shower")
		addButton("Finger her", "Make that kitty purr louder", "finger_her")
		addButtonWithChecks("Fuck her", "Breed that slut right here and now", "breed_her", [], [[ButtonChecks.HasReachablePenis]])
	if(state == "finger_her"):
		playAnimation(StageScene.ShoweringDuo, "rub", {pc="elizaMom", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You whisper into her ear while one of your hands returns back to kneading her breasts slowly.")

		saynn("[say=pc]No. As long as you promise to be a good little kitty for me.[/say]")

		saynn("[say=elizaMom]I'm a little old to be considered little.. But I can certainly try.[/say]")

		saynn("Her nipples harden under your touch.. making her let out a soft, breathy moan.")

		saynn("Your second hand.. slides down her stomach.. following the soft curve of her belly, down through the wet fur until your fingers find her pink slit. She shivers, her legs parting just a little.")

		saynn("Your digits slide along her sensitive folds, gently spreading them open.. and catching a line of her juices between them. She is already wet.. and not just from the shower. Her breath catches, a soft gasp echoing off the tiles.")

		saynn("[say=elizaMom]Mmhh..[/say]")

		saynn("You take your time, tracing the length of her slit, feeling the heat. One of your digits finds her clit, circling it gently, barely touching. She shivers, her hips twitching forward, catching more.")

		saynn("[say=elizaMom]What a tease..[/say]")

		saynn("[say=pc]Did you forget who you are?[/say]")

		saynn("[say=elizaMom]Yes, actually.. for a second. But now I'm reminded again..[/say]")

		saynn("Your other hands squeeze her breasts, fingers pinching her nipple.. tugging on it. She moans, her head falling back against your shoulder.")

		saynn("You tug on her nipple again.. harder this time.. and a thin stream of milk drips down your fingers, washing away instantly by the water.")

		saynn("[say=elizaMom]..a.. ah..[/say]")

		saynn("You keep working her clit, slow circles, driving her further into this needy state. Her breathing goes ragged, her claws out and digging into your wrists. She is rocking her hips now, desperate for more.")

		saynn("[say=elizaMom]Mhh.. ah.. Don't make an old woman beg..[/say]")

		saynn("You slide one finger inside her. She is tight.. hot.. clenching around you. You pump it in and out slowly, curling your finger inside her, trying to find the pleasure.")

		saynn("[say=elizaMom]Oh fuck.. right there..[/say]")

		saynn("You add a second finger.. then a third.. stretching her out a little more.. still exploring. Her moans grow a little more sensual, raw. The sound of the water now barely covers them.")

		saynn("Time is limited.. so you stop teasing.")

		saynn("You pull your digits out.. leave only two of them inside.. and start thrusting them in.. hard. She cries out, her whole body jolting from sudden pleasure as your curled fingertips hammer away at her bumpy spot. Her breasts bounce in your grip, milk dripping from her nips..")

		saynn("[say=elizaMom]Ah.. ahh.. ahh-.. I'm.. I'm gonna..[/say]")

		saynn("You keep thrusting.. finger-fucking her at a rapid pace. It only takes mere seconds before her body starts convulsing.")

		saynn("She lets out a passionate cry.. before her inner walls clamp down on your fingers. A gush of fluids sprays from her, splashing against the wall, mixing with the shower water. You keep pumping, making her squirt and again.. until she is limp against you, gasping for breath.")

		saynn("[say=elizaMom]Haa.. haa.. f-fuck.. oh my god.. ah..[/say]")

		saynn("Her legs are trembling like hell, her tail spazzing out, her whole body squirming against your.")

		saynn("You stop and let your digits stay inside her, enjoying her aftershocks.")

		saynn("[say=pc]I'm gonna take something from your locker, hope you don't mind.[/say]")

		saynn("[say=elizaMom]Do.. whatever you want..[/say]")

		saynn("You leave her be, carefully drawing your digits out and letting the water wash them clean.")

		saynn("Before she gets a chance to turn around.. you are already gone.")

		addButton("Continue", "See what happens next", "after_sex_grab_badge")
	if(state == "after_sex_grab_badge"):
		removeCharacter("elizaMom")
		playAnimation(StageScene.Solo, "stand")
		GM.pc.setLocation("med_corridor7")
		aimCameraAndSetLocName("med_nearshower")
		saynn("You return back to the lockers.. use a blanket to quickly dry yourself.. and then put all your things on.")

		saynn("You rip the badge off of her labcoat and make your exit before anyone sees you!")

		saynn("At least something is going right.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "just_shower"):
		playAnimation(StageScene.ShoweringDuo, "shower", {pc="elizaMom", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You let your hands rest on her hips for a moment. You lean in close to her ear, your breath tickling it.")

		saynn("[say=pc]Just relax. Let me take care of you.[/say]")

		saynn("A soft shiver is rushing through her back, her tail brushing against your leg. You notice a certain bottle on a small ledge.")

		saynn("[say=pc]Is that a soap bottle over there?[/say]")

		saynn("[say=elizaMom]Best one in the whole galaxy..[/say]")

		saynn("[say=pc]Smuggling contraband onto the space station, I see how it is. Hand it to me and raise your hands, nice and smooth.[/say]")

		saynn("She reaches for the bottle and gives it to you. Then, slowly, she raises her arms, her fingers returning to her hair.")

		saynn("You pour some of that stuff into your palms.. and then place your hands on her shoulders. She tenses for just a breath.. and then melts as you begin to knead the muscles there.")

		saynn("[say=elizaMom]Mmh.. you have good hands.[/say]")

		saynn("Your digits are sliding down her back, spreading the soap over the pastel fur. You trace the curve of her spine, her waist.. her hips. You try to not miss an inch.")

		saynn("Her hands are busy washing her hair.. while your slide around to her front, gliding over her stomach, up her ribcage. You pour a little more soap and cup her breasts, much more gently this time. Your palms circle her heavy mounds, thumbs brushing over her hard nipples.")

		saynn("[say=elizaMom]Ah..[/say]")

		saynn("You squeeze softly, working the soap into her fur, making the woman shiver again.. a good sign that you should switch your focus. One hand stays on her breast while another slides down her stomach, through the wet fur and cupping her crotch, palm pressing against her slit, feeling the warmth there. The feline lets out another shaky breath.")

		saynn("When all that's clean, you move lower, your digits sliding over her thighs, down her legs. You kneel behind her, working the soap into her ankles.. and rear paws. She puts one hand against the wall, steadying herself as you wash her every toe.. and all the paw pads.")

		saynn("[say=elizaMom]You're.. very thorough..[/say]")

		saynn("Time is running out.. but only her butt is left. You pour more soap and cup the firm cheeks, kneading them slowly, feeling the muscles beneath the soft fur. She arches her back just slightly, pressing into your touch. Little scritches around the base of her tail make her shiver erratically.. in a cute way. The fluffy tail itself gets some love too, you give it a few long strokes along its length while it tries to curl around your wrists constantly.")

		saynn("After you're fully done, you embrace her again.")

		saynn("[say=elizaMom]That felt so nice.. You know.. I could turn around and return the favor..[/say]")

		saynn("Best if she doesn't know who you are.")

		saynn("[say=pc]Maybe some other time. Right now I need to take something from your locker.[/say]")

		saynn("Her ears perk.")

		saynn("[say=elizaMom]That's a big ask.. Do you promise to return it?[/say]")

		saynn("[say=pc]I think it will be given back to you.[/say]")

		saynn("[say=elizaMom]It's not my panties, is it~?[/say]")

		saynn("When she says that, you're already gone from her stall.")

		addButton("Continue", "See what happens next", "after_sex_grab_badge")
	if(state == "breed_her"):
		playAnimation(StageScene.SearchSex, "sex", {pc="elizaMom", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Something tells you that she likes it rough. And so rough she shall receive, the feeling is mutual.")

		saynn("Your hands slide down to her hips and pull her back against you.. hard. She gasps, her tail trapped between the two bodies.")

		saynn("[say=elizaMom]Oh-![/say]")

		saynn("You spread her ass with both hands, possessively, exposing her pink slit to the spray. You take a moment to look at her, water running down her folds. You slide two fingers down her sex, spreading her open and fingering her with a few quick thrusts, making sure that she is ready.")

		saynn("She is.")

		saynn("You don't waste another second, quickly lining yourself up and ramming your {pc.penis} inside her.")

		saynn("[say=elizaMom]AH![/say]")

		saynn("Her cry echoes off the tiles, her paws land onto the wall, trying to grab onto something. You don't give her time to adjust, pulling back and throwing your hips forward again, hard, burying yourself to the hilt.")

		saynn("[say=elizaMom]F-fuck-.. oh god..[/say]")

		saynn("Your hips slap against her ass as you establish a rhythm. Water cascades down both of you still while your hands are gripping her waist, her tits swaying with every thrust.")

		saynn("[say=elizaMom]Ah.. ahh.. ah-..[/say]")

		addButton("Faster", "Increase the pace", "breed_fast")
	if(state == "breed_fast"):
		playAnimation(StageScene.SearchSex, "fast", {pc="elizaMom", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You increase the pace, every thrust is spreading her slit wide, your cock hammering deep, smashing against the entrance of her womb. She is tight, hot, clenching around you each time you ram inside.")

		saynn("[say=elizaMom]I'm.. I'm gonna..[/say]")

		saynn("She cums first, her whole body shuddering, legs shaking, her pussy clamping down even harder around your shaft. She cries out, her claws scraping lines into the tiles.")

		var pcHasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		saynn("You don't stop. You keep fucking her through her orgasm, pounding into her oversensitive walls. The orgasm makes her legs weaker so you slap her ass to help the bloodflow."+str(" Your cock is also receiving extra blood actually.. your knot has been inflating more and more.." if pcHasKnot else "")+"")

		saynn("[say=elizaMom]Ah.. f-fuck..[/say]")

		addButton("Cum inside", "Breed the bitch", "just_breed_cum")
		addButton("Pull out", "You changed your mind!", "just_breed_pullout")
	if(state == "just_breed_cum"):
		playAnimation(StageScene.SearchSex, "inside", {pc="elizaMom", npc="pc", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		var pcHasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		if (pcHasKnot):
			saynn("You pull her back one last time and shove your cock deep. The knot slams against the woman's pussy entrance, stretching them wide.")

			saynn("[say=elizaMom]W-wait.. what are you-.. AH![/say]")

			saynn("She doesn't get to finish. With a wet pop, the knot slides inside her, making her pussy look impossibly stretched a second.. before you two get locked together. She cries out again, her back arching, claws scratching at the tiles. Her inner walls clamp down on the knot.. as the orgasm washes over you.")

			saynn("Hot seed pumps into her womb, rope after rope, hot and thick, flooding her insides. She gasps again, letting her body milk your balls dry.")

			saynn("[say=elizaMom]Too b-big.. f-fuck.. I feel it.. inside me..[/say]")

			saynn("Her belly has received a nice bump from all of this. Her legs are shaking, body trembling around you. You stay there, waiting a few long seconds..")

			saynn("And then.. with a sharp yank.. you pull the knot free. A gush of your {pc.cum} follows, spilling from her gaping pussy, dripping down her thighs. She slumps against the wall, her legs giving out, water still landing on her.")

		else:
			saynn("You pull her back one last time and shove your cock balls deep, burying yourself to the base. Your hips lock against her ass.. as the orgasm washes over you.")

			saynn("Hot seed pumps into her womb, rope after rope. She gasps, her body twitching, inner walls milking your balls dry. You stay there for a moment, letting every last drop fill her.")

			saynn("[say=elizaMom]S-so much.. f-fuck.. I feel it.. inside me..[/say]")

			saynn("Then you pull out. A gush of {pc.cum} follows.. spilling from her used pussy, dripping down her thighs. She slumps against the wall, her legs giving out, water still landing on her.")

		saynn("Her breathing comes in short, erratic gasps.")

		saynn("There is no time aftercare.. so you let the water clean your cock.. before you step out.")

		addButton("Continue", "See what happens next", "after_sex_grab_badge")
	if(state == "just_breed_pullout"):
		playAnimation(StageScene.SearchSex, "tease", {pc="elizaMom", npc="pc", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("At the last possible second, you decide to change your mind and pull out. Your throbbing cock flips out with a wet sound.. followed by hot ropes of thick seed landing across the woman's ass, one after another, marking her fur.. until the water starts washing it off.")

		saynn("She is left panting heavily, her body twitching, pussy still twitching from the aftershocks.")

		saynn("[say=elizaMom]Ahh.. hah..[/say]")

		saynn("She slumps against the wall, her legs finally giving out.")

		saynn("There is no time aftercare.. so you let the water clean your cock.. before you step out.")

		addButton("Continue", "See what happens next", "after_sex_grab_badge")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "just_grab_badge"):
		addMessage("Task updated!")

	if(_action == "leave_after_saw"):
		addMessage("Task updated!")

	if(_action == "embrace_scarlet"):
		GM.pc.afterTakingAShower()

	if(_action == "just_shower"):
		processTime(5*60)

	if(_action == "finger_her"):
		processTime(5*60)

	if(_action == "breed_her"):
		processTime(5*60)

	if(_action == "after_sex_grab_badge"):
		addMessage("Task updated!")

	if(_action == "just_breed_cum"):
		processTime(3*60)
		getCharacter("elizaMom").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("elizaMom")

	if(_action == "just_breed_pullout"):
		processTime(3*60)
		getCharacter("elizaMom").cummedOnBy("pc", FluidSource.Penis)
		GM.pc.orgasmFrom("elizaMom")

	setState(_action)
