extends SceneBase

func _init():
	sceneID = "KaitLove69Scene"

func _run():
	if(state == ""):
		#aimCameraAndSetLocName("hideout_chill")
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("[say=pc]Feeling bored, Kait?[/say]")

		saynn("Kait shrugs.")

		saynn("[say=kait]A bit, why?[/say]")

		saynn("The snow leopard arches her back, stretching while making a cute noise. When she meets her gaze after that, a smile curls the corners of her lips.")

		saynn("[say=pc]Maybe we could.. get to know each other a little better?[/say]")

		saynn("She raises a brow and tilts her head a bit.")

		saynn("[say=kait]Oh yeah~?[/say]")

		saynn("She leans in a bit closer, a playful spark in her eyes.")

		saynn("[say=kait]Trying to seduce me, huh?[/say]")

		saynn("[say=pc]I wouldn't say..[/say]")

		saynn("She traces a clawed paw along your arm.")

		saynn("[say=kait]Well, it worked~.[/say]")

		saynn("She chuckles softly, the tip of her tongue peeking out at you.")

		saynn("Well then.")

		saynn("[say=pc]Get your fluffy butt over here.[/say]")

		saynn("A cute giggle escapes her.")

		addButton("Continue", "See what happens next", "both_naked")
	if(state == "both_naked"):
		addCharacter("kait", ["naked"])
		playAnimation(StageScene.BreastFeeding, "tease", {pc="kait", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("The next moment you know it, you're on the floor, undressing each other. Kait gives you little licks near your neck while you're unbuttoning her shirt, revealing her perky breasts, complete with stiff dark nips. She shimmies out of her shorts next, leaving her in just the bulky metal collar.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Kait immediately takes note of your chastity cage.")

			saynn("[say=kait]That is so cute~.[/say]")

			saynn("Her paws reach out to cup your balls gently.. it makes your locked away cock start putting more pressure against its prison."+str(" She also gently teases your hidden pussy slit.." if GM.pc.hasReachableVagina() else "")+"")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your {pc.penis} springs free. Kait's eyes go big, her paws reach out to cup your balls gently.")

			saynn("[say=kait]Nice..[/say]")

		elif (GM.pc.hasReachableVagina()):
			saynn("Your pussy slit got revealed to Kait's eyes. She is quick to give your folds a few teasing rubs.")

			saynn("[say=kait]Nice..[/say]")

		saynn("At the same time, your hands are exploring her, sliding across her sides and squeezing her breasts together before going down between her legs to rub her clit.")

		saynn("[say=pc]Why don't you turn around, kitty.[/say]")

		saynn("[say=kait]Mmhh~.[/say]")

		addButton("Continue", "See what happens next", "69_prepare")
	if(state == "69_prepare"):
		playAnimation(StageScene.Sex69, "tease", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Kait straddles you backwards, presenting you with a great view of her fluffy butt. Her tail goes out of the way, revealing her slick pussy and a tight-looking tailhole, both carrying a dark color of her nips. She looks over her shoulder at you, a wicked grin on her face.")

		saynn("[say=kait]Do you like what you see~?[/say]")

		saynn("She wiggles her rear at you. Her pussy looks quite.. tasty..")

		saynn("What should Kait focus on?")

		if (GM.pc.hasReachablePenis()):
			addButton("Penis", "She should suck your cock!", "69_pp")
		if (GM.pc.isWearingChastityCage()):
			addButton("Chastity cage", "She should suck your caged cock!", "69_cage")
		if (GM.pc.hasReachableVagina()):
			addButton("Pussy", "She should lick you out as well", "69_vag")
		if (!GM.pc.hasReachablePenis() && !GM.pc.isWearingChastityCage() && !GM.pc.hasReachableVagina()):
			addButton("Cancel", "This shouldn't be possible!", "endthescene")
	if(state == "69_pp"):
		playAnimation(StageScene.Sex69, "FM", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Kait lowers her head, her warm breath washing over the head of your {pc.penis}.. before she gives it a slow, deliberate lick.")

		saynn("[say=kait]Tastes nice..[/say]")

		saynn("Right after that, you put your hands on her hips and pull her closer, burying your face between her fluffy thighs! She gasps, her whole body shudders as you drag your tongue up along her slit. She tastes great.. sweet and a little salty. You delve your tongue deeper, finding her clit and circling it with your tongue.")

		saynn("[say=kait]Ah.. what a nice tongue.[/say]")

		saynn("She moans from your work.. and then takes the head of your cock into her mouth, her tongue swirling around it before she starts to bob her head, gradually taking more of you in. Her rough feline tongue feels great.. little electric impulses spreading all along your shaft.")

		saynn("You groan against her pussy and then return the favor, your tongue diving into her wetness, lapping up her juices. You switch between flicking her clit and teasing her tight entrance. You hear cute moans followed by Kait gently grinding her hips back against your face. At the same time, she pumps your shaft near the base while sucking on it.")

		saynn("You could feel the tension building in her, that slick, needy pussy clenching around your tongue as you prod it. You add your fingers into the mix, rubbing her clit while your tongue finds its way inside her, lapping away at her inner walls. Kait cries out a pleasure noise, her mouth leaving your cock to gasp for a second.")

		saynn("[say=kait]Fuck..[/say]")

		saynn("She takes a quick breath and then dives back down, taking you deeper into her throat. You feel the tip of your cock hitting the back of her mouth and then meeting with her tight walls. She doesn't take all of it.. but some is already enough to make you feel good.")

		saynn("Your climax was drawing near.. so you double your efforts, licking her out and rubbing her clit until her thighs begin to tremble.")

		addButton("Continue", "See what happens next", "69_pp_cum")
	if(state == "69_pp_cum"):
		playAnimation(StageScene.Sleeping, "rub", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("She was the first to break. Her body starts squirming as a muffled moan vibrates around your shaft, her pussy clamping down on your tongue hard.")

		saynn("The feeling of her orgasm, combined with her mouth working on your cock so well was enough to push you over the edge. You groan, your hips bucking as you {pc.penis} starts shooting your load into her mouth! She takes it all, swallowing greedily, still licking and sucking until you are completely spent.")

		saynn("Finally, she releases your cock with a wet pop and rolls off, lying beside you on the floor.. still the opposite direction. She is panting a lot.. before chuckling.")

		saynn("[say=kait]Okay.. I think we know each other a little better now.. Hah..[/say]")

		saynn("[say=pc]I think we do indeed.[/say]")

		saynn("When that's done, she turns around to embrace you.")

		saynn("Together, you spend some time like this.")

		saynn("But then, with a little lick on your cheek, Kait jumps off.")

		saynn("[say=kait]Enough cuddling~.[/say]")

		saynn("Oh well.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "69_cage"):
		playAnimation(StageScene.Sex69, "FF", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Kait lowers her head, her warm breath washing over the cold metal of your chastity cage. She lets out a soft, amused purr.")

		saynn("[say=kait]Mmm.. all locked up for me, huh~?[/say]")

		saynn("She gives the cage a gentle tap with her claw, making it clink softly. Then her tongue darts out, dragging a slow, deliberate lick along its surface. It feels.. quite unique.. you don't feel the lick at all but you do feel the vibrations coming through her tongue and into your trapped cock.")

		saynn("Right after that, you put your hands on her hips and pull her closer, burying your face between her fluffy thighs! She gasps, her whole body shudders as you drag your tongue up along her slit. She tastes great.. sweet and a little salty. You delve your tongue deeper, finding her clit and circling it with your tongue.")

		saynn("[say=kait]Ah.. what a nice tongue.[/say]")

		saynn("She moans from your work.. and then focuses back on your cage. One of her paws gently tugs on it, kinda like she is stroking it.. while the other paw is teasing your balls more, cupping and caressing. She leans in closer, her tongue finding the small opening at the tip. She flicks at it, trying to reach the sensitive head of your cock inside.")

		saynn("[say=kait]Poor thing.. so close but so far~.[/say]")

		saynn("Her paw jumps from the cage and slides lower, her claws carefully tracing along your "+str("perineum" if !GM.pc.hasVagina() else "pussy slit")+" before one of her digits finds your tailhole. She circles it teasingly, applying gentle pressure.")

		saynn("[say=kait]Let me help you out a little..[/say]")

		saynn("She quickly licks her finger and then pushes it inside you, curling it upwards, searching for that special spot. When she finds it, you groan against her pussy, your hips instinctively pressing back against her paw. She keeps licking your cage, her tongue lapping up at its surface.. while her finger is massaging your prostate with gentle strokes.")

		saynn("It feels.. too good.. Your trapped cock strains against its prison, desperately.. You double your efforts on Kait, your tongue diving into her wetness, lapping up her juices. You switch between flicking her clit and teasing her tight entrance. You hear cute moans followed by Kait gently grinding her hips back against your face.")

		saynn("[say=kait]Fuck.. you're good at that..[/say]")

		saynn("Her finger keeps hammering away at your sensitive spot, her tongue doing more and more of those teasing licks that send shivers down your spine when she couples them with her purring. You feel the tension building in her, that slick, needy pussy clenching around your tongue as you prod it. You add your fingers into the mix too, rubbing her clit while your tongue finds its way inside her, lapping away at her inner walls.")

		addButton("Continue", "See what happens next", "69_cage_cum")
	if(state == "69_cage_cum"):
		playAnimation(StageScene.Sleeping, "rub", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("She was the first to break. Her body starts squirming as a muffled moan vibrates around your locked away member, her pussy clamping down on your tongue hard.")

		saynn("The sight and taste of her orgasm.. combined with her finger working your prostate, is too much. You groan, your hips bucking as your trapped cock desperately tries to cum. Weak spurts of your seed start leaking out through the small hole in the front of the cage.. dribbling down the metal.")

		saynn("Kait notices immediately. She pulls her finger out of you and leans in, her tongue lapping up every drop that escapes, cleaning the cage with slow, deliberate strokes. She doesn't stop until there's nothing left, until you're completely spent and the cage is spotless.")

		saynn("Finally, she releases your cage and rolls off, lying beside you on the floor.. still the opposite direction. She is panting a lot.. before chuckling.")

		saynn("[say=kait]Okay.. I think we know each other a little better now.. Hah..[/say]")

		saynn("[say=pc]I think we do indeed.[/say]")

		saynn("When that's done, she turns around to embrace you.")

		saynn("Together, you spend some time like this.")

		saynn("But then, with a little lick on your cheek, Kait jumps off.")

		saynn("[say=kait]Enough cuddling~.[/say]")

		saynn("Oh well.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "69_vag"):
		playAnimation(StageScene.Sex69, "FF", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Kait lowers her head, her warm breath washing over your wet folds.. before she gives your pussy a slow, deliberate lick from bottom to top.")

		saynn("[say=kait]Mmm, tastes nice..[/say]")

		saynn("Right after that, you put your hands on her hips and pull her closer, burying your face between her fluffy thighs! She gasps, her whole body shudders as you drag your tongue up along her slit. She tastes great.. sweet and a little salty. You delve your tongue deeper, finding her clit and circling it with your tongue.")

		saynn("[say=kait]Ah.. what a nice tongue.[/say]")

		saynn("Kait moans from your work.. and then dives into your pussy, her tongue sliding along your folds. She finds your clit and puts more focus on it next, letting you feel all the tiny hooks that her feline tongue possesses. Little electric impulses spread through your whole body..")

		saynn("You moan against her pussy and then return the favor, your tongue diving into her wetness, lapping up her juices. You switch between flicking her clit and teasing her tight entrance. You hear cute moans followed by Kait gently grinding her hips back against your face. At the same time, she pumps two fingers into you, curling them just right while her tongue works your clit.")

		saynn("You could feel the tension building in her, that slick, needy pussy clenching around your tongue as you prod it. You add your fingers into the mix too, rubbing her clit while your tongue finds its way inside her, lapping away at her inner walls. Kait cries out a pleasure noise, her tongue leaving your pussy for a second.")

		saynn("[say=kait]Fuck..[/say]")

		saynn("She takes a quick breath and then dives back down, her tongue lapping away at your folds while her fingers keep working on your g-spot. It all makes your hips buck against her face..")

		saynn("Your climax was drawing near.. so you double your efforts, licking her out and rubbing her clit until her thighs begin to tremble.")

		addButton("Continue", "See what happens next", "69_vag_cum")
	if(state == "69_vag_cum"):
		playAnimation(StageScene.Sleeping, "rub", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("She was the first to break. Her body starts squirming as a muffled cry vibrates against your pussy, her own cunt clamping down on your tongue hard.")

		saynn("The feeling of her orgasm, combined with her tongue and fingers working your pussy so well was enough to push you over the edge. You cry out, your hips bucking as your climax washes over you, your juices squirts onto Kait's cute face. She laps up what she can greedily, still licking and sucking until you are completely spent.")

		saynn("Finally, she gives your pussy slit one last kiss and then rolls off, lying beside you on the floor.. still the opposite direction. She is panting a lot.. before chuckling.")

		saynn("[say=kait]Okay.. I think we know each other a little better now.. Hah..[/say]")

		saynn("[say=pc]I think we do indeed.[/say]")

		saynn("When that's done, she turns around to embrace you.")

		saynn("Together, you spend some time like this.")

		saynn("But then, with a little lick on your cheek, Kait jumps off.")

		saynn("[say=kait]Enough cuddling~.[/say]")

		saynn("Oh well.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "69_pp_cum"):
		GM.pc.cummedOnBy("kait", FluidSource.Vagina, 0.2)
		GM.pc.cummedInMouthBy("kait", FluidSource.Vagina, 0.8)
		getCharacter("kait").cummedInMouthBy("pc", FluidSource.Penis)
		GM.pc.orgasmFrom("kait")

	if(_action == "69_cage_cum"):
		GM.pc.cummedOnBy("kait", FluidSource.Vagina, 0.2)
		GM.pc.cummedInMouthBy("kait", FluidSource.Vagina, 0.8)
		getCharacter("kait").cummedInMouthBy("pc", FluidSource.Penis)
		GM.pc.orgasmFrom("kait")

	if(_action == "69_vag_cum"):
		GM.pc.cummedInMouthBy("kait", FluidSource.Vagina, 0.2)
		GM.pc.cummedOnBy("kait", FluidSource.Vagina, 0.8)
		getCharacter("kait").cummedInMouthBy("pc", FluidSource.Vagina, 0.3)
		getCharacter("kait").cummedOnBy("pc", FluidSource.Vagina, 0.7)
		GM.pc.orgasmFrom("kait")

	setState(_action)
