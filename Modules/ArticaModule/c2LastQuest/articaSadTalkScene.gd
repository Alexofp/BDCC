extends SceneBase

var isCaged = false

func _init():
	sceneID = "articaSadTalkScene"

func _run():
	if(state == ""):
		setFlag("ArticaModule.LQTalkedOnce", true)
		addCharacter("artica", ["sad", "naked"])
		isCaged = getCharacter("artica").isWearingChastityCage()
		playAnimation(StageScene.SexStart, "start", {pc="pc", npc="artica", npcBodyState={naked=true}})
		saynn("You find Artica on her bed. She has pushed herself into the corner and has her hands wrapped around her legs..")

		saynn("Her gaze.. spaced out. Her hair is all messy..")

		saynn("[say=pc]Hey.[/say]")

		saynn("She turns her head towards you, still hiding behind her knees.")

		saynn("[say=artica]M..m-m.hh..[/say]")

		addButton("Talk", "Talk with the fluff", "do_talk")
		addButton("Tease", "Tease the fluff", "do_tease")
		addButton("Sex", "Have some fun", "do_sex")
		addButton("Leave", "Leave the sad fluff be", "endthescene")
	if(state == "do_talk"):
		saynn("[say=pc]Wanna chat?[/say]")

		saynn("You hear a sad sigh.")

		saynn("[say=artica]I k-keep.. g-getting nightmares..[/say]")

		saynn("[say=pc]Nightmares? They don't let you sleep?[/say]")

		saynn("She shakes her head and looks around the cell, her voice keeps hitching..")

		saynn("[say=artica]I d-don't know.. A-am I s-sleeping n-now?..[/say]")

		saynn("Oh. You get a feeling that Artica is not doing well.")

		addButton("Continue", "See what happens next", "")
	if(state == "do_tease"):
		saynn("[say=pc]Artica..[/say]")

		saynn("She barely reacts when you reach your hand out and brush it over her thigh, her body tense and unresponsive.")

		saynn("You continue stroking her thigh, your fingers trailing up and down along her fur, close to her crotch, in an attempt to bring a spark of life back into her eyes.")

		saynn("[say=pc]I'm always here.[/say]")

		saynn("A small shiver runs through.. but she remains largely unresponsive.")

		saynn("[say=artica]But.. w-where a-am I..[/say]")

		saynn("Better to stop here.")

		addButton("Continue", "See what happens next", "")
	if(state == "do_sex"):
		saynn("[say=pc]Maybe this will help you..[/say]")

		saynn("You move closer, your hand reaching out to touch her, your digits trailing over her thigh, seeking a reaction.. But Artica remains mostly still..")

		saynn("Your touches grow bolder, your hand slipping between her legs and gently rubbing her clit. Again, Artica's reponse was minimal, her pussy is not getting any wetter from the stimulation.")

		saynn("[say=artica]Mmm.hh.hh..[/say]")

		saynn("Looks like Artica lost any drive for sex. It's even worse than how it was when she first arrived at BDCC..")

		addButton("Enough", "You'd rather not push her", "endthescene")
		addButtonWithChecks("Force sex", "(noncon) How dare that slut not spread her legs eagerly anymore", "force_sex", [], [[ButtonChecks.HasReachablePenis]])
	if(state == "force_sex"):
		playAnimation(StageScene.SexMissionary, "fast", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Frustrated by the lack of reaction, your tone switches.")

		saynn("[say=pc]Enough of wallowing in self-pity. Maybe being reminded of your place is what you really crave.[/say]")

		saynn("You spread Artica's legs wide.. and already align your {pc.penis} with her pussy, determined to snap her out of this stupid melancholy state.")

		saynn("[say=artica]Hh..[/say]")

		saynn("[say=pc]You're nothing but a whore anyway.[/say]")

		saynn("With that, you trust your cock inside her, the sudden penetration shaking Artica's body. She gasps softly, her muscles tensing up as your shaft fills her, stretching her tight pussy..")

		saynn("You soon realize that she is still completely dry, the discomfort making Artica resist, her mind still clouded by despair.. But you just continue to pound into her, forcing your dick inside until her resistance begins to crumble.")

		saynn("[say=artica]H.. hh.. I'm j-just.. a u-useless slut..[/say]")

		saynn("Artica whimpers, her voice barely audibly over the sounds of your balls slapping against her butt.")

		saynn("[say=artica]..n-nothing b-but a.. worthless w-whore..[/say]")

		saynn("Her"+str(" caged" if isCaged else "")+" cock is still useless and worthless, not even trying to get hard inside of its sheath as you fuck her. Artica lets out quiet noises as you fuck her raw, your hands holding her pinned..")

		saynn("Her pussy might not be lubed up well enough.. but it sure is still clenching tightly, pushing you closer to your peak. Maybe you can just keep Artica as a broken sex toy forever..")

		addButton("Cum inside", "Breed the fluff", "do_cum_inside")
	if(state == "do_cum_inside"):
		playAnimation(StageScene.SexMissionary, "inside", {pc="pc", npc="artica", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		var pcHasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		saynn("Finally, you ram your cock deep inside,"+str(" knotting her pussy and" if pcHasKnot else "")+" breaking into her womb.")

		saynn("[say=artica]Nh..[/say]")

		saynn("Artica's body is shaking a little.. while you proceed to pump her slutty cunt full of your hot seed, your hands holding her still"+str(" and primed for breeding" if !getCharacter("artica").isVisiblyPregnant() else "")+"")

		saynn("[say=pc]The faster you move on, the better. Or I will have to get you brainwashed into a perfect cock sleeve.[/say]")

		saynn("[say=artica]B-brainwashed?.. s-sounds.. g..gh.. good..[/say]")

		saynn("You pull out, letting her stuffed bruised-looking pussy to drip seed all over her bed sheets..")

		saynn("[say=artica]Hh..[/say]")

		saynn("And just like that, after draining your balls inside her, you leave her be.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_talk"):
		processTime(3*60)

	if(_action == "do_tease"):
		processTime(3*60)

	if(_action == "do_sex"):
		processTime(3*60)

	if(_action == "do_cum_inside"):
		processTime(3*60)
		getCharacter("artica").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("pc")

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCaged"] = isCaged

	return data

func loadData(data):
	.loadData(data)

	isCaged = SAVE.loadVar(data, "isCaged", false)
