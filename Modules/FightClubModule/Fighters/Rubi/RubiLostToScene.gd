extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RubiLostToScene"

func _run():
	if(state == ""):
		addCharacter("rubi")
		playAnimation(StageScene.Duo, "kneel", {npc="rubi"})

	if(state == ""):
		saynn("Defeated, you slump down to the floor.")

		saynn("[say=rubi]Huh? Did I actually win? Wow![/say]")

		saynn("The femboy-ish guy steps closer to you and taps on your head. You groan, unable to continue fighting. Some of the crowd boos since you lost to a seemingly easy opponent. Some laugh seeing the confusion on the cat’s face.")

		saynn("[say=rubi]Uhh. Of course I won! Happens all the time. Now.. what to do with you..[/say]")

		saynn("He eyes you out and tries to come up with something. He really didn’t think it through, did he?")

		addButtonWithChecks("Power bottom", "See what happens to you", "power_bottom", [], [ButtonChecks.HasReachablePenis])
		addButton("He cums on you", "See what happens", "he_cums_on_you")
		GM.ES.triggerRun("ArenaFighterPCLost", ["rubi"])

	if(state == "power_bottom"):
		# (if has cock)
		playAnimation(StageScene.SexCowgirl, "sex", {
			pc="pc", npc="rubi", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})

		saynn("He looks at your bulge and finally decides what he wants to do with you.")

		saynn("[say=rubi]You're gonna serve as my fucktoy![/say]")

		# (if not naked)
		if(!GM.pc.isFullyNaked()):
			saynn("He {pc.undressMessageS}. He then makes you spread your legs, causing your {pc.cock} to be exposed!")

		# (if naked)
		else:
			saynn("He makes you spread your legs, causing your {pc.cock} to be exposed!")

		saynn("Rubi crouches before you and slips a few of his digits into his mouth, coating them with his saliva. He then reaches down to your cock and starts stroking it, spreading his mouth fluids all over your shaft. While he does that, you notice that his own shorts are bulging quite a bit, a little damp spot appears where his feline dick puts pressure on the cloth. You can’t help but to moan softly, his hand is so soft and he strokes your cock so fucking well, some precum already shoots onto his fingers. The crowd already realized what the guy is gonna do and starts cheering “Fuck {pc.his} cock! Do it, slutty femboy!”.")

		saynn("Rubi then pulls his shorts down, exposing his less-than-average barbed cock and the cute pink butthole. He moves his wet fingers down to his butt, moves the tail out of the way, and rubs some wetness into his star. You don’t seem to mind too much, it’s a free fuck for you!")

		saynn("The femboy then straddles your crotch and slowly lowers himself onto your cock! His tailhole shows some resistance but after some attempts the guy manages to take your shaft down his ass. As his star gives in, he immediately lets out a girly moan and starts rubbing his perky nipples, his barbed cock is bobbing up and down as he clenches his butthole around your cock, getting a feel for it.")

		saynn("[say=rubi]Fuck, your cock is so good.[/say]")

		saynn("He gets as low as his butt allows him and then starts to ride you, moving his butt up and down along your length. His prostate seems to be massaged quite well by your shaft as his own cock starts leaking pre left and right. He keeps moaning and panting while the whole crowd watches him power bottom you with great interest.")

		addButton("Cum!", "You can’t endure this for long", "cum!")

	if(state == "cum!"):
		playAnimation(StageScene.SexCowgirl, "fast", {
			pc="pc", npc="rubi", 
			npcCum=true, pcCum=true,
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		saynn("Eventually he starts to moan even more passionately, his barbed cock throbs and twitches as it starts to dribble cum onto your chest. As he cums, his tailhole clenches so much that you feel yourself being near your peak too!")

		saynn("[say=rubi]C’mon, cum already![/say]")

		saynn("He doesn’t stop, he keeps riding you while his cock is leaking more and more cum, sometimes shooting out a long sticky string instead. The orgasm finally overtakes your body, you grunt, as your {pc.cock} starts stuffing the femboy’s butt full of your {pc.cum}. He takes it like a champ, forcing himself down onto your shaft as deep as he can while his inner walls milk your balls dry. The crowd cheers as they see another cumshot from the cat.")

		saynn("Even though you lost, you at least got some pretty tasty ass. The guy moans again as he stands up and gives everyone a good view of his stretched and stuffed tailhole. He wiggles his ass before quickly getting over the fence, leaving you alone in the arena and covered in cum.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")


	if(state == "he_cums_on_you"):
		# (if no penis)
		playAnimation(StageScene.SexHandjob, "tease", {
			pc="rubi", npc="pc", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={},
		})

		saynn("His shorts are bulging harder when he finally decides what to do with you.")

		saynn("[say=rubi]I will turn you into a cum dumpster![/say]")

		saynn("Bold claim for such a girly looking inmate, Rubi slides down his shorts exposing his hard feline cock of a less-than average length. But it already oozes with precum. He then grabs you by the collar and forces you to sit while using the other hand to stroke himself, you see how his soft barbs get squeezed under his digits while he pleasures his shaft.")

		saynn("You’re too weak to do anything about this, a femboy cat is jerking himself near your face while everyone is watching.")

		addButton("Let it happen", "He will cum on you", "let_it_happen")

	if(state == "let_it_happen"):
		playAnimation(StageScene.SexHandjob, "tease", {
			pc="rubi", npc="pc", 
			pcCum=true,
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={},
		})
		
		saynn("You switch your gaze between the crowd, the guy’s cock and his eyes. You’re not too happy to be used like some cum toilet but what can you do.")

		saynn("[say=rubi]Prepare to carry my load! Ah..[/say]")

		saynn("Rubi opens his mouth and drops some cute moans while his cock starts to throb. You turn your head to the side slightly and a second later a string of his warm seed hits your cheek. Then another one lands on your hair. He starts cumming and giving you a cum shower, messing up your face and top part of the body. You close your eyes and shut your lips as some of the sticky stuff lands on them and starts dripping off your chin.")

		saynn("As the guy is done, he is still panting. So humiliating, you open one eye and see the crowd cheering as they watch you, covered in cum of some cute femboy. The guy quickly puts his cock away and headpats you before climbing over the fence, leaving you alone in the arena.")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	
	if(_action == "cum!"):
		getCharacter("rubi").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("rubi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rubi_powerbottom")
	
	if(_action == "let_it_happen"):
		GM.pc.cummedOnBy("rubi")
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

