extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var isSlave = false
var isFullSlave = false
var isStrapon = false
var pcStrapon = false
var straponHasArticaCum = false
var straponHasCum = false
var pcVag = false

func _init():
	sceneID = "articaPlusRahiScene"

func _run():
	if(state == ""):
		addCharacter("artica")
		addCharacter("rahi")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		isSlave = getModule("RahiModule").isInSlavery()
		isFullSlave = getModule("RahiModule").canTalkInFirstPerson()
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("You tell Artica to head into her cell.. while you go and grab Rahi. You get a feeling that pairing the shy kitty and the shy fluff might lead to something interesting.")

		saynn("[say=rahi]Hang around with Artica? She is fun.. Sounds good.. meow..[/say]")

		saynn("It doesn't take much effort to convince the kitty. So you bring her into Artica's cell too.")

		addButton("Continue", "See what happens next", "in_cell")
	if(state == "in_cell"):
		playAnimation(StageScene.Duo, "stand", {npc="artica", pc="rahi"})
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		GM.pc.setLocation("cellblock_lilac_nearcell")
		saynn("Kitty waves to the"+str(" naked" if isNaked else "")+" lilac girl.")

		saynn("[say=rahi]Hello-o..[/say]")

		saynn("Artica waves back. They're standing near each other.. while you just go sit on a chair, hoping to see a great show.")

		if (isFullSlave):
			saynn("[say=artica]Heyas.. Rahi..[/say]")

		else:
			saynn("[say=artica]Heyas.. Kitty..[/say]")

		saynn("Rahi sees how you just sat in the corner with your legs crossed.. and hums, her sly kitty eyes already begin to make the fluff blush.")

		saynn("[say=artica]What is t-this about..[/say]")

		saynn("[say=rahi]Hmm..[/say]")

		saynn("Artica tilts her head.. while Rahi makes a single step towards her.")

		if (isFullSlave):
			saynn("[say=rahi]I think.. {rahiMaster} here wants to see.. who is the biggest slut out of the two of us..[/say]")

		else:
			saynn("[say=rahi]She thinks.. {pc.name} wants to see.. who is the biggest slut out of the two of us..[/say]")

		saynn("Rahi smiles and looks at you for confirmation. Even though she is an incredibly subby kitty.. subbyness is relative.. A single cat can be both a prey and predator..")

		saynn("What do you want Rahi to do with Artica?")

		addButton("Play", "See what Rahi can do with the fluff", "do_play")
		addButton("Go full out", "(Sex) Let Rahi bully Artica into full submission", "do_fullout")
		addButton("Train sex!", "Have a threesome with Artica in the middle", "do_trainsex")
	if(state == "do_trainsex"):
		playAnimation(StageScene.Duo, "stand", {npc="artica", npcBodyState={naked=true,hard=true}})
		addCharacter("artica", ["naked"])
		saynn("Your gaze sparks with lust.")

		saynn("[say=pc]You know.. I'm actually thinking of double-teaming a certain someone together.[/say]")

		saynn("[say=rahi]Ohh.. Sounds good..[/say]")

		saynn("You get up from the chair and stand in another corner of the room, making it so Artica is now between you and Rahi.. Both your gazes are staring at the slightly confused fluff..")

		saynn("Artica looks around while you just smile. You see how Rahi is bracing, trying to focus on something.")

		saynn("[say=artica]Um.. I.. eek![/say]")

		saynn("Suddenly Rahi steps closer and puts her paws all over the girl,"+str(" forcibly undressing her and then" if !isNaked else "")+" bravely groping and caressing her butt. Artica is moaning and acting incredibly subby while kitty's paws already reach between the herm's legs, finding the cute wet slit and"+str(" the caged up sheath" if isCaged else " the sheath that her cyan member already peeking from")+"..")

		if (isCaged):
			saynn("[say=rahi]That is cute.. Luckily, we won't have to remove the cage..[/say]")

			saynn("[say=artica]Oh?..[/say]")

			saynn("Rahi pulls out a strapon harness.. that she has from somewhere.. and quickly secures it around Artica's waist, putting a rubber cock over her caged one and making sure her slit is still available..")

			saynn("[say=rahi]That is your new cock, stupid slut.. You are now our bitch..[/say]")

		else:
			saynn("[say=rahi]Shut up, stupid slut.. You are now our bitch..[/say]")

		saynn("Rahi is certainly.. very mouthy.. But it seems to work on Artica, the intimidated fluff is shivering.. but also dripping juices all over the floor, the scent of an aroused slutty girl hits your senses..")

		saynn("[say=rahi]You're such a cute little bitch, aren't you?[/say]")

		saynn("Rahi tries to sound dommy, her voice low and husky. She keeps rubbing Artica's"+str(" new rubber" if isCaged else "")+" cock and pussy with slow strokes and rubs, feeling"+str(" her shaft swell and" if !isCaged else " her strapon harness twitching above the cage and")+" her pussy getting more slick under her touch. Artica shivers, her breath hitching..")

		saynn("[say=artica]R-Rahi..[/say]")

		if (isFullSlave):
			saynn("[say=rahi]Miss Rahi. Call me Miss Rahi or I will.. kick your balls![/say]")

		else:
			saynn("[say=rahi]Miss Rahi. Call her Miss Rahi or she will.. kick your balls![/say]")

		saynn("[say=artica]M-Miss Rahi.. ah..[/say]")

		saynn("The fluff is whimpering as Rahi squeezes her balls, the mix of fear and arousal making her tremble.")

		saynn("Artica is gonna be in the middle of a sex train.. But which spot do you want to take?")

		if (GM.pc.hasReachableVagina()):
			addButton("First", "Be the one who is getting fucked by Artica. Rahi will be fucking Artica with a strapon while Artica fucks your pussy", "train_be_first")
		else:
			addButton("First", "Be the one who is getting fucked by Artica. Rahi will be fucking Artica with a strapon while Artica fucks your ass", "train_be_first")
		if (GM.pc.hasReachablePenis() || (GM.pc.hasStrapons() && GM.pc.canWearStrapon())):
			addButton("Last", "Be the one who is fucking Artica. Rahi will be getting fucked by Artica while you fuck Artica", "train_be_last")
		else:
			addDisabledButton("Last", "You don't have any strapons to fuck Artica while she fucks Rahi..")
	if(state == "be_last_pickstrapon"):
		saynn("Pick which strapon you want to use to fuck Artica.")

		addStraponButtons("be_last_addstrapon_pc")
		if (false):
			addButton("Nope", "You shouldn't see this", "be_last_addstrapon_pc")
	if(state == "train_be_last"):
		playAnimation(StageScene.SexTrain, "tease", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="pc", npc2BodyState={naked=true,hard=true}})
		saynn("You twirl your finger while looking at Rahi.. and she understands everything.")

		saynn("[say=rahi]Kneel![/say]")

		if (!pcStrapon):
			saynn("Together, you forcibly bring Artica onto her knees. You position yourself behind, your hands gripping Artica's hips, keeping her still.")

		else:
			saynn("Together, you forcibly bring Artica onto her knees. You quickly secure a strapon harness around your waist and position yourself behind, your hands gripping Artica's hips, keeping her still.")

		saynn("Rahi grabs Artica's chin.. and makes the fluff look up at her.. as she undresses, dropping her shorts and shirt, exposing her {rahi.breasts} and cute pink pussy.. Artica gulps audibly.")

		saynn("[say=rahi]We're gonna use you.. like the stupid slutty fucktoy that you are..[/say]")

		saynn("Rahi then turns around and gets on all fours, her pussy wet and ready.. She reaches one of her hands out to guide Artica's "+str("rubber canine cock" if isStrapon else "canine cock")+" into her slick entrance.. while you put pressure on her back from behind, preventing her from escaping but also aligning your "+str("own cock" if !pcStrapon else "rubber cock")+" with her cyan cunt and letting it rub against her wet sensitive folds.."+str(" Little did she know, your toy is loaded with a surprise.." if (straponHasCum || straponHasArticaCum) else "")+""+str(" very big surprise.." if straponHasArticaCum else "")+"")

		if (isFullSlave):
			saynn("[say=rahi]Fuck me.. you little whore.[/say]")

		else:
			saynn("[say=rahi]Fuck her.. you little whore.[/say]")

		saynn("[say=artica]Eek.. I.. oh..[/say]")

		saynn("Rahi growls, trying to maintain her dom persona. All the while Artica is sandwiched between you two, her body shivering from the overwhelming sensations coming from both ends..")

		addButton("Thrust!", "Start fucking the fluff", "behind_do_thrust")
	if(state == "behind_do_thrust"):
		playAnimation(StageScene.SexTrain, "sex", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="pc", npc2BodyState={naked=true,hard=true}})
		saynn("With a fast thrust, you enter Artica, ramming your "+str("cock" if !pcStrapon else "strapon")+" down her slit and eliciting a sharp gasp from her. As your hips collide with Artica's butt, it makes her thrust her hips forward too, causing her"+str(" rubber" if isStrapon else "")+" cock to part Rahi's pussy folds wide and slide inside..")

		saynn("[say=artica]EEP-.. nhh..[/say]")

		saynn("[say=rahi]Ah..[/say]")

		saynn("As Artica recoils from your thrust, you meet her ass with another, pounding her pussy raw.. while she, in turn, fucks Rahi.")

		saynn("[say=rahi]You like this, don't you, slut? Being used like.. the bitch that you are? Ah..[/say]")

		saynn("Artica's response is just a series of whimpers and moans, her body betraying her as her arousal skyrockets, her"+str(" rubber member getting squeezed tightly by Rahi's pussy.. and she somehow feels it.." if isStrapon else " canine member getting squeezed tightly by Rahi's pussy..")+"")

		addButton("Faster", "Thrust faster", "behind_faster")
	if(state == "behind_faster"):
		playAnimation(StageScene.SexTrain, "fast", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="pc", npc2BodyState={naked=true,hard=true}})
		saynn("Gradually, you increase the pace, thrusting down that cyan slit harder while your grip on her hips is tightening. You lean in closer to her ear and whisper..")

		saynn("[say=pc]You're such a good girl, Artica.. Take it all..[/say]")

		saynn("[say=artica]Nyahh..[/say]")

		if (!pcStrapon):
			saynn("..and instantly feel her pussy clench around your cock.")

		else:
			saynn("..and instantly feel her pussy tugging on your strapon more, walls clenching around it, increasing friction.")

		if (isFullSlave):
			saynn("[say=rahi]Ah.. You're gonna knot my pussy, slut, you hear? Your whole cock is going inside me.. or I'm gonna.. ah.. g-gonna.. s-step.. ah..[/say]")

		else:
			saynn("[say=rahi]Ah.. You're gonna knot her pussy, slut, you hear? Your whole cock is going inside her.. or she is gonna.. ah.. g-gonna.. s-step.. ah..[/say]")

		saynn("The cell is filled with the sounds of your bodies moving together, mixed with all the moans and gasps of pleasure. Artica was lost in the sensations, her mind probably a complete haze from submission and lust. As you continue to fuck her clenching pussy, Rahi also picks up the pace and impales herself on Artica's cock harder and faster.. her pink folds slapping against the"+str(" growing" if !isStrapon else " fat rubber")+" knot..")

		addButton("Continue", "See what happens next..", "behind_cum")
	if(state == "behind_cum"):
		playAnimation(StageScene.SexTrain, "inside", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="pc", npc2BodyState={naked=true,hard=true}})
		saynn("With a final, desperate thrust, Rahi manages to knot herself on Artica's cock, the sudden spike of pleasure sending them both over the edge!")

		saynn("[say=rahi]Myaa-ah..[/say]")

		if (isStrapon):
			saynn("Rahi is shaking while Artica's cock is throbbing.. inside of its little cage.. cum leaking from under Artica's strapon harness as her pussy clenches around your"+str(" rubber" if pcStrapon else "")+" cock, trying to milk it.."+str(" and succeeding.." if (!pcStrapon || straponHasCum || straponHasArticaCum) else "")+"")

		else:
			saynn("Rahi is shaking while Artica's cock is throbbing and pulsing, flooding the cat's womb full of her seed.. At same time, Artica's pussy clenches around your"+str(" rubber" if pcStrapon else "")+" cock, trying to milk it.. "+str(" and succeeding.." if (!pcStrapon || straponHasCum || straponHasArticaCum) else "")+"")

		if (!pcStrapon):
			saynn("You groan and throw your hips forward, ramming your {pc.penis} deep inside and breaking into Artica's babymaker.. before pumping it full of your {pc.cum}.. The intensity of this rough treatment pushed Artica deeper into the abyss of pleasure, her entire body shaking between you and Rahi..")

		else:
			saynn("Eager to enhance this moment, you throw your hips forward, ramming your toy deep inside and breaking into Artica's babymaker.."+str(" before pumping it full of cum, your strapon releasing its load inside" if (straponHasCum && !straponHasArticaCum) else "")+""+str(" before pumping it full of Artica's cum, your strapon releasing its load inside" if (straponHasArticaCum) else "")+".. The intensity of this rough treatment pushed Artica deeper into the abyss of pleasure, her entire body shaking between you and Rahi..")

		saynn("Rahi, who was equally overwhelmed by this, her pussy squirting, producing a fountain of juices, milking Artica's"+str(" fake" if isStrapon else "")+" cock while the room echoing with her moans, her legs shaking wildly.")

		saynn("As you all begin to come down from your highs, you continue to hold Artica gently, your "+str("member" if !pcStrapon else "toy")+" inside her.. while her"+str(" rubber" if isStrapon else "")+" member is inside Rahi..")

		saynn("[say=rahi]Ah.. f-feels so good.. h-hh..[/say]")

		saynn("[say=artica]Hhhnnhh.. mhhh..[/say]")

		saynn("[say=pc]You two are so cute.[/say]")

		saynn("[say=rahi]N-no.. y-you..[/say]")

		addButton("Continue", "See what happens next", "aftercuddle")
	if(state == "aftercuddle"):
		playAnimation(StageScene.Sleeping, "sleep", {pc="rahi", npc="artica", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("After so much fun.. you let the girls cuddle together. Rahi is licking Artica's ear.. while the white fluff moans softly.")

		saynn("Who knew that they would get along so well.")

		saynn("You join the cuddle pile and spend some time together with them..")

		saynn("But soon it was time to go..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "train_be_first"):
		addCharacter("rahi", ["naked"])
		pcVag = GM.pc.hasReachableVagina()
		playAnimation(StageScene.Duo, "kneel", {pc="artica", npc="rahi", bodyState={naked=true,hard=true}, npcBodyState={naked=true,hard=true}})
		saynn("You nod towards Rahi and Artica's tail.. and the kitty understands everything.")

		saynn("[say=rahi]Kneel![/say]")

		saynn("You and Rahi forcibly bring Artica to her knees.")

		saynn("[say=artica]Eep..[/say]")

		saynn("The feline then stands in front of her, undressing and revealing her {rahi.breasts} and a cute pink pussy. But she isn't just stripping for the heck of it, Rahi suddenly pulls out"+str(" another" if isStrapon else "")+" strapon.. and takes her time, carefully sliding the short end down her wet exposed slit, securing it that way.."+str(" Where is she getting so many toys from anyway.." if isStrapon else "")+"")

		saynn("Artica bites her lip, her eyes darting between Rahi and her new shiny knotted toy..")

		saynn("[say=rahi]Lick it, you.. useless whore. Unless you want your cunt bruised.[/say]")

		saynn("[say=artica]Y-yes.. M-Miss Rahi..[/say]")

		saynn("Artica leans in closer and flicks her cyan tongue out, dragging it along that shiny cock, coating it with her saliva, her tail swaying anxiously behind her as she sees Rahi's mean eyes.")

		if (isStrapon):
			saynn("Artica's own strapon is twitching as the locked away cock is trying to get hard under it..")

		else:
			saynn("Artica's cock is hard and dripping..")

		saynn("[say=rahi]Such a good little whore.. Right?.. meow..[/say]")

		saynn("Artca is stammering, her cheeks blushing brightly.")

		saynn("[say=artica]Y-yes.. I'm y-your whore, M-Miss R-Rahi..[/say]")

		saynn("[say=rahi]Now..[/say]")

		saynn("You were watching Rahi trying to be dominant with a smirk. But now it was time for you to have some fun too..")

		addButton("All fours", "Get on all fours in front of Artica", "first_tease")
	if(state == "first_tease"):
		playAnimation(StageScene.SexTrain, "tease", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="rahi", npc2BodyState={naked=true,hard=true}})
		saynn("Rahi moves behind Artica, her paws pulling her tail high and then giving her a firm spank.")

		saynn("[say=rahi]Ready to be fucked, bitch?[/say]")

		saynn("At the same time, you position yourself in front of the fluff, getting on all fours, your "+str("pussy" if pcVag else "tailhole")+" already brushing against "+str("the tip of Artica's strapon" if isStrapon else "the tip of Artica's cock")+".. You have your hand on her shaft.. guiding it..")

		saynn("[say=pc]And you will be fucking me too, Artica. "+str("Filling me with your seed like a good girl" if !isStrapon else "Like a good girl")+".[/say]")

		saynn("[say=artica]Eek.. I.. t-this is.. nnhh..[/say]")

		saynn("Sandwiched between you and Rahi, Artica is squirming softly, unsure how to react.. but not for long.")

		addButton("Continue", "See what happens next", "front_sex")
	if(state == "front_sex"):
		playAnimation(StageScene.SexTrain, "sex", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="rahi", npc2BodyState={naked=true,hard=true}})
		saynn("Rahi quickly aligns herself with Artica's pussy.. teasing the slick entrance.. before she throws her hips forward!")

		saynn("[say=artica]Ah!..[/say]")

		saynn("The rubber strapon spreads her slit wide.. while the impact of Rahi's hips on her butt makes her thrust forward too, her "+str("{artica.penis}" if !isStrapon else "strapon")+" parting your "+str("folds" if pcVag else "anal star")+" and burying itself deep inside you soon after.")

		saynn("[say=pc]Mmm~..[/say]")

		saynn("[say=rahi]Take it.. you slut..[/say]")

		saynn("Rahi growls and pulls the toy out before ramming it in again, her voice hitching slightly as the strapon is rubbing against her inner walls each time.")

		saynn("[say=rahi]You l-love being fucked like this, don't you..[/say]")

		saynn("At the same time, you meet Artica's"+str(" rubber" if isStrapon else "")+" cock with your own motions, impaling your eager "+str("pussy" if pcVag else "asshole")+" onto that veiny shaft, getting it stretched more.."+str(" Your hard cock is dripping pre as your buttons are being stimulated nicely.." if GM.pc.hasReachablePenis() else "")+""+str(" Your caged up cock is dripping pre as your button are being stimulated nicely.." if GM.pc.isWearingChastityCage() else "")+"")

		saynn("[say=artica]Y-yes.. I l-love b-being your whore.. ah..[/say]")

		addButton("Faster", "Really hump that cock", "front_faster")
	if(state == "front_faster"):
		playAnimation(StageScene.SexTrain, "fast", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="rahi", npc2BodyState={naked=true,hard=true}})
		saynn("Your moans grow louder, your "+str("pussy" if pcVag else "tailhole")+" hugging that cock tightly.."+str(" You feel the knot near the base of her shaft growing fast and juicy.. and so you keep trying to fit it in.." if isStrapon else " You feel the knot near the base of her rubber shaft.. and so you keep trying to fit it in..")+"")

		saynn("[say=pc]Knot me, Artica. I want to feel your knot inside me.. ah..[/say]")

		saynn("Poor fluff is squirming a lot.. So Rahi puts her paw on her hair and yanks on it.")

		saynn("[say=rahi]You heard {pc.him}, whore..[/say]")

		saynn("Artica obeys as much as she can, "+str("fucking" if pcVag else "pegging")+" you while she is getting fucked herself, Rahi's strapon was pounding her pussy hard..")

		saynn("And she wasn't gonna stop, kitty's pace only quickened, her panting unable to hide her own moans anymore as the feeldoe strapon is pushing on her own pleasure spot quite well. She doesn't stop trying to fit the whole thing in, her toy also has the knot..")

		saynn("[say=rahi]Mhh.. ah.. f-fuck.. Take it all, b-bitch.. p-please..[/say]")

		saynn("[say=artica]Ahh-h.. g-gods.. t-too m-muuch.. ah..[/say]")

		saynn("You feel close..")

		addButton("Continue", "See what happens next", "front_cum")
	if(state == "front_cum"):
		playAnimation(StageScene.SexTrain, "inside", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="rahi", npc2BodyState={naked=true,hard=true}})
		saynn("Rahi got a good grip on Artica's hair.. and then.. with one final push.. forces her whole knotted shaft inside, stretching that pussy to its maximum.. and beyond..")

		saynn("[say=artica]Ahh-hh!.. S-so b-big.. ah..[/say]")

		saynn("The friction finally pushes Rahi over the edge, her own slit pulsing around the feeldoe strapon as she cums, her pussy juices gushing all over Artica's legs..")

		saynn("[say=rahi]Ah.. nyaah..[/say]")

		if (!isStrapon):
			saynn("The rough thrust forces the fluff to throw her hips forward.. just when you were meeting her cock.. the immense amount of pressure results in Artica's"+str(" rubber" if isStrapon else "")+" knot popping inside you! Both you and Artica cum hard, her cock shooting rope after rope of spunk inside your "+str("womb" if pcVag else "ass")+".. while Rahi's strapon is filling her with some kind of cumlube..")

		else:
			saynn("The rough thrust forces the fluff to throw her hips forward.. just when you were meeting her cock.. the immense amount of pressure results in Artica's"+str(" rubber" if isStrapon else "")+" knot popping inside you! Both you and Artica cum hard, her cock shooting rope after rope of spunk.. into her chastity cage.. while Rahi's strapon is filling her with some kind of cumlube..")

		saynn("[say=pc]Ah.. so much..[/say]")

		saynn("The cell is filled with moans and a strong scent of sex as the three of you go through your orgasmic state.. your bodies rubbing against each other as the ecstatic waves cause random muscles to tense up..")

		saynn("[say=rahi]Such a.. s-such a.. h-huff.. ah..[/say]")

		saynn("Rahi is struggling to stay to dommy, her soft nature makes her hug Artica.")

		saynn("[say=artica]Nhh-h.. ahh-h.. t-thank.. y-you.. M-Miss Rahi.. and {pc.name}.. I'm.. s-such a s-slut..[/say]")

		saynn("[say=rahi]Me-eow-w..[/say]")

		saynn("[say=pc]You two are so cute.[/say]")

		saynn("[say=rahi]N-no.. y-you..[/say]")

		addButton("Continue", "See what happens next", "aftercuddle")
