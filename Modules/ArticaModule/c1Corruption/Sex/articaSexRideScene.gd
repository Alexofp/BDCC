extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var isAnal = false
var hasCumInStrapon = false
var hasArticaCumInStrapon = false
var isStraponFuck = false

func _init():
	sceneID = "articaSexRideScene"

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
		if (isNaked):
			saynn("Seeing Artica's "+str("desperate caged up drippy cock" if isCaged else "hard drippy canine cock")+".. makes you want to do things to it!")

		else:
			saynn("Seeing Artica's "+str("desperate caged up cock leaving wet spots on her shorts" if isCaged else "hard canine cock bulging out her shorts")+".. makes you want to do things to it!")

		saynn("You bite your lip while silently staring at the white fluff who is constantly fidgeting because of her body's needs. Your gazes collide..")

		saynn("[say=artica]Y-yes?..[/say]")

		saynn("[say=pc]Let's fuck![/say]")

		saynn("Your hand darts out and grabs the girl's collar before yanking her in the direction of your cell.")

		saynn("[say=artica]Eep!..[/say]")

		addButton("Cell", "Pin the fluff against your bed", "in_cell")
	if(state == "in_cell"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.SexCowgirlAlt, "tease", {npc="pc", pc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		GM.pc.setLocation(GM.pc.getCellLocation())
		saynn("You rush to your cell, pulling the girl by her collar who can barely move her hind paws fast enough to keep up.")

		if (!isNaked):
			saynn("As soon as you burst into your little private cell, your hands forcibly strip the fluff naked before pinning her against your bed.. soon followed by your naked body getting on top of her.")

		else:
			saynn("As soon as you burst into your little private cell, your hands shove and then pin the naked fluff against your bed.. soon followed by your naked body getting on top of her.")

		saynn("[say=artica]E-eep.. t-too ff-fast..[/say]")

		saynn("As you straddle Artica's hips.. you can just feel the heat that's radiating from her"+str(" caged up" if isCaged else "")+" cock.. the scent making your own lust grow bigger with each passing moment.")

		if (GM.pc.hasReachableVagina()):
			saynn("With a sly grin, you tease "+str("her chastity cage by grinding it with your pussy slightly" if isCaged else "her hard cyan shaft by sliding your pussy along it, spreading your juices")+".")

		else:
			saynn("With a sly grin, you tease "+str("her chastity cage by grinding it with your ass slightly" if isCaged else "her hard cyan shaft by lowering yourself onto the tip, making it prod your tailhole")+".")

		if (isCaged):
			saynn("[say=artica]I-I'm.. n-not rr-really.. aah-h.. a.. top.. and m-my d-dick is l-locked a-anyway.. it's u-useless..[/say]")

			addDisabledButton("Pussy", "Artica is caged!")
			addDisabledButton("Ass", "Artica is caged!")
			addButtonWithChecks("Pick strapon", "Make Artica wear one of your strapons!", "pick_strapon", [], [[ButtonChecks.HasStrapons]])
			addButton("Chastity grind", "Grind her cage", "chastity_ride")
		else:
			saynn("[say=artica]I-I'm.. n-not rr-really.. aah-h.. a.. top..[/say]")

			addButtonWithChecks("Pussy", "Ride that lollypop of a dick with your slit", "ride_pussy", [], [[ButtonChecks.HasReachableVagina]])
			addButton("Ass", "Ride that lollypop of a dick with your butt", "ride_ass")
			addDisabledButton("Chastity grind", "Artica needs to be caged up for this")
		addButton("Never mind", "Cancel the scene", "endthescene")
	if(state == "chastity_ride"):
		playAnimation(StageScene.SexCowgirlAlt, "inside", {npc="pc", pc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]For me it's not useless~.[/say]")

		if (GM.pc.hasReachableVagina()):
			saynn("With a playful smirk, you position yourself above her cage, your pussy hovering just above it. Slowly, you lower yourself onto it, letting the fluff feel the heat radiating from your slick folds.")

		else:
			saynn("With a playful smirk, you position yourself above her cage, your {pc.analStretch} tailhole hovering just above it. Slowly, you lower yourself onto it, letting the fluff feel the heat radiating from your love tunnel.")

		saynn("[say=artica]Ah..[/say]")

		saynn("[say=pc]It's fun to tease you.. when you're locked up like that..[/say]")

		saynn("Artica squirms slightly, her cock is straining against its confines, cyan tip failing to get past the firm metal cage. All the while you just start to slowly grind your "+str("pussy" if GM.pc.hasReachableVagina() else "asshole")+" against it, riding the fluff like that..")

		saynn("[say=artica]Hh-hahh.. ah..[/say]")

		saynn("Even though there is no direction stimulation, Artica is moaning, her hips bucking against the bed slightly.. She is so-o-o horny..")

		saynn("[say=artica]P-please.. it's.. t-too much to e-endure.. ah..[/say]")

		saynn("Her toes curling with anticipation, her paws grabbing onto the bed sheets.. while you just keep riding her caged cock, letting the metal tip inside your "+str("slick pussy slit.. letting your hot juices drip onto it and land on her sensitive flesh." if GM.pc.hasReachableVagina() else "needy fuckhole.. letting it spread your start slightly.")+"")

		saynn("[say=artica]Nhh-hh!.. P-pppleee-asee.. g-gooods..[/say]")

		saynn("Poor fluff is melting.. while you're just smiling.")

		saynn("[say=pc]If you're so eager, cum already~. Cum like the little chastity slut that you are.[/say]")

		saynn("With a gasp, Artica's orgasm crashes over her, her cock pulsating in its little tight cage as streams of cum spurted out onto her own belly.. She is squirming hard under you.. desperate moans leaving her lips one after another.. while you just giggle softly.")

		saynn("[say=artica]Ahh.. ah-h.ah..ahh..[/say]")

		saynn("[say=pc]Good girl.[/say]")

		saynn("As her small cute climax comes to an end, she is left panting, her body still quivering with the aftershocks of her peak.")

		saynn("[say=artica]..g-gods..[/say]")

		saynn("You rest together like that.. before you help her to get back to her spot.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pick_strapon"):
		saynn("Which strapon do you want to put on Artica?")

		addStraponButtons()
		addButton("Back", "You changed your mind", "in_cell")
		if (false):
			addButton("Nope", "You shouldn't see this", "do_put_on_strapon_on_artica")
	if(state == "do_put_on_strapon_on_artica"):
		playAnimation(StageScene.SexCowgirlAlt, "tease", {npc="pc", pc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]And I don't plan to unlock you~.[/say]")

		saynn("Artica tilts her head slightly, her big puppy eyes confused. But it all becomes clear when you pull out one of your strapon harnesses..")

		if (GM.pc.canWearStrapon()):
			saynn("[say=artica]A..are y-you gonna w-wear that?..[/say]")

		else:
			saynn("[say=artica]W-what are you gonna..[/say]")

		saynn("Your smile shines brightly as you proceed to secure the harness around Artica's hips, strapon going over her caged cock..")

		saynn("[say=artica]B.. but..[/say]")

		saynn("[say=pc]Just try to imagine that it's your real cock~.[/say]")

		saynn("[say=artica]I.. d-do..n..t.. ah..[/say]")

		saynn("You spit on the rubber shaft and then firmly stroke it with your hand, spreading your saliva along the shiny surface.. which makes Artica tense up.")

		if (hasArticaCumInStrapon):
			saynn("[say=pc]You don't even know the best part yet~.[/say]")

			saynn("[say=artica]Um?..[/say]")

			saynn("You have no plans to tell her what that strapon is loaded with.. And especially the origin of that load..")

		elif (hasCumInStrapon):
			saynn("[say=pc]You don't even know the best part yet~.[/say]")

			saynn("[say=artica]Um?..[/say]")

			saynn("You have no plans to tell her what that strapon is loaded with..")

		saynn("How do you want to ride her strapon now?")

		addButtonWithChecks("Pussy", "Ride the strapon with your pussy", "do_ride_strapon_pussy", [], [[ButtonChecks.HasReachableVagina]])
		addButton("Ass", "Ride the strapon with your ass", "do_ride_strapon_ass")
	if(state == "do_ride_strapon_pussy"):
		playAnimation(StageScene.SexCowgirlAlt, "sex", {npc="pc", pc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You lean forward and grab Artica's by the chin, making her look up at you.")

		saynn("[say=pc]Shh~. Just be a good fucktoy and moan as I ride you.[/say]")

		saynn("And with that, your free hand wraps its digits around Artica's rubber cock.. before guiding it as you lower yourself onto it, the pointy head kissing your "+str("wet folds and then spreading them" if !isAnal else "{pc.analStretch} anal ring and then spreading it")+".. the toy slowly sliding inside you.")

		saynn("[say=pc]Oh yeah..[/say]")

		saynn("Seeing that, Artica's cheek blush.. The pressure inside her chastity cage rising.")

		saynn("[say=artica]T-th-his is.. l-lewd.. ah-..[/say]")

		saynn("You cut her off by bringing your body down onto that nice fat shaft, letting it pierce your "+str("cunt" if !isAnal else "ass")+" and stretch the inner walls wide. Feels good.. too good.. a little cute moan escapes your lips as your muscles tense up, your "+str("slit" if !isAnal else "fuckhole")+" hugging that rubber cock firmly.")

		if (!isAnal):
			saynn("[say=pc]Nice cock, Artica. Do you feel my pussy clenching around it~?[/say]")

		else:
			saynn("[say=pc]Nice cock, Artica. Do you feel my butt clenching around it~?[/say]")

		saynn("[say=artica]..y-yea.hhah.. ah..[/say]")

		saynn("Artica's toes curl from pleasure as you begin to ride her, your back arching with each motion. The feeling of being full sends shivers down your spine.. while Artica is squirming below you, your "+str("wet pussy" if !isAnal else "anal star")+" sliding up and down along the toy.")

		if (GM.pc.isWearingChastityCage()):
			saynn("That strapon is massaging your "+str("pleasure spot" if !isAnal else "prostate")+" so nicely that you feel the pressure behind your chastity cage rising fast too.. Two caged up cuties having fun together..")

		elif (GM.pc.hasReachablePenis()):
			saynn("That strapon is massaging your "+str("pleasure spot" if !isAnal else "prostate")+" so nicely that you feel the pressure in your own member rising fast..")

		addButton("Faster", "Ride her faster", "ride_strapon_pussy_faster")
	if(state == "ride_strapon_pussy_faster"):
		playAnimation(StageScene.SexCowgirlAlt, "fast", {npc="pc", pc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (!isAnal):
			saynn("As your passion grows, so does your pace, Artica's strapon hammering against your cervix as you slam yourself against her hips. The cage behind the strapon harness is twitching..")

		else:
			saynn("As your passion grows, so does your pace, Artica's strapon reaching deep inside your {pc.masc} ass as you slam it against her hips. The cage behind the strapon harness is twitching..")

		saynn("[say=artica]T-t-ttoo m-much!.. ahh-h.. I c-can't.. ah..ahh.. P-please.."+str(" m-miss.." if GM.pc.getGender() == Gender.Female else "")+"[/say]")

		saynn("Wow.. the fluff is really getting into it, the visual stimulation getting her oh so horny.. She keeps moaning as you ride the rubber toy that has nothing to do with her real cock, her hips lifting instinctively to meet your movements.")

		saynn("Your own moans synergize with hers.. You're about to cum..")

		addButton("Cum", "Time to cum..", "ride_strapon_cum")
	if(state == "ride_strapon_cum"):
		playAnimation(StageScene.SexCowgirlAlt, "inside", {npc="pc", pc="artica", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("With each motion, Artica feels her arousal building more and more.. Until she just can't take it anymore.")

		saynn("[say=artica]Ahhhh-h-h!.. ahh-h..ah.h.ah.a.. g-godds..[/say]")

		saynn("Her body is convulsing with pleasure, her slick neglected pussy releasing a torrent of girlcum onto the bedsheets.. her caged up dick throbbing in its tight cage.. cumming while forced to stay in its sheath.. her wasted seed already leaking from under the strapon harness..")

		if (hasArticaCumInStrapon):
			saynn("At the same time, your own orgasm hits you like a tidal wave. Your legs shake as you take the whole rubber shaft inside you, the inner walls of your slick warm "+str("pussy squirting and" if !isAnal else "love tunnel")+" clenching rhythmically around the toy.. clenching so much that it triggers the toy to finally release its contents inside you.. [b]Artica's cum is flooding your "+str("womb" if !isAnal else "butt")+"[/b]!")

			if (GM.pc.isWearingChastityCage()):
				saynn("Strings of {pc.cum} erupt through the little hole of your chastity cage, landing on Artica's gray belly, leaving cute patterns and marking her fur.")

			elif (GM.pc.hasReachablePenis()):
				saynn("Strings of {pc.cum} erupt from your {pc.penis} and land on Artica's gray belly and tits, leaving cute patterns and marking her fur.")

			if (!isAnal):
				saynn("[say=pc]Ah.. yeah.. g-give me all your pups, Artica.. your cock is pumping me full of your thick virile cum..[/say]")

			else:
				saynn("[say=pc]Ah.. yeah.. look, Artica.. your cock is pumping me full of your thick virile cum..[/say]")

			saynn("The fluff notices some of the spunk already leaking out.. Her eyes widened.")

			saynn("[say=artica]Nh-h.. b-but.. ah.. h-how.. wha..[/say]")

			saynn("[say=pc]Ah.. Remember when I milked you~?[/say]")

			saynn("Artica pants and blinks many times, her cheeks somehow blushing even more bright now.")

		elif (hasCumInStrapon):
			saynn("At the same time, your own orgasm hits you like a tidal wave. Your legs shake as you take the whole rubber shaft inside you, the inner walls of your slick warm "+str("pussy squirting and" if !isAnal else "love tunnel")+" clenching rhythmically around the toy.. clenching so much that it triggers the toy to finally release its contents inside you.. [b]Someone's cum is flooding your "+str("womb" if !isAnal else "butt")+"[/b]!")

			if (GM.pc.isWearingChastityCage()):
				saynn("Strings of {pc.cum} erupt through the little hole of your chastity cage, landing on Artica's gray belly, leaving cute patterns and marking her fur.")

			elif (GM.pc.hasReachablePenis()):
				saynn("Strings of {pc.cum} erupt from your {pc.penis} and land on Artica's gray belly and tits, leaving cute patterns and marking her fur.")

			if (!isAnal):
				saynn("[say=pc]Ah.. yeah.. breed me, Artica.. your cock is pumping me full of thick virile cum..[/say]")

			else:
				saynn("[say=pc]Ah.. yeah.. look, Artica.. your cock is pumping me full of thick virile cum..[/say]")

			saynn("The fluff notices some of the spunk already leaking out.. Her eyes widened.")

			saynn("[say=artica]Nh-h.. b-but.. ah.. h-how.. wha..[/say]")

			saynn("[say=pc]Ah.. I just loaded it with someone's cum~. Not yours, don't worry~.[/say]")

			saynn("Artica pants and blinks many times, her cheeks somehow blushing even more bright now.")

		else:
			saynn("At the same time, your own orgasm hits you like a tidal wave. Your legs shake as you take the whole rubber shaft inside you, the inner walls of your slick warm "+str("pussy squirting and" if !isAnal else "love tunnel")+" clenching rhythmically around the toy..")

			if (GM.pc.isWearingChastityCage()):
				saynn("Strings of {pc.cum} erupt through the little hole of your chastity cage, landing on Artica's gray belly, leaving cute patterns and marking her fur.")

			elif (GM.pc.hasReachablePenis()):
				saynn("Strings of {pc.cum} erupt from your {pc.penis} and land on Artica's gray belly and tits, leaving cute patterns and marking her fur.")

			saynn("[say=pc]Ah.. yeah.. Good girl.. Got so excited just from watching me ride your cock~?[/say]")

			saynn("The fluff notices some of the spunk already leaking out.. Her eyes widened.")

			saynn("[say=artica]Nh-h.. ah.. y-yea..h..hah..[/say]")

			saynn("[say=pc]Hah. Adorable.[/say]")

			saynn("Artica pants and blinks many times, her cheeks somehow blushing even more bright now.")

		addButton("Rest", "Just spend time together", "just_rest")
		if (hasCumInStrapon || hasArticaCumInStrapon):
			addButton("Sit on face", "Make Artica clean up her mess", "pussy_sit_on_face_strapon")
		else:
			addDisabledButton("Sit on face", "Load the strapon with someone's cum.. including Artica's.. to able to do this")
	if(state == "ride_pussy"):
		playAnimation(StageScene.SexCowgirlAlt, "sex", {npc="pc", pc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You lean forward and grab Artica's by the chin, making her look up at you.")

		saynn("[say=pc]Shh~. Just be a good fucktoy and moan as I ride you.[/say]")

		saynn("And with that, your free hand wraps its digits around Artica's canine cock.. before guiding it as you lower yourself onto it, the pointy head kissing your "+str("wet folds and then spreading them" if !isAnal else "{pc.analStretch} anal ring and then spreading it")+".. her cock slowly sliding inside you.")

		saynn("[say=pc]Oh yeah..[/say]")

		saynn("[say=artica]Ah-.. y-youre so.. w-warm.. n-not too f-fast, o-oka- eep![/say]")

		saynn("You cut her off by bringing your body down onto that nice fat shaft, letting it pierce your "+str("cunt" if !isAnal else "ass")+" and stretch the inner walls wide. Feels good.. too good.. a little cute moan escapes your lips as your muscles tense up, your "+str("slit" if !isAnal else "fuckhole")+" hugging that cock firmly.")

		if (!isAnal):
			saynn("[say=pc]Nice cock, Artica. Do you feel my pussy clenching around it~?[/say]")

		else:
			saynn("[say=pc]Nice cock, Artica. Do you feel my butt clenching around it~?[/say]")

		saynn("[say=artica]..y-yea.hhah.. ah..[/say]")

		saynn("Artica's toes curl from pleasure as you begin to ride her, your back arching with each motion. The feeling of being full sends shivers down your spine.. while Artica is squirming below you, your "+str("wet pussy" if !isAnal else "anal star")+" sliding up and down her shaft.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Her cock is massaging your "+str("pleasure spot" if !isAnal else "prostate")+" so nicely that you feel the pressure behind your chastity cage rising fast..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Her cock is massaging your "+str("pleasure spot" if !isAnal else "prostate")+" so nicely that you feel the pressure in your own member rising fast..")

		addButton("Faster", "Ride her faster", "ride_pussy_faster")
	if(state == "ride_pussy_faster"):
		playAnimation(StageScene.SexCowgirlAlt, "fast", {npc="pc", pc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (!isAnal):
			saynn("As your passion grows, so does your pace, Artica's cock hammering against your cervix as you slam yourself against her hips.")

		else:
			saynn("As your passion grows, so does your pace, Artica's cock reaching deep inside your {pc.masc} ass as you slam it against her hips.")

		saynn("[say=artica]T-t-ttoo m-much!.. ahh-h.. I c-can't.. ah..ahh.. P-please.."+str(" m-miss.." if GM.pc.getGender() == Gender.Female else "")+"[/say]")

		saynn("Artica's knot is inflating, making her cock is even more fat at the base.. so much that the orb doesn't fit inside anymore, just slapping against your "+str("needy {pc.vaginaStretch} pussy folds" if !isAnal else "needy {pc.analStretch} ring")+".. But you keep trying, stretching yourself out more bit by bit..")

		saynn("[say=artica]I-it w-won't.. ah.. w-won't f-fit.. ah![/say]")

		saynn("Sounds like a challenge.")

		saynn("[say=pc]I will make it.[/say]")

		addButton("Get knotted", "Force it in!", "ride_pussy_cum")
	if(state == "ride_pussy_cum"):
		playAnimation(StageScene.SexCowgirlAlt, "inside", {npc="pc", pc="artica", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Artica's big blue orb is struggling to fit inside no matter how hard you ride her..")

		saynn("[say=artica]I'm.. g-ggonnaa-aah.hh-hnyaaa-hh!..[/say]")

		saynn("But.. then.. with a determined thrust of power, you suddenly manage to impale yourself on her pulsating cock almost balls deep, the swollen knot starts slipping inside you, stretching your tight entrance extremely wide to accommodate all that girth.. Then, with one final push, the knot finally gets buried fully, tying you to the squirming shaking girl..")

		saynn("[say=pc]Oh fuck~..[/say]")

		if (!isAnal):
			saynn("You let out a passionate moan of ecstasy as Artica's cock throbs inside you, filling your womb to the brim with many spurts of thick, virile cum.. while your pussy is clenching around her knotted shaft, your own orgasm overwhelming your senses and making your legs tremble.")

		else:
			saynn("You let out a passionate moan of ecstasy as Artica's cock throbs inside you, filling your butt to the brim with many spurts of thick, virile cum.. while your inner walls are clenching around her knotted shaft, your own orgasm overwhelming your senses and making your legs tremble.")

		saynn("[say=artica]Nnhh-h!.. ahhh-h..hh.. ahh..[/say]")

		saynn("Oh wow, Artica is grabbing onto the bed sheets desperately while her whole body is thrashing wildly, her lusty eyes rolling up, her"+str(" own" if !isAnal else "")+" pussy releasing a shower of her girly fluids onto her thighs..")

		if (GM.pc.isWearingChastityCage()):
			saynn("That's not all the mess that the fluff is receiving though, there is also your caged up cock that is cumming all over her gray belly, weak strings of your seed are marking her fur.")

		elif (GM.pc.hasReachablePenis()):
			saynn("That's not all the mess that the fluff is receiving though, there is also your own cock that is cumming all over her gray belly, strong strings of your seed are marking her fur.")

		saynn("Both you and her are panting heavily.. the feeling of tightness doesn't ever leave anymore as you two are tied together, her full member stuck inside you..")

		saynn("[say=artica]Ah-h.. hh.. s-stuck..[/say]")

		saynn("[say=pc]Yeah.. Let me be your cock warmer, Artica.[/say]")

		saynn("[say=artica]S-s.. s-sure.. ah..[/say]")

		saynn("It's not like she has a choice.")

		addButton("Rest", "Just spend time together until the knot deflates", "just_rest")
		addButton("Sit on face", "Make Artica clean up her mess", "pussy_sit_on_face")
		addButton("Knot-fucking", "(Roughness) Milk Artica's balls dry", "pussy_knot_fucking")
	if(state == "just_rest"):
		if (isStraponFuck):
			saynn("You rest together like that, with Artica's strapon still inside you. You lean forward and get comfy on Artica's"+str(" round pregnant" if getCharacter("artica").isVisiblyPregnant() else "")+" chest.. while her chastity cage is still faintly pulsing, making the rubber toy shift inside..")

			saynn("[say=artica]Ah..[/say]")

			var acceptCaged = getFlag("ArticaModule.cagedAcceptStage", 0)
			saynn("[say=pc]Poor girl. You'd wish that this was your real cock inside me?[/say]")

			if (acceptCaged <= 1):
				saynn("[say=artica]Y-yeahh-h..[/say]")

				saynn("[say=pc]Well, too bad. I guess I gotta train your mind more~.[/say]")

			elif (acceptCaged <= 2):
				saynn("[say=artica]M-maybe.. I d-don't know..[/say]")

				saynn("[say=pc]Well, too bad. I guess I gotta train your mind more~.[/say]")

			else:
				saynn("[say=artica]N-no.. M-my c-cock.. useless.. b-better to k-keep locked..[/say]")

				saynn("[say=pc]Aww. You're such a good girl.[/say]")

			saynn("You cuddle for a bit more before you finally take off her strapon.. while keeping the cage, of course. After that, you just let Artica go.")

			saynn("[say=artica]T-take care..[/say]")

		else:
			saynn("Since there is nothing better to do, you decide to just rest together. You lean forward and get comfy on Artica's"+str(" round pregnant" if getCharacter("artica").isVisiblyPregnant() else "")+" chest.. while her knot is still faintly pulsing inside you.")

			saynn("[say=artica]Ah..[/say]")

			saynn("[say=pc]Don't squirm, silly. You're making yourself hard again.[/say]")

			saynn("[say=artica]I'm.. mmhh.. t-trying.. ah..[/say]")

			saynn("You giggle and lick her lips.")

			saynn("[say=pc]Poor girl.[/say]")

			saynn("And just like that, you spend some time.. until Artica's knot deflates enough for you to escape it.. Her cum starts gushing out of your used hole instantly..")

			saynn("You clean what you can and let Artica go.")

			saynn("Her legs are still shaky.")

			saynn("[say=artica]T-ttake care..[/say]")

		addButton("Continue", "See what happens next", "endthescene_getbackstrapon")
	if(state == "pussy_knot_fucking"):
		playAnimation(StageScene.SexCowgirlChoke, "fast", {npc="pc", pc="artica", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Even with her full length inside you.. you're still hungry for more..")

		saynn("[say=pc]Hold on, fucktoy.. It's gonna be a rough ride..[/say]")

		saynn("[say=artica]Wha-.. Ahh!..[/say]")

		saynn("With determination in your eyes, you apply your full strength and pull yourself up.. forcefully yanking the fat knot out of your "+str("used pussy" if !isAnal else "stuffed ass")+", allowing the cum to start gushing out.. Poor fluff's body is tensing under you, the sudden act making her squirm hard.")

		saynn("[say=pc]Ah..[/say]")

		saynn("You weren't finished though.. rather than pulling away completely, you start lowering yourself onto her cock again, trying to force the knot inside.")

		saynn("[say=artica]Wa-ait!.. n-noo-o.. d-don't.. pp-pllease!.. s-stop!.. ahh-h..[/say]")

		saynn("Artica actually starts trying to pull away from you.. her paws pushing you off.. which gives you no choice..")

		saynn("[say=pc]Nghh.. Shut up and knot me, slut.[/say]")

		saynn("You slap her hands away and get a firm grip on her throat, pushing the fluff into the bed as you force her knot inside you, the fat orb slipping past your "+str("stretched wide pussy folds" if !isAnal else "stretched wide asshole")+" yet again!")

		saynn("[say=artica]Kh-h!..[/say]")

		saynn("Your legs are shaking, your used "+str("slit" if !isAnal else "tailhole")+" clenching hard around the cock that has just came inside you.. but you don't stop, pulling yourself up again before getting yourself knotted.. again and again, each time applying less force as your "+str("pussy" if !isAnal else "anal ring")+" adapts to the knot-fucking..")

		saynn("Artica's resistance fades quickly, her eyes rolling up. Her lips are producing silent gasps as your hand still squeezes her throat, her body quivering underneath you..")

		saynn("Your cell smells of hot sex.. you keep riding that knot, forcing it in and out yourself.. until Artica's cock starts throbbing inside you yet again! With full force, you bring yourself down, accepting her full length.. followed by Artica's hot virile seed spilling "+str("inside your womb" if !isAnal else "deep inside you")+" yet again, her balls tensing up wildly as you milk them dry with your stretched "+str("cunt" if !isAnal else "inner walls")+".")

		if (!isAnal):
			if (GM.pc.isVisiblyPregnant()):
				saynn("[say=pc]Y-yeah.. I'm pregnant already but I need more.. I need all of it..[/say]")

			else:
				saynn("[say=pc]Y-yeah.. pump me full of your pups.. I need all of it..[/say]")

		else:
			saynn("[say=pc]Y-yeah.. pump me full.. I need all of it..[/say]")

		saynn("Artica is drooling, the pleasure consumed her mind. Your own body is kinda giving up too by this point, all the muscles.. exhausted..")

		saynn("You find strength to yank the knot out for the last time.. before.. just flopping on top of the girl..")

		addButton("Continue", "See what happens next", "after_knotfuck")
	if(state == "after_knotfuck"):
		playAnimation(StageScene.Sleeping, "sleep", {npc="pc", pc="artica", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("Hours later..")

		saynn("Your bed is so soft.. Why isn't it always this soft?")

		saynn("You open your eyes..")

		saynn("[say=artica]H-h-hai.. um..[/say]")

		saynn("Your head hurts a little.. ow.. just like your used gaping fuckhole..")

		saynn("[say=artica]I.. I d-didn't k-know if I should.. w-wake you up..[/say]")

		saynn("So adorable..")

		saynn("[say=artica]Do you n-need something?..[/say]")

		saynn("[say=pc]Y-yeah.. no.. it's okay.[/say]")

		saynn("[say=artica]H-hope I was a good.. f-.. f-fucktoy..[/say]")

		saynn("You smooch her on the lips and get up.")

		saynn("[say=pc]Hah. Yeah.[/say]")

		saynn("You help her to get up too.")

		saynn("[say=artica]I will.. b-be in my spot..[/say]")

		saynn("[say=pc]Uh huh.[/say]")

		if (!isNaked):
			saynn("Artica grabs her uniform and runs off..")

		else:
			saynn("Artica blinks a few times.. and then runs off..")

		saynn("Huh.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pussy_sit_on_face"):
		playAnimation(StageScene.SexFaceSitting, "sit", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (!isStraponFuck):
			saynn("You wait a bit until Artica's knot deflates enough.. before easing yourself off of it.. plop..")

		else:
			saynn("You wait a bit before easing yourself off of that strapon.")

		saynn("[say=artica]Ah.. t-that was.. i-intense..[/say]")

		saynn("[say=pc]I'm not done yet~.[/say]")

		saynn("Watching Artica lay underneath you, panting and squirming.. gives another.. an even more kinky idea.. With a mischievous glint in your eyes, you straddle Artica's.. face, offering your messy used "+str("pussy" if !isAnal else "asshole")+"..")

		saynn("[say=pc]Lick it up, Artica.[/say]")

		saynn("[say=artica]Eep..[/say]")

		saynn("The girl hesitates, her cheeks flushing deep red.. while "+str("someone's" if (!hasArticaCumInStrapon && hasCumInStrapon) else "her own")+" seed starts dripping onto her face. Her head is trapped between your thighs.. there is nowhere she can go.")

		saynn("[say=pc]Lick or I will just grind your face~.[/say]")

		saynn("No matter what, she can't avoid the intoxicating scent.. it makes Artica dart her tongue out and give your "+str("pussy" if !isAnal else "anal ring")+" a careful little lick, catching some of the.. flavor.")

		saynn("[say=pc]Mmm~..[/say]")

		if (!isAnal):
			saynn("Your little moan makes Artica taste more of that cocktail of your juices and "+str("someone's" if (!hasArticaCumInStrapon && hasCumInStrapon) else "her own")+" cum, her body trembling as her tongue delves deeper, spreading the sensitive folds and lapping it all up..")

		else:
			saynn("Your little moan makes Artica taste more of "+str("someone's" if (!hasArticaCumInStrapon && hasCumInStrapon) else "her own")+" cum, her body trembling as her tongue delves deeper, rimming around the sensitive ring and lapping it all up..")

		saynn("[say=pc]Good.. girl.. mmh-h.. little cum eater..[/say]")

		saynn("Her tongue is working tirelessly, cleaning your "+str("pussy" if !isAnal else "butt")+" up and exploring you from the inside. All the while her "+str("own cock is hard again, pre dripping off the tip.." if !isStraponFuck else "caged cock is trying to get hard in its metal prison again, pre dripping off the tip..")+"")

		saynn("[say=pc]Now swallow.[/say]")

		saynn("Artica shows you her mouth full of "+str("someone's" if (!hasArticaCumInStrapon && hasCumInStrapon) else "her own")+" cum.. then closing it and swallowing.. before showing how empty it is now.")

		saynn("[say=pc]Such a good girl.. Thank you, Artica~.[/say]")

		saynn("[say=artica]N-no.. p-problem..[/say]")

		saynn("You help her to come back to sense and send her off back to her spot. While you stay and clean up a bit.")

		addButton("Continue", "See what happens next", "endthescene_getbackstrapon")
func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "do_put_on_strapon_on_artica", [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_cell"):
		processTime(2*60)

	if(_action == "chastity_ride"):
		processTime(10*60)
		getModule("ArticaModule").triggerCorruption(0.02)
		getCharacter("artica").cummedOnBy("artica")

	if(_action == "ride_ass"):
		isAnal = true
		setState("ride_pussy")
		return

	if(_action == "do_put_on_strapon_on_artica"):
		processTime(2*60)
		var strapon = _args[0]
		GM.pc.getInventory().removeItem(strapon)
		getCharacter("artica").getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		var theFluids = strapon.getFluids()
		if(theFluids != null):
			if(theFluids.hasFluidTypeWithCharID("Cum", "artica")):
				hasArticaCumInStrapon = true
			if(theFluids.hasFluidType("Cum")):
				hasCumInStrapon = true
		isStraponFuck = true

	if(_action == "do_ride_strapon_ass"):
		isAnal = true
		setState("do_ride_strapon_pussy")
		return

	if(_action == "ride_pussy_faster"):
		processTime(5*60)

	if(_action == "ride_strapon_cum"):
		processTime(6*60)
		getModule("ArticaModule").triggerCorruption(0.02)
		if(isAnal):
			GM.pc.gotAnusFuckedBy("artica")
			GM.pc.cummedInAnusBy("artica", FluidSource.Strapon)
		else:
			GM.pc.gotVaginaFuckedBy("artica")
			GM.pc.cummedInVaginaBy("artica", FluidSource.Strapon)
		getCharacter("artica").cummedOnBy("pc")
		GM.pc.orgasmFrom("artica")

	if(_action == "pussy_sit_on_face_strapon"):
		processTime(10*60)
		getModule("ArticaModule").triggerCorruption(0.01)
		if(isAnal):
			GM.pc.bodypartTransferFluidsToAmount(BodypartSlot.Anus, "artica", BodypartSlot.Head, 0.2, 20.0)
		else:
			GM.pc.bodypartTransferFluidsToAmount(BodypartSlot.Vagina, "artica", BodypartSlot.Head, 0.2, 20.0)
		setState("pussy_sit_on_face")
		return

	if(_action == "ride_pussy_cum"):
		processTime(6*60)
		getModule("ArticaModule").triggerCorruption(0.02)
		if(isAnal):
			GM.pc.gotAnusFuckedBy("artica")
			GM.pc.cummedInAnusBy("artica")
		else:
			GM.pc.gotVaginaFuckedBy("artica")
			GM.pc.cummedInVaginaBy("artica")
		if(GM.pc.isWearingChastityCage() || GM.pc.hasReachablePenis()):
			getCharacter("artica").cummedOnBy("pc")
		GM.pc.orgasmFrom("artica")

	if(_action == "just_rest"):
		processTime(20*60)

	if(_action == "pussy_sit_on_face"):
		processTime(10*60)
		getModule("ArticaModule").triggerCorruption(0.01)
		if(isAnal):
			GM.pc.bodypartTransferFluidsToAmount(BodypartSlot.Anus, "artica", BodypartSlot.Head, 0.2, 20.0)
		else:
			GM.pc.bodypartTransferFluidsToAmount(BodypartSlot.Vagina, "artica", BodypartSlot.Head, 0.2, 20.0)

	if(_action == "pussy_knot_fucking"):
		processTime(10*60)
		getModule("ArticaModule").triggerCorruption(0.02)
		if(!isAnal):
			GM.pc.gotVaginaFuckedBy("artica")
			GM.pc.cummedInVaginaBy("artica")
			GM.pc.doPainfullyStretchHole(BodypartSlot.Vagina, "artica")
		else:
			GM.pc.gotAnusFuckedBy("artica")
			GM.pc.cummedInAnusBy("artica")
			GM.pc.doPainfullyStretchHole(BodypartSlot.Anus, "artica")

	if(_action == "after_knotfuck"):
		processTime(3*60*60)

	if(_action == "endthescene_getbackstrapon"):
		if(getCharacter("artica").isWearingStrapon()):
			var strapon = getCharacter("artica").getWornStrapon()
			getCharacter("artica").getInventory().removeEquippedItem(strapon)
			GM.pc.getInventory().addItem(strapon)
		endScene()
		return

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
	data["isAnal"] = isAnal
	data["hasCumInStrapon"] = hasCumInStrapon
	data["hasArticaCumInStrapon"] = hasArticaCumInStrapon
	data["isStraponFuck"] = isStraponFuck

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
	isAnal = SAVE.loadVar(data, "isAnal", false)
	hasCumInStrapon = SAVE.loadVar(data, "hasCumInStrapon", false)
	hasArticaCumInStrapon = SAVE.loadVar(data, "hasArticaCumInStrapon", false)
	isStraponFuck = SAVE.loadVar(data, "isStraponFuck", false)
