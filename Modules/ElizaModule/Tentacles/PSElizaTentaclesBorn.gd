extends SceneBase

var creditsPaid = 0
var creditsPaidStr = ""

func _init():
	sceneID = "PSElizaTentaclesBorn"

func _reactInit():
	creditsPaid = getModule("ElizaModule").getTentaclesCost()
	creditsPaidStr = str(creditsPaid)+" credit"+("s" if creditsPaid != 1 else "")

func _run():
	if(state == ""):
		addCharacter("eliza")
		saynn("You hand Eliza a credits chip with "+str(creditsPaidStr)+".")

		saynn("[say=pc]Should be enough?[/say]")

		saynn("The feline's eyes light up as she snatches the chip.")

		saynn("[say=eliza]Yes~.[/say]")

		saynn("She runs from behind the counter.. and practically pulls you behind her.")

		addButton("Continue", "See what happens next", "in_lab")
	if(state == "in_lab"):
		aimCameraAndSetLocName("med_researchlab")
		saynn("Eliza brings you into the research lab where she already has everything set up.")

		saynn("[say=eliza]Time to calculate our perfect DNA.[/say]")

		saynn("She pulls out her datapad and starts furiously typing away on it, her tail wagging behind her with barely contained excitement.")

		saynn("After some time, she presents you her datapad. The screen shows one big 'start' button.")

		saynn("[say=eliza]Do it~.[/say]")

		saynn("Why not, you press the button.. and the screen goes black for a second.. before filling in with scrolling texts, graphs and rotating 3D models of genetic structures.")

		saynn("[say=pc]Thanks for giving me something to do.[/say]")

		saynn("[say=eliza]This way I'm not responsible~.[/say]")

		saynn("[say=pc]What?[/say]")

		saynn("You begin to feel the room.. getting all warm. So warm that Eliza has to lean against one of the tables and start fanning herself with her paw.")

		saynn("Some seconds pass.. about ten maybe. And then her datapad beeps.")

		saynn("[say=eliza]Phew. We probably just evaporated a small ocean's worth of water.[/say]")

		saynn("[say=pc]How? The super-computers are installed here?[/say]")

		saynn("She shakes her head..")

		saynn("[say=eliza]Nope, they're down in engineering.[/say]")

		saynn("There was so much warm air that it managed to reach you..")

		saynn("Hopefully it was worth it.")

		saynn("[say=eliza]Look![/say]")

		saynn("She shows you her datapad that has a glowing model of an.. egg.. rotating slowly.")

		saynn("[say=eliza]Perfection. No oxidation damage. No radiation damage. A combination of all of the perfect traits..[/say]")

		saynn("After that, she approaches one of the machines.. an incubator. She uploads the sequence into it and lets it start doing its job.")

		saynn("The lab gets filled with sounds of whirs and hisses.. it does take some time.")

		saynn("But eventually, a small hatch opens. Inside.. that same egg.. but now realized into existance.")

		saynn("It's small.. much smaller than the one you have seen already.. about the size of a tennis ball. But it still has all of the familiar traits.. like that vibrant green shell.. with a strange cross-shaped crease at the top.")

		saynn("Eliza puts on her latex gloves.. and then reaches in to carefully take it out.")

		saynn("[say=eliza]Hello, beautiful..[/say]")

		saynn("She offers it to you.. but you decide against holding such an alien-looking object.")

		saynn("[say=pc]You're gonna grow it in the testing chamber again?[/say]")

		saynn("[say=eliza]Testing chamber? No~. I have a better spot in mind.[/say]")

		saynn("[say=pc]What would it be?[/say]")

		saynn("Her little cunning smile makes you tense up.")

		saynn("[say=eliza]Your cell! Let's go![/say]")

		saynn("[say=pc]No way.[/say]")

		saynn("[say=eliza]The egg is perfect, there is zero risk! You paid for it so it's only fair~.[/say]")

		saynn("She grabs your hand and pulls towards the exit, the egg hiding in her other paw.")

		addButton("Continue", "See what happens next", "in_cell")
	if(state == "in_cell"):
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		GM.pc.setLocation(GM.pc.getCellLocation())
		saynn("A few passing nurses and guards give you odd looks.. but no one dares to ask what it is that Eliza is carrying.")

		saynn("She brings you back to your cell.")

		saynn("Once inside, she sets the egg gently on the floor and steps back, admitting it for a bit.")

		saynn("[say=eliza]Ready?[/say]")

		saynn("[say=pc]I hope you're right, doctor.[/say]")

		saynn("She offers you a smile.. and then produces a familiar syringe that she uses to inject the egg with.")

		saynn("[say=eliza]What's the worst that could happen?[/say]")

		saynn("You just nod and take a few steps back, standing near the exit.")

		saynn("For a moment, nothing happens. But then the growth begins.")

		addButton("Continue", "See what happens next", "show_egg")
	if(state == "show_egg"):
		playAnimation(StageScene.SoloBigEgg, "stand")
		saynn("It's faster this time. The egg swells to the size of a melon.. then a beach ball.. and then bigger still. The green shell thickens and becomes darker.")

		saynn("Eliza backs away slowly, gently shoving you away from the exit.")

		saynn("When the egg grows about half the size of you.. it suddenly stops and starts shaking instead.")

		saynn("At least it looked like it was shaking at first. The more you look at it, the more you realize that it is still growing.. but downwards.. creating itself a nest of sorts, consisting out of those dead-looking purple tendrils.")

		saynn("[say=eliza]Huh. I thought that those were just a bad mutation.[/say]")

		saynn("[say=pc]I guess they're important.[/say]")

		saynn("You continue to monitor the egg that is now mostly still.")

		saynn("Sudden thump.")

		saynn("Something is moving inside.")

		saynn("Another thump.")

		saynn("Yeah, definitely. Every thump makes the shell deform slightly.")

		saynn("You look at Eliza.. who seems a little more worried than before, her green eyes wide open.")

		saynn("[say=pc]It's gonna be fine. Worst case.. We're unleashing a giant monster upon this prison.[/say]")

		saynn("[say=eliza]That will be a first for me..[/say]")

		saynn("Another thump.. and the shell splits in two..")

		addButton("Continue", "See what happens next", "tentacles_reveal")
	if(state == "tentacles_reveal"):
		playAnimation(StageScene.TentaclesDuo, "glare", {pc="eliza", plant=true, instantSleep=true})
		addCharacter("PCTentacles")
		saynn("Tentacles.. many of them.. appear between the split halves of the egg shell. They uncurl slowly and rise high.")

		saynn("The two of you are staying completely silent.. Eliza pressing against you..")

		saynn("The green tips begin to curiously look around the cell. They sway left.. then right.. One tendril drifts toward the ceiling and pokes it.")

		saynn("This could go either way still..")

		saynn("And then they notice you.. Every single tip freezes. All at once. Many tentacles are staring directly towards you and Eliza.")

		saynn("The feline's claws dig into your arm. Her breathing stops.")

		saynn("The tentacles don't move. They don't strike. They just.. look.")

		saynn("One thick tendril slowly breaks from the rest and slides forward across the floor. It stops only a few inches from your feet. The tip tilts upwards.. like it's studying your face.")

		saynn("[say=eliza]..please don't kill us..[/say]")

		saynn("The tentacle shivers a bit, confused by the sudden sound. But then it does something strange.")

		saynn("It bows to you.")

		saynn("Another tentacle joins it. Then another. Soon, a whole group of them are doing a strange, synchronized bow to you.")

		saynn("Eliza loosens her grip slightly.")

		saynn("[say=eliza]..hi?..[/say]")

		saynn("Her word is met with a nod of a few tentacles.")

		saynn("[say=pc]They seem friendly.[/say]")

		saynn("They start swaying idly, the tips are still looking around, full of curiosity..")

		saynn("Eliza exhales the caught air.")

		saynn("[say=eliza]Phew! I didn't destroy the prison! Mom is gonna be proud of me.[/say]")

		saynn("You can't help but chuckle.")

		saynn("Eliza watches the tentacles with growing fascination. And this catches their attention, a few of the tendrils reach out to brush against her arm.")

		saynn("[say=eliza]Aw, they're so gentle.[/say]")

		saynn("You reach your hand out too and are met with a friendly touch from them, one of the tentacles gently curls around your wrist.")

		saynn("The more you look.. the more you notice something. Some of the green tips are looking quite slick.. almost drippy.")

		saynn("[say=eliza]I think.. I think that they're horny~.[/say]")

		saynn("A tentacle slides between you two and gently nudges Eliza's hip. She squeaks.")

		saynn("[say=eliza]Ah![/say]")

		saynn("It nudges again.. more insistent.. and so Eliza stumbles forward slightly. The tentacles catch her.. and begin to explore, getting under her labcoat and running along the curves of her hips and belly.")

		saynn("[say=eliza]Ahah, that tickles![/say]")

		saynn("A thought appears in your head.")

		saynn("[say=pc]How am I gonna explain it?[/say]")

		saynn("[say=eliza]Explain what?[/say]")

		saynn("Eliza is squirming slightly, giggling and gently rubbing the tentacles that poke her in various places.")

		saynn("[say=pc]Explain this. What if a guard sees it?[/say]")

		saynn("The feline pulls out a datapad and starts typing away on it.. while the drippy tentacles keep brushing against her.. some of them are curling around her legs and arms now.. but she always manages to pull her limbs free.")

		saynn("[say=eliza]I did some magic and now you have a permit for a single green plant in your cell~.[/say]")

		saynn("Plant..")

		saynn("[say=pc]I doubt that anyone will see it as a plant.[/say]")

		saynn("Eliza chuckles and directs her attention towards the eager tentacles.")

		saynn("[say=eliza]Listen to me, cuties! If you see someone you don't know enter this room, you're gonna play dead! Understand?[/say]")

		saynn("The tentacles stop for a bit.. and then nod.")

		saynn("[say=eliza]See? They're smart~. That whole selection thing that we did worked.[/say]")

		saynn("[say=pc]I hope so.[/say]")

		saynn("[say=eliza]Oh yeah, what are you gonna call them? Calling them a plant all the time would be kinda mean![/say]")

		addButton("Continue", "See what happens next", "name_list")
	if(state == "name_list"):
		playAnimation(StageScene.TentaclesDuo, "idle", {plant=true})
		saynn("How do you wanna name your new tentacles?")

		addTentacleNameButtons()
		if (false):
			addButton("Ignore", "you shouldn't see this", "pick_name")
	if(state == "pick_name"):
		removeCharacter("PCTentacles")
		addCharacter("PCTentacles")
		saynn("[say=pc]I think.. {pcTentacles} is a good name.[/say]")

		saynn("The tendrils twitch as they hear you.")

		saynn("[say=eliza]{pcTentacles}.. yeah.. has a good ring to it. Ah.. haha-.[/say]")

		saynn("You can see Eliza's blush as she wiggles under all the touches, her top and skirt getting a bit wet from the juices that the slick tips have left on them.")

		saynn("[say=eliza]Okay.. They're friendly. Very friendly. Maybe too friendly.[/say]")

		saynn("Eventually, the feline manages to gather enough will to free herself and take a step back.")

		saynn("She fixes her misplaced clothing, straightening her blouse and pulling her skirt down.")

		saynn("[say=eliza]Phew. Well, there you go. Enjoy your new plant! You earned it. It's time for me to go.[/say]")

		addButton("Let her leave", "Allow Eliza to leave", "just_let_leave")
		addButton("Push Eliza", "Push Eliza into the green mass of horny tentacles and see what happens..", "push_eliza")
	if(state == "just_let_leave"):
		saynn("You nod and watch as Eliza Quinn steps out of the cell.")

		saynn("One of the tentacles offers her a goodbye wave.")

		saynn("And now.. you're alone with them.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "push_eliza"):
		playAnimation(StageScene.TentaclesBondage, "start", {pc="eliza", plant=true, bodyState={underwear=true}})
		saynn("A devious thought comes into your head..")

		saynn("Just before she starts leaving.. you decide to give her a slight push.")

		saynn("[say=eliza]Eek![/say]")

		saynn("Eliza flails and stumbles forward.. falling straight into the warm mass of lusty tentacles with a soft thump.")

		saynn("She tries to pull away.. but the curious tentacles already wrap around her arms and legs, keeping her to themselves. Even her tail has gotten caught by one of the thinner tendrils.")

		saynn("[say=pc]This is my way to say 'Thank you'. You earned some fun too.[/say]")

		saynn("She shoots you a quick strict glance.. her cheeks blushing red.")

		saynn("[say=eliza]Tell them to let go![/say]")

		saynn("One of the tentacles sneaks under her skirt and rubs against her inner thighs.. before finding a particularly sensitive spot")

		saynn("[say=eliza]Easy! Easy.. ah! Tell them to stop..[/say]")

		saynn("Another little tendril slides under her blouse and starts kneading her "+str("milky " if getCharacter("eliza").canBeMilked() else "perky ")+"breasts..")

		saynn("You watch as Eliza squirms against the green vines that hold her, the feline's breathing getting deep.")

		saynn("[say=pc]Why don't you tell them yourself?[/say]")

		saynn("She frowns and puts on her most mean eyes possible.. but her expression softens up more and more as she gets groped and fondled. She doesn't say a thing.")

		saynn("The tentacles start undressing her, the labcoat goes first. The blouse gets lifted up and stripped off.. the skirt gets pulled off as well. Her cute black lingerie gets revealed to your eyes.. her fur already looking wet near the crotch region.")

		saynn("[say=eliza]You're gonna watch me as they.. ah.. as they have it their way with me?..[/say]")

		saynn("You shrug.")

		saynn("[say=pc]It's a pretty good view. I can have my fun with them later.[/say]")

		saynn("A tentacle traces along the edge of her bra.. before dipping under it to brush against her nipple. Her back arches, a little moan leaving her lips.")

		saynn("[say=eliza]I'm gonna watch you as you watch me then~. Ah..[/say]")

		saynn("What a brat.")

		saynn("You point at the tentacles to catch their attention.. and then you point at Eliza's face..")

		saynn("[say=eliza]Huh?[/say]")

		addButton("Continue", "See what happens next", "eliza_blindfolded")
	if(state == "eliza_blindfolded"):
		playAnimation(StageScene.TentaclesBondage, "tease", {pc="eliza", plant=true, bodyState={naked=true}})
		saynn("Suddenly, a few tentacles wrap around her face, covering up her eyes and brushing against her lips.")

		saynn("[say=eliza]Hmpff..[/say]")

		saynn("At the same time, another tentacle carefully manipulates the latches on her bra.. setting her cuties free. Her panties follow, peeled down her thighs until they land onto the floor.")

		saynn("You can see her trying to free her face, shaking her head a bit.")

		saynn("[say=pc]You should relax.[/say]")

		saynn("She humpfs more and wiggles her whole body now.. that's when a thick, shiny tentacle presses against her pussy entrance, coating her already-wet folds with its juices.")

		saynn("[say=eliza]Mphh-?[/say]")

		saynn("[say=pc]Yeah, you really should relax now, kitty.[/say]")

		addButton("Continue", "See what happens next", "bound_sex")
	if(state == "bound_sex"):
		playAnimation(StageScene.TentaclesBondage, "sex", {pc="eliza", plant=true, bodyState={naked=true}})
		saynn("Before she can react, the tentacle pushes inside, spreading her wet pussy and stuffing it full with itself.")

		saynn("Eliza throws her head back, a muffled cry escaping her throat. Her legs try to close.. knees touching.. but the tentacles are quick to spread them again, the tentacle proceeding to slowly pull out.. before sliding in again.")

		saynn("[say=pc]That.. looks fun.[/say]")

		saynn("[say=eliza]Mmhh-.. mmhh.. hh..[/say]")

		saynn("More little muffled moans escape her as she gets fucked by a plant, the tentacle stretching her out and reaching deeper, coating her inner walls with its juice.")

		saynn("A little sneaky one finds her clit and presses against it, doing little circular rubs, stimulating that knob.")

		saynn("[say=eliza]Mmmph-!..[/say]")

		addButton("Continue", "See what happens next", "eliza_cums_first")
	if(state == "eliza_cums_first"):
		playAnimation(StageScene.TentaclesBondage, "fast", {pc="eliza", plant=true, bodyState={naked=true}})
		saynn("Her thighs already begin to tremble, her tail spazzing a bit. And so the tentacles double their efforts, thrusting into her pussy faster and flicking away at her clit harder.")

		saynn("Eliza cums with a muffled scream.. her whole body convulsing in the tentacles' grip. Her pussy squirts! A sudden, strong gush of her juices that splatter against the floor and the tendrils holding her. The tentacles seem to be drinking it eagerly, their tips pulsing.")

		saynn("They're not done.. clearly..")

		addButton("Continue", "See what happens next", "sudden_more_sex")
	if(state == "sudden_more_sex"):
		playAnimation(StageScene.TentaclesSex, "sex", {pc="eliza", plant=true, bodyState={naked=true}})
		saynn("While Eliza is busy trying to endure the orgasmic waves, the tentacles suddenly pull her up, high above the floor! Her blushing cheeks and lusty eyes aren't hidden from you anymore.")

		saynn("She only manages to say..")

		saynn("[say=eliza]Wait-!..[/say]")

		saynn("..before a tentacle fills her mouth, sneaking in between her teeth and going down her throat, stretching the tight walls there.")

		saynn("[say=eliza]Mmm..[/say]")

		saynn("The tentacle that's fucking her pussy is still there, thrusting away.. But at the same time, another one joins in and starts prodding her tight-looking pink tailhole.")

		saynn("[say=eliza]MMhhH![/say]")

		saynn("Despite her resistance and attempts to clench, that tentacle starts to bury itself in.. slowly.. relentlessly.. Stretching that puckering star wide and working itself inside.. All of the juices help to act as lube.")

		saynn("A tentacle in her throat lets her say a single word..")

		saynn("[say=eliza]..fuck!..[/say]")

		saynn("..before plugging her mouth again and proceeding to slide inside.. the one in her butt starts picking up the pace as well.")

		saynn("All her holes are being pounded raw at the same time while some of the other tentacles explore her body, tracing lines over her belly, fondling her tits, playing with her stiff nips..")

		saynn("Her butthole is still clenching hard around the tendril that's fucking it.. but the tentacle is strong enough to push through that resistance, ramming itself deep inside her, sending shivers through her spine.")

		saynn("It takes less than a minute before she cums again.. Her second orgasm crashes over her hard. She arches her back as her pulsing pussy squirts again, showering the green vines, making them more eager to continue.")

		saynn("[say=eliza]Mhhh!.. mHHhh-h~!..[/say]")

		saynn("But then.. something new begins to happen.")

		saynn("The tentacle in her pussy grows a little orb-shaped bump near the base. That bump.. starts traveling along the tendril, getting closer to the doctor's sensitive folds. Soon, it presses against them.")

		saynn("[say=eliza]Mmhh-?[/say]")

		saynn("She tries to look down at it.. but the tentacle in her mouth forces her to keep her neck straight. All the while, that bump starts putting more and more pressure onto Eliza's sex.. kinda like a knot of canine cock would do.")

		addButton("Continue", "See what happens next", "eliza_gets_stuffed")
	if(state == "eliza_gets_stuffed"):
		playAnimation(StageScene.TentaclesSex, "fast", {pc="eliza", cum=true, plant=true, bodyState={naked=true}})
		saynn("Then.. with a sudden push.. the tentacle forces that orb down Eliza's slit, stretching her wide for a few seconds. The bump disappears inside her without a trace.")

		saynn("[say=eliza]MMhhHH-!..[/say]")

		saynn("[say=pc]It just stuffed something into you.[/say]")

		saynn("[say=eliza]Mhhh-h!.. ff-u..ck.. ffh..[/say]")

		saynn("Eliza arches back.. her slit pulsing around the tentacle that keeps fucking her. And soon, a second bump reaches her folds.. before forcing itself inside. Kitty's pussy shoots a bit of juice as it gets stretched extremely wide again.")

		saynn("[say=eliza]HHhmh!..[/say]")

		saynn("You can't help but to notice Eliza's belly getting bigger as this is happening. There is no denying it.. the tentacles are stuffing her with their eggs.")

		saynn("[say=pc]It's just putting its eggs inside you, relax~.[/say]")

		saynn("Her eyes visibly enlarge, her ears perk high. Eliza suddenly starts trying to free herself, wiggling her butt while desperately flailing her arms. Loud muffled noises of protest escape her lips..")

		saynn("[say=eliza]MHHh! HHHph! NHhh-..[/say]")

		saynn("It doesn't take long before her terrified eyes roll up from another orgasm. Her holes all clench hard around the tendrils.. before another egg gets forcefully stuffed inside her womb.")

		saynn("[say=eliza]Mhhh-h..[/say]")

		saynn("You notice that the tentacle in her ass also starts trying to stuff eggs inside her. The first one goes extremely slowly.. the egg stretching her poor tight asshole bit by bit.. until the girl's anal star gives up and swallows the egg. Another egg follows fast.. before her tailhole even has time to close up.")

		saynn("[say=eliza]Nhh-h.m..mhh..[/say]")

		saynn("The poor kitty is cumming and moaning into the tentacle while her belly swells big, making her look pregnant.")

		saynn("You watch with fascination as Eliza's womb and guts find space for more and more of these orbs. She has given up resisting by now, her body squirming only from the multiple orgasms, her eyes looking spaced out already.")

		saynn("And that's when the nectar comes..")

		saynn("Suddenly, the tentacles start throbbing wildly. Thick, warm cum-like nectar gets pumped into Eliza's pussy and her ass, filling all of the empty space between the eggs and inflating her belly even further.")

		saynn("More nectar sprays from other tendrils, showering the feline's belly, her nice tits and her cute face.")

		saynn("When Eliza can't receive any more of that stuff inside, it begins to overflow, streaming down from her holes onto her inner thighs.")

		saynn("The tentacles begin slowing down..")

		addButton("Continue", "See what happens next", "eliza_flops")
	if(state == "eliza_flops"):
		playAnimation(StageScene.TentaclesSleepOn, "sleep", {pc="eliza", bodyState={naked=true}})
		saynn("When the tendrils finally finish with Eliza, they gently pull their tips out of her holes and carefully lower her onto themselves, offering a cozy embrace instead.")

		saynn("Eliza just lies there.. breathing in short, broken gasps. Her belly is huge.. nectar is dripping out of her stretched holes, pooling beneath her. Her eyes are half-closed, unfocused.")

		saynn("[say=pc]Are you okay?[/say]")

		saynn("After a long moment.. she suddenly lets out a soft giggle.")

		saynn("[say=eliza]..hah..[/say]")

		saynn("She tries to say something else.. but it comes out as a moan, her hand reaching out to pat her swollen belly slightly.")

		saynn("[say=eliza]..I'm so fucking full..[/say]")

		saynn("She doesn't seem mad at you.. at least currently. But that's probably because she got fucked silly.")

		saynn("[say=pc]Thank you for bringing me this plant.[/say]")

		saynn("[say=eliza]..you're.. welcome..[/say]")

		saynn("The tentacles begin to gently gather her clothes. They help her to sit up, moving her like she is a doll. Then, they guide her arms and head through her blouse and pull her pencil skirt back over her hips. They even manage her bra and panties on.. all of the mess still dripping from her fur and used holes. The labcoat is last, covering up most of it..")

		saynn("She reaches for her messy ponytail.. but the tendrils are quicker, fixing all of the loose strands and redoing the tail for her. So nice of them.")

		addButton("Continue", "See what happens next", "eliza_after_everything_getup")
	if(state == "eliza_after_everything_getup"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("Eliza gets up.. with the help of the tendrils and your hand. Her legs shake a bit and she grabs onto you, her sense of balance thrown off by the huge belly.")

		saynn("[say=eliza]Gotta.. gotta walk.. normal people walk.. I'm normal..[/say]")

		saynn("She takes a step.. and instantly grabs onto you again.")

		saynn("[say=eliza]Ah..[/say]")

		saynn("[say=pc]You should go get a shower.[/say]")

		saynn("[say=eliza]..you're an asshole.. I should..[/say]")

		saynn("She takes another step.. then another.")

		saynn("Slowly, she waddles towards the exit of your cell.")

		saynn("The tentacles wave their tips as she steps out.")

		addButton("Continue", "See what happens next", "after_sex_alone")
	if(state == "after_sex_alone"):
		removeCharacter("eliza")
		playAnimation(StageScene.TentaclesDuo, "idle", {plant=true})
		saynn("And now.. you're left alone.. with your tentacles.")

		saynn("They seem to just be vibing now, swaying left and right.")

		saynn("Your cell is now a bit more lively than before. Nice.")

		addButton("Continue", "See what happens next", "endthescene")
func addTentacleNameButtons():
	for theName in PlayerSlaveryTentacles.MONSTER_NAMES:
		addButton(theName, "Pick this name!", "pick_name", [theName])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_lab"):
		processTime(10*60)

	if(_action == "in_cell"):
		processTime(15*60)

	if(_action == "show_egg"):
		processTime(5*60)

	if(_action == "tentacles_reveal"):
		processTime(3*60)

	if(_action == "pick_name"):
		setFlag("ElizaModule.tent_name", _args[0])
		setState("picked_name")
		return

	if(_action == "eliza_blindfolded"):
		processTime(3*60)

	if(_action == "bound_sex"):
		processTime(5*60)

	if(_action == "eliza_cums_first"):
		processTime(3*60)

	if(_action == "sudden_more_sex"):
		processTime(5*60)

	if(_action == "eliza_gets_stuffed"):
		processTime(3*60)
		var theChar = getCharacter("eliza")
		var theTentacles = getCharacter("PCTentacles")
		var theMenstrualCycle:MenstrualCycle = theChar.getMenstrualCycle()
		for _i in range(8):
			theMenstrualCycle.addTentacleEgg("PCTentacles", TentacleEggType.Plant, 12*60*60, OrificeType.Vagina)
		for _i in range(6):
			theMenstrualCycle.addTentacleEgg("PCTentacles", TentacleEggType.Plant, 12*60*60, OrificeType.Anus)
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInVaginaBy("PCTentacles")
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInAnusBy("PCTentacles")
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInMouthBy("PCTentacles")
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedOnBy("PCTentacles")

	if(_action == "eliza_flops"):
		processTime(3*60)

	if(_action == "eliza_after_everything_getup"):
		processTime(5*60)

	if(_action == "after_sex_alone"):
		getCharacter("eliza").afterTakingAShower()
		setFlag("ElizaModule.tent_eliza", true)

	setState(_action)

func saveData():
	var data = .saveData()

	data["creditsPaid"] = creditsPaid
	data["creditsPaidStr"] = creditsPaidStr

	return data

func loadData(data):
	.loadData(data)

	creditsPaid = SAVE.loadVar(data, "creditsPaid", 0)
	creditsPaidStr = SAVE.loadVar(data, "creditsPaidStr", "")