func addStraponButtons(nextstateid):
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), nextstateid, [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_cell"):
		processTime(3*60)

	if(_action == "do_trainsex"):
		getCharacter("artica").getInventory().equipItem(GlobalRegistry.createItem("StraponCanine"))
		isStrapon = true

	if(_action == "train_be_first"):
		processTime(3*60)
		var strapon = GlobalRegistry.createItem("StraponFeeldoe")
		strapon.getFluids().addFluid("CumLube", RNG.randi_range(2, 5)*RNG.randf_range(80.0, 100.0))
		getCharacter("rahi").getInventory().forceEquipStoreOtherUnlessRestraint(strapon)

	if(_action == "train_be_last"):
		processTime(3*60)
		if(!GM.pc.hasReachablePenis()):
			setState("be_last_pickstrapon")
			return

	if(_action == "be_last_addstrapon_pc"):
		processTime(2*60)
		pcStrapon = true
		var strapon = _args[0]
		GM.pc.getInventory().removeItem(strapon)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		var theFluids = strapon.getFluids()
		if(theFluids != null):
			if(theFluids.hasFluidTypeWithCharID("Cum", "artica")):
				straponHasArticaCum = true
			if(theFluids.hasFluidType("Cum")):
				straponHasCum = true
		setState("train_be_last")
		return

	if(_action == "behind_do_thrust"):
		processTime(3*60)

	if(_action == "behind_faster"):
		processTime(3*60)

	if(_action == "behind_cum"):
		processTime(3*60)
		if(!isStrapon):
			getCharacter("rahi").cummedInVaginaBy("artica")
		if(pcStrapon):
			getCharacter("artica").cummedInVaginaBy("pc", FluidSource.Strapon)
		else:
			getCharacter("artica").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("artica")

	if(_action == "aftercuddle"):
		processTime(10*60)
		getCharacter("artica").removeStrapon()
		GM.pc.unequipStrapon()
		getCharacter("rahi").removeStrapon()

	if(_action == "first_tease"):
		processTime(3*60)

	if(_action == "front_sex"):
		processTime(3*60)
		if(pcVag):
			GM.pc.gotVaginaFuckedBy("artica")
		else:
			GM.pc.gotAnusFuckedBy("artica")

	if(_action == "front_faster"):
		processTime(3*60)

	if(_action == "front_cum"):
		processTime(5*60)
		if(pcVag):
			GM.pc.gotVaginaFuckedBy("artica")
			if(!isStrapon):
				GM.pc.cummedInVaginaBy("artica")
		else:
			GM.pc.gotAnusFuckedBy("artica")
			if(!isStrapon):
				GM.pc.cummedInAnusBy("artica")
		getCharacter("artica").cummedInVaginaBy("rahi", FluidSource.Strapon)

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
	data["isSlave"] = isSlave
	data["isFullSlave"] = isFullSlave
	data["isStrapon"] = isStrapon
	data["pcStrapon"] = pcStrapon
	data["straponHasArticaCum"] = straponHasArticaCum
	data["straponHasCum"] = straponHasCum
	data["pcVag"] = pcVag

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
	isSlave = SAVE.loadVar(data, "isSlave", false)
	isFullSlave = SAVE.loadVar(data, "isFullSlave", false)
	isStrapon = SAVE.loadVar(data, "isStrapon", false)
	pcStrapon = SAVE.loadVar(data, "pcStrapon", false)
	straponHasArticaCum = SAVE.loadVar(data, "straponHasArticaCum", false)
	straponHasCum = SAVE.loadVar(data, "straponHasCum", false)
	pcVag = SAVE.loadVar(data, "pcVag", false)
