extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaCanteenTeaseScene"

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
		saynn("You invite Artica to go eat in a canteen.")

		if (nakedAndShy):
			saynn("[say=artica]Oh.. umm-m.. but I'm naked.. Everyone is gonna see m-my.. eep![/say]")

			saynn("You decide not to listen to her excuses and just grab her by the collar.")

		elif (isLusty):
			saynn("[say=artica]Oh.. um-m.. we ca-a-an..[/say]")

			if (isNaked):
				saynn("Her hard exposed {artica.penis} tells you that she might be needy for more than just a snack.")

			else:
				saynn("Her bulging out shorts are telling you that she might be needy for more than just a snack.")

		else:
			saynn("[say=artica]Sounds good.. back to my old spot, haha.[/say]")

		addButton("Canteen", "Go eat!", "go_eat")
	if(state == "go_eat"):
		playAnimation(StageScene.PawJobUnderTable, "start", {npc="pc", pc="artica"})
		if (nakedAndShy):
			saynn("You grab 2 trays with the tasteless nutrient paste. Holding that tray forces Artica to keep her {artica.penis} exposed, her cheeks blush deeply as she rushes to the usual table.")

			saynn("[say=artica]Everyone is w-watching..[/say]")

		elif (isNaked && isVerySlut):
			saynn("You grab 2 trays with the tasteless nutrient paste and head to the usual table. Artica is swaying her butt eagerly, enjoying your hungry gaze on her exposed private bits.")

			saynn("[say=artica]Everyone is watching, haha..[/say]")

		elif (isNaked && isSlut):
			saynn("You grab 2 trays with the tasteless nutrient paste and head to the usual table. Artica doesn't seem to be that ashamed of her body anymore, just casually walking past all the other inmates who stare at her private bits.")

			saynn("[say=artica]I'm so.. exposed..[/say]")

		else:
			saynn("You grab 2 trays with the tasteless nutrient paste and sit behind the usual table.")

			saynn("[say=artica]"+str(RNG.pick(["How's you?..", "Looks tasty.. a bit..", "I'm doing okay.. What about you?"]))+"[/say]")

		saynn("Time flies as you chat and eat your meals.")

		addButton("Stealth tease", "Tease her crotch with your leg under the table", "stealth_tease")
		if (corruption >= 0.1):
			addButtonWithChecks("Crotch sniffing", "Force Artica to sniff your crotch", "force_crotchsniff", [], [[ButtonChecks.HasReachableOrCagedPenisOrReachableVagina]])
		else:
			addDisabledButton("Crotch sniffing", "Artica's corruption needs to be above 10%")
		if (corruption >= 0.2):
			addButton("Offer foot", "Offer Artica to worship your foot", "tease_offerfoot")
		else:
			addDisabledButton("Offer foot", "Artica's corruption needs to be above 20%")
		addButton("Just nom", "You just wanted to eat with Artica", "just_nom")
	if(state == "just_nom"):
		saynn("You decide against teasing Artica and just have a nice conversation with her.")

		if (isSlut && isLusty):
			saynn("She was talking about sex and paws.. a lot.")

		else:
			saynn("You talk all about prison life.")

		saynn("After finishing your meals, you return to the main platform.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "force_crotchsniff"):
		if (isLusty):
			playAnimation(StageScene.ChairCrotchSniff, "grind", {pc="artica", npc="pc", pcCum=true, bodyState={hard=true}, npcBodyState={hard=true}})
			saynn("As you abruptly end the meal time and stand up, Artica's heart is already racing with anticipation. Before she can even process what is happening, you grab her by the hair.. and force her face into your crotch, pressing her nose against your "+str("{pc.penis}" if GM.pc.hasPenis() else "wet pussy")+"!")

			saynn("Artica's eyes widen in surprise, a low moan escaping her lips as she inhales deeply, the intoxicating scent overwhelming her senses. With each breath, a wave of pleasure is coursing through her body, her cock throbbing with need"+str(" inside of its cage" if isCaged else "")+".")

			saynn("[say=artica]I'm.. I.. mm.m-m.. ah-h..Ah!..[/say]")

			saynn("Suddenly, her body convulsed with pleasure! Streams of hot sticky cum erupt from her pulsating cock"+str(", splattering onto the floor beneath in a messy puddle" if isNaked else ", most of it caught by the fabric of her shorts.. but some is seeping through already..")+"")

			saynn("Panting heavily, Artica slumps against you, her body trembling.")

			saynn("[say=pc]Such a cute girl.[/say]")

		else:
			playAnimation(StageScene.ChairCrotchSniff, "sniff", {pc="artica", npc="pc", bodyState={hard=true}, npcBodyState={hard=true}})
			saynn("You know the best way to make Artica horny..")

			saynn("Without saying a word, you get up and approach her bench. Seeing you and your eyes full of intention makes the fluff shift back, gaining some distance..")

			saynn("[say=artica]Um.. what are you-.. Eep![/say]")

			if (GM.pc.isWearingChastityCage()):
				saynn("But you are quick to reach your hand out and grab her by the hair.. before pushing her face straight into your crotch, dragging her face over your balls and along your cold chastity cage, marking her fur with your precum. She seems to be trying to break free..")

			elif (GM.pc.hasReachablePenis()):
				saynn("But you are quick to reach your hand out and grab her by the hair.. before pushing her face straight into your crotch, dragging her face over your balls and along your {pc.penis}, marking her fur with your precum. She seems to be trying to break free..")

			else:
				saynn("But you are quick to reach your hand out and grab her by the hair.. before pushing her face straight into your crotch, dragging her face over your wet pussy, marking her fur with your juices. She seems to be trying to break free..")

			saynn("[say=pc]Inhale![/say]")

			saynn("Her breath hitches as she inhales deeply, her nostrils filling with the intoxicating scent. Shivers run down Artica's spine as her canine cock starts to harden and drip with arousal"+str(" inside of its cage" if isCaged else "")+".")

			saynn("[say=pc]Good. Keep doing it.[/say]")

			saynn("Her body is responding eagerly.. Little moans escaping her maw.. With each inhale, she is getting more and more aroused, her mind clouded with lust, her cheeks flushing with desire.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "tease_offerfoot"):
		#var isDigi = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsDigi)
		#var isHoofs = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsHoofs)
		#var pawname = ("foot" if (!isDigi  && !isHoofs) else ("paw" if isDigi else "hoof"))
		#var toesname = ("toes" if !isHoofs else "sole")
		if (isLusty):
			playAnimation(StageScene.CheckPaw, "crotch", {pc="pc", npc="artica", npcCum=true, npcBodyState={hard=true}})
			saynn("You notice Artica's hungry stare on your {pc.feet}.. She seems to be pretty pent up.. so why not help her?")

			saynn("[say=pc]Kneel. Under the table.[/say]")

			if (isSlut):
				saynn("Without much deliberation, the fluff eagerly slides under the table and obeys your words, kneeling as best as the table above allows.")

			else:
				saynn("The fluff is clearly battling herself, her wide eyes scanning the room.. the very busy room.. But eventually the lust wins.. Artica slides under the table and obeys your words, kneeling as best as the table above allows it.")

			if (isNaked):
				if (isCaged):
					saynn("Slowly, you reach your {pc.foot} forward.. and make Artica spread her legs by pushing on her thighs.. before putting it on her crotch. She gasps as you start rubbing the exposed metal cage with your {pc.toes}.. The cyan cock inside is pretty much always hard, desperate to get out..")

					saynn("[say=artica]Nh-h.. t-that's.. i-intense..[/say]")

					saynn("Huh, you're barely playing with that thing, just tugging and pulling on it a little.. But you do feel a lot of pressure building up inside.. looks like Artica might..")

					saynn("[say=artica]Ah!.. ah-h..ah.ah..ahh-h..[/say]")

					saynn("Instinctively, she closes her legs around your {pc.foot} as her muscles tense up.. Artica is moaning cutely while her locked away cock is throbbing hard.. before cumming and leaving quite a mess on her fur and your {pc.foot}..")

					saynn("[say=pc]Wow. That was fast~. Now clean it up.[/say]")

					saynn("She is panting heavily.. the orgasm making her sway a lot.. but she does grab your {pc.foot} with her hands and brings it up to her maw.. before using her tongue to lap up all the mess that she created.. Very cute.")

				else:
					saynn("Slowly, you reach your {pc.foot} forward.. and make Artica spread her legs by pushing on her thighs.. before putting it on her crotch. She gasps as you start rubbing the exposed hard canine cock with your {pc.toes}.. Teasing the drippy tip as well as the balls.")

					saynn("[say=artica]Nh-h.. t-that's.. i-intense..[/say]")

					saynn("Huh, you're barely playing with that thing, just stroking it a little.. But you do feel a lot of pressure building up.. The girl is squirming a lot, her balls twitching, her knot visibly inflating.. looks like Artica might..")

					saynn("[say=artica]Ah!.. ah-h..ah.ah..ahh-h..[/say]")

					saynn("Instinctively, she closes her legs around your {pc.foot} as her muscles tense up.. Artica is moaning cutely while her cock is throbbing hard.. cumming and leaving quite a mess on her fur and your {pc.foot}..")

					saynn("[say=pc]Wow. That was fast~. Now clean it up.[/say]")

					saynn("She is panting heavily.. the orgasm making her sway a lot.. but she does grab your {pc.foot} with her hands and brings it up to her maw.. before using her tongue to lap up all the mess that she created.. Very cute.")

			else:
				if (isCaged):
					saynn("Slowly, you reach your {pc.foot} forward.. and make Artica spread her legs by pushing on her thighs.. before putting it on her crotch. She gasps as you start rubbing the metal cage in her shorts with your {pc.toes}..")

					saynn("[say=artica]Nh-h.. t-that's.. i-intense..[/say]")

					saynn("Huh, you're barely playing with that thing, just tugging and pulling on it a little.. But you do feel a lot of pressure building up inside.. looks like Artica might..")

					saynn("[say=artica]Ah!.. ah-h..ah.ah..ahh-h..[/say]")

					saynn("Instinctively, she closes her legs around your {pc.foot} as her muscles tense up.. Artica is moaning cutely while her locked away cock is throbbing inside her shorts.. cumming and leaving quite a mess..")

					saynn("[say=pc]Wow. That was fast~.[/say]")

				else:
					saynn("Slowly, you reach your {pc.foot} forward.. and make Artica spread her legs by pushing on her thighs.. before putting it on her crotch. She gasps as you start rubbing the hard member in her shorts, dragging your {pc.toes} around its outline..")

					saynn("[say=artica]Nh-h.. t-that's.. i-intense..[/say]")

					saynn("Huh, you're barely playing with that cock, just stroking it a little.. But you do feel a lot of pressure building up.. so many twitches.. and the knot is inflating too.. looks like Artica might..")

					saynn("[say=artica]Ah!.. ah-h..ah.ah..ahh-h..[/say]")

					saynn("Instinctively, she closes her legs around your {pc.foot} as her muscles tense up.. Artica is moaning cutely while her cock is throbbing inside her shorts.. cumming and leaving quite a mess..")

					saynn("[say=pc]Wow. That was fast~.[/say]")

		else:
			if (RNG.chance(50)):
				playAnimation(StageScene.CheckPaw, "lick", {pc="pc", npc="artica", npcBodyState={hard=true}})
				saynn("Slowly, you raise one of your legs and put it on top of another.. As you do that, you notice Artica's intrigued stare. Her eyes watch you wiggle your {pc.foot}.. her mouth watering.")

				saynn("[say=pc]Go ahead~.[/say]")

				if (isSlut):
					saynn("Without much deliberation, the fluff eagerly slides under the table.. before bringing herself closer to your {pc.feet}.")

				else:
					saynn("The fluff is clearly battling herself, her wide eyes scanning the room.. the very busy room.. But eventually she decides to slide under the table.. and bring herself closer to your {pc.feet}.")

				saynn("She quickly brushes them with her hands, clearing off any dust and dirt.. before giving your {pc.toes} a little lick.. Hah, it tickles, your {pc.foot} recoiling back instinctively. Gently, Artica pulls it back and stuffs her face into it, her snout doing a few good sniffs.. before she starts dragging her canine tongue over the sensitive surface again..")

				saynn("[say=pc]You like it, don't you?[/say]")

				saynn("The girl only yips quietly before parting her lips and allowing some of your {pc.foot} inside, gently sucking on it..")

				saynn("You notice "+str("her shorts getting tight.." if !isNaked else "her cock leaving her sheath..")+" so this must be working.")

				saynn("After she is done worshiping that {pc.foot}.. you lower it and raise another for her to lick. Such a hungry pawslut she is.. Her eyes look so lusty.."+str(" there is a visible wet spot on her shorts where her crotch is.." if !isNaked else " Her member is fully hard and dripping by now..")+"")

				saynn("[say=pc]Good.. Should be enough for now. Don't want you getting too excited.[/say]")

			else:
				playAnimation(StageScene.CheckPaw, "beans", {pc="pc", npc="artica", npcBodyState={hard=true}})
				saynn("Slowly, you raise one of your legs and put it on top of another.. As you do that, you notice Artica's intrigued stare. Her eyes watch you wiggle your {pc.foot}.. her own paws curling as she admires yours.")

				saynn("[say=pc]I'm not stopping you~.[/say]")

				if (isSlut):
					saynn("Without much deliberation, the fluff eagerly slides under the table.. before bringing herself closer to your {pc.feet}.")

				else:
					saynn("The fluff is clearly battling herself, her wide eyes scanning the room.. the very busy room.. But eventually she decides to slide under the table.. and bring herself closer to your {pc.feet}.")

				saynn("She quickly brushes them with her hands, clearing off any dust and dirt.. before proceeding to give them a small massage, her hands gently kneading your {pc.toes}. Feels nice..")

				saynn("[say=pc]You're getting good at it.[/say]")

				saynn("The girl only yips quietly before caressing your {pc.foot} more with her clawed digits, the palms rubbing the underside of it..")

				saynn("You notice "+str("her shorts getting tight.." if !isNaked else "her cock leaving her sheath..")+" so this must be getting her horny.")

				saynn("After she is done worshiping that {pc.foot}.. you lower it and raise another for her to massage. And so she does, her eyes looking so lusty while she is busy giving another massage.."+str(" there is a visible wet spot on her shorts where her crotch is.." if !isNaked else " Her member is fully hard and dripping by now..")+"")

				saynn("[say=pc]Good.. Should be enough for now. Don't want you getting too excited.[/say]")

		saynn("You finish your meals.. and return to the main platform after this.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "stealth_tease"):
		playAnimation(StageScene.PawJobUnderTable, "fast", {npc="pc", pc="artica", pcCum=isLusty, bodyState={hard=true}})
		saynn("The canteen is buzzing with activity as normal.. no one would notice you doing something kinky..")

		if (isLusty):
			var theCockDesc = ("hard cock" if !isCaged else "caged up cock")
			saynn("With a subtle smirk, you extend your leg under the table, reaching out to gently "+str("brush Artica's crotch through the bulging shorts" if !isNaked else "stroke her "+theCockDesc)+" with the sole of your foot.")

			saynn("Artica gasps, her eyes widening in surprise as a red blush spreads across her cheeks. She is squirming in her seat, her breath catching in her throat..")

			saynn("[say=artica]H-hey.. um-m.. ah.. eep.. ah.. ah..[/say]")

			if (isNaked):
				saynn("It doesn't take long for her soft whimpers to be replaced by cute moans, Artica's cock is only getting harder"+str(", the knot filling with blood.." if !isCaged else ".. well, trying to. The chastity cage prevents any kind of erection..")+"")

				saynn("[say=artica]W-wai.. I'm g-gonna.. ah-h.. it's too m-m-muuuch.. ah.ah..h-h~..[/say]")

				saynn("The fluff was horny already.. so this teasing was a little too much for her.")

				saynn("With a gasp of pleasure, Artica's hips bucked involuntarily, her entire body trembling as a powerful orgasm starts rushing through her. More moans escape from her lips as her cock erupts, with hot ropes of cum spurting from its tip and splattering all over the underside of the table..")

			else:
				saynn("It doesn't take long for her soft whimpers to be replaced by cute moans, "+str("the cock in her shorts seems to be getting bigger and bigger, its pulsing knot filling with blood.." if !isCaged else "the locked cock in her shorts seems to be twitching quite a bit, desperately trying to fight the chastity cage..")+"")

				saynn("[say=artica]W-wai.. I'm g-gonna.. ah-h.. it's too m-m-muuuch.. ah.ah..h-h~..[/say]")

				saynn("The fluff was horny already.. so this teasing was a little too much for her.")

				saynn("With a gasp of pleasure, Artica's hips bucked involuntarily, her entire body trembling as a powerful orgasm starts rushing through her. More moans escape from her lips as her cock erupts, with hot ropes of cum spurting from its tip and splattering all over her own shorts and fur.. oops.. maybe you should steal her clothes for her to not get messy from this!")

		else:
			var theCockDesc = ("sheath" if !isCaged else "caged up cock")
			saynn("With a subtle smirk, you extend your leg under the table, reaching out to gently "+str("brush Artica's crotch through the bulging shorts" if !isNaked else "stroke her "+theCockDesc)+" with the sole of your foot.")

			saynn("Artica gasps, her eyes widening in surprise as a red blush spreads across her cheeks. She is squirming in her seat, her breath catching in her throat..")

			saynn("[say=artica]H-hey.. um-m.. ah.. eep.. ah.. ah..[/say]")

			if (isCaged):
				saynn("You keep teasing her drippy cock until it's nice and hard.. well.. as hard as it can be inside of its cute small chastity cage. Better stop here or she will cum and lose her desire.")

			else:
				saynn("You keep teasing her drippy cock until it's nice and hard.. Better stop here or she will cum and lose her desire.")

			if (isSlut):
				saynn("[say=artica]Nh-h.. why d-did you s-stop..[/say]")

				saynn("[say=pc]Because~.[/say]")

			else:
				saynn("[say=artica]Nh-h.. now I'm so.. ah..[/say]")

				saynn("[say=pc]Good.[/say]")

		saynn("After that, you return back to Artica's usual spot.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "go_eat"):
		processTime(15*60)
		GM.pc.afterEatingAtCanteen()
		setFlag("Canteen_PlayerAteToday", true)

	if(_action == "stealth_tease"):
		processTime(6*60)
		if(isLusty):
			getModule("ArticaModule").triggerCorruption(0.01)
			getCharacter("artica").cummedOnBy("artica")
		else:
			getModule("ArticaModule").makeLusty()

	if(_action == "force_crotchsniff"):
		processTime(10*60)
		if(isLusty):
			getModule("ArticaModule").triggerCorruption(0.01)
			getCharacter("artica").cummedOnBy("artica")
		else:
			getModule("ArticaModule").makeLusty()

	if(_action == "tease_offerfoot"):
		processTime(5*60)
		GM.pc.addLust(20)
		if(isLusty):
			getModule("ArticaModule").triggerCorruption(0.02)
			if(isNaked):
				getCharacter("artica").cummedInMouthBy("artica", FluidSource.Penis, 0.4)
			getCharacter("artica").cummedOnBy("artica")
		else:
			getModule("ArticaModule").makeLusty()

	if(_action == "just_nom"):
		processTime(20*60)

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
