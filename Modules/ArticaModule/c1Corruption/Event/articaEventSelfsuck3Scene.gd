extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var straponHasArticaCum = false
var straponHasCum = false

func _init():
	sceneID = "articaEventSelfsuck3Scene"

func _run():
	if(state == ""):
		setFlag("ArticaModule.nextReaction", "s3hap")
		addCharacter("artica")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		GM.pc.setLocation("cellblock_lilac_nearcell")
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		saynn("Artica seems to be heading towards her cell. Looks like someone is horny..")

		saynn("Might as well see what she will do.")

		addButton("Continue", "See what happens next", "artica_selfsucking")
	if(state == "artica_selfsucking"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.SelfSuck, "sex", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("You peek your head inside her cell.. and see that Artica is already on her bed, her legs pulled up high, her spine bent in a perfect arc.")

		if (!isCaged):
			saynn("She is sucking her own cock! Her lips are wrapped around her cyan shaft as she is moving her head, her tongue actively swirling around the member, sending electrifying jolts of pleasure through her body, causing her to curl her toes.")

			saynn("[say=artica]Mmm-m..[/say]")

			saynn("She moans around her cock, so lost in this activity that she doesn't notice your eyes staring at her.")

		else:
			saynn("She is sucking her own cock! Well, as much as her chastity allows it.. Her lips are wrapped around her cage as she is moving her head, her tongue actively swirling around the member inside, sending electrifying jolts of pleasure through her body, causing her to curl her toes.")

			saynn("[say=artica]Mmm-m..[/say]")

			saynn("She moans around her locked cock, so lost in this activity that she doesn't notice your eyes staring at her.")

		addButton("Continue", "See what happens next", "artica_selfsucks_faster")
	if(state == "artica_selfsucks_faster"):
		playAnimation(StageScene.SelfSuck, "fast", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("With a needy muffled whimper, Artica sped up, now thrusting her hips as well, sucking herself off faster.")

		saynn("Somehow, she learned to keep the perfect balance, her hind paws working expertly to counteract her thrusts"+str(", allowing her cock to reach the back of her throat, thanks to her trained flexibility.." if !isCaged else ", allowing her to push more of the cage into her mouth, thanks to her trained flexibility..")+"")

		saynn("Her wet pussy is so exposed in this position.. you bet that it's possible to take advantage of that..")

		addButtonWithChecks("Fuck her", "Join in on the fun", "fuck_artica", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Strapon her", "Join in on the fun", "strapon_artica_pick", [], [[ButtonChecks.HasStraponAndCanWear]])
		addButton("Just watch", "See what happens next", "nofuck_artica_cum")
	if(state == "nofuck_artica_cum"):
		playAnimation(StageScene.SelfSuck, "inside", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("You think that it's best not to startle the horny fluff..")

		if (!isCaged):
			saynn("She is doing so well already anyway, sucking her own throbbing cock so eagerly that her knot is inflating fast and pressing against her lips. Knotting her own mouth in position seems like a very bad idea.. so the fluff just rubs her nose against it, focussing on pleasuring the shaft mostly..")

		else:
			saynn("She is doing so well already anyway, sucking her own throbbing locked cock so eagerly that the trapped shaft is putting some real pressure onto the metal, desperately trying to get hard. The girl keeps thrusting her tongue into any and all holes in the cage, pleasuring herself any way she can..")

		saynn("[say=artica]Mmmhh.. Mmm.. MMmhh!..[/say]")

		saynn("Her body is shivering more and more.. And soon, her own member is erupting in her mouth, shooting thick ropes of white cream down her throat. Artica is swallowing eagerly.. while her bent body is convulsing from the orgasm, her pussy squirting, the weird pose making it way more intense than it has any right to be..")

		saynn("Even after her orgasm begins to fade, the fluff is still moaning softly around her cock, her tongue cleaning the cyan shaft..")

		addButton("Continue", "See what happens next", "artica_walksout")
	if(state == "artica_walksout"):
		addCharacter("artica")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("You just stand outside of her cell, leaning against one of the walls..")

		saynn("After a few minutes, Artica walks out.. and sees you.. her cheeks blush instantly.")

		saynn("[say=artica]Oh.. h.. uh.. um.. h-ha..i..hi..[/say]")

		saynn("[say=pc]Hey there, Artica.[/say]")

		saynn("You cross your arms and smile, only making the girl feel more embarrassed. She knows that you know..")

		saynn("[say=pc]Don't worry, I don't judge. You are one kinky girl though~.[/say]")

		saynn("[say=artica]Um.. T-thanks.. y-yeah.. h-haha..[/say]")

		saynn("She quickly rushes towards her spot.. Her eyes are sparkling.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "fuck_artica"):
		playAnimation(StageScene.SelfSuck, "fuckfast", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Before Artica could react, you were already on her, pinning her in this position, your cock exposed and hard. Her eyes widened in surprise.. but your grip the burning lust in your eyes silenced her protest.")

		saynn("[say=artica]MMMmhmmh![/say]")

		saynn("With a swift thrust, you bury your {pc.penis} deep inside her, making Artica let out a muffled moan around her own"+str(" locked" if isCaged else "")+" cock. The sensation of being stretched so suddenly, combined with the feeling of her own dick in her mouth, was overwhelming. You don't give her any time to just, instead just immediately proceeding to fuck her pussy with raw passion.")

		saynn("Artica's mind was flooded with intense pleasure, her shaky lusty eyes rolling up as she is desperately sucking her own cock.. while your thrusts are making it impossible for her to focus on anything. Her pussy is clenching hard around your shaft, her body eagerly responding to your rough treatment. With each thrust, you were ramming your dick deeper, hitting her g-spot at a perfect angle and making her shiver wildly, legs wrapping around your back and pulling you in with her hind paws..")

		saynn("[say=pc]Such a slut.. Sucking herself off while getting her pussy pounded raw.[/say]")

		var pcHasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		saynn("Her cock is throbbing in her mouth"+str(", the blood pressure making her knot into a fat meaty orb" if !isCaged else " while she is thrusting her tongue in any and all holes of her chastity cage")+". She could feel her climax approach, her body trembling.. and you feel yourself getting close too"+str(", the knot on your cock inflating fast as well" if pcHasKnot else "")+"..")

		addButton("Cum inside", "Breed the eager fluff", "fuck_artica_cum")
	if(state == "fuck_artica_cum"):
		playAnimation(StageScene.SelfSuck, "fuckinside", {pc="artica", npc="pc", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		var pcHasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		saynn("With a final, deep thrust, you ram your cock deep inside,"+str(" knotting that needy pussy," if pcHasKnot else " breaking into her womb,")+" before.. cumming inside. Your shaft is throbbing while pumping her"+str(" busy" if getCharacter("artica").isVisiblyPregnant() else "")+" babymaker full of your hot seed.")

		saynn("[say=artica]MMMHHH-Hhh!..[/say]")

		saynn("She gets all tight around your dick, milking your balls dry.. before cumming herself, her own member erupting in her mouth, shooting thick ropes of white cream down her throat. Artica is swallowing eagerly.. while her bent body is convulsing from the orgasm, the weird pose making it way more intense than it has any right to be..")

		saynn("You finally slow down, your thrusts becoming shallow as you empty the last drops of your seed into Artica's womb. Then you just stay there, your cock buried inside her.. while she is cleaning hers with her tongue.")

		saynn("[say=artica]Mmm-mh..[/say]")

		saynn("Her eyes are so.. cute.. They're sparkling..")

		saynn("[say=pc]Hah.. Looks like you don't need me to feed you anymore.[/say]")

		saynn("[say=artica]..mmm.. mmh..[/say]")

		saynn("[say=pc]Intense, wasn't it?[/say]")

		saynn("[say=artica]mhm..[/say]")

		saynn("You just stay like that for a good few minutes, your bodies pressed together. The room is filled with the scent of sex.. Artica's body is still trembling with the afterglow of her orgasm, her pussy clenching weakly around your cock..")

		addButton("Cuddle", "Spent some time together", "after_sex_cuddle")
	if(state == "after_sex_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="artica", npcBodyState={naked=true,hard=true}})
		saynn("After that raw display of passion.. You decide to pull Artica into some cuddles.")

		saynn("You help her to.. unbend.. and then wrap your hands around her, still on her bed.")

		saynn("[say=artica]Ah..[/say]")

		saynn("[say=pc]How is your back?[/say]")

		saynn("[say=artica]Oh.. it's okay.. it was w-worth it..[/say]")

		saynn("You chuckle and nuzzle her cheek.")

		saynn("[say=pc]You are one kinky girl.[/say]")

		saynn("[say=artica]Y-yeah.. haha.. I am a total slut it seems..[/say]")

		saynn("And so you just cuddle like that for some time before it was time for her to return to her spot.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "strapon_artica_pick"):
		saynn("Pick which strapon you want to use to fuck Artica.")

		addStraponButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "do_put_on_strapon")
	if(state == "strapon_artica_fuck"):
		playAnimation(StageScene.SelfSuck, "fuckfast", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Before Artica could react, you were already on her, pinning her in this position, quickly securing your strapon harness around your waist"+str(", the one that is loaded with a special surprise." if (straponHasArticaCum || straponHasCum) else "")+". Her eyes widened in surprise.. but your grip the burning lust in your eyes silenced her protest.")

		saynn("[say=artica]MMMmhmmh![/say]")

		saynn("With a swift thrust, you bury your rubber toy deep inside her, making Artica let out a muffled moan around her own"+str(" locked" if isCaged else "")+" cock. The sensation of being stretched so suddenly, combined with the feeling of her own dick in her mouth, was overwhelming. You don't give her any time to just, instead just immediately proceeding to fuck her pussy with raw passion.")

		saynn("Artica's mind was flooded with intense pleasure, her shaky lusty eyes rolling up as she is desperately sucking her own cock.. while your thrusts are making it impossible for her to focus on anything. Her pussy is clenching hard around that rubber shaft, her body eagerly responding to your rough treatment. With each thrust, you were ramming that strapon deeper, hitting her g-spot at a perfect angle and making her shiver wildly, legs wrapping around your back and pulling you in with her hind paws..")

		saynn("[say=pc]Such a slut.. Sucking herself off while getting her pussy pounded raw.[/say]")

		saynn("Her cock is throbbing in her mouth"+str(", the blood pressure making her knot into a fat meaty orb" if !isCaged else " while she is thrusting her tongue in any and all holes of her chastity cage")+". She could feel her climax approach, her body trembling..")

		if (straponHasArticaCum):
			saynn("[say=pc]Nhh.. Hope you won't mind what I loaded that strapon with~. It's extra special.[/say]")

			saynn("[say=artica]MMmmhh-?..[/say]")

		elif (straponHasCum):
			saynn("[say=pc]Nhh.. Hope you won't mind what I loaded that strapon with~.[/say]")

			saynn("[say=artica]MMmmhh-?..[/say]")

		addButton("Cum inside", "Breed the eager fluff", "fuck_artica_strapon_cum")
	if(state == "fuck_artica_strapon_cum"):
		playAnimation(StageScene.SelfSuck, "fuckinside", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (straponHasArticaCum || straponHasCum):
			saynn("With a final, deep thrust, you ram that strapon deep inside, breaking into her womb. Her pussy is clenching around it so hard.. that it finally triggers your strapon to start pumping the girl's "+str(" busy" if getCharacter("artica").isVisiblyPregnant() else "")+" babymaker full of hot seed.."+str(" Her own seed.." if straponHasArticaCum else " Someone else's seed..")+"")

		else:
			saynn("With a final, deep thrust, you ram that strapon deep inside, breaking into her womb. You didn't load it with any cum.. but her clenching pussy is still trying to milk it hard..")

		saynn("[say=artica]MMMHHH-Hhh!..[/say]")

		saynn("She gets all tight around your toy.. before cumming herself, her member erupting in her mouth, shooting thick ropes of white cream down her throat. Artica is swallowing eagerly.. while her bent body is convulsing from the orgasm, the weird pose making it way more intense than it has any right to be..")

		saynn("You finally slow down, your thrusts becoming shallow as you go easy on the girl. Then you just stay there, your strapon buried inside her.. while she is cleaning her cock with her tongue.")

		saynn("[say=artica]Mmm-mh..[/say]")

		saynn("Her eyes are so.. cute.. They're sparkling..")

		saynn("[say=pc]Hah.. Looks like you don't need me to feed you anymore.[/say]")

		saynn("[say=artica]..mmm.. mmh..[/say]")

		saynn("[say=pc]Intense, wasn't it?[/say]")

		saynn("[say=artica]mhm..[/say]")

		saynn("You just stay like that for a good few minutes, your bodies pressed together. The room is filled with the scent of sex.. Artica's body is still trembling with the afterglow of her orgasm, her pussy clenching weakly around your rubber shaft.. Time to take it off..")

		addButton("Cuddle", "Spent some time together", "after_sex_cuddle")
func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "do_put_on_strapon", [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "artica_selfsucking"):
		processTime(5*60)

	if(_action == "artica_selfsucks_faster"):
		processTime(3*60)

	if(_action == "fuck_artica"):
		processTime(3*60)

	if(_action == "strapon_artica_pick"):
		processTime(3*60)

	if(_action == "nofuck_artica_cum"):
		processTime(3*60)
		getModule("ArticaModule").triggerCorruption(0.1)
		getCharacter("artica").cummedInMouthBy("artica")

	if(_action == "artica_walksout"):
		processTime(3*60)

	if(_action == "fuck_artica_cum"):
		processTime(3*60)
		getModule("ArticaModule").triggerCorruption(0.1)
		getCharacter("artica").cummedInMouthBy("artica")
		getCharacter("artica").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("artica")

	if(_action == "after_sex_cuddle"):
		GM.pc.unequipStrapon()
		processTime(13*60)

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
		setState("strapon_artica_fuck")
		return

	if(_action == "fuck_artica_strapon_cum"):
		processTime(3*60)
		getModule("ArticaModule").triggerCorruption(0.1)
		getCharacter("artica").cummedInMouthBy("artica")
		getCharacter("artica").cummedInVaginaBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("artica")

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
	data["straponHasArticaCum"] = straponHasArticaCum
	data["straponHasCum"] = straponHasCum

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
	straponHasArticaCum = SAVE.loadVar(data, "straponHasArticaCum", false)
	straponHasCum = SAVE.loadVar(data, "straponHasCum", false)
