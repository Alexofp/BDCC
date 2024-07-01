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
			saynn("[say=rahi]I think.. {rahiMaster} here wants to see something.. meow..[/say]")

		else:
			saynn("[say=rahi]She thinks.. {pc.name} wants to see something.. meow..[/say]")

		saynn("Rahi smiles and looks at you for confirmation. Artica looks at you too, unsure what to do..")

		saynn("What do you want them to do?")

		addButton("Play", "Let them play together and figure out who is the biggest slut", "do_play")
		if (getFlag("ArticaModule.rewardNotFirst", false)):
			addButton("Go full out", "(Sex) Let Rahi bully Artica into full submission", "do_fullout")
			addButton("Train sex!", "Have a threesome with Artica in the middle", "do_trainsex")
		else:
			addDisabledButton("Go full out", "This would be too much for the first time..")
			addDisabledButton("Train sex!", "This would be way too much for the first time..")
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
		playAnimation(StageScene.SexTrain, "inside", {pc="artica", npc="rahi", pcCum=true, npcCum=true, npc2Cum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="pc", npc2BodyState={naked=true,hard=true}})
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
		saynn("Your moans grow louder, your "+str("pussy" if pcVag else "tailhole")+" hugging that cock tightly.."+str(" You feel the knot near the base of her shaft growing fast and juicy.. and so you keep trying to fit it in.." if !isStrapon else " You feel the knot near the base of her rubber shaft.. and so you keep trying to fit it in..")+"")

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
		playAnimation(StageScene.SexTrain, "inside", {pc="artica", npc="pc", pcCum=true, npcCum=true, npc2Cum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="rahi", npc2BodyState={naked=true,hard=true}})
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
	if(state == "do_play"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", pc="artica"})
		saynn("You shrug at their gazes.")

		saynn("[say=pc]So, I know that you two are total bottoms..[/say]")

		saynn("They both pout at you like you just called them something bad.")

		saynn("[say=pc]But I think one of you is more subby than the other.[/say]")

		saynn("[say=artica]I'm not.. tha-a-at.. subby.. I can be the top.. I think..[/say]")

		saynn("Rahi hears speech full of unsure undertones that and chuckles softly.")

		if (isFullSlave):
			saynn("[say=rahi]Well.. why don't you try your skills on me then.. meow..[/say]")

		else:
			saynn("[say=rahi]Well.. why don't you try your skills on her then.. meow..[/say]")

		saynn("The environment is fully controlled by you.. so why not. "+str("Naked " if isNaked else "")+"Artica clears her throat.. and takes a step closer to Rahi, their noses almost touching now..")

		saynn("[say=artica]Um.. bend over.. w-wait.. t-take your clothes off first.. like a.. um..[/say]")

		saynn("It was honestly cute. Rahi listens to Artica's orders and nods-nods.. but doesn't act.")

		saynn("[say=artica]W-why didn't you..[/say]")

		if (isFullSlave):
			saynn("[say=rahi]Make me?[/say]")

		else:
			saynn("[say=rahi]Make her?[/say]")

		saynn("Artica blinks a lot.. Being so close to the cute kitty is making her blush, her body swaying a bit, her tail wrapping around her waist..")

		saynn("[say=artica]Um.. do it or I w-will.. um.. hah.. um..[/say]")

		saynn("Rahi is getting tired of that.. she suddenly darts her paw out and grabs Artica by the short hair.")

		if (isFullSlave):
			saynn("[say=rahi]Alright, you whore. You are the most subby soft slut that I have ever seen I think.. Stand still now.[/say]")

		else:
			saynn("[say=rahi]Alright, you whore. You are the most subby soft slut that she has ever seen, she thinks.. Stand still now.[/say]")

		saynn("The sudden switch makes Artica's eyes widen, a flash of fear and arousal going through them. She tries to stand her ground, to assert herself.. but only realizes that she is doing exactly what Rahi told her to do.")

		saynn("[say=artica]Eep.. h-hey..[/say]")

		addButton("Continue", "See what happens next", "play_rahi_undresses_artica")
	if(state == "play_rahi_undresses_artica"):
		playAnimation(StageScene.Grope, "grope", {pc="artica", npc="rahi"})
		if (isNaked):
			saynn("Rahi's other paw boldly lands on Artica's naked body and begins exploring it, her clawed digits going over the sides, following the fancy fur pattern..")

		else:
			saynn("Rahi's other paw boldly slips into Artica's shirt and begins exploring her body, her clawed digits going over the sides, following the fancy fur pattern..")

		saynn("[say=rahi]Meow? You are not subby? Prove it already..[/say]")

		saynn("Even though Rahi is an incredibly subby kitty herself.. subbyness seems to be relative.. A single cat can be both a prey and predator it seems.. huh.")

		saynn("Artica tries to pull Rahi's paws off of her hair and body.. but the kitty just keeps returning them to where they were, now squeezing Artica's butt and fondling her nice"+str(" swollen" if getCharacter("artica").isLactating() else "")+" tits..")

		saynn("[say=artica]Eep..[/say]")

		saynn("Eventually Artica gives up and lets the feline grope and rub her, Rahi's paws quickly finds her wet needy slit and a"+str(" sheath that houses a half-hard canine cock.." if !isCaged else " sheath that is protected by a metal chastity cage..")+"")

		if (isCaged):
			saynn("[say=rahi]You thought you could top the kitty with that?.. It's very cute..[/say]")

		else:
			saynn("[say=rahi]You are awfully wet for someone who thought they could top the kitty..[/say]")

		saynn("Artica's ears turn down, the commanding presence of Rahi somehow making her shiver.")

		saynn("[say=artica]Eek.. w-what d-do you want me to d-do..[/say]")

		saynn("Her voice barely above a whisper.")

		saynn("[say=rahi]Get on your knees already, you.. stupid fucking bitch! Yeah..[/say]")

		saynn("Such a mouthy cat.. Things are quickly getting interesting..")

		addButton("Continue", "See what happens next", "play_artica_knees")
	if(state == "play_artica_knees"):
		playAnimation(StageScene.Duo, "kneel", {pc="artica", npc="rahi", bodyState={hard=true}})
		saynn("Artica hesitates for a moment.. but feeling Rahi's claws near her nips and balls makes her sink to her knees fast, her cheeks flushing with both embarrassment.. and something else.")

		saynn("Kitty smiles.. and then hums, unsure what to do next. She looks down at herself and gasps.")

		if (isFullSlave):
			saynn("[say=rahi]Lick my pussy, you slut. And make a good job of it. I'm not Rahi.. I'm a Miss Rahi now..[/say]")

		else:
			saynn("[say=rahi]Lick her pussy, you slut. And make a good job of it. She is not kitty.. She is.. Miss Rahi now..[/say]")

		saynn("Artica tilts her head, confused at that order. Rahi is quickly getting impatient, she grabs Artica's hair again.. before pushing her face into her crotch, the fluff's snout is pressed directly against Rahi's shorts..")

		saynn("[say=rahi]Do it already..[/say]")

		saynn("Artica whines.. She is panting warmly against Rahi's crotch making her squirm a bit.. But then she finally flicks her long canine tongue out.. and proceeds to drag it over the cloth, trying to find where the sensitive folds are..")

		saynn("[say=rahi]P-pathetic.. that's what you call licking?.. Harder, you.. stupid whore..[/say]")

		saynn("A curiosity makes you delve in and ask something..")

		saynn("[say=pc]Why do you cuss so much, kitty?[/say]")

		saynn("Rahi momentarily snaps out of it, her ears turning down.")

		saynn("[say=rahi]Um.. i-isn't that how you dominate.. meow..[/say]")

		saynn("Fair enough.. It's certainly one way to dom.. You nod and let them continue.")

		saynn("It seems this rough way to domming is doing tricks with Artica's mind.. She obediently laps at Rahi's pussy through the shorts with increased pressure, shivering while her own arousal grows fast.."+str(" canine cock bulging her own shorts.." if (!isNaked && !isCaged) else "")+""+str(" canine cock standing fully hard and dripping pre.." if (isNaked && !isCaged) else "")+""+str(" her locked away canine cock dripping pre.." if isCaged else "")+"")

		saynn("[say=rahi]Ah.. nyaa-ah..[/say]")

		saynn("Rahi grabs onto Artica's hair more and moans softly, the cloth becoming wet exactly where her slick needy flower is..")

		saynn("[say=rahi]N-not s-so fast.. s-silly.. ah.. kitty is g-gonna..[/say]")

		saynn("Suddenly Rahi stands high on her toes, a sudden wave of pleasure rushing through her.. while Artica keeps licking obediently, her tongue following the outline of the pulsing pussy.. her paws sliding under Rahi's hind paws and gently massaging the paw pads..")

		saynn("[say=rahi]Ahh-h.. e-easy.. ah..[/say]")

		saynn("Finally, Rahi manages to push Artica back.. Fluff's subby eyes are sparkling brightly..")

		saynn("[say=rahi]G-good w-whore.. n-now..[/say]")

		addButton("Continue", "See what happens next", "play_onfloor")
	if(state == "play_onfloor"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.SexPawjob, "tease", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}})
		saynn("Rahi notices Artica's interest in hind paws.. and smirks.")

		saynn("[say=rahi]You want to cum now, don't you, soft little bitch?..[/say]")

		saynn("[say=artica]M-m.. m-maybe.. y-yea.. mmhh..[/say]")

		if (isCaged):
			saynn("Artica's hands reach for her chastity cage.. but Rahi is quick to slap them away.. with her legs.")

		else:
			saynn("Artica's hands reach for her hard twitching cock.. but Rahi is quick to slap them away.. with her legs.")

		saynn("[say=rahi]Nu huh.. You will cum like a.. like a pathetic slut that you are.. only from k-kitty's touch.[/say]")

		if (isCaged):
			saynn("For some reason, Rahi goes and quickly grabs a strapon harness.. that she puts it on Artica, securing a rubber canine cock over her locked away real one..")

			saynn("[say=rahi]This is your cock now..[/say]")

			saynn("Rahi gets down on the floor.. and presents her hind paws to Artica in full their glory, her toes curling near the "+str("rubber " if isCaged else "")+" canine cock.. Artica's mouth watering as she watches..")

		else:
			saynn("Rahi gets down on the floor.. and presents her hind paws to Artica in full their glory, her toes curling near the "+str("rubber " if isCaged else "")+" canine cock.. Artica's mouth watering as she watches..")

		saynn("[say=artica]M-may I.. um.. M-Miss Rahi..[/say]")

		saynn("Rahi shakes her head.")

		saynn("[say=rahi]You can do better than that..[/say]")

		addButton("Continue", "See what happens next", "play_rahistrokes_begin")
	if(state == "play_rahistrokes_begin"):
		playAnimation(StageScene.SexPawjob, "sex", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}})
		saynn("Rahi's hind paws move to stroke Artica's cock.. pawpads wrapping the "+str("rubber" if isCaged else "veiny")+" shaft.. and going up and down along, her toes squeezing and rubbing the"+str(" sensitive flesh" if !isCaged else "shiny fake member")+".. "+str("Even though Rahi is only teasing a strapon, the visuals alone make Artica moan, her body trembling.." if isCaged else "As Rahi teases the cyan cock, Artica can't help but to moan, her body trembling..")+"")

		saynn("[say=rahi]You want faster?.. Beg..[/say]")

		saynn("[say=artica]Mmmhh-hh.. p-please.. it f-feels so good..[/say]")

		saynn("Rahi tilts her head.")

		if (isFullSlave):
			saynn("[say=rahi]Speak up, slut.. I can barely hear you..[/say]")

		else:
			saynn("[say=rahi]Speak up, slut.. Kitty can barely hear you..[/say]")

		saynn("Rahi slows down on purpose, barely stroking the cock now..")

		saynn("[say=artica]Mm..M-Miss Rahi.. Ma-ay you p-please.. ff..faster..[/say]")

		saynn("Artica whines and tries to hump those paws, shoving her cock in-between.. but Rahi just spreads her legs when that happens, giggling seeing the desperate fluff squirm..")

		saynn("[say=artica]Please.. hh-h.. I'm a s-slut..[/say]")

		if (isFullSlave):
			saynn("[say=rahi]Slut for my paws?[/say]")

		else:
			saynn("[say=rahi]Slut for her paws?[/say]")

		saynn("Artica nods-nods.."+str(" Her neglected cock twitching.. until Rahi wraps her hind paws around it again and begins stroking it.. slowly.." if !isCaged else " Her strapon is twitching as the caged cock underneath it pushes on the harness.. until Rahi wraps her hind paws around the rubber shaft and begins stroking it.. slowly..")+"")

		saynn("[say=artica]I'm.. a total pawslut.. ah.. d-dirty little paw b-bitch.. p-please..[/say]")

		saynn("[say=rahi]Oki~.[/say]")

		saynn("Rahi suddenly stops, making Artica squirm harder.")

		saynn("[say=artica]..M-miss Rahi?..[/say]")

		saynn("[say=rahi]Do it yourself.. pawslut.. meow..[/say]")

		saynn("Kitty presents her hind paws to Artica.. and nods-nods to her confused stare.")

		addButton("Continue", "See what happens next", "play_artica_cums")
	if(state == "play_artica_cums"):
		playAnimation(StageScene.SexPawjob, "thrustfast", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}})
		saynn("Artica blushes deeply.. but she does obey, carefully putting her hands on Rahi's ankles.. and then thrusting between them, her lips producing a cute moan..")

		saynn("[say=rahi]T-there you go.. as fast as you want..[/say]")

		saynn("[say=artica]Y-yes.. M-Miss Rahi.. hh-hmm..[/say]")

		saynn("The fluff quickly picks up the pace, sliding her"+str(" pulsing" if !isCaged else " fake")+" member between Rahi's paws at a faster pace.. while the kitty just admires the view..")

		if (isCaged):
			saynn("Even though Artica's actual cock isn't being stimulated at all, the fluff somehow finds stimulation in this.. She moans louder and more passionate..")

		else:
			saynn("The cyan knot begins to inflate quickly.. Artica's cock is already throbbing.. She moans louder and more passionate..")

		saynn("[say=artica]I'm.. I'm g-gon.. ahhh!..[/say]")

		if (isCaged):
			saynn("..and then rams the knotted strapon through the hole between Rahi's hind paws.. letting them squeeze the fat rubber orb.. while she can't hold back anymore.. Artica cums hard, her whole body arching as cum begins oozing from under her strapon harness, her locked cock shooting cum into own sheath and chastity cage..")

			saynn("[say=rahi]You're making such a mess on the floor, whore.. Y-You will have to clean that..[/say]")

		else:
			saynn("..and then rams the knotted member through the hole between Rahi's hind paws.. letting them squeeze her fat juicy orb so tightly that she can't hold back anymore.. Artica cums hard, her twitching member releasing thick strings of cum.. all of them landing on Rahi's uniform and the exposed parts of her fur..")

			saynn("[say=rahi]Eek.. you messy whore.. y-you will have to clean that..[/say]")

		saynn("[say=artica]Nya-a-ahh-..[/say]")

		saynn("Artica is panting, her body shivering wildly..")

		addButton("Continue", "See what happens next", "play_artica_cleans_rahi")
	if(state == "play_artica_cleans_rahi"):
		playAnimation(StageScene.SexPawjob, "tease", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}})
		if (isCaged):
			saynn("Rahi points at the mess on the floor with her toes..")

			saynn("[say=rahi]Clean it up, slut..[/say]")

			saynn("Artica, still high from her orgasm, obeys without hesitation. She drops low to the floor and begins lapping up her own cum, her tongue working eagerly to clean up every drop.. Rahi watches with a satisfied smirk..")

		else:
			saynn("Rahi looks down at the messy uniform..")

			saynn("[say=rahi]Clean it up, slut..[/say]")

			saynn("Artica, still high from her orgasm, obeys without hesitation. She leans in and begins licking the cum off of Rahi's fur and her uniform, her tongue working eagerly to clean up every drop.. Rahi watches with a satisfied smirk..")

		saynn("[say=rahi]Good.. g-girl..[/say]")

		saynn("[say=pc]Just like you.[/say]")

		saynn("Rahi turns her head towards you.. and covers her face up..")

		saynn("[say=rahi]..meow-w..[/say]")

		saynn("She instantly goes into subby mode again.. what a cutie..")

		saynn("You let them wrap up.. and pat them both.")

		saynn("[say=pc]Amazing show, thank you.[/say]")

		saynn("Rahi purrs.. Artica chrrrrs..")

		saynn("But it was time to go..")

		addButton("Continue", "See what happens next", "endthescene_removearticastrapon")
	if(state == "do_fullout"):
		playAnimation(StageScene.Duo, "stand", {pc="rahi", npc="artica", npcBodyState={hard=true}})
		saynn("It's not the first time you gather them here.. So you roughly know who is more subby out of the two of them.. It was time to let Rahi loose..")

		saynn("[say=pc]You can go full out on that girl, kitty. Do anything you want.[/say]")

		saynn("Artica hears that and eeps, her fluffy tail flicking wildly behind her..")

		saynn("Rahi nods.. and focuses her gaze on the white fluff..")

		saynn("[say=rahi]Meow..[/say]")

		saynn("[say=artica]..yip..[/say]")

		saynn("Rahi takes a single step forward.. And Artica takes a step back.")

		saynn("[say=rahi]Is something wrong.. are you afraid of something?..[/say]")

		saynn("Artica's ears flatten slightly, her cheeks flushing as she avoids the drilling stare..")

		saynn("[say=artica]N..n-n.. n..[/say]")

		saynn("[say=rahi]You're shivering..[/say]")

		saynn("Rahi takes another step.. while the fluff runs into the wall behind her.. cornering herself.")

		saynn("[say=artica]Eek..[/say]")

		saynn("[say=rahi]I'm just a cat.. meow meow..[/say]")

		saynn("Rahi steps closer and closer.. while Artica hugs the wall.")

		saynn("[say=rahi]Aren't you just.. the prettiest little whore?..[/say]")

		saynn("Aw, she can dominate without being mean.. almost..")

		saynn("Rahi's paw reaches out high and lands on"+str(" Artica's naked shoulder, gently caressing her fur.." if isNaked else " Artica's shoulder, gently pulling the collar of the lilac shirt to the side and caressing the fur underneath..")+"")

		saynn("[say=artica]I.. I-I..[/say]")

		saynn("[say=rahi]Don't even try to deny it, you stupid bitch..[/say]")

		saynn("Softness didn't last long though, Rahi grips Artica's chin, forcing the fluff to look into her eyes.")

		saynn("[say=rahi]You're just a slut, aren't you? A bitch in heat, desperate for a good rough fuck.[/say]")

		saynn("Artica whimpers softly, the degrading words sending thrills through her body, her cock twitching"+str(" in its little cage, trying to grow hard but failing.." if isCaged else ", growing harder by the second..")+"")

		addButton("Continue", "See what happens next", "all_stradle")
	if(state == "all_stradle"):
		addCharacter("rahi", ["naked"])
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.SexCowgirlAlt, "tease", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Artica doesn't even resist as Rahi"+str(" forcibly undresses and then" if !isNaked else "")+" pushes her onto the floor.")

		if (isCaged):
			saynn("The feline notices that the herm is caged up and pouts..")

			if (isFullSlave):
				saynn("[say=rahi]You're not going away without fucking me, slut..[/say]")

			else:
				saynn("[say=rahi]You're not going away without fucking her, slut..[/say]")

			saynn("Rahi grabs a strapon harness and quickly secures it around Artica's waist, giving her a fake canine cock.. over her real useless one..")

			saynn("[say=artica]Eek.. my..[/say]")

			saynn("[say=rahi]Shh..[/say]")

		else:
			saynn("[say=artica]Eek..[/say]")

			saynn("[say=rahi]Shh..[/say]")

		saynn("Rahi stands over Artica.. and then gently wiggles her fluffy butt out of her shorts, letting them fall on the fluff's face.")

		saynn("[say=rahi]Oops..[/say]")

		saynn("She kicks them away, opening a great view of her wet dripping sex. Rahi seems to be just as aroused as the herm..")

		saynn("The shirt flies off too, followed by Rahi straddling Artica's hips, already grinding her slit against the "+str("hard knotted cock" if !isStrapon else "rubber knotted cock")+"..")

		saynn("[say=rahi]You like this, don't you..[/say]")

		saynn("Rahi purrs while dragging her sensitive folds along the veiny surface of Artica's cock, coating it with her juices.")

		saynn("[say=rahi]Just as much as you love being called a slut and being treated like the whore that you are..[/say]")

		saynn("Artica's breath hitches, her body squirming under the needy feline..")

		saynn("[say=artica]Y-yes.. I d-do..[/say]")

		saynn("You can barely hear her..")

		saynn("With a sly grin, Rahi positions herself above that"+str(" rubber" if isStrapon else " juicy")+" cock, her pussy pushing on the tip, trying to engulf it..")

		saynn("[say=rahi]Good girl.. Let's see how well you can fuck, slut..[/say]")

		saynn("Rahi looks at you.. waiting for your nod.")

		addButton("Nod", "Let them fuck", "all_fuck")
	if(state == "all_fuck"):
		playAnimation(StageScene.SexCowgirlAlt, "sex", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("As soon as you nod, Rahi brings herself down onto Artica's shaft, her slick pussy enveloping it nicely..")

		saynn("[say=artica]Ah.. s-so tight..[/say]")

		if (isStrapon):
			saynn("The fluff moans.. wait.. how..")

		saynn("[say=rahi]Oh yeah?.. Focus on pleasing it..[/say]")

		saynn("Rahi raises a bit.. just to let go and bring herself down onto Artica who instinctively thrusts her hips upwards, eager to obey the feline.")

		saynn("[say=rahi]Ah.. Is this all you've got, b-bitch?..[/say]")

		saynn("Kitty grips Artica's thighs, digging her claws into them.. while riding that cock hard, bouncing up and down. All the while Artica is bucking her hips more, trying to force more of her"+str(" fake" if isStrapon else " ")+" canine cock inside..")

		saynn("[say=artica]I'm.. ah.. I-I'm.. t-trying.. M-Miss Rahi..[/say]")

		saynn("[say=rahi]Hh-h.ah..[/say]")

		saynn("Rahi closes her eyes and pants softly, cute girly moans keep leaving her lips.. She catches herself getting close and losing her dom energy.. and decides to switch things up.")

		addButton("Continue", "See what happens next", "all_sexlick")
	if(state == "all_sexlick"):
		playAnimation(StageScene.SexPawLick, "inside", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("She brings the fluff up to a kneeling position.. while laying down herself.. before pushing her hind paw directly into Artica's face.")

		if (isFullSlave):
			saynn("[say=rahi]I guess you need some extra incentive to do better..[/say]")

		else:
			saynn("[say=rahi]Kitty guesses you need some extra incentive to do better..[/say]")

		saynn("Artica sees the rough pawpads.. her mouth watering.. until Rahi baps her with the clawed toes.")

		saynn("[say=rahi]Lick already..[/say]")

		saynn("The fluff nods and digs her face into the paw, flicking her tongue out and dragging it over the bean, making Rahi squirm and her pussy clench.")

		saynn("[say=rahi]Ah..[/say]")

		addButton("Continue", "See what happens next", "all_sexlick_sex")
	if(state == "all_sexlick_sex"):
		playAnimation(StageScene.SexPawLick, "sex", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Artica remembers that her"+str(" rubber" if isStrapon else "")+" cock is still inside the kitty.. She proceeds to slowly thrust her hips, fucking that pussy while licking her paw, making her clench harder.")

		saynn("[say=rahi]Ah.. f-fuck.. you're a good little bitch..[/say]")

		saynn("Rahi rubs her hind paw against Artica's face, massaging her blushing cheeks with her beans.")

		saynn("[say=artica]Nyahh..[/say]")

		saynn("She catches one of the toes.. and begins sucking on it.. It makes her pick up the pace.")

		saynn("[say=rahi]F-faster.. fuck that wet cunt.. rail it.. harder..[/say]")

		saynn("Rahi's dominance seems to be slipping hard as her mind gets flooded with pleasure.")

		addButton("Continue", "See what happens next", "all_sexlick_sex_fast")
	if(state == "all_sexlick_sex_fast"):
		playAnimation(StageScene.SexPawLick, "fast", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Artica is panting too.. but she obeys, pounding into Rahi's pussy while holding her hind paw and nuzzling it..")

		saynn("[say=artica]I'm.. g-gonna.. ah.[/say]")

		saynn("[say=rahi]M-meow-w.. y-you're close, w-whore?..[/say]")

		if (isStrapon):
			saynn("Somehow Artica finds enough stimulation in this, her caged cock is twitching hard under the strapon harness, you notice a pool of juices gathering up under her, her own pussy dripping eagerly..")

			saynn("[say=rahi]Oh y-yeah.. W-what a slut.. S-sure.. Knot"+str(" me.. I want it all.." if isFullSlave else "her.. Kitty wants it all..")+"[/say]")

			saynn("[say=artica]Y-yes.. M-Miss Rahi..[/say]")

			saynn("Artica begins going hard, trying to force the rubber knot inside too, the harness putting pressure on her chastity cage while she does so..")

		else:
			saynn("Artica's cock is twitching hard, the knot at the base inflating into a fat meaty orb. You notice a pool of juices gathering up under her, her own pussy dripping eagerly.")

			saynn("[say=rahi]Oh y-yeah.. W-what a slut.. S-sure.. Fill "+str("me up.. Knot my needy pussy.. cum inside.." if isFullSlave else "her up.. Knot her needy pussy.. cum inside..")+"[/say]")

			saynn("[say=artica]Y-yes.. M-Miss Rahi..[/say]")

			saynn("Artica begins going hard, trying to force the knot inside too, stretching Rahi's pussy to its limits..")

		addButton("Continue", "See what happens next", "all_sexlick_sex_cum")
	if(state == "all_sexlick_sex_cum"):
		playAnimation(StageScene.SexPawLick, "inside", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("With a final, forceful thrust, Artica's knot slips past Rahi's entrance.. locking them together.")

		saynn("[say=rahi]AH!..[/say]")

		saynn("[say=artica]Nyahh!..[/say]")

		if (!isStrapon):
			saynn("Kitty arches her back as thick ropes of cum get shot deep into her womb, her pussy squeezing and milking every drop from Artica's twitching balls.. Both fluffs are shaking hard, their moans echoing around the cell..")

			if (isFullSlave && !getCharacter("rahi").isVisiblyPregnant()):
				saynn("[say=rahi]Breed meeee-e..[/say]")

			saynn("Such eager girls, wow. Getting so frisky right in front of you.")

			saynn("As the last waves of their orgasm subside, Artica collapses onto Rahi, panting heavily..")

		else:
			saynn("Kitty arches her back as her pussy is now squeezing the whole length of that strapon, trying to milk it, its tip resting in her womb. At the same time, Artica's cum is dripping onto the floor, leaking from under the harness.. Both fluffs are shaking hard, their moans echoing around the cell..")

			saynn("Such eager girls, wow. Getting so frisky right in front of you.")

			saynn("As the last waves of their orgasm subside, Artica collapses onto Rahi, panting heavily..")

		saynn("[say=rahi]Myaa-aaah..[/say]")

		saynn("[say=artica]A-are you okay, M-miss Rahi?..[/say]")

		saynn("[say=rahi]Nyeaaahhh..[/say]")

		saynn("Kitty begins licking Artica's cheek.. while still having her full length inside her..")

		saynn("[say=pc]Looks like you broke her a bit.[/say]")

		saynn("Artica blushes..")

		saynn("[say=artica]S-sorry.. ah.. she is clenching so hard..[/say]")

		saynn("[say=rahi]Fff.. uuhh..[/say]")

		saynn("[say=pc]You're good, Artica. Let her squirm..[/say]")

		saynn("And so you let them cuddle like that for some time..")

		saynn("After that, you help Rahi to come back to senses.. and send them both off.")

		saynn("It was time to go.")

		addButton("Continue", "See what happens next", "endthescene_removearticastrapon")
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

	if(_action == "do_play"):
		setFlag("ArticaModule.rewardNotFirst", true)

	if(_action == "do_trainsex"):
		setFlag("ArticaModule.rewardNotFirst", true)
		if(isCaged):
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

	if(_action == "play_rahi_undresses_artica"):
		processTime(3*60)

	if(_action == "play_artica_knees"):
		processTime(3*60)

	if(_action == "play_onfloor"):
		processTime(3*60)
		if(isCaged):
			getCharacter("artica").getInventory().equipItem(GlobalRegistry.createItem("StraponCanine"))

	if(_action == "play_rahistrokes_begin"):
		processTime(3*60)

	if(_action == "play_artica_cums"):
		processTime(5*60)
		if(!isCaged):
			getCharacter("rahi").cummedOnBy("artica")

	if(_action == "play_artica_cleans_rahi"):
		processTime(5*60)
		getCharacter("artica").cummedInMouthBy("artica", FluidSource.Penis)
		if(!isCaged):
			getCharacter("rahi").clearBodyFluids()

	if(_action == "endthescene_removearticastrapon"):
		getCharacter("artica").removeStrapon()
		endScene()
		return

	if(_action == "all_stradle"):
		processTime(5*60)
		if(isCaged):
			getCharacter("artica").getInventory().equipItem(GlobalRegistry.createItem("StraponCanine"))
			isStrapon = true

	if(_action == "all_fuck"):
		processTime(3*60)

	if(_action == "all_sexlick"):
		processTime(3*60)

	if(_action == "all_sexlick_sex"):
		processTime(5*60)

	if(_action == "all_sexlick_sex_fast"):
		processTime(5*60)

	if(_action == "all_sexlick_sex_cum"):
		processTime(5*60)
		if(!isStrapon):
			getCharacter("rahi").cummedInVaginaBy("artica")

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
