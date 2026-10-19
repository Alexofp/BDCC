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

		saynn("You reach around and find the tip of her cock, just barely visible from the sheath. You run your thumb over it, collecting a bit of clear pre. Avy shivers. You bring your slick thumb back to her tailhole.. and begin rubbing the pre around the tight anal ring.. gently.")

		saynn("[say=avy]..grhh..[/say]")

		saynn("Then you prod the star itself.. just teasing at first. It instantly twitches and gets even tighter under your touch. Avy gets super tense again.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
