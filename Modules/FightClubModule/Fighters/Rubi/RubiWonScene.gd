extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RubiWonScene"

func _run():
	if(state == ""):
		addCharacter("rubi")
		playAnimation(StageScene.Duo, "stand", {npc="rubi", npcAction="kneel"})

	if(state == ""):
		saynn("Rubi falls to his knees, unable to continue fighting. He pants heavily and looks at you with some kind of hope in his eyes.")

		saynn("[say=rubi]You aren’t gonna just leave me.. are you?[/say]")

		saynn("As you step closer to him, his cute femboy eyes shine brighter and the bulge on his shorts gets bigger.")

		addButton("Leave him", "Not doing anything would be the biggest punishment to him", "leave_him")
		addButton("Finger him", "There is nothing more humiliating than having your ass fingered in public", "finger_him")
		addButtonWithChecks("Rail him", "Use his butt for your pleasure", "rail_him", [], [ButtonChecks.HasReachablePenis])
		GM.ES.triggerRun("ArenaFighterPCWon", ["rubi"])

	if(state == "leave_him"):
		saynn("The crowd starts to boo at you as you step away from him. Some inmates seem kinda upset with your decision. As you start climbing the fence, Rubi suddenly gets on all fours and crawls closer to you, almost begging.")

		saynn("[say=rubi]You can’t.. Please. Do anything with me, I will obey, I promise![/say]")

		saynn("So cute, he actually sounds honest about it. But still, you got your win and that is all that matters, you climb over the fence and go receive your reward.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")



	if(state == "finger_him"):
		playAnimation(StageScene.SexStanding, "tease", {
			npc="rubi", pc="pc", 
			npcCum=true,
			bodyState={},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		saynn("[say=pc]Yeah, I ain’t gonna just leave such cute slut wanting~[/say]")

		saynn("You pull the femboy up and push him against the nearest fence. Your hand gets pressed into his back, causing him to bend forward and pull his ass back. You drag his shorts down and give his ass a firm smack, sending it to bounce while a cute moan escapes from Rubi’s lips.")

		saynn("He is so turned on already, his barbed cock is out and leaking lots of precum. You grab some of it onto your fingers and start prodding at his tight-looking tailhole, preparing him. He immediately arches his back more and grabs tighter onto the chain link fence. Somebody from the crowd slips his hands through the fence and starts squeezing his breasts, causing his pink nips to become aroused.")

		saynn("[say=rubi]Nghh.. harder!..[/say]")

		saynn("If he wants that, he will get it. You keep his torso pinned while shoving two of your digits down his tailhole, stretching it. Then you curl your digits down and start sliding them in and out while the fingertips are pushing against his pleasure spot, making the guy moan. His thick precum is good enough as a lube, you slowly ramp up your pace, pounding at his prostate so much that his butt starts to make wet noises. His cock is already throbbing and leaking some transparent fluids, it seems like you’re milking the guy very well!")

		saynn("[say=rubi]F-fuck.. that’s t-the spot.. Ahh~..[/say]")

		saynn("His neglected cock gets hard as a rock. You decide to toy with him and pull your digits out, stealing his source of pleasure. He immediately starts to let out desperate moans and squirm. You keep him pinned and shove your digits into his opened mouth. Bright blush appears on his cheeks as he starts licking and suckling on your digits on his own. The crowd seems satisfied with the display, some yell ‘Slut! Sissy!’.")

		saynn("His cock is still as hard, leaking more without you even stimulating him. You yank out your fingers out of his mouth and give his ass another smack, making him tense up, before shoving your digits back into his butt. You quickly find the swollen prostate and start pounding at it, fingering the guy.")

		saynn("Only a few more seconds pass before the guy starts dropping some very passionate moans as his cock starts dripping cum! Not as strong as a normal orgasm but you keep him cumming for at least 20 seconds, he squirms and shivers under you as his balls gradually get drained.")

		saynn("[say=rubi]Fu-u-uckk-k~..[/say]")

		saynn("When he is done, you pull your digits out and rub them dry against his ass. He slowly lowers himself down to his knees, still moaning, the afterglow feeling is so strong for him. You leave him in his mess and get over the fence to claim your reward.")

		addButton("Continue", "Time to leave", "endthescene")

	if(state == "rail_him"):
		# (needs cock)
		playAnimation(StageScene.SexAllFours, "sex", {
			npc="rubi", pc="pc", 
			npcCum=true, pcCum=true,
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})

		saynn("[say=pc]How can I leave without first using such a slut?[/say]")

		saynn("You crouch behind him and swiftly pull his shorts down, exposing his erect feline cock and a clean tight-looking pink pucker. You see excitement in his eyes as he is willingly spreading his legs for you.")

		saynn("[say=pc]Good girl~[/say]")

		saynn("You expose your {pc.cock} and spit at it before spreading your saliva across its length. Then you kneel before the guy and make him raise his legs while going down on him, guiding your cock towards his tailhole. As it starts prodding at the cat’s star, little moans begin escaping from his lips. The crowd cheers ‘Rougher! Breed! Use him!’.")

		saynn("You decide to listen to the crowd’s suggestions and pin the femboy’s legs to the floor while thrusting your hips forward, forcing your cock to stretch his needy fuckhole open. He clenches instinctevely but you push through, your cock rubs his pleasure spot, making his own barbed member drip pre.")

		saynn("[say=rubi]F-fuck-k-k~[/say]")

		saynn("You keep his legs pinned while fucking his butt in the missonary position. You quickly reach a steady pace and start thrusting harder, attempting to shove your cock slightly deeper each time. The guy arches his back and drops one moan after another, his barbed cock is rock-hard.")

		saynn("After some pleasurable prostate milking Rubi suddenly starts moaning louder, his dick shooting weak strings of seed onto his own belly as he cums. His inner walls are closing in around your shaft but you don’t stop, you keep railing the femboy’s pussy, quickly pushing yourself towards your own peak. That extends his wet ruined orgasm, causing his cock to keep leaking cum until his balls are drained.")

		saynn("[say=rubi]F-Fuck! T-too much!.. Ah~~..[/say]")

		saynn("You go past the point of no return and ram your {pc.cock} nice and deep. You grunt as you begin stuffing Rubi’s ass full of your {pc.cum}. His belly inflates slightly, he shakes and shivers while moaning like some kind of slut, so much pleasure. The audience cheers loudly, some applaud even. As your orgasm starts to fade, you pull your cock out of his used fuckhole and use the remaining waves of {pc.cum} to create a mess all over the guy’s belly and chest.")

		saynn("He is left panting and moaning, his gaping leaking star slowly closing. The afterglow after anal sex feels so good. You chuckle and leave him be, time to go get your reward.")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	
	if(_action == "rail_him"):
		getCharacter("rubi").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("rubi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rubi_railhim")
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

