extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var hasPortalPantiesAlready = false

func _init():
	sceneID = "articaEventPortalPanties2Scene"

func _run():
	if(state == ""):
		addCharacter("artica")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		aimCameraAndSetLocName("hall_mainentrance")
		saynn("Artica seems to be heading towards the elevator.")

		saynn("Your guess is, she is heading towards the workshop again..")

		addButton("Follow", "See where she goes", "in_workshop")
	if(state == "in_workshop"):
		GM.pc.setLocation("eng_workshop")
		aimCameraAndSetLocName("eng_workshop")
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="alexrynard"})
		saynn("And you weren't wrong, Artica is standing near that engineer foxy.")

		saynn("[say=alexrynard]Look, I'm busy. I don't want to sound mean but.. I'm not eager for sex like most people seem to be here.[/say]")

		saynn("The foxy struggles to find the right words, speaking strictly but slowly. The fluff lowers her gaze.")

		saynn("[say=artica].. ..[/say]")

		saynn("[say=alexrynard]I'm glad that you like being a test subject. I'm sure someone in the medical wing would appreciate that. Mhm?[/say]")

		saynn("Engineer sighs and tries to return to his current task, his hand holding a screwdriver. He tries to unscrew something.. but his hands begin to shake when Artica starts leaving..")

		saynn("[say=alexrynard]Wait![/say]")

		saynn("The fluff instantly returns to the foxy, her eyes full of hope. All the while the engineer sighs again.")

		saynn("[say=alexrynard]I got something else you can test. But this is the last time.[/say]")

		saynn("Foxy reaches under the workbench.. and pulls another case out. He opens it.. revealing.. panties? Purple panties. Artica tilts her head watching a normal-looking piece of clothing.")

		saynn("[say=artica]..?[/say]")

		saynn("[say=alexrynard]Nu huh, look.[/say]")

		saynn("He turns the panties inside-out.. revealing some kind of devices that are attached to the cloth. Together with that, he also shows Artica some kind of.. tube.")

		saynn("[say=alexrynard]You will figure it out, I'm sure. Now leave me alone, I gotta focus.[/say]")

		saynn("Artica grabs the two prototypes.. The panties she begins to put on already..")

		saynn("[say=alexrynard]No, not here. Go a.. somewhere else.[/say]")

		saynn("She nods.. and just heads off, swaying her hips with extra excitement.")

		saynn("[say=artica]..[/say]")

		saynn("[say=alexrynard]You're welcome.[/say]")

		addButton("Follow", "See where Artica is going now..", "in_cell")
	if(state == "in_cell"):
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		GM.pc.setLocation("cellblock_lilac_nearcell")
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.SexPortalOral, "tease", {pc="artica", onlyRight=true, bodyState={naked=true, hard=true}})
		removeCharacter("alexrynard")
		saynn("Artica rushes into her cell"+str(", quickly throws her clothes on the bed" if !isNaked else "")+" and puts on the unassuming purple panties.")

		saynn("[say=artica]..just panties?.. At least they fit snuggly..[/say]")

		saynn("Nothing interesting happened from just putting them on.. and there doesn't seem to be any buttons or controls on them.. so she switches her focus to the other device.")

		saynn("[say=artica]..hm..[/say]")

		saynn("That one is way more interesting, featuring an array of buttons and a little screen. She takes a deep breath and presses one of them.")

		saynn("There is an electronic noise.. followed by the device lighting up.. almost like it's a flashlight.")

		saynn("[say=artica]Eek..[/say]")

		saynn("But it was actually something else. Artica's eyes widen in amazement as the device opens some kind of portal.. and inside of that portal.. she sees the unmistakable cyan folds of her own pussy..")

		saynn("[say=artica]Oh.. wait.. what.. h-how..[/say]")

		saynn("Her heart races as she brings the device.. which looks more like a fleshlight now.. closer.. Feeling the warmth of her own breath is making the pussy displayed on that fleshlight clench and get all wet. Artica instantly tries to look inside her panties.. but all she can do is free her cock, the panties are keeping themselves secure around her slit.. so there is no denying it anymore..")

		saynn("[say=artica]Is that.. how my pussy looks.. wow..[/say]")

		saynn("She drags her tongue over the folds.. and moans, feeling her pussy being licked.. Her eyes are sparkling with excitement..")

		addButton("Continue", "See what happens next", "artica_sits")
	if(state == "artica_sits"):
		playAnimation(StageScene.FleshlightSit, "tease", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("Unable to resist any longer, she sits on the edge of her bed, positioning the fleshlight at the tip of her throbbing, knotted canine cock. She gently traces her own petals with it, precum mixing with her pussy juices.. before she suddenly stops and pulls the fleshlight away.")

		saynn("[say=artica]..am I.. r-really gonna do this?..[/say]")

		saynn("She is hesitating, her gaze turning desperate.")

		saynn("[say=artica]..am I really g-gonna fuck myself..[/say]")

		saynn("Artica sighs, her body fidgeting around, toes curling. She brings the fleshlight a little closer to her face.. and spreads the folds with her other paw.. looking deep inside.. seeing the whole slick love tunnel with a tight-looking cervix at the end.. Artica sees how her pussy clenches in great detail.. her own aroused scent hitting her nosetrills.. intoxicating scent..")

		saynn("[say=artica]..just a little bit maybe.. mmm.. I will just pull out before cumming.. y-yes..[/say]")

		saynn("She presses the fleshlight against the tip of her cock.. and lets it penetrate her folds and spread them aside.. her own member slipping into the welcoming wet slit..")

		addButton("Continue", "See what happens next", "artica_fucks_herself")
	if(state == "artica_fucks_herself"):
		playAnimation(StageScene.FleshlightSit, "sex", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("The instantly pleasure was intense, her body responding to both the penetration and the internal sensation, a soft moan leaving her lips..")

		saynn("[say=artica]Ah..[/say]")

		saynn("Artica starts with slow, deliberate thrusts, each movement of that fleshlight sending shivers through her.")

		saynn("[say=artica]I can feel.. e-every inch.. of my own cock.. inside me.. ah..ah..[/say]")

		saynn("Her breaths become faster, mingled with all the cute moans that she produces while fucking herself, lost in the sea of pleasure..")

		addButton("Continue", "See what happens next", "artica_fucks_herself_faster")
	if(state == "artica_fucks_herself_faster"):
		playAnimation(StageScene.FleshlightSit, "fast", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("With each thrust, she increases the pace without even realizing it, the fleshlight becoming slick with her juices. The dual stimulation of fucking and being fucked drives her wild, her moans growing louder.")

		saynn("[say=artica]Y-yes.. ah.. hah..[/say]")

		saynn("She feels the knot at the base of her cock inflating with blood.. and slapping against the sensetive folds, unable to fit inside anymore.")

		saynn("[say=artica]I should stop.. r-right now.. ah.. just a few more.. mhmm-m.. and that's all..[/say]")

		saynn("She is close, her body squirming on her bed, shivers rushing through her..")

		saynn("[say=artica]I gotta s-stop..[/say]")

		addButton("Continue", "See what happens next", "artica_doesnt_stop")
	if(state == "artica_doesnt_stop"):
		playAnimation(StageScene.FleshlightSit, "cum", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("The tightness of her own pussy was too much to endure, Artica lets out a noise of passion as she forces the full length of her cock inside that fleshlight.. the knot slipping in with a satisfying pop..")

		saynn("[say=artica]Nhh.. I c-can't stop..[/say]")

		saynn("Her body trembles, orgasm crashing over her. More moans leave her lips as her thick creamy cum shoots through her cock, pumping her own pussy full of it.. She could probably feel every spurt, the warmth spreading inside her..")

		saynn("Her sprawled toes reaching out far, her chin high.. her eyes sparkling with lust..")

		saynn("[say=artica]W-why did I do that.. ah..[/say]")

		saynn("You know why..")

		addButton("Continue", "See what happens next", "after_first_orgasm")
	if(state == "after_first_orgasm"):
		playAnimation(StageScene.FleshlightSit, "inside", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("As the orgasm begins to fade, she is left panting, her own length still fully inside her, creating a cute bump on her belly..")

		if (getCharacter("artica").isVisiblyPregnant()):
			saynn("[say=artica]At l-least I'm already pregnant..[/say]")

		else:
			saynn("[say=artica]I'm g-gonna knock myself up like this..[/say]")

		saynn("Artica looks down at herself.. the knot prevents any leakage.. pulling out now would mean unleashing a flow of seed onto her bed..")

		saynn("Even after that orgasm, Artica's eyes are still somehow lusty..")

		saynn("[say=artica]Well.. Since I already came inside m-myself..[/say]")

		saynn("Is she really gonna continue.. what a needy fluff.")

		addButton("Continue", "See what happens next", "artica_more_horny")
	if(state == "artica_more_horny"):
		playAnimation(StageScene.FleshlightSit, "standsex", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("She carefully pulls the fleshlight off her swollen knot.. gasping as it pops out, leaving her pussy gaping slightly and dripping her own cum. Then, without wasting another moment, Artica positions herself better on the bed, her paw lining up the fleshlight with her cock once more..")

		saynn("This time, she thrusts into her pussy rather than stroking her shaft with it, her hips already moving at a steady pace, her tight, slick pussy enveloping her member nicely, all the seed making her love tunnel extra slick..")

		saynn("[say=artica]Ah.. w-why does my pussy f-feel so good..[/say]")

		saynn("Maybe you should help her..")

		addButton("Just watch", "Just watch Artica snowballing her own pussy", "just_watch")
		addButton("Join", "Grab Artica's fleshlight and help her fuck herself..", "join_in")
	if(state == "just_watch"):
		setFlag("ArticaModule.nextReaction", "p2alone")
		playAnimation(StageScene.FleshlightSit, "standfast", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("Naaah, you'd rather just let her have fun. Why would you startle the fluff.. when she is moaning so desperately and slutty..")

		saynn("She increases the pace, her paws gripping the fleshlight tightly as she thrust faster and harder, her half-deflated knot slapping against her stuffed pussy, occasionally slipping in and out..")

		saynn("[say=artica]Ah.. ah.. You're s-such a slut, Artica.. F-fucking your own pussy like t-this.. ah.. so tight..[/say]")

		saynn("The pleasure is making her head spin, her balls tensing up more, her member throbbing inside the fleshlight as she nears her second climax..")

		addButton("Continue", "See what happens next", "artica_cums_inside_herself_again")
	if(state == "artica_cums_inside_herself_again"):
		playAnimation(StageScene.FleshlightSit, "standinside", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("Her knot inflates with blood again.. which makes her eager to do.. it..")

		saynn("With one rough thrust, she manages to knot her pussy again.. her orgasming inner walls clenching around her canine cock.. until she cums hard, dumping a second load deep inside her womb, snowballing her own pussy..")

		saynn("[say=artica]Ah.. ny-yaahhh.. ah..[/say]")

		saynn("She kept thrusting, her body moving on its own, milking every last drop of cum from her balls.. She is panting.. shaking.. her slit keeps getting tight around the knot..")

		addButton("Continue", "See what happens next", "artica_after_double")
	if(state == "artica_after_double"):
		playAnimation(StageScene.FleshlightSit, "inside", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("Finally, exhausted and utterly spent, Artica collapses on the bed, her cock still stuck inside her pussy.")

		saynn("She lays there, panting and basking in the afterglow, her body still tingling.")

		if (getCharacter("artica").isVisiblyPregnant()):
			saynn("[say=artica]I s-shouldn't have done this.. How am I ever gonna jack myself off any other way.. haha..[/say]")

		else:
			saynn("[say=artica]I have definetly knocked myself up.. haha..[/say]")

		saynn("You let the girl recover.. and just leave. Such a kinky fluff she is..")

		addButton("Continue", "See what happens next", "endthescene_removepanties")
	if(state == "join_in"):
		setFlag("ArticaModule.nextReaction", "p2pc")
		playAnimation(StageScene.SexFleshlight, "tease", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Artica was so busy fucking herself.. that she didn't even hear your footsteps approaching her bed..")

		saynn("Without much warning, you grab the fleshlight out of Artica's hands, making her gasp.")

		saynn("[say=artica]AH! EEP![/say]")

		saynn("You pull the fluff into your embrace with your other hand.")

		saynn("[say=pc]Wow.. Look at that.. your pussy is so wet..[/say]")

		saynn("[say=artica]Wh-what.. are you..[/say]")

		saynn("You don't answer, instead bringing the fleshlight close to her twitching cock, brushing the sensetive cyan folds against the pointy canine cock tip.. Artica shivers, her body reacting to the teasing touch.")

		saynn("[say=pc]Such an eager girl..[/say]")

		saynn("She whimpers, her hips instinctively thrusting forward, seeking the warmth and tightness.. but you just pull her pussy away when that happens.")

		saynn("[say=artica]Please..[/say]")

		saynn("Her voice becomes a desperate whisper..")

		saynn("[say=artica]Please.. I n-need it..[/say]")

		saynn("You slowly slide the fleshlight over the head of Artica's cock, teasing her hard by moving the toy up and down, her pussy never taking the full length inside.. Artica moans, her hips bucking more as she tries to force herself deeper into the fleshlight.. but you keep her held firmly..")

		saynn("[say=artica]Please.. anything.. I will do anything.. I n-need to..[/say]")

		saynn("[say=pc]You need what?[/say]")

		saynn("[say=artica]I need to cum.. i-inside my own p-pussy.. I w-wanna breed myself.. p-please..[/say]")

		saynn("Artica begging is making you smile.. How can you say no?")

		addButton("Give it to her", "Slide the fleshlight along her cock..", "pc_slides_felshlight")
	if(state == "pc_slides_felshlight"):
		playAnimation(StageScene.SexFleshlight, "sex", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Your chin lands on her shoulder as you finally slide the fleshlight down over Artica's cock, the half-deflated knot slipping in as well..")

		saynn("[say=artica]Ah..[/say]")

		saynn("Artica moans loudly as the familliar tightness envelops her cock.. a familliar member stretching her fuckhole..")

		saynn("You begin to stroke her cock with the fleshlight at a pace that is making her squirm and rub against you..")

		saynn("[say=pc]You love fucking yourself?[/say]")

		saynn("[say=artica]Y-yes.. ah..[/say]")

		saynn("[say=pc]Do it then, fuck yourself.[/say]")

		addButton("Continue", "See what happens next", "pc_slides_felshlight_fast")
	if(state == "pc_slides_felshlight_fast"):
		playAnimation(StageScene.SexFleshlight, "fast", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Artica obeys, thrusting her hips forward a bit to meet the fleshlight. The sensations of fucking herself is driving her wild, more passionate noises escaping her lips.. as you stroke her cock faster with that handy fleshlight.")

		saynn("[say=artica]Ah.. ah.. ah..[/say]")

		saynn("You can feel her pussy resisting, her inner walls clenching around the pulsing knotted cock, increasing the friction. But you keep pushing through, forcing that pussy to swallow most of the length.. the fat orb getting swollen with blood again and slapping against her folds..")

		saynn("[say=pc]What should I do with that knot?[/say]")

		saynn("[say=artica]I-inside.. please.. ah.. r-ram it in.. k-knot my p-pussy.. please.. ah..[/say]")

		saynn("Such a needy fluff..")

		addButton("Knot", "Shove full length of Artica's cock inside her pussy", "pc_makes_artica_knot_herself_cum")
	if(state == "pc_makes_artica_knot_herself_cum"):
		playAnimation(StageScene.SexFleshlight, "inside", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("As Artica was nearing her orgasm, you suddenly slid the fleshlight further, forcing the knot to part Artica's pussy wide and slip inside with a cute pop noise.")

		saynn("[say=artica]AH!.. Ahh-hh..[/say]")

		saynn("Artica cries out a moan, her pussy gripping the full length of her shaft hard. Being knotted.. by her own cock.. is quickly sending the fluff over the edge.")

		saynn("[say=artica]I'm.. Ah-h..[/say]")

		saynn("Her {artica.penis} is throbbing and shooting thick ropes of cum into the fleshlight.. snowballing her own womb, adding to the seed that was already there. You continue to tug on the fleshlight, trying to milk every last drop of spunk from her balls.")

		saynn("[say=pc]Good girl. Yeah, breed yourself, like that..[/say]")

		saynn("She is leaning into you, her legs are all shaky, her toes keep curling up.")

		addButton("Cuddle", "Pull her into some cuddles", "do_cuddle_after_sex")
	if(state == "do_cuddle_after_sex"):
		playAnimation(StageScene.Cuddling, "squirm", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
		saynn("You pull the exhausted, spent Artica onto the bed and cuddle her.. while her cock is still fully inside that fleshlight, the knot keeping it secured nicely..")

		saynn("[say=artica]Hh-hh.. mmhh..[/say]")

		saynn("You chukle as she is still squirming in your hands.")

		saynn("[say=pc]Enjoying yourself?[/say]")

		saynn("[say=artica]Yes-..s.. ah.. how did you..[/say]")

		saynn("[say=pc]You weren't exactly hiding, were you.[/say]")

		saynn("She lowers her eyes.")

		saynn("[say=artica]M-maybe.. haha..[/say]")

		saynn("You nuzzle her cheek while she chrrrrs quietly.")

		saynn("[say=pc]Such an eager girl.[/say]")

		saynn("You just spend some time like this.. while Artica is being a cockwarmer.. for her own cock..")

		saynn("But eventually it was time to go.")

		addButton("Continue", "See what happens next", "endthescene_removepanties")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_workshop"):
		processTime(3*60)

	if(_action == "in_cell"):
		processTime(3*60)
		if(!getCharacter("artica").getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom)):
			var thePanties = GlobalRegistry.createItem("PortalPanties")
			thePanties.coversPenis = false
			getCharacter("artica").getInventory().forceEquipStoreOtherUnlessRestraint(thePanties)
		else:
			hasPortalPantiesAlready = true

	if(_action == "artica_sits"):
		processTime(3*60)

	if(_action == "artica_fucks_herself"):
		processTime(3*60)

	if(_action == "artica_fucks_herself_faster"):
		processTime(3*60)

	if(_action == "artica_doesnt_stop"):
		processTime(3*60)
		getCharacter("artica").cummedInVaginaBy("artica")
		getModule("ArticaModule").triggerCorruption(0.05)

	if(_action == "after_first_orgasm"):
		processTime(2*60)

	if(_action == "artica_more_horny"):
		processTime(2*60)

	if(_action == "just_watch"):
		processTime(3*60)

	if(_action == "join_in"):
		processTime(3*60)

	if(_action == "artica_cums_inside_herself_again"):
		processTime(3*60)
		getCharacter("artica").cummedInVaginaBy("artica")
		getModule("ArticaModule").triggerCorruption(0.05)

	if(_action == "artica_after_double"):
		processTime(3*60)

	if(_action == "endthescene_removepanties"):
		if(!hasPortalPantiesAlready):
			getCharacter("artica").getInventory().clearSlot(InventorySlot.UnderwearBottom)
		endScene()
		return

	if(_action == "pc_slides_felshlight"):
		processTime(3*60)

	if(_action == "pc_slides_felshlight_fast"):
		processTime(3*60)

	if(_action == "pc_makes_artica_knot_herself_cum"):
		processTime(3*60)
		getCharacter("artica").cummedInVaginaBy("artica")
		getModule("ArticaModule").triggerCorruption(0.05)

	if(_action == "do_cuddle_after_sex"):
		processTime(5*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isNaked"] = isNaked
	data["isCaged"] = isCaged
	data["corruption"] = corruption
	data["isSlut"] = isSlut
	data["isVerySlut"] = isVerySlut
	data["isLusty"] = isLusty
	data["nakedAndShy"] = nakedAndShy
	data["hasPortalPantiesAlready"] = hasPortalPantiesAlready

	return data

func loadData(data):
	.loadData(data)

	isNaked = SAVE.loadVar(data, "isNaked", false)
	isCaged = SAVE.loadVar(data, "isCaged", false)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	isSlut = SAVE.loadVar(data, "isSlut", false)
	isVerySlut = SAVE.loadVar(data, "isVerySlut", false)
	isLusty = SAVE.loadVar(data, "isLusty", false)
	nakedAndShy = SAVE.loadVar(data, "nakedAndShy", false)
	hasPortalPantiesAlready = SAVE.loadVar(data, "hasPortalPantiesAlready", false)
