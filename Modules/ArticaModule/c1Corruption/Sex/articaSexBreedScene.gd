extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var articaCondom = false
var condomUsed = false
var condomBroke = false
var condomBreakChance = 0.0
var straponHasCum = false
var straponHasArticaCum = false
var isStraponSex = false
var isStroking = false
var isLicking = false

func _init():
	sceneID = "articaSexBreedScene"

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
			saynn("Your eyes lock onto the white fluff, your gaze purposefully lingering on her"+str(" milky" if getCharacter("artica").isLactating() else "")+" {artica.breasts}.. fluffy"+str(" cute" if !getCharacter("artica").isVisiblyPregnant() else " round")+" belly.. her closed legs that house a"+str(" caged up" if isCaged else "n aroused")+" sheath.. but also a needy pussy hidden behind her balls.")

		else:
			saynn("Your eyes lock onto the white fluff, your gaze purposefully lingering on her shirt that hides her {artica.breasts} and fluffy"+str(" cute" if !getCharacter("artica").isVisiblyPregnant() else " round")+" belly.. her shorts that cover up her a"+str(" caged up" if isCaged else "n aroused")+" sheath.. but also a needy pussy behind her balls.")

		saynn("She notices your greedy stare, the attention making the fluff wiggle her body. You can just.. feel.. her scent getting stronger with each second of you watching her.")

		if (isVerySlut):
			saynn("[say=artica]D-do I l-look s-slutty?..[/say]")

		elif (isSlut):
			saynn("[say=artica]A-are you..[/say]")

		else:
			saynn("[say=artica]What a-are you..[/say]")

		saynn("With a predatory grin, you suddenly grab her by the collar and pull her in the direction of your cell.")

		saynn("[say=artica]..eeep!..[/say]")

		addButton("Cell", "Pull the fluff into your cell", "in_cell")
	if(state == "in_cell"):
		addCharacter("artica", ["naked"])
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		GM.pc.setLocation(GM.pc.getCellLocation())
		playAnimation(StageScene.SexPawLick, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("As soon as you enter your little place, Artica gets pushed onto the bed"+str(", your hands remove her clothes in seconds and are already exploring her forms, spreading her legs" if !isNaked else ", your hands already start exploring her forms and spreading her legs")+".")

		saynn("[say=artica]Ah..[/say]")

		saynn("What a great view.. shy blushing face that is already panting softly.. "+str("swollen milky tits with dark cyan perky nips that have purple piercings in them" if getCharacter("artica").isLactating() else "modest round tits with cyan perky nips that have purple piercings in them")+".. her tight cyan slit that is hiding under her fluffy balls..")

		saynn("The fluff bites her lip, her eyes avoid any contact with yours..")

		var isPreg = getCharacter("artica").isPregnant()
		if (GM.pc.hasReachablePenis()):
			if (isVerySlut):
				if (isPreg):
					saynn("[say=artica]I h-have a big litter inside me a-already.. b-but we could always try for m-more.. P-please.. Make m-my mind blank..[/say]")

				else:
					saynn("[say=artica]P-Please.. I need y-your cock inside me.. stretching me wide.. filling me up full until I can't think.. a-anymore..[/say]")

					saynn("So mouth-y she is..")

			elif (isSlut):
				if (isPreg):
					saynn("[say=artica]I h-have a big litter inside me a-already.. b-but we could always try for m-more..[/say]")

				else:
					saynn("[say=artica]P-Please.. your c-cock.. inside m-me..[/say]")

			else:
				if (isPreg):
					saynn("[say=artica]I h-have a big litter inside me a-already..[/say]")

				else:
					saynn("[say=artica]P-Please.. your c-cock.. ah..[/say]")

		addButton("Continue", "See what happens next", "what_do")
	if(state == "wear_condom_pick"):
		saynn("Which condom do you want to put on your cock?")

		addButton("Best condom", "Wear your best condom", "wear_condom_best")
		addButton("Worst condom", "Wear your worst condom", "wear_condom_worst")
	if(state == "after_wear_condom"):
		playAnimation(StageScene.SexPawLick, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		saynn("You quickly rip the package off of one of your condoms with your teeth and then apply to your cock.")

		if (getCharacter("artica").isVisiblyPregnant()):
			saynn("Artica looks down at her pregnant belly.. and tilts her head at you.")

			saynn("[say=pc]I don't like the mess.[/say]")

			saynn("[say=artica]T-that's.. f-fair..[/say]")

			saynn("She is clearly not a fan.")

		else:
			saynn("Artica looks down at her pregnant belly.. and tilts her head at you.")

			saynn("[say=pc]I'd rather not knock you up..[/say]")

			saynn("[say=artica]T-that's.. f-fair..[/say]")

			saynn("She doesn't seem very enthusiastic about the rubbers. Huh.")

		addButton("Continue", "See what happens next", "what_do")
	if(state == "add_condom_on_artica"):
		playAnimation(StageScene.SexPawLick, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		saynn("You rip-open a packaged condom and start applying it to Artica's cyan shaft.. while she is squirming!")

		saynn("[say=artica]Ah.. But I'm n-not g-gonna..[/say]")

		saynn("[say=pc]You will. All over yourself.[/say]")

		saynn("She blushes deeply.")

		saynn("[say=artica]..p-probably..[/say]")

		addButton("Continue", "See what happens next", "what_do")
	if(state == "picked_strapon"):
		playAnimation(StageScene.SexPawLick, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		saynn("You secure a strapon around your waist!"+str(" One that is loaded.." if straponHasCum else "")+""+str(" One that is loaded with Artica's cum.." if straponHasArticaCum else "")+"")

		saynn("[say=artica]Oh.. wow..[/say]")

		if (straponHasCum || straponHasArticaCum):
			saynn("[say=pc]You like it? You will like its contents even more~. Let's have fun.[/say]")

		else:
			saynn("[say=pc]You like it~? Let's have fun.[/say]")

		addButton("Continue", "See what happens next", "what_do")
	if(state == "start_stroke_cock"):
		playAnimation(StageScene.SexPawLick, "stroketease", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		saynn("One of your hands lands on Artica's hard shaft.. and starts stroking it.")

		saynn("[say=artica]E-eep..[/say]")

		saynn("[say=pc]What~? You're ready to burst already? C'mon, little girl, hold it together.[/say]")

		saynn("The fluff is squirming, her hips slightly humping your hand.. which makes you slow down.")

		saynn("[say=pc]Not so fast. You're only cumming from my"+str(" cock" if GM.pc.hasReachablePenis() else " toy")+", you hear?[/say]")

		saynn("[say=artica]..ah.. y-yes..[/say]")

		addButton("Continue", "See what happens next", "what_do")
	if(state == "select_strapon_menu"):
		saynn("Which strapon do you want to use?")

		addStraponButtons()
		addButton("Back", "You changed your mind", "what_do")
		if (false):
			addButton("Nope", "You shouldn't see this", "do_put_on_strapon")
	if(state == "what_do"):
		playAnimation(StageScene.SexPawLick, ("stroke" if isStroking else "")+"tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		saynn("What do you want to do?")

		if (GM.pc.hasReachablePenis()):
			if (condomUsed):
				addButton("Fuck her!", "Time for some safe protected fun", "start_fuck")
			else:
				addButton("Breed her!", "Time for fun", "start_fuck")
				addButtonWithChecks("Wear condom", "Put on a condom", "wear_condom_pick", [], [[ButtonChecks.HasCondoms]])
		else:
			if (GM.pc.isWearingStrapon()):
				addButton("Fuck her", "Make that fluff squiiiirm", "start_strapon_fuck")
			else:
				addDisabledButton("Breed her!", "You don't have a reachable penis..")
				addButtonWithChecks("Wear strapon", "Select which strapon you want to put on", "select_strapon_menu", [], [[ButtonChecks.HasStraponAndCanWear]])
		if (!articaCondom):
			addButtonWithChecks("Condom on her", "Make Artica wear a condom to prevent any future mess..", "add_condom_on_artica", [], [[ButtonChecks.HasCondoms]])
		if (!isStroking && !isCaged):
			addButton("Stroke her", "Stroke her cock at the same time", "start_stroke_cock")
		addButton("Cancel", "You changed, your mind", "endthescene")
	if(state == "start_fuck"):
		playAnimation(StageScene.SexPawLick, ("stroke" if isStroking else "")+"sex", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		saynn("Artica gasps as you plunge your "+str("hard cock" if !isStraponSex else "shiny strapon")+" into her dripping lusty pussy, her slick walls forcibly spreading to accommodate your"+str(" rubber" if isStraponSex else "")+" girth and length.. One thrust is quickly followed by another, your "+str("cock" if !isStraponSex else "toy")+" sinking eagerly into that.. tight.. clenching.. pussy."+str(" All the while your hand keeps stroking her off, still at a teasing pace!" if isStroking else "")+"")

		saynn("[say=artica]Ah!.. N-not s-so f-faa.. ah..ah.ah..[/say]")

		if (isStroking):
			saynn("Even that seems to be too fast for the poor fluff..")

		saynn("[say=pc]Why would I go slow? Your slutty pussy is begging to be fucked.[/say]")

		saynn("Her moans are filling the cell as you find your rhythm, her"+str(" own" if !isStraponSex else "")+" "+str("cock quickly getting fully hard and swaying back and forth, precum leaking from the tip" if !isCaged else "locked away cock is pushing on its cage, trying to leave the sheath, precum leaking from the peeking tip")+". Fluff is squirming on the bed, her toes curling, legs spreading more, her wet folds drawing you deeper into her velvety warmth.."+str(" not that you can feel that through the strapon.. but it still feels nice.." if isStraponSex else "")+"")

		saynn("As the rough thrusts continue, Artica's hind paw finds your face.. its claws are gently teasing your cheek.. cyan paw pads are massaging it..")

		addButton("Lick paw", "Lick the paw that is in front of you", "sex_fast_lick")
		addButton("No lick", "Just rail her harder", "sex_fast")
	if(state == "sex_fast"):
		playAnimation(StageScene.SexPawLick, ("stroke" if isStroking else "")+"fast", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		if (isLicking):
			saynn("How can you say no to her soft hind paw.. You continue fucking the girl while nuzzling her cyan pawpads, your tongue is out and occasionally giving them little licks, feeling how rough the texture of them are..")

		else:
			saynn("You ignore the girl's soft hind paws and just continue fucking her, pushing away her toes when they become too bold and get in the way again.")

			saynn("[say=pc]I'm not a pawslut, you are.[/say]")

		saynn("Her cunt keeps clenching around your "+str("cock" if !isStraponSex else "rubber shaft, increasing friction")+".. but you keep pounding her, fighting through her resistance with raw force. A little bump appears above her crotch during each thrust, your "+str("member" if !isStraponSex else "strapon")+" smashing against her natural wall, trying to break through into her womb.")

		saynn("[say=artica]Ah-h.. s-so in-ntense.. g-gods.. ah.. I'mm..m.. g-gonna.. ah..[/say]")

		if (isStroking):
			saynn(""+str("The knot on the base of the cyan shaft that you're stroking is inflating with blood" if !isCaged else "Her cute caged up cock is desperately twitching in its small prison")+", her pussy twitching and shooting weak spurts of juices, the intense rough fucking making the fluff grab onto the bed sheets and throw her head back.")

		else:
			saynn(""+str("The knot on the base of the cyan shaft is inflating with blood" if !isCaged else "Her cute caged up cock is desperately twitching in its small prison")+", her pussy twitching and shooting weak spurts of juices, the intense rough fucking making the fluff grab onto the bed sheets and throw her head back.")

		if (isStraponSex):
			saynn("She is close.. you can feel it.. you can smell it..")

		else:
			saynn("She is close.. you can feel it.. you can smell it.. You feel like you're about to cum too..")

		if (isStraponSex):
			addButton("Climax", "See what happens!", "sex_cum")
		else:
			addButton("Cum inside", "Breed the fluff", "sex_cum")
	if(state == "sex_cum"):
		playAnimation(StageScene.SexPawLick, ("stroke" if isStroking else "")+"inside", {pc="pc", npc="artica", pcCum=true, npcCum=true, bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		if (isStraponSex):
			if (straponHasArticaCum || straponHasCum):
				saynn("Artica's pussy is not just clenching around your rubber shaft.. it spasms, the slick walls trying to milk it hard. So, of course, with a primal growl, you ram your toy deep into that slutty fuckhole.. until the extreme tightness triggers it to release its load..")

				saynn("You smile while your strapon is throbbing, pumping Artica's womb full of her own hot virile cum..")

				saynn("[say=artica]Oh.. ee-ep.. nyaaaa..-ahh..[/say]")

				if (!getCharacter("artica").isVisiblyPregnant()):
					saynn("[say=pc]Get pregnant, needy slut. "+str("Enjoy your own pups." if straponHasArticaCum else "Enjoy someone's pups.")+"[/say]")

					saynn("[say=artica]W-wha-?..[/say]")

					saynn("[say=pc]Whose cum do you think I loaded the strapon with~?[/say]")

					saynn("[say=artica]C-c-cum?.. ahh-h..[/say]")

				else:
					saynn("[say=pc]Ngh.. Gonna breed you even while you're pregnant. Enjoy "+str("your own" if straponHasArticaCum else "someone's")+" cum inside you.[/say]")

					saynn("[say=artica]C-c-cum?.. ahh-h..[/say]")

			else:
				saynn("Artica's pussy is not just clenching around your rubber shaft.. it spasms, the slick walls trying to milk it hard. So, of course, with a primal growl, you ram your toy deep into that slutty fuckhole and let Artica cum around it..")

				saynn("[say=artica]Oh.. ee-ep.. nyaaaa..-ahh..[/say]")

				saynn("[say=pc]Such a needy girl.. but so easy to handle.[/say]")

		elif (!condomUsed):
			saynn("Artica's pussy is not just clenching around your shaft.. it spasms, the slick walls milking you hard. So, of course, with a primal growl, you ram your cock into that slutty fuckhole and let it throb, releasing your hot seed deep inside her, pumping her womb full..")

			saynn("[say=artica]Oh.. ee-ep.. nyaaaa..-ahh..[/say]")

			if (!getCharacter("artica").isVisiblyPregnant()):
				saynn("[say=pc]Get pregnant, needy slut.[/say]")

			else:
				saynn("[say=pc]Ngh.. Gonna breed you even while you're pregnant.[/say]")

		elif (condomBroke):
			saynn("Artica's pussy is not just clenching around your shaft.. it spasms, the slick walls milking you hard. So, of course, with a primal growl, you ram your cock into that slutty fuckhole and let it throb, releasing your hot seed into the condom inside Artica. Something is wrong though..")

			saynn("[say=artica]Oh.. ee-ep.. nyaaaa..-ahh.. so h-hoot..[/say]")

			saynn("You pull out a bit and notice that the condom is indeed.. busted.. [b]All of its contents spill into Artica's womb![/b]")

			if (getCharacter("artica").isVisiblyPregnant()):
				saynn("[say=pc]Oops.. At least you're already pregnant.[/say]")

			else:
				saynn("[say=pc]Oops.. Someone might get pregnant..[/say]")

			saynn("[say=artica]W-wha-?.. Ah!..[/say]")

			saynn("The fluff is too.. busy.. to react.")

		else:
			saynn("Artica's pussy is not just clenching around your shaft.. it spasms, the slick walls milking you hard. So, of course, with a primal growl, you ram your cock into that slutty fuckhole and let it throb, releasing your hot seed into the condom inside Artica, all safely contained within..")

			saynn("[say=artica]Oh.. ee-ep.. nyaaaa..-ahh..[/say]")

			saynn("[say=pc]What a needy slut.[/say]")

		if (!articaCondom):
			saynn("Her body is convulsing in pleasure as orgasmic waves, her"+str(" own" if !isStraponSex else "")+" cock twitching"+str(" in your hand" if isStroking else "")+" and shooting "+str("powerful" if !isCaged else "weak")+" lines of thick seed"+str(" from inside its cage.. that land onto her belly and tits.." if isCaged else ".. that land onto her tits and face..")+"")

		else:
			saynn("Her body is convulsing in pleasure as orgasmic waves, her"+str(" own" if !isStraponSex else "")+" cock twitching"+str(" in your hand" if isStroking else "")+" and shooting "+str("powerful" if !isCaged else "weak")+" lines of thick seed"+str(" from inside its cage.. that land onto her belly and tits.." if isCaged else " into the condom, making it sag more and more under its own weight..")+"")

		if (isStraponSex):
			saynn("You stay inside her and just watch Artica go through her climax with great interest..")

		elif (!condomUsed):
			saynn("You stay inside her and grunt as her tightness keeps trying to pull all of your stored seed out.. even when your orgasm begins to fade.")

		elif (condomBroke):
			saynn("Might as well not hold back after what happened.. You stay inside her and grunt as her tightness keeps trying to pull all of your stored seed out.. even when your orgasm begins to fade.")

		else:
			saynn("Trusting the condom, you stay inside her and grunt as her tightness keeps trying to pull all of your stored seed out.. even when your orgasm begins to fade.")

		saynn("[say=artica]Nh-hh.. tt-too.. m-much..[/say]")

		saynn("Her hand lands on her lower part of the belly and gently caresses it, the digits outline the exact shape of your "+str("cock" if !isStraponSex else "strapon")+".."+str(" while you still idly stroke her cock, milking all of her remaning seed out.." if isStroking else "")+"")

		saynn("Time to relax.")

		addButton("Cuddle", "Some aftercare is nice", "do_cuddle")
	if(state == "do_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (!condomUsed):
			if (isStraponSex):
				saynn("After such a rough fuck, it's nice to just touch the fluff sometimes. You pull Artica into your embrace and cuddle with her. "+str("Her stuffed cyan cunt is dripping her own seed onto your bed.." if straponHasArticaCum else "")+""+str("Her stuffed cyan cunt is dripping someone's seed onto your bed.." if straponHasArticaCum else "")+"")

			else:
				saynn("After such a rough fuck, it's nice to just touch the fluff sometimes. You pull Artica into your embrace and cuddle with her. Her stuffed cyan cunt is dripping your seed onto your bed..")

			if (straponHasArticaCum && !getCharacter("artica").isVisiblyPregnant()):
				saynn("[say=artica]I.. I m-might g-get knocked up.. f-from my own c-cum..[/say]")

				saynn("[say=pc]That's the plan, yes~.[/say]")

				saynn("[say=artica]I'd be.. carrying m-my own pups.. h.. haha..[/say]")

			elif (straponHasArticaCum && getCharacter("artica").isVisiblyPregnant()):
				saynn("[say=artica]You u-used m-my cum..[/say]")

				saynn("You rub her pregnant belly.")

				saynn("[say=pc]You're already knocked up, silly.[/say]")

				saynn("[say=artica]Y-yeah.. true.. h.. haha..[/say]")

			elif (isVerySlut || isSlut):
				saynn("[say=artica]N-nya.. I'm s-such a.. messy.. cock w-whore..[/say]")

				saynn("[say=pc]A soft and breedable messy cock whore.[/say]")

				saynn("[say=artica]..h.. haha..[/say]")

			else:
				saynn("[say=artica]N-nya.. I'm s-such a.. messy..[/say]")

				saynn("She cuts herself short.")

				saynn("[say=pc]Messy who?[/say]")

				saynn("[say=artica]J-Just.. m-messy..[/say]")

				saynn("You chuckle and boop her snout.")

				saynn("[say=pc]You're a messy slut, Artica.[/say]")

				saynn("[say=artica]Eep..[/say]")

		elif (condomBroke):
			saynn("After such a rough fuck, it's nice to just touch the fluff sometimes. You pull Artica into your embrace and cuddle with her. Her stuffed cyan cunt is dripping your seed onto your bed.. Artica finally notices that..")

			saynn("[say=artica]Um.. w-wait.. d-didn't you use a c-condom..[/say]")

			saynn("[say=pc]I did.[/say]")

			saynn("You show her the busted rubber.")

			saynn("[say=artica]Ohhh-hh..-hh..[/say]")

			if (getCharacter("artica").isVisiblyPregnant()):
				saynn("You rub her pregnant belly.")

				saynn("[say=pc]You're already knocked up, who cares.[/say]")

				saynn("[say=artica]..y-yeah..[/say]")

			else:
				saynn("You rub her belly.")

				saynn("[say=pc]So you might become a mom.[/say]")

				saynn("[say=artica]..y-yeah..[/say]")

		else:
			saynn("After such a rough fuck, it's nice to just touch the fluff sometimes. You pull Artica into your embrace and cuddle with her after disposing of the used condom. Her"+str(" clean" if !getCharacter("artica").hasEffect(StatusEffect.HasCumInsideVagina) else "")+" cyan cunt is dripping juices onto your bed..")

			if (isVerySlut || isSlut):
				saynn("[say=artica]N-nya.. N.n-no c-condom next t-time?..[/say]")

				if (getCharacter("artica").isVisiblyPregnant()):
					saynn("[say=pc]Oh wow, someone here wants to be a pregnant cum dump?[/say]")

					saynn("[say=artica]..h.. haha.. ..a-always..[/say]")

				else:
					saynn("[say=pc]Oh wow, someone wants to get knocked up.[/say]")

					saynn("[say=artica]..h.. haha..[/say]")

			else:
				saynn("[say=artica]N-nya.. I'm s-such a.. drippy..[/say]")

				saynn("She cuts herself short.")

				saynn("[say=pc]Drippy who?[/say]")

				saynn("[say=artica]J-Just.. d-drippy..[/say]")

				saynn("You chuckle and boop her snout.")

				saynn("[say=pc]You're a drippy slut, Artica.[/say]")

				saynn("[say=artica]Eep..[/say]")

		if (articaCondom):
			saynn("Carefully, you"+str(" also" if condomUsed else "")+" remove the full condom from Artica's cock before carefully tying it up and disposing of it.")

		saynn("You spend some time like that.. before you send her off to her usual spot.")

		addButton("Continue", "See what happens next", "endthescene")
func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "do_put_on_strapon", [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_cell"):
		processTime(3*60)

	if(_action == "wear_condom_best"):
		condomUsed = true
		condomBreakChance = GM.pc.useBestCondom()
		setState("after_wear_condom")
		return

	if(_action == "wear_condom_worst"):
		condomUsed = true
		condomBreakChance = GM.pc.useWorstCondom()
		setState("after_wear_condom")
		return

	if(_action == "do_put_on_strapon"):
		processTime(2*60)
		var strapon = _args[0]
		GM.pc.getInventory().removeItem(strapon)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		var theFluids = strapon.getFluids()
		if(theFluids != null):
			if(theFluids.hasFluidTypeWithCharID("Cum", "artica")):
				straponHasArticaCum = true
			if(theFluids.hasFluidType("Cum")):
				straponHasCum = true
		isStraponSex = true
		setState("picked_strapon")
		return

	if(_action == "start_strapon_fuck"):
		isStraponSex = true
		setState("start_fuck")
		return

	if(_action == "add_condom_on_artica"):
		articaCondom = true
		GM.pc.useWorstCondom()

	if(_action == "start_stroke_cock"):
		isStroking = true

	if(_action == "sex_fast_lick"):
		processTime(5*60)
		isLicking = true
		setState("sex_fast")
		return

	if(_action == "sex_fast"):
		processTime(5*60)

	if(_action == "sex_cum"):
		processTime(6*60)
		getModule("ArticaModule").triggerCorruption(0.02)
		if(condomUsed):
			condomBroke = GM.pc.shouldCondomBreakWhenFucking("artica", condomBreakChance)
			if(!condomBroke):
				addFilledCondomToLootIfPerk(GM.pc.createFilledCondom())
		
		if(!condomUsed || condomBroke):
			getCharacter("artica").cummedInVaginaByAdvanced("pc", {knotted=false,condomBroke=condomBroke,engulfed=false})
		
		if(articaCondom):
			addFilledCondomToLootIfPerk(getCharacter("artica").createFilledCondom())
		else:
			getCharacter("artica").cummedOnBy("artica")
		
		GM.pc.orgasmFrom("artica")

	if(_action == "do_cuddle"):
		processTime(20*60)
		GM.pc.unequipStrapon()

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
	data["articaCondom"] = articaCondom
	data["condomUsed"] = condomUsed
	data["condomBroke"] = condomBroke
	data["condomBreakChance"] = condomBreakChance
	data["straponHasCum"] = straponHasCum
	data["straponHasArticaCum"] = straponHasArticaCum
	data["isStraponSex"] = isStraponSex
	data["isStroking"] = isStroking
	data["isLicking"] = isLicking

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
	articaCondom = SAVE.loadVar(data, "articaCondom", false)
	condomUsed = SAVE.loadVar(data, "condomUsed", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
	condomBreakChance = SAVE.loadVar(data, "condomBreakChance", 0.0)
	straponHasCum = SAVE.loadVar(data, "straponHasCum", false)
	straponHasArticaCum = SAVE.loadVar(data, "straponHasArticaCum", false)
	isStraponSex = SAVE.loadVar(data, "isStraponSex", false)
	isStroking = SAVE.loadVar(data, "isStroking", false)
	isLicking = SAVE.loadVar(data, "isLicking", false)
