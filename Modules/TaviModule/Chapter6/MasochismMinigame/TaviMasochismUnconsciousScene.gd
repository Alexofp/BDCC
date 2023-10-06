extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var tookVirginity = false

func _init():
	sceneID = "TaviMasochismUnconsciousScene"

func _run():
	if(state == ""):
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		addCharacter("tavi", ["naked"])
		playAnimation(StageScene.Choking, "hard", {npc="tavi", npcBodyState={naked=true}})
		saynn("Oops.. it seems you have choked Tavi too much. A little miscalculation caused you to keep a tight grip on her throat for too long. Tavi's feline eyes went wide in surprise before her expression faded into unconsciousness, her body going limp on you.")

		saynn("[say=pc]Tavi?[/say]")

		saynn("Immediately, you stop choking her and check her pulse.. yeah, it seems to be there. Tavi is breathing even if she is not reacting anymore.")

		addButton("Help her", "Help Tavi get back to her senses", "help_tavi")
		addButton("'Help her'", "Tavi is quite.. vulnerable right now.. isn't she?", "lewd_tavi")
	if(state == "help_tavi"):
		playAnimation(StageScene.Cuddling, "idle", {npc="tavi", npcBodyState={naked=true}})
		saynn("You tap on Tavi's cheeks a few times and her face muscles instinctively tense up. You repeat that and then shake her a little until the senses begin returning to her.")

		saynn("[say=tavi]Ow.. My head..[/say]")

		saynn("Her paws reach for her face and hold onto it. You snatch a pillow off her bed and put it under her head as support.")

		saynn("[say=pc]How are you?[/say]")

		saynn("[say=tavi]"+str(taviSpeak("Feels like I got railed hard by you.. Which is.. acceptable..", "Feels like I got gangbanged by the whole prison.. Which is.. acceptable..", "Feels like I got into a fight and headbutted everyone.. Which is.. acceptable.."))+"[/say]")

		saynn("Now that's a Tavi that you remember. She hisses a little as you try to lift her a bit before pulling in for some cuddles.")

		saynn("[say=pc]Sorry. I pushed you a little too far.[/say]")

		saynn("[say=tavi]Yeah, that wasn't nice.. But I knew what I was signing up for.[/say]")

		saynn("She tries to look behind her at you but turning her head causes her headache to get stronger.")

		saynn("[say=tavi]Ow. Can't ride the highs without the lows? Or something like that.[/say]")

		saynn("[say=pc]Still, I shouldn't have..[/say]")

		saynn("Tavi cuts you off.")

		saynn("[say=tavi]I kill people. Well, used to. You know, it's nice to be on the other side sometimes. Not too often.[/say]")

		saynn("She doesn't seem to make much sense. Her mind is still all over the place probably, causing various thoughts to come up unprompted.")

		saynn("[say=pc]What do you mean?[/say]")

		saynn("[say=tavi]Do you think killers wonder how their victims feel? I do.. Probably because I had a big empty spot in my soul.[/say]")

		saynn("She smiles and rubs against you.")

		saynn("[say=tavi]And now you fill that spot~. Don't worry about it~.[/say]")

		saynn("That went in a strange direction. You decide to just cuddle Tavi for some time to help her recover.")

		saynn("At least she is alright.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "lewd_tavi"):
		playAnimation(StageScene.SexStart, "defeated", {npc="tavi", npcBodyState={naked=true}})
		saynn("You shake Tavi a little but she keeps sleeping soundly, her warm breathing tickling your skin. As you move her into a more comfortable position and notice that the fur near her crotch has gotten quite wet from this, a devious thought comes into your mind..")

		saynn("You feel some guilt.. but you're also.. curious. Your hands gently part Tavi's thighs, putting her needy"+str(" untouched" if getModule("TaviModule").isVirgin() else "")+" flower out on display.")

		saynn("As you touch it, the feline squirms slightly under you. So you continue, rubbing her little glowing clit with linear motions. Soon, Tavi parts her lips and starts moaning softly while her petals become even more wet. It's like she wants this..")

		addButton("Fingers", "Make Tavi feel good with your fingers", "cum_fingers")
		addButtonWithChecks("Fuck her", "She can't say no anyway..", "fuck_tavi", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Strapon her", "She can't say no anyway..", "strapon_tavi_pick", [], [ButtonChecks.HasStraponAndCanWear])
	if(state == "cum_fingers"):
		saynn("A thirst for forbidden drives you further, your fingers tracing a teasing path along her sensitive folds, wondering how much they can get away with..")

		saynn("Your fingers delicately explore Tavi's pussy, spreading it slightly to uncover"+str(" the hymen that is still intact despite how much she went through. You decide to be careful not to tear it now." if getModule("TaviModule").isVirgin() else " the slick depths, the slightly pulsing inner walls.. and the cervix that is illuminated by a green glow.")+"")

		saynn("As you continue to rub her cute slit, Tavi's body responds in subtle ways, her hips shifting, her toes curling, her tail wrapping around her leg. Slowly, you increase the rhythm, stimulating her folds while trying not to wake her up.")

		saynn("Eventually you find a perfect pace, teasing the unconscious feline at the edge of her peak. Her cell smells of desire and arousal.. and sex.")

		saynn("A moment comes where Tavi's body can't endure the constant source of pleasure anymore. She produces a cute prolonged moan as her body tenses from an orgasm surging through it, her hips twitching involuntarily. A second later, Tavi's pussy squirts all over her thighs, releasing all of its stored up tension. Lewd.")

		saynn("After that, you are just left to watch Tavi squirming from the afterglow of her pleasure.")

		addButton("Wake her up", "Wake up Tavi", "finger_wakeup")
	if(state == "finger_wakeup"):
		playAnimation(StageScene.Cuddling, "idle", {npc="tavi", npcBodyState={naked=true}})
		saynn("You pull Tavi in for some cuddles and then shake her a little until she finally comes back to her senses. She slowly opens her eyes.")

		saynn("[say=tavi]Ow.. Head..[/say]")

		saynn("You nuzzle her cheek to help calm her down.")

		saynn("[say=tavi]How long was I out for?[/say]")

		saynn("[say=pc]Some time.[/say]")

		saynn("Tavi looks at herself.. probably feeling warmth spreading throughout her whole body.")

		saynn("[say=tavi]I had such a.. strange dream.[/say]")

		saynn("[say=pc]Sorry I pushed too far.[/say]")

		saynn("She rubs her head and rests in your hands.")

		saynn("[say=tavi]It's alright. I don't mind. I knew what I signed up for..[/say]")

		saynn("You spend some time together.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "fuck_tavi"):
		playAnimation(StageScene.SexMissionary, "tease", {npc="tavi", uncon=true, bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You feel some guilt but seeing the opportunity makes that feeling fade away, replaced by an even more devious thought.")

		saynn("While Tavi is unconscious and breathing softly, you carefully move her into a comfortable position while you take a spot between her legs, your hands gently parting her thighs. Your {pc.penis} is already rock hard just from thinking about it..")

		saynn("Your eyes track her face, making sure she is still dreaming about something, while your hands guide your member to brush against her sensitive folds.. They feel nice, your length gets quickly coated in her pussy juices while you gently slide along her flower. Did she get wet just from you choking her?")

		if (getModule("TaviModule").isVirgin()):
			saynn("As you align yourself better with her slit and proceed to prod it gently, the tip of your cock quickly meets some organic barrier.. A sign of Tavi's innocence. Maybe you should think about it a bit more.. But you went so far to get to this point.. you can't stop now.. You deserve this. Yes.")

		else:
			saynn("As you align yourself better with her slit and proceed to prod the pussy hole, her sensitive folds get pushed aside, letting you stretch her sex more and more. One swift motion and you will be inside.. Maybe you should think about it a bit more.. But you went so far to get to this point.. you can't stop now.. You deserve this. Yes.")

		addButton("Push", "Start fucking Tavi", "fuck_tavi_push")
	if(state == "fuck_tavi_push"):
		playAnimation(StageScene.SexMissionary, "sex", {npc="tavi", uncon=true, bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		if (tookVirginity):
			saynn("Your hands land on Tavi's hips and hold her still while you proceed to put more and more strain on her last line of defense. The feline is wincing and hissing softly while the tip of your cock is pushing on her hymen harder and harder.. until piercing and tearing through it, [b]stealing Tavi's virginity[/b].")

			saynn("Tavi squirms and huffs while her inner pussy walls grasp their first cock.. so tight. There is some bleeding, green toxic-like blood dripping out of her not-so-virgin pussy, giving your member a fancy green glow as you proceed to explore her deeper, enjoying the pleasurable friction way too much..")

			saynn("Tavi is not a girl anymore.. but a woman.. even if she lost her innocence while unconscious.. She probably wouldn't mind anyway.")

		else:
			saynn("Your hands land on Tavi's hips and hold her still while you guide yourself inside her with a slow, deliberate motion. The sensations are overwhelming already, her pussy responds to your push by softly clenching and tightening around you. She is not a virgin anymore but her pussy didn't get any looser, providing enough slick juices for you to start fucking her raw..")

		saynn("With every thrust, Tavi's love tunnel eagerly embracing your length as if.. craving it. Random little moans start escaping from the feline, her noises of love. So you push forward, just as eagerly, exploring her depths, reaching her cervix but not putting pressure on it as to not to wake the feline up.")

		saynn("[say=tavi]h-h.. ah..[/say]")

		saynn("So wrong. But both of you were never about doing things the right way. You feel the climax approaching and so you welcome it, increasing your pace, fucking that sleeping pussy while your hands support you, your eyes watching her bouncing {tavi.breasts}.")

		addButton("Cum inside", "Might as well..", "fuck_tavi_inside")
		addButton("Pull out", "You can't leave any evidence inside her..", "fuck_tavi_pullout")
	if(state == "fuck_tavi_inside"):
		playAnimation(StageScene.SexMissionary, "inside", {npc="tavi", uncon=true, bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		if (tookVirginity):
			saynn("You took her virginity.. So might as well be the first one to claim her womb. Tavi whines softly in her sleep while you ram your {pc.penis} as deep as her pussy allows, pushing her over the edge while your seed begins flooding her womb.. so much of it that some spills out already.")

		else:
			saynn("You went so far.. might as well claim her womb too. Tavi whines softly in her sleep while you ram your {pc.penis} as deep as her pussy allows, pushing her over the edge while your seed begins flooding her womb.. so much of it that some spills out already.")

		saynn("Tavi's body has a slight shiver to it. Her mouth lets out a prolonged quiet noise as you finally stop.")

		saynn("As you pull out, you get a great view of her creamed up pussy. Hot. But she might wake up any second so you quickly put her uniform on her to cover up what you did.")

		addButton("Continue", "See what happens next", "fuck_wakeup_cuddle")
	if(state == "fuck_wakeup_cuddle"):
		addCharacter("tavi")
		playAnimation(StageScene.Cuddling, "idle", {npc="tavi"})
		saynn("You pull Tavi for some cuddles and shake her slightly until she comes to her senses. The feline slowly opens her eyes and winces.")

		saynn("[say=tavi]Ow.. Head..[/say]")

		saynn("[say=pc]Easy there, Tavi.[/say]")

		saynn("You embrace and support her while she rubs her head.")

		saynn("[say=tavi]How long was I out?..[/say]")

		saynn("[say=pc]Some time. My bad.[/say]")

		saynn("Tavi just sighs, her paws trail over her body, probably noticing a strange source of heat coming from her crotch.")

		saynn("[say=tavi]It's okay.. I had a dream at least. I don't usually have those.. Seems I got a little too heated.[/say]")

		saynn("You spend some time together like that. All the while you keep wondering if she.. knows..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "fuck_tavi_pullout"):
		playAnimation(StageScene.SexMissionary, "tease", {npc="tavi", uncon=true, bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		if (tookVirginity):
			saynn("Even though you took her virginity, you decide against cumming inside. Just before you reach the peak, you finally pull out. Your cock throbbing and releasing strings of thick slimy seed all over her crotch and belly, leaving quite a mess..")

		else:
			saynn("You went so far.. but you gotta stop at some point.. Just before you reach the peak, you finally pull out. Your cock throbbing and releasing strings of thick slimy seed all over her crotch and belly, leaving quite a mess..")

		saynn("Tavi's body has a slight shiver to it, she is clearly orgasming. Her pussy spasms around a cock that's no longer there. Hot. But she might wake up any second so you quickly put her uniform on her to cover up what you did.")

		addButton("Continue", "See what happens next", "fuck_wakeup_cuddle")
	if(state == "strapon_tavi_pick"):
		saynn("Pick which strapon you wanna use on Tavi.")

		addStraponButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "strapon_tavi")
	if(state == "strapon_tavi"):
		playAnimation(StageScene.SexMissionary, "tease", {npc="tavi", uncon=true, bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You feel some guilt but seeing the opportunity makes that feeling fade away, replaced by an even more devious thought.")

		saynn("While Tavi is unconscious and breathing softly, you carefully move her into a comfortable position while you take a spot between her legs, your hands gently parting her thighs. Then you grab one of the strapons and secure it around your waist.")

		saynn("Your eyes track her face, making sure she is still dreaming about something, while your hands guide the rubber cock to brush against her sensitive folds.. Your new length gets quickly coated in her pussy juices while you gently slide along her flower. Did she get wet just from you choking her?")

		if (getModule("TaviModule").isVirgin()):
			saynn("As you align yourself better with her slit and proceed to prod it gently, the tip of your strapon quickly meets some organic barrier.. A sign of Tavi's innocence. Maybe you should think about it a bit more.. Maybe doing this with a strapon is wrong.. But.. you went so far to get to this point.. you can't stop now.. You deserve this. Yes.")

		else:
			saynn("As you align yourself better with her slit and proceed to prod the pussy hole, her sensitive folds get pushed aside, letting you stretch her sex more and more. One swift motion and you will be inside.. Maybe you should think about it a bit more.. But you went so far to get to this point.. you can't stop now.. You deserve this. Yes.")

		addButton("Push", "Start fucking Tavi", "strapon_tavi_push")
	if(state == "strapon_tavi_push"):
		playAnimation(StageScene.SexMissionary, "sex", {npc="tavi", uncon=true, bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		if (tookVirginity):
			saynn("Your hands land on Tavi's hips and hold her still while you proceed to put more and more strain on her last line of defense. The feline is wincing and hissing softly while the tip of your rubber cock is pushing on her hymen harder and harder.. until piercing and tearing through it, [b]stealing Tavi's virginity[/b].")

			saynn("Tavi squirms and huffs while her inner pussy walls grasp their first cock.. a dildo. There is some bleeding, green toxic-like blood dripping out of her not-so-virgin pussy, giving your toy a fancy green glow as you proceed to explore her deeper, enjoying the pleasurable friction way too much..")

			saynn("Tavi is not a girl anymore.. but a woman.. even if she lost her innocence while unconscious.. She probably wouldn't mind anyway.")

		else:
			saynn("Your hands land on Tavi's hips and hold her still while you guide yourself inside her with a slow, deliberate motion. The sensations are overwhelming already, her pussy responds to your push by softly clenching and tightening around your toy. She is not a virgin anymore but her pussy didn't get any looser, providing enough slick juices for you to start fucking her raw..")

		saynn("With every thrust, Tavi's love tunnel eagerly embracing your length as if.. craving it. Random little moans start escaping from the feline, her noises of love. So you push forward, just as eagerly, exploring her depths, reaching her cervix but not putting pressure on it as to not to wake the feline up.")

		saynn("[say=tavi]h-h.. ah..[/say]")

		saynn("So wrong. But both of you were never about doing things the right way. You feel her climax approaching and so you welcome it, increasing your pace, fucking that sleeping pussy while your hands support you, your eyes watching her bouncing {tavi.breasts}.")

		addButton("Continue", "See what happens next", "strapon_tavi_cum")
	if(state == "strapon_tavi_cum"):
		playAnimation(StageScene.SexMissionary, "inside", {npc="tavi", uncon=true, bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("After a few more thrusts, Tavi suddenly arches her back, her pussy gripping your toy tightly, clenching around it.")

		saynn("You don't feel much yourself.. But it's still very arousing.. Seeing Tavi squirm under you.")

		saynn("As you pull the strapon out, her slit is still pulsing. Hot. But she might wake up any second so you quickly put her uniform on her to cover up what you did.")

		addButton("Continue", "See what happens next", "fuck_wakeup_cuddle")
func taviSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak

func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "strapon_tavi", [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "help_tavi"):
		processTime(30*60)

	if(_action == "lewd_tavi"):
		processTime(3*60)

	if(_action == "cum_fingers"):
		processTime(3*60)
		getCharacter("tavi").cummedOnBy("tavi", FluidSource.Vagina, 0.3)

	if(_action == "fuck_tavi"):
		processTime(3*60)

	if(_action == "finger_wakeup"):
		processTime(3*60)

	if(_action == "fuck_tavi_push"):
		processTime(3*60)
		if(getModule("TaviModule").isVirgin()):
			tookVirginity = true
			setFlag("TaviModule.TaviIsNotVirgin", true)

	if(_action == "fuck_tavi_inside"):
		processTime(3*60)
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "fuck_tavi_pullout"):
		processTime(3*60)
		getCharacter("tavi").cummedOnBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "fuck_wakeup_cuddle"):
		processTime(3*60)
		GM.pc.unequipStrapon()

	if(_action == "strapon_tavi"):
		processTime(3*60)
		var strapon = _args[0]
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)

	if(_action == "strapon_tavi_push"):
		processTime(3*60)
		if(getModule("TaviModule").isVirgin()):
			tookVirginity = true
			setFlag("TaviModule.TaviIsNotVirgin", true)

	if(_action == "strapon_tavi_cum"):
		processTime(3*60)
		getCharacter("tavi").cummedInVaginaBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("tavi")

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["tookVirginity"] = tookVirginity

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	tookVirginity = SAVE.loadVar(data, "tookVirginity", false)
