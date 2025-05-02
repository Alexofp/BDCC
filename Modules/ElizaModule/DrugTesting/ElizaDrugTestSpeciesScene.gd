extends SceneBase

func _init():
	sceneID = "ElizaDrugTestSpeciesScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("[say=pc]I think you should totally try this one.[/say]")

		saynn("She shakes her head.")

		saynn("[say=eliza]Nope![/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("Her tail puffs up.")

		saynn("[say=eliza]You don't understand, I have absolutely the worst luck when it comes to these things.[/say]")

		saynn("[say=pc]Maybe today it's gonna be different. C'mon, you can undo it, right?[/say]")

		saynn("Her expression softens.")

		saynn("[say=eliza]I can undo anything.[/say]")

		saynn("[say=pc]So? You might be missing out on something cool.[/say]")

		saynn("She sighs.")

		saynn("[say=eliza]Alright, I'm hopeful.[/say]")

		saynn("She throws the pill into her mouth.. and swallows it.")

		saynn("At first, nothing seems to change.. but then a ripple of warmth begins spreading from her chest through every limb.")

		addButton("Continue", "See what happens next", "dragon_tf")
	if(state == "dragon_tf"):
		playAnimation(StageScene.TFLook, "start", {pc="eliza"})
		saynn("Her fur ripples, shifting into tight, iridescent scales that glint under the sterile, clinical lights. Eliza gasps, pressing her paw to her throat as her muzzle tingles.. growing longer and more angular, the whiskered tip reshaping into a proud dragon's snout.")

		saynn("She stumbles back, eyes wide as twin horns burst from her forehead, curling backwards, a texture of a polished obsidian. Her feline ears morph away.. replaced with elegant dragon frills, now poking out from the sides of her head.")

		saynn("Behind her, the slender feline tail thickens and stretches, scales creeping along its length as it grows into a powerful, dragon-like tail.. with a tuft of soft, rich fur at the tip.")

		saynn("Eliza reaches down to brush her fingers over her new underbelly.. where her plush white fur gives way to overlapping scales.")

		saynn("When the transformation process concludes, Eliza is left panting.. new Eliza.")

		saynn("[say=eliza]You've got to be kidding me.[/say]")

		saynn("Her voice echoes oddly from within her elongated throat.")

		saynn("Her gaze fixates on yours.. her nostrils flaring.. her tail wagging behind her, slapping the expensive equipment left and right.")

		saynn("[say=eliza]..I really wanna test if I can breathe fire. But I care for the lab too much.[/say]")

		saynn("[say=pc]I don't think you look that bad.[/say]")

		saynn("One glare tells you everything.")

		saynn("[say=eliza]I've seen many great-looking dragons. But I look like a plush toy![/say]")

		saynn("You giggle softly.")

		saynn("[say=pc]Cute plush toy.[/say]")

		saynn("[say=eliza]Will I have to lay eggs now?! Is that how it works?! That just won't do![/say]")

		saynn("She goes back to the chemistry station and begins brewing the same drug again. Her hands swiftly and expertly go through the process.")

		saynn("When that's done, she throws the pill into her mouth, zero deliberation.")

		addButton("Continue", "See what happens next", "human_tf")
	if(state == "human_tf"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("A familiar warmth begins to ripple through her bones.")

		saynn("Her horns are first.. those proud obsidian spirals.. shiver and splinter, cracking like falling stalactites before crumbling away.")

		saynn("Eliza gasps as her scales tighten and shimmer, shifting from jewel-like plates to soft, feather-light skin. You watch the iridescence bleed out of her limbs, replaced by the smooth human flesh. She looks at her new hands, noting the absence of claws.")

		saynn("Her muzzle shortens, the long dragon snout folding back into a human nose and lips. Eliza stumbles as her jaw realigns, teeth reshaping and sliding into new positions. She touches her face, her brows raising high.")

		saynn("Behind her, the hefty tail retracts with a slow, uncomfortable pull. What was a massive, powerful tail is now just a faint tingle in her spine. With it gone, Eliza starts to lose her balance occasionally.")

		saynn("Her digigrade legs change, bones in her calves and ankles realign, flattening her stance into the full-footed plantigrade posture of a human. She reflexively bends her knees, testing the unfamiliar weight distribution. Her feet lose any kind of toe beans..")

		saynn("Looking down, she sees her paws replaced by slender feminine hands with delicate nails and skin.")

		saynn("When everything is done, Eliza steps forward cautiously, rolling her heel to toe, eyes wide.")

		saynn("[say=eliza]Haha. Wow.[/say]")

		saynn("She looks into the datapad, staring at her face from different directions.")

		saynn("[say=pc]You don't like it?[/say]")

		saynn("[say=eliza]Why are my ears so complicated?[/say]")

		saynn("[say=pc]Probably to hear better.[/say]")

		saynn("[say=eliza]I was hearing things just fine.. And what is this nose shape?[/say]")

		saynn("She wiggles her nose.. and furrows her brows.")

		saynn("[say=eliza]Where is my cute little feline snout..[/say]")

		saynn("Eliza lifts a foot and gasps at the sight of her little stumpy toes.")

		saynn("[say=eliza]Where are my toe beans?! Where are my paws.. I liked my pastel-colored fur..[/say]")

		saynn("She sighs.")

		saynn("[say=pc]It's not that bad, people can get used to any..[/say]")

		saynn("She throws a blue pill into her mouth.")

		addButton("Continue", "See what happens next", "back_to_cat")
	if(state == "back_to_cat"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("Her fur returns, her face morphs back in a familiar feline muzzle, her ears perk up from under her careful ponytail, her feet change shape and structure, allowing her to walk on her paw pads again, a tail is now wagging behind her back.")

		saynn("When it's all over, Eliza touches herself.. and then exhales.")

		saynn("[say=eliza]Home, sweet home..[/say]")

		saynn("Makes you smile.")

		saynn("[say=pc]At least you tried.[/say]")

		saynn("[say=eliza]Hah. Yeah. Maybe the horns weren't so bad..[/say]")

		saynn("You nod.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "dragon_tf"):
		processTime(3*60)
		setFlag("ElizaModule.elizatf_species", "dragon")
		getCharacter("eliza").updateBodyparts()

	if(_action == "human_tf"):
		processTime(3*60)
		setFlag("ElizaModule.elizatf_species", "human")
		getCharacter("eliza").updateBodyparts()

	if(_action == "back_to_cat"):
		processTime(3*60)
		setFlag("ElizaModule.elizatf_species", "")
		getCharacter("eliza").updateBodyparts()
		if(!getFlag("ElizaModule.tfcan_species", false)):
			setFlag("ElizaModule.tfcan_species", true)
			addMessage("Eliza can now transform into a dragon or a human. If you ask her.")

	setState(_action)
