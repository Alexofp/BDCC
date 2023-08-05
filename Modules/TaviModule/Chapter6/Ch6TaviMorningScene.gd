extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var sexSkill = 0
var usedStrapon = false
var sexSkillMod = 1.0

func _init():
	sceneID = "Ch6TaviMorningScene"

func _run():
	if(state == ""):
		addCharacter("tavi", ["naked"])
		var playedAnim = false
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		sexSkill = getModule("TaviModule").getSkillScore("taviSkillSex")
		sexSkillMod = 1.0 + sexSkill / 3.0
		saynn("As you enter Tavi's cell, you find her lying on her bed, her breathing heavy and her eyes filled with the mix of desire and need.")

		var randomText = RNG.pick([1, 2, 3, 4, 5, 6])
		if (randomText == 1):
			saynn("The air in the cell is filled with tension as Tavi notices you, her voice is quiet.")

			saynn("[say=tavi]I can't take it anymore.. I need you..[/say]")

			saynn("She doesn't even care that she is naked and displaying her needy pussy to you. She hopes you see it even.")

		elif (randomText == 2):
			saynn("Tavi's gaze wanders over your {pc.masc} body, mostly lingering on your crotch. She purrs with a seductive smile.")

			saynn("[say=tavi]Would you help me to satisfy this heat.. I need you to fuck me..[/say]")

			saynn("Her paws are idly rubbing her pussy, the clawed digit gently playing with the clit. Tavi doesn't seem to mind you watching.")

		elif (randomText == 3):
			saynn("As you approach her, Tavi shifts her body, spreading her legs slightly for you. A silent invitation.. Her soft voice trembles with urgency.")

			saynn("[say=tavi]It's happening again.. Every day.. I can't.. I need to cum..[/say]")

			saynn("Her body is squirming slightly while you watch. Her pussy is incredibly wet. Seems like that experiment that Eliza did her got her hooked on pleasure.")

		elif (randomText == 4):
			playedAnim = true
			playAnimation(StageScene.Hug, "hug", {npc="tavi", npcBodyState={naked=true}})
			saynn("Tavi gets up off the bed and reaches out to touch your hand before guiding it to her sensitive spot between her legs. Her body arches with pleasure just feeling the contact of your digits on her wet pussy folds. She looks at you with pleading eyes.")

			saynn("[say=tavi]Fuck me.. Use me.. Do anything to me.. Just let me cum.. I will be your submissive slut..[/say]")

			saynn("You pull the hand away before Tavi starts humping it. Isn't she a needy girl..")

		elif (randomText == 5):
			playedAnim = true
			playAnimation(StageScene.Hug, "hug", {npc="tavi", npcBodyState={naked=true}})
			saynn("With a soft whimper, Tavi gets up and presses her girly body against yours, her paws trailing up your {pc.masc} chest.")

			saynn("[say=tavi]I can't endure it any longer.. You must fuck me.. Any way you want..[/say]")

			saynn("Your pet is rubbing her crotch against your leg, spreading her pussy juices. So needy..")

		elif (randomText == 6):
			playedAnim = true
			playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="kneel", npcBodyState={naked=true}})
			saynn("Tavi notices you and gets off the bed. Her body trembles with unfulfilled desire as she kneels before you, her paws idly brushing against her curves and rubbing the sensitive spots.")

			saynn("[say=tavi]I'm so needy.. And I'm yours to take..[/say]")

			saynn("Her voice sounds almost desperate. That kitty really wants to be fucked..")

		if (!playedAnim):
			playAnimation(StageScene.Sleeping, "idle", {pc="tavi", bodyState={naked=true}})
		addButton("Finger her", "Make Tavi cum with just your fingers", "do_finger")
		if (sexSkill > 0):
			if (!isVirgin):
				addButton("Fuck her", "Rail Tavi to satisfy her heat", "do_fuck_pick")
			else:
				addDisabledButton("Fuck her", "Tavi can't be a virgin for this")
		if (sexSkill > 1):
			addButtonWithChecks("Tribadism", "Rub pussies with Tavi to satisfy her heat", "do_trib", [], [ButtonChecks.HasReachableVagina])
	if(state == "do_finger"):
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}})
		saynn("With a firm grip, you pin Tavi against the wall. Her body is already shivering with anticipation. She willingly spreads her long legs and sticks her butt out for you, her tail getting out of the way, exposing the dripping sex..")

		saynn("Your touch is commanding and yet tender as you decide to tease Tavi a little more and cup her {tavi.breasts}, squeezing them so tight she can't help but to let out a moan. The sensations of your palms brushing against her perky nips is sending shivers down her spine, igniting a hunger for more.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("After that, your fingers move lower, between her legs.. until they find her drenched dripping pussy. A blush spreads across Tavi's cheeks, she is so exposed and vulnerable. And yet, she lets you do anything with her..")

		saynn("Without hesitation, you begin rubbing Tavi's pussy, your fingers expertly navigating her slick folds. Her breath gets all heavy and deep as the pleasure waves wash over her. Each stroke brings her closer and closer, a powerful sensation builds within her..")

		if (isVirgin):
			saynn("You are careful to avoid her virgin pussy entrance but you give extra attention to the little green clit, swiping left and right with your big thumb until Tavi is squirming before you.")

		else:
			saynn("She is not a virgin so you are free to plunge your digits down her pussy hole and start fingering her slutty sex. Your digits are bent a little, allowing you to hit the g-spot which causes the feline to squirm and moan loudly, her pussy is already squirting out some juices.")

		saynn("[say=tavi]I'm gonna.. I'm..[/say]")

		addButton("Let her cum", "Let Tavi experience another orgasm", "do_finger_cum")
		addButton("Deny Tavi", "Deny her orgasm", "do_finger_deny")
	if(state == "do_finger_cum"):
		saynn("You don't stop rubbing Tavi's pussy until her body starts convulsing in orgasm, the climax is so strong, it makes her legs shake. Her pussy is pulsing and clenching around your digits, a flood of her juices leaves your hand incredibly wet.")

		saynn("[say=tavi]Feels so g-good..[/say]")

		saynn("You then bring the hand to her mouth and Tavi begins eagerly licking her own juices, her long rough tongue tickling your palm.")

		saynn("That seems to satisfy Tavi. Probably not for long.")

		addButton("Continue", "See what happens next", "start_talk")
	if(state == "do_finger_deny"):
		saynn("Tavi is so close to her orgasm, she can feel it. However, you have different plans. To her surprise, you pull your hand away from her dripping pussy, denying her the climax she so desperately craves.")

		saynn("[say=tavi]H-hey..[/say]")

		saynn("A mixture of confusion and frustration fills Tavi's eyes as she feels the pleasure slipping away. Her body arches towards you, her paws begin reaching down to her crotch to finish what you have started.. but you catch her wrists and prevent that, causing the feline to start breaking down.")

		saynn("[say=tavi]No-o!.. I need to cum.. Please..[/say]")

		saynn("But your touch is firm and your voice is cold. You force Tavi to endure her body cooling down, her desire.. going away.. unfulfilled..")

		saynn("[say=pc]No. You're not allowed to cum, Tavi.[/say]")

		saynn("Her body quivers with frustration. She is truly desperate.. But at least her heat seems to be slowly going away.. for now..")

		saynn("[say=tavi]So mean..[/say]")

		addButton("Continue", "See what happens next", "start_talk")
	if(state == "do_fuck1"):
		playAnimation(StageScene.SexStanding, "fast", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("Without a word, you step forward, quickly closing the distance between you and Tavi before grabbing and pressing her against one of the cell's walls. It only takes a second for you to expose your {pc.penis} and align it with her pussy before thrusting inside!")

		saynn("Tavi gasps at the sudden penetration but her wet pussy eagerly accepts you and your cock, allowing you to slide inside her quite easily, already picking up the pace.")

		saynn("[say=tavi]Ngh.. F-fuck..[/say]")

		saynn("The horny feline holds onto the cold wall and moans as you take her rough, Tavi's back is pressed against your chest, allowing you to growl softly into her ear.")

		saynn("She anticipates each thrust with the motion of her body, meeting your cock before your hips slap against her fluffy butt. Both of you quickly approach your peaks..")

		if (getModule("TaviModule").hasWombMark()):
			saynn("[say=tavi]Breed me!.. Please!.. Make my mark shine brightly![/say]")

		else:
			saynn("[say=tavi]I can't get pregnant.. Please..[/say]")

		addButton("Inside", "Cum inside Tavi", "do_fuck1_inside")
		addButton("Pull out", "You'd rather not", "do_fuck1_pullout")
	if(state == "do_fuck1_inside"):
		playAnimation(StageScene.SexStanding, "inside", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("With a final thrust, you ram your {pc.penis} as deep as that pussy allows before the raw passion takes over. Your member throbs inside Tavi, filling her with your hot sticky {pc.cum} while is busy moaning and gasping, her body trembling with pleasure as she welcomes the flood of your seed.")

		saynn("[say=tavi]T-thank you..[/say]")

		saynn("As your orgasms begin to fade, so does Tavi's heat. As you pull out, you are presented with a great sight: Tavi holding onto the wall, her stuffed used pussy leaking your seed.")

		addButton("Continue", "See what happens next", "start_talk")
	if(state == "do_fuck1_pullout"):
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("You fight the urge to breed Tavi and pull your member out as soon as you feel the orgasmic waves take over. Your {pc.penis} is throbbing and shooting {pc.cum} onto the floor while Tavi is busy shivering ever so slightly, her neat pussy wasn't stuffed this time.")

		saynn("[say=tavi]H-huff..[/say]")

		saynn("As your orgasm begins to fade, so does Tavi's heat. Heat that got unsatisfied.")

		addButton("Continue", "See what happens next", "start_talk")
	if(state == "do_fuck1_strapon"):
		playAnimation(StageScene.SexStanding, "fast", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("Without a word, you step forward, quickly closing the distance between you and Tavi before grabbing and pressing her against one of the cell's walls. It only takes a few seconds for you to secure your strapon and align it with her pussy before thrusting inside!")

		saynn("Tavi gasps at the sudden penetration but her wet pussy eagerly accepts you and your rubber dildo, allowing you to slide inside her quite easily, already picking up the pace.")

		saynn("[say=tavi]Ngh.. F-fuck..[/say]")

		saynn("The horny feline holds onto the cold wall and moans as you take her rough, Tavi's back is pressed against your chest, allowing you to growl softly into her ear.")

		saynn("She anticipates each thrust with the motion of her body, meeting the rubber cock before your hips slap against her fluffy butt. She approaches her peak quite quickly..")

		if (getModule("TaviModule").hasWombMark()):
			saynn("[say=tavi]Breed me!.. Please!.. Make my mark shine brightly![/say]")

		else:
			saynn("[say=tavi]I can't get pregnant.. Please..[/say]")

		saynn("You only have a toy so you can't really do it either way.. But Tavi still begs you.")

		addButton("Knot", "Ram the whole strapon inside Tavi", "do_fuck1_knot_strapon")
		addButton("Pull out", "You'd rather not", "do_fuck1_pullout_strapon")
	if(state == "do_fuck1_knot_strapon"):
		playAnimation(StageScene.SexStanding, "inside", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("With a final thrust, you ram the canine cock strapon as deep as that pussy allows before the knot suddenly slips in and the raw passion takes over. Your strapon throbs inside Tavi, filling her with your hot sticky cumlube while is busy moaning and gasping, her body trembling with pleasure as she welcomes the flood of cum-like substance.")

		saynn("[say=tavi]T-thank you..[/say]")

		saynn("As your orgasms begin to fade, so does Tavi's heat. As you pull out, you are presented with a great sight: Tavi holding onto the wall, her stuffed used pussy leaking seed.")

		addButton("Continue", "See what happens next", "start_talk_removestrapon")
	if(state == "do_fuck1_pullout_strapon"):
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("You fight the urge to knot Tavi and pull the toy out as soon as you feel the orgasmic waves take over her body. The feline squirms and moans as her pussy is trying to grasp what's not there anymore.")

		saynn("[say=tavi]H-huff..[/say]")

		saynn("That satisfied her heat, even if not completely.")

		addButton("Continue", "See what happens next", "start_talk_removestrapon")
	if(state == "do_fuck2"):
		playAnimation(StageScene.SexMissionary, "fast", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("Without hesitation, you pull Tavi towards her bed and throw her on it before pinning her frame with your own body, positioning yourself between her legs and already aligning your {pc.penis} with her needy pussy hole.")

		saynn("The feline gasps and arches her back as you enter her in one swift motion, your member pulsing with desire inside her.")

		saynn("[say=tavi]Ah.. Yes!..[/say]")

		saynn("Tavi's moans fill the cell as you set a passionate rhythm, thrusting into that wet pussy, stretching her walls and pounding away at the most sensitive spots. All the while your hands hold Tavi's wrist pressed into the bed, your mouth growling softly into her ear before biting into her neck.")

		saynn("Soon, both of you begin to reach your climaxes..")

		if (getModule("TaviModule").hasWombMark()):
			saynn("[say=tavi]Cum inside!.. Please!.. Make my mark shine brightly![/say]")

		else:
			saynn("[say=tavi]I can't get pregnant.. You can cum inside..[/say]")

		addButton("Cum inside", "Breed Tavi", "do_fuck2_inside")
		addButton("Pull out", "You'd rather not", "do_fuck2_pullout")
	if(state == "do_fuck2_inside"):
		playAnimation(StageScene.SexMissionary, "inside", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("You grunt as your body tenses, your cock throbbing inside Tavi from the intense wave of pleasure building within you. Tavi gasps as you pin her to the bed harder while your sticky {pc.cum} floods Tavi's womb, painting her clenching inner walls.")

		saynn("Your orgasm sends off a chain reaction, causing Tavi's body to start trembling and squirming as she welcomes your seed with an intoxicating eagerness, her insides pulsating around you.")

		saynn("[say=tavi]T-thank you..[/say]")

		saynn("As your orgasms begin to fade, so does Tavi's heat. As you pull out, you are presented with a great sight: Tavi is on her back, her legs spread, her stuffed used pussy leaking your {pc.cum}.")

		addButton("Continue", "See what happens next", "start_talk")
	if(state == "do_fuck2_pullout"):
		playAnimation(StageScene.SexMissionary, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("You grunt as your body tenses, your cock throbbing inside Tavi from the intense wave of pleasure building within you. Sensing the impending climax, you pull out just in time, strings of your seed begin landing on Tavi's belly and crotch, making the fur look messy.")

		saynn("Tavi huffs as she feels your warm {pc.cum}, her body shivering and squirming. She got denied what she wanted and so her body begins to cool down, losing the heated state.")

		saynn("[say=tavi]Huff..[/say]")

		saynn("That satisfied her desires, even if not completely.")

		addButton("Continue", "See what happens next", "start_talk")
	if(state == "do_fuck2_strapon"):
		playAnimation(StageScene.SexMissionary, "fast", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("Without hesitation, you pull Tavi towards her bed and throw her on it before wearing a strapon harness and pinning her frame with your own body, positioning yourself between her legs and already aligning your temporary cock with her needy pussy hole.")

		saynn("The feline gasps and arches her back as you enter her in one swift motion, her inner walls try to stop your strapon but you use force to push through her resistance.")

		saynn("[say=tavi]Ah.. Yes!..[/say]")

		saynn("Tavi's moans fill the cell as you set a passionate rhythm, thrusting into that wet pussy, stretching her walls and pounding away at the most sensitive spots. All the while your hands hold Tavi's wrist pressed into the bed, your mouth growling softly into her ear before biting into her neck.")

		saynn("Soon, Tavi reaches her climax..")

		saynn("[say=tavi]Knot me.. Stuff my pussy full![/say]")

		addButton("Knot Tavi", "Do what Tavi wants", "do_fuck2_knot_strapon")
		addButton("Deny Tavi", "You'd rather not", "do_fuck2_pullout_strapon")
	if(state == "do_fuck2_knot_strapon"):
		playAnimation(StageScene.SexMissionary, "inside", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("You grunt and pin her to the bed harder while using all of your strength to put pressure on Tavi's pussy.. until the fat rubber orb slips inside! The strapon starts throbbing inside the feline from the immense amount of stress that her inner walls put on it. Tavi gasps as hot sticky cum-like substance floods Tavi's womb, painting her inner walls white.")

		saynn("This sends off a chain reaction that causes Tavi's body to start trembling and squirming as she welcomes your seed with an intoxicating eagerness, her insides pulsating around the rubber cock.")

		saynn("[say=tavi]T-thank you..[/say]")

		saynn("As Tavi's orgasm begins to fade, so does her heat. As you pull out, you are presented with a great sight: Tavi is on her back, her legs spread, her stuffed used pussy leaking your {pc.cum}.")

		addButton("Continue", "See what happens next", "start_talk_removestrapon")
	if(state == "do_fuck2_pullout_strapon"):
		playAnimation(StageScene.SexMissionary, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("Instead of trying to knot Tavi with that toy, you just pull it out, denying Tavi's kinky request and causing her to start squirming and resisting. You keep her pinned and let her body start cooling down, losing the heated state.")

		saynn("[say=tavi]Huff..[/say]")

		saynn("That satisfied her desires, even if not completely.")

		addButton("Continue", "See what happens next", "start_talk_removestrapon")
	if(state == "do_fuck3"):
		playAnimation(StageScene.SexAllFours, "fast", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("With a burst of primal energy, you seize Tavi by the waist and throw her onto the bed. She gasps as you position her on all fours, her eyes shine with an alluring mix of excitement and desire.")

		saynn("In a matter of seconds, you position yourself behind her, your {pc.cock} quickly gets aligned with her inviting pussy before spreading her slick folds apart and entering Tavi, making her arch her back and offer all of her body to you.")

		saynn("[say=tavi]Yes, use your pet!.. Ah..[/say]")

		saynn("Tavi moans deeply as you start roughly fucking her, yanking on her tail before thrusting inside which amplifies each motion and makes your cock reach deeper.")

		saynn("Her green spots glow in the dimly lit room that is filled with the sounds of your hips slapping against Tavi's round butt. When you begin to nearing the edge, you tighten your grip on Tavi's hips and tail, your movements becoming more urgent and hers more desperate, her breath hitching as she begs.")

		if (getModule("TaviModule").hasWombMark()):
			saynn("[say=tavi]Don't pull out, please!.. Please!.. Make my mark shine even brighter![/say]")

		else:
			saynn("[say=tavi]You don't have to pull out.. Please..[/say]")

		addButton("Cum inside", "Breed Tavi", "do_fuck3_inside")
		addButton("Pull out", "You'd rather not", "do_fuck3_pullout")
	if(state == "do_fuck3_inside"):
		playAnimation(StageScene.SexAllFours, "inside", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("As Tavi's body reaches the peak, her body tenses, her walls clenching around your cock so much that you can no longer hold back. With a powerful thrust, you ram your {pc.penis} as deep as Tavi's pussy allows before cumming inside, waves of your seed flooding her womb.")

		saynn("[say=tavi]Ah-h.. So much..[/say]")

		saynn("The intense orgasm washes over both of you, Tavi's body continues to quiver and milk your member for all its {pc.cum}, moans continue to slip past her lips.")

		saynn("[say=tavi]T-thank you..[/say]")

		saynn("As your orgasms begin to fade, so does Tavi's heat. As you pull out, you see Tavi on all fours, her stuffed used pussy leaking your {pc.cum}, dripping onto her thighs.")

		addButton("Continue", "See what happens next", "start_talk")
	if(state == "do_fuck3_pullout"):
		playAnimation(StageScene.SexAllFours, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("You grunt as your body tenses, your cock throbbing inside Tavi from the intense wave of pleasure building within you. Sensing the impending climax, you pull out just in time, your load leaves quite a mess on her bedsheets.")

		saynn("Tavi huffs, her body shivering and squirming from the orgasm. But she still got denied what she truly wanted and so her body begins to cool down, losing the heated state.")

		saynn("[say=tavi]Huff..[/say]")

		saynn("That satisfied her desires, even if not completely.")

		addButton("Continue", "See what happens next", "start_talk")
	if(state == "do_fuck3_strapon"):
		playAnimation(StageScene.SexAllFours, "fast", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("With a burst of primal energy, you seize Tavi by the waist and throw her onto the bed. She gasps as you position her on all fours, her eyes shine with an alluring mix of excitement and desire.")

		saynn("In a matter of seconds, you position yourself behind her and secure a strapon around your waist that then quickly gets aligned with her inviting pussy before spreading her slick folds apart and entering Tavi, making her arch her back and offer all of her body to you.")

		saynn("[say=tavi]Yes, use your pet!.. Ah..[/say]")

		saynn("Tavi moans deeply as you start roughly fucking her, yanking on her tail before thrusting inside which amplifies each motion and makes the strapon reach deeper.")

		saynn("Her green spots glow in the dimly lit room that is filled with the sounds of your hips slapping against Tavi's round butt. When you feel her nearing the edge, you tighten your grip on Tavi's hips and tail, your movements becoming more quick and hers more desperate, her breath hitching as she begs.")

		saynn("[say=tavi]Harder.. Please..[/say]")

		addButton("Knot Tavi", "Do what she wants you to do", "do_fuck3_inside_strapon")
		addButton("Pull out", "You'd rather not knot Tavi", "do_fuck3_pullout_strapon")
	if(state == "do_fuck3_inside_strapon"):
		playAnimation(StageScene.SexAllFours, "inside", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("As Tavi's body reaches the peak, her body tenses, her walls clenching around the strapon so much that you can no longer hold back. With a powerful thrust, you ram the rubber cock as deep as Tavi's pussy allows before.. the knot slips inside too, stretching that pussy extremely wide and then stuffing it full of thick cumlube.")

		saynn("[say=tavi]Ah-h.. Yes!..[/say]")

		saynn("Tavi's body continues to quiver and try to milk the strapon, moans continue to slip past her lips.")

		saynn("[say=tavi]T-thank you..[/say]")

		saynn("As Tavi's orgasm begins to fade, so does her heat. As you pull out, you see Tavi on all fours, her stuffed used pussy leaking, dripping onto her thighs.")

		addButton("Continue", "See what happens next", "start_talk_removestrapon")
	if(state == "do_fuck3_pullout_strapon"):
		playAnimation(StageScene.SexAllFours, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("Instead of trying to knot Tavi with that toy, you just pull it out, denying Tavi's kinky request and causing her to start squirming and resisting. You keep still on all fours and let her body start cooling down, losing the heated state.")

		saynn("[say=tavi]Huff..[/say]")

		saynn("That satisfied her desires, even if not completely.")

		addButton("Continue", "See what happens next", "start_talk_removestrapon")
	if(state == "do_trib"):
		playAnimation(StageScene.SexTribadism, "sex", {npc="tavi", pc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("Without much hesitation, you grab Tavi's hand and bring her to the bed. Then, after a gentle push, naked Tavi ends up on it, her heart probably pounding hard already.")

		saynn("[say=pc]Let me do everything..[/say]")

		saynn("You join the feline, positioning yourself on the opposite side of the bed, your legs finding their place between and around Tavi's, your wet pussies kissing each other.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("Soon, you begin to move your body, grinding your crotch against Tavi's with passion that mirrors the intensity of Tavi's heat. The room fills with cute moans.. and also the wet sounds your slits rubbing against each other.")

		saynn("You can feel Tavi's body squirming with need, the heat between her legs becoming more intense the more you grind your sex with hers, exchanging pussy fluids. Tavi tries to match your motions but you pick up the pace, causing the feline to submit and moan loudly.")

		saynn("[say=tavi]Please.. I'm so close..[/say]")

		addButton("Faster", "Make Tavi cum from this", "do_trib_cum")
		addButton("Deny Tavi", "Deny the pleasure of Tavi's orgasm", "do_trib_deny")
	if(state == "do_trib_cum"):
		playAnimation(StageScene.SexTribadism, "fast", {npc="tavi", pc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You decide not to stop and double your efforts instead, grabbing Tavi's paw and picking up the pace, your motions smooth even if a little rough.")

		saynn("[say=tavi]I'm gonna..[/say]")

		saynn("With a passionate noise of love, Tavi's body tenses as a powerful orgasm engulfs her. You continue to rub pussies with her, prolonging Tavi's pleasure and then causing your own climax, throwing your head back and moaning as your sexes pulsate against each other.")

		saynn("[say=tavi]Ah!..[/say]")

		saynn("Her breath is deep and quick. Even after both of you pass your peaks, Tavi's body is still buzzing with the aftershocks. You embrace each other and just rest.")

		saynn("[say=tavi]Thank you..[/say]")

		saynn("Seems Tavi's heat was satisfied for today.")

		addButton("Continue", "See what happens next", "start_talk")
	if(state == "do_trib_deny"):
		playAnimation(StageScene.SexTribadism, "tease", {npc="tavi", pc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("At the last possible second you suddenly just.. stop moving your hips, denying Tavi her pleasure.")

		saynn("[say=tavi]H-hey.. No..[/say]")

		saynn("She tries to make herself cum by grinding your crotch but you actively resist that, making Tavi more and more desperate, her noises incredibly cute.")

		saynn("[say=tavi]I wanna cum so mu-u-uch..[/say]")

		saynn("But you just shake your head. When she tries to use her paws to help, you catch them and hold them firmly. All the while Tavi's heat slowly goes away, unsatisfied..")

		addButton("Continue", "See what happens next", "start_talk")
func taviSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak

func equipStrapon():
	usedStrapon = true
	var strapon = GlobalRegistry.createItem("StraponCanine")
	var fluids = strapon.getFluids()
	fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
	GM.pc.getInventory().equipItem(strapon)


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_finger"):
		processTime(3*60)

	if(_action == "do_fuck_pick"):
		if(GM.pc.hasReachablePenis()):
			#usedStrapon = false
			setState(RNG.pick(["do_fuck1", "do_fuck2", "do_fuck3"]))
		else:
			#usedStrapon = true
			setState(RNG.pick(["do_fuck1_strapon", "do_fuck2_strapon", "do_fuck3_strapon"]))
			var strapon = GlobalRegistry.createItem("StraponCanine")
			var fluids = strapon.getFluids()
			fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
			GM.pc.getInventory().equipItem(strapon)
		return

	if(_action == "do_finger_cum"):
		getModule("TaviModule").addCorruption(3 * sexSkillMod)

	if(_action == "do_finger_deny"):
		getModule("TaviModule").addCorruption(-3 * sexSkillMod)

	if(_action == "start_talk"):
		endScene()
		runScene("Ch6TaviTalkScene")
		return

	if(_action == "do_fuck1_inside"):
		processTime(10*60)
		getModule("TaviModule").addCorruption(5 * sexSkillMod)
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "do_fuck1_pullout"):
		processTime(10*60)
		getModule("TaviModule").addCorruption(-5 * sexSkillMod)
		GM.pc.orgasmFrom("tavi")

	if(_action == "do_fuck1_knot_strapon"):
		processTime(10*60)
		getModule("TaviModule").addCorruption(5 * sexSkillMod)
		getCharacter("tavi").cummedInVaginaBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("tavi")

	if(_action == "do_fuck1_pullout_strapon"):
		processTime(10*60)
		getModule("TaviModule").addCorruption(-5 * sexSkillMod)
		GM.pc.orgasmFrom("tavi")

	if(_action == "start_talk_removestrapon"):
		GM.pc.removeStrapon()
		endScene()
		runScene("Ch6TaviTalkScene")
		return

	if(_action == "do_fuck2_inside"):
		processTime(10*60)
		getModule("TaviModule").addCorruption(5 * sexSkillMod)
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "do_fuck2_pullout"):
		processTime(10*60)
		getModule("TaviModule").addCorruption(-5 * sexSkillMod)
		getCharacter("tavi").cummedOnBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "do_fuck2_knot_strapon"):
		processTime(10*60)
		getModule("TaviModule").addCorruption(5 * sexSkillMod)
		getCharacter("tavi").cummedInVaginaBy("pc", FluidSource.Strapon)
		#GM.pc.orgasmFrom("tavi")

	if(_action == "do_fuck2_pullout_strapon"):
		processTime(10*60)
		getModule("TaviModule").addCorruption(-5 * sexSkillMod)
		#getCharacter("tavi").cummedOnBy("pc")
		#GM.pc.orgasmFrom("tavi")

	if(_action == "do_fuck3_inside"):
		processTime(10*60)
		getModule("TaviModule").addCorruption(5 * sexSkillMod)
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "do_fuck3_pullout"):
		processTime(10*60)
		getModule("TaviModule").addCorruption(-5 * sexSkillMod)
		#getCharacter("tavi").cummedOnBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "do_fuck3_inside_strapon"):
		processTime(10*60)
		getModule("TaviModule").addCorruption(5 * sexSkillMod)
		getCharacter("tavi").cummedInVaginaBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("tavi")

	if(_action == "do_fuck3_pullout_strapon"):
		processTime(10*60)
		getModule("TaviModule").addCorruption(-5 * sexSkillMod)
		#getCharacter("tavi").cummedOnBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "do_trib_cum"):
		processTime(10*60)
		GM.pc.rubsVaginasWith("tavi")
		GM.pc.orgasmFrom("tavi")
		getModule("TaviModule").addCorruption(5 * sexSkillMod)

	if(_action == "do_trib_deny"):
		processTime(10*60)
		GM.pc.rubsVaginasWith("tavi")
		getModule("TaviModule").addCorruption(-5 * sexSkillMod)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["sexSkill"] = sexSkill
	data["usedStrapon"] = usedStrapon
	data["sexSkillMod"] = sexSkillMod

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	sexSkill = SAVE.loadVar(data, "sexSkill", 0)
	usedStrapon = SAVE.loadVar(data, "usedStrapon", false)
	sexSkillMod = SAVE.loadVar(data, "sexSkillMod", 1.0)
