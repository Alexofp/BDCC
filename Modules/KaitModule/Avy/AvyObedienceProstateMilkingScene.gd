extends SceneBase

func _init():
	sceneID = "AvyObedienceProstateMilkingScene"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("hideout_chill")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("[say=pc]Stand still for me, Avy.[/say]")

		saynn("Avy crosses her arms, her brows furrowing.")

		saynn("[say=avy]What is it this time? Look, I'm not a subby bitch. If you want one, go grab Kait.[/say]")

		saynn("She doesn't seem very eager about submitting. Better start small then.")

		saynn("[say=pc]You're not a subby bitch. I just want you to stand still for a bit. Can you do that for me?[/say]")

		saynn("She rolls her eyes. You know that she responds better when you're mean to her.. but maybe now she can respond to soft domination too.")

		saynn("[say=avy]I guess. You're gonna make me feel super fucking weird again, I know it.[/say]")

		saynn("You will just have to try and see.")

		saynn("[say=pc]Shh.. Look forward. Just like how I taught you.[/say]")

		saynn("And so she goes still, straightening her posture and putting full focus on the wall in front of her. Avy's hands are by her sides, her shoulders moved back slightly.")

		saynn("You take a step to the side.. and watch Avy's eyes ignoring you, still staring at the same spot.")

		saynn("[say=pc]Good.[/say]")

		saynn("Slowly, you begin walking around her, a familiar gesture. Avy blinks, her lips trembling subtly as you step out of her sight. Her chest moves ever so slightly as she breathes in and out.")

		saynn("You get behind her. Avy's ear is turning, trying to track you.")

		saynn("[say=pc]Don't be scared.[/say]")

		saynn("[say=avy]Maybe I should be.[/say]")

		saynn("Better show her some respect.")

		saynn("[say=pc]I'm gonna touch you. Is that okay with you, not subby bitch?[/say]")

		saynn("[say=avy]Pff.. sure.[/say]")

		addButton("Embrace", "Approach and grab her neck", "do_approach")
	if(state == "do_approach"):
		playAnimation(StageScene.GropeBehind, "neck", {pc="avy", npc="pc"})
		saynn("Slowly, you approach the foxy from behind. So close, she can feel your breath on her back. One of your hands squeezes between her arm and her body, landing on her hips. Your other hand lands on top of her arm and travels up along it.. until it finds her collar. Your digits jump a little higher, landing on Avy's throat.")

		saynn("You don't put much pressure on it.. just enough to make her feel less in control.")

		saynn("The foxy instinctively raises her chin, her body twitching under your touches.")

		saynn("[say=avy]Ah.. That's a little more than just touching.. you know?[/say]")

		saynn("[say=pc]A little, you got me.. Should I stop?[/say]")

		saynn("You hear a quiet growl from her.. a growl that you can also feel through your digits.")

		saynn("[say=avy]Fuck you.. ugh.. no..[/say]")

		saynn("Fuck you? You tighten the grasp on her neck.")

		saynn("[say=avy]Ah.. but if someone sees me like this.. I will kill you..[/say]")

		saynn("[say=pc]I will just pretend that we had a disagreement. And I won.[/say]")

		saynn("Avy tries to wiggle out of your grip.. but you pull her back.")

		saynn("[say=avy]Pff.. That's a very unrealistic story.[/say]")

		saynn("[say=pc]Is a story about you submitting to me willingly more realistic?[/say]")

		saynn("[say=avy]No. Of course not.. That would never happen.[/say]")

		addButton("Undress her", "Take off her clothes", "undress_avy")
	if(state == "undress_avy"):
		addCharacter("avy", ["naked"])
		playAnimation(StageScene.GropeBehind, "grope", {pc="avy", npc="pc", bodyState={naked=true}})
		saynn("You let go of her neck, your hands moving to her shirt. Avy stays still, her eyes still fixed on the wall. You begin unbuttoning her shirt slowly, one button at a time, gradually revealing the curves of her breasts.")

		saynn("[say=avy]Mmh..[/say]")

		saynn("You slide the shirt off her shoulders, letting it fall to the floor. Avy doesn't seem to cover herself, her perky red nips now exposed to the cold air.")

		saynn("Next, you hands rich for the band of her shorts. You pull them down slowly, past her hips, down her legs.. until they land onto the floor.")

		saynn("Her sheath is visible now, the tip of her cock just barely peeking out.")

		saynn("Your hands gently travel along her sides.. feeling the fur stand on ends.")

		saynn("[say=pc]Do you feel cold?[/say]")

		saynn("[say=avy]..I'm fine.[/say]")

		saynn("You cup her breasts.. and feel her growl appear again.")

		saynn("[say=pc]Approach the wall, Avy. The one that you're looking at. Put your hands on it.[/say]")

		saynn("[say=avy]Why?[/say]")

		saynn("[say=pc]Because I want you to.[/say]")

		saynn("She huffs.. but obeys.")

		addButton("Continue", "See what happens next", "avy_near_wall")
	if(state == "avy_near_wall"):
		playAnimation(StageScene.Search, "standidle", {pc="avy", npc="pc", bodyState={naked=true}})
		saynn("Avy walks up to the nearest wall. She hesitates for a second.. but then decides to do as told, placing her palms on it.")

		saynn("[say=pc]A little higher. And wider.[/say]")

		saynn("You get a hold of her wrists and try to bring them where you want them.. but she slaps your hands away and does it herself.")

		saynn("[say=avy]Well then fucking say so..[/say]")

		saynn("[say=pc]We're in no rush.[/say]")

		saynn("She places her hands high on the wall, spaced further than her shoulders too.")

		saynn("[say=avy]Happy?[/say]")

		saynn("[say=pc]Perfect. Spread your legs a bit wider too.[/say]")

		saynn("[say=avy]Maybe you want me to spread my asshole for you too, fucker?..[/say]")

		saynn("It's like she can read the future.")

		saynn("[say=pc]No need to. Let me know if I'm making you uncomfortable. I'm serious. We can stop here and I'd be happy.[/say]")

		saynn("[say=avy]You're.. fine.. grr..[/say]")

		saynn("She growls.. but spreads her legs for you, presenting more of herself. Her tail is still tastefully covering up her crack.")

		saynn("[say=pc]I want you to keep your hands on the wall. No matter what.[/say]")

		saynn("[say=avy]And if I do?[/say]")

		saynn("[say=pc]See it as a challenge. If you do, you will lose.[/say]")

		saynn("[say=avy]And what are you gonna do?[/say]")

		saynn("You know that she won't agree to what you wanna do with her.. not easily.")

		saynn("[say=pc]You will have to trust me, Avy. I'm not gonna make it hurt.[/say]")

		saynn("[say=avy]Ugh.. whatever..[/say]")

		addButton("Tease", "Start teasing her butt", "start_tease_butt")
	if(state == "start_tease_butt"):
		playAnimation(StageScene.Search, "butt", {pc="avy", npc="pc", bodyState={naked=true}})
		saynn("You crouch behind her.")

		saynn("Your hands reach out and land on her butt, gently squeezing. Avy flinches.. but doesn't pull away.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("[say=avy]Don't call me that..[/say]")

		saynn("You knead her cheeks, trying to make the foxy relax. There is so much tension in her.. too much of it. You keep trying to work it out, massaging her rear.")

		saynn("Then, when you feel like she got used to it, you stop.. get a better grasp on her cheeks.. and spread them.. carefully exposing her tight, puckered tailhole. A very cute little star. Avy's tail flicks nervously.")

		saynn("[say=avy]Ugh.. Seriously? Why did you do that, weirdo..[/say]")

		saynn("[say=pc]You can tell me to stop.[/say]")

		saynn("She goes quiet.")
		
		addButton("Continue", "See what happens next", "start_prod_butt")
	if(state == "start_prod_butt"):
		playAnimation(StageScene.Search, "prod", {pc="avy", npc="pc", bodyState={naked=true}})
		saynn("You reach around and find the tip of her cock, just barely visible from the sheath. You run your thumb over it, collecting a bit of clear pre. Avy shivers. You bring your slick thumb back to her tailhole.. and begin rubbing the pre around the tight anal ring.. gently.")

		saynn("[say=avy]..grhh..[/say]")

		saynn("Then you prod the star itself.. just teasing at first. It instantly twitches and gets even tighter under your touch. Avy gets super tense again.")

		saynn("[say=pc]Try to breathe.[/say]")

		saynn("She lets out a shaky breath.")

		saynn("Slowly, you work one finger inside her. She is incredibly tight. You wiggle your digit inside her, gently massaging her inner walls.")

		saynn("[say=avy]..fuck.[/say]")

		saynn("You pull your finger out and gather more pre from her cock.. before pushing it back in. It's a bit easier this time, Avy's anal ring giving in, swallowing your digit. Despite all the teasing, she is still not hard at all, only the tip of her member is showing still.")

		saynn("[say=avy]I'm not a fucking buttslut.. okay?..[/say]")

		saynn("Maybe she isn't one indeed.")

		saynn("[say=pc]No one is judging you. We're just exploring.[/say]")

		saynn("You take your time, gently stretching her, your fingers massaging and prodding her tailhole more.. coercing it to loosen up, just a little.")

		saynn("You manage to add a second finger! Avy's breath hitches.. but she doesn't say anything. Her hands are still firmly planted on the wall, her legs spread wide.. her knees rotated towards each other slightly.")

		saynn("You push your digits a bit deeper, searching. It doesn't take long before your fingers stumble upon something. A small, firm spot. About the shape of a walnut. You press on it gently.")

		saynn("[say=avy]A.. ow..[/say]")

		saynn("You keep caressing that same spot with your fingertips, going over it again and again. As you do that, Avy's breathing catches again, her sheath twitching. She tries to look behind her.")

		saynn("[say=avy]The fuck are you doing?[/say]")

		saynn("[say=pc]Hands on the wall, Avy.[/say]")

		saynn("Your digits feel that spot inflating a bit, getting firmer. Avy's inner walls squeeze around your digits, a little soft noise escaping her.")

		saynn("[say=avy]Mhh..[/say]")

		saynn("The tip of her cock starts to peak out more. It looks like you found it, her pleasure spot. The spot that has a lot of nerve endings clumped up together, making it very sensitive. And so you keep stimulating it, causing Avy's member to grow more and more, sliding out of the sheath.")

		saynn("[say=avy]..oh fuck..[/say]")

		saynn("Her hips are swaying instinctively, her rear paws are tippy-toeing, her anal star still trying to close around your digits.")

		addButton("Continue", "See what happens next", "start_prod_butt_faster")
	if(state == "start_prod_butt_faster"):
		playAnimation(StageScene.Search, "prodfast", {pc="avy", npc="pc", bodyState={naked=true, hard=true}})

		saynn("She is fully hard by now.. but you keep going, pushing on that pleasure button.. causing her shaft to twitch, a bead of her precum hanging from the tip.")

		saynn("Avy is trying to keep calm.. but little stifled moans do begin escaping her lips. Her palms are sliding down the wall each time she gets lost in the pleasure.")

		saynn("[say=avy]..ah.. are you just.. gonna keep doing that..[/say]")

		saynn("[say=pc]I don't see why not. Pretty sure it feels good for you.[/say]")

		saynn("Slow little strokes, you just keep massaging that firm spot with two digits, curling your digits a bit to hit it exactly.")

		saynn("[say=avy]Mhh.. hh..[/say]")

		saynn("She bends forward more, her face resting on the cold wall, her shivering paws holding onto it, her hard cock twitching harder, precum dribbling from it, the knot inflating subtly.")

		saynn("You notice one of her hands beginning to slide down the wall, down to her member.")

		saynn("[say=pc]Avy. Hand away from your cock.[/say]")

		saynn("She is still doing it. So you slap her palm away.")

		saynn("[say=avy]You.. bitch..[/say]")

		saynn("[say=pc]Should I stop?[/say]")

		saynn("[say=avy]Yeah.. ah.. stop f-fucking teasing me..[/say]")

		saynn("Poor foxy is squirming in front of you, panting and producing little quiet moans, her tailhole is now comfortably stretching around your digits while you slide them in and out, fingering her prostate.")

		saynn("Any more of this and it feels like she will start climbing that wall. Her hand is reaching down for her twitching member again.")

		saynn("[say=pc]Avy. If you want to cum today, put your hands on the wall. Right now.[/say]")

		saynn("She growls but her growl turns into a soft whine, followed by desperate moans. A little puddle of her precum has gathered underneath her by this point.")

		saynn("[say=avy]Grh.. ah.. I hate you so much.. ah.. f-fine..[/say]")

		saynn("She obeys, grabbing onto the wall and enduring your onslaught on her p-spot. It doesn't look like she can cum from this alone.. so you will have to help her a bit.")

		addButton("Stroke her", "Keep doing what you're doing but also begin stroking her member slowly", "do_stroke")
	if(state == "do_stroke"):
		playAnimation(StageScene.Search, "stroke", {pc="avy", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Your free hand reaches around her and gets a grasp on her cock. It feels hot, all the veins are pulsing underneath your palm.")

		saynn("You start to stroke her.. slowly.. your other hand is still massaging her prostate from the inside. The extra stimulation is making her whole body shudder.")

		saynn("[say=avy]Mhh.. ahh.. f-fuck.. ah.. shit..[/say]")

		saynn("Her eyes are closed, lips constantly parted, hot breaths escaping her. She is dragging her moans now, tension rising fast inside her body.")

		saynn("Her knot is inflating further. You're not even stroking her that hard, just enough to keep the process going. You feel her prostate getting bigger, the inner walls clenching hard.")

		saynn("[say=avy]I'm.. f-fuck.. I'm-m..[/say]")

		saynn("[say=pc]Go ahead.[/say]")

		addButton("Continue", "See what happens next", "avy_cums")
	if(state == "avy_cums"):
		playAnimation(StageScene.Search, "strokefast", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, pcCum=true})
		saynn("A few more strokes.. and it happens.")

		saynn("Avy arches her back and throws her head back, passionate little moans and whines echoing around the room. Her balls tense up while her throbbing cock starts to leak cum.. little pressure.")

		saynn("[say=avy]Ahhh.. ahh-.. ahh.. F-fu-uck.. ah..[/say]")

		saynn("[say=pc]What a good girl. Keep going. Let it all out.[/say]")

		saynn("[say=avy]Grhh.. hh..[/say]")

		saynn("Judging from how her seed is dribbling out rather than shooting.. It looks like you might have ruined her orgasm a bit by accident.. but she is still having the time of her life, squirming and panting in front of you, her tailhole hungrily pulsing around your digits, really squeezing them.")

		saynn("It's a weak orgasm.. but it sure is a long one. Her seed keeps dripping out for at least ten seconds.. a devious thought flashing in your mind.. you catch some of her cum onto your hand..")

		saynn("Eventually, the foxy is left panting and breathing heavily.")

		saynn("[say=avy]Uhh.. ah.. f-fucking hell..[/say]")

		saynn("[say=pc]Turn around for me.[/say]")

		addButton("Continue", "See what happens next", "taste_test")
	if(state == "taste_test"):
		playAnimation(StageScene.Grope, "tease", {pc="avy", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Avy obeys, turning around but still leaning against the wall that is now behind her, using it for support.")

		saynn("Her member, despite all, is still semi-hard.")

		saynn("You get up and look her in the face. Avy's cheeks are glowing, her stare directed away.")

		saynn("[say=pc]It looks like you enjoyed yourself.[/say]")

		saynn("[say=avy]If anyone finds out about this..[/say]")

		saynn("[say=pc]Don't worry. No one will find out about it.[/say]")

		saynn("You show her your messy hand.")

		saynn("[say=pc]As long as you get rid of the evidence.[/say]")

		saynn("[say=avy]What? The fuck?[/say]")

		saynn("[say=pc]I just want you to lick it. Taste yourself.[/say]")

		saynn("[say=avy]I'm not a fucking cumslut.. Put that shit way..[/say]")

		saynn("[say=pc]I'm not ordering you because you're a cumslut. I'm asking you because I want you to. A single lick. You're not gonna die from a single lick.[/say]")

		saynn("She stares at you. Her jaw tightens, her eyes turning mean and evil, her fists clenching.")

		saynn("You keep up the eye contact, your face only showing kind emotions, zero judgement.")

		saynn("Avy growls.. and yet.. she begins to slowly lean forward. Her tongue darts out.. and does one lick.. tickling your hand.")

		saynn("When she retracts the tongue back into her mouth.. it doesn't take long before her face changes, now showing clear disgust, her muzzle wrinkling.")

		saynn("She spits it out fast.")

		saynn("[say=avy]That is.. the worst fucking thing I've ever tasted.. fucking gross..[/say]")

		saynn("Aw. But at least she tried it.")

		addButton("Pat her", "Give her a headpat for trying", "give_headpat")
	if(state == "give_headpat"):
		playAnimation(StageScene.Grope, "pat", {pc="avy", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Avy did a lot.. she deserves it.")

		saynn("Your.. non-messy hand.. rises up.. and lands on her head.. before proceeding to pat her gently.")

		saynn("[say=pc]I am proud of you, Avy.[/say]")

		saynn("[say=avy]Don't.. f-fucking say that..[/say]")

		saynn("She seems to be taking the headpats anyway.. so you continue delivering them.")

		saynn("[say=pc]I will say that because I really think that you have made a lot of progress.[/say]")

		saynn("[say=avy]You're just.. turning me into a slut.. you think I can't see that?[/say]")

		saynn("[say=pc]You're still an evil bitch, Avy. Nothing can change that. I'm just helping you experience more of this life. It felt good, didn't it?[/say]")

		saynn("She is snarling.")

		saynn("[say=avy]No.. fuck no.. it felt.. okay.. at most..[/say]")

		saynn("You chuckle.")

		saynn("[say=pc]I see how it is.[/say]")

		saynn("[say=avy]What?! What do you see?![/say]")

		saynn("[say=pc]I see a good girl.[/say]")

		saynn("[say=avy]ARGHH..[/say]")

		saynn("And so she grabs her clothes and just runs away like a vampire that got touched by the sunlight.")

		saynn("Looks like this is it.")

		addButton("Continue", "See what happens next", "endscene_back")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "endscene_back"):
		aimCameraAndSetLocName(GM.pc.getLocation())
		endScene()
		return

	setState(_action)
