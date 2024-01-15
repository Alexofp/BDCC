extends "res://Modules/HypnokinkModule/Scenes/Sessions/HK_SessionInductionBase.gd"

func _init():
	sceneID = HK_Sessions.InductionPendulum
	
func _initScene(_args = []):
	onInduction(_args)

func _run():
	if(state == ""):
		addCharacter("vion")
		playAnimation(StageScene.Duo, "sit", {npc="vion", npcAction="sit"})
		
		saynn("[say=vion]Sit down on the sofa, if you'd please.[/say]")
		
		saynn("You do so. {vion.name} brings the chair over and seats himself directly opposite of you.")
		
		saynn("[say=vion]Let's go with a classic, shall we?[/say]")

		saynn("Vion unwinds a piece of string with a loop on one end and a metal washer on the other. He raises it in front of you at eye-level and begins gently swinging it, slipping into a practiced, soothing demeanor.")

		#saynn("[say=vion]Remember, it's simply a relaxation technique. Have you ever caught yourself staring out the window for what must have been half an hour, watching the rain fall, or maybe the birds fly by? Same principle applies here.[/say]")
		
		saynn("[say=vion]Now, focus on the pendulum. Follow it with your eyes.[/say]")

		#sayn("You feel a bit silly, but nonetheless do as ordered.")
		saynn("You watch the pendulum as it spins and swings...")
		
		sayn("Left.")
		sayn("                     Right.")
		sayn("Left.")
		saynn("                     Right.")

		sayn("[say=vion]Let the noise outside fade into the background.[/say]")
		sayn("[say=vion]Notice how it glints in the light as it swings and spins.[/say]")
		sayn("[say=vion]Back and forth. Following the pendulum all the while. Back and forth.[/say]")
		saynn("[say=vion]Let your breathing slow down. Slow and steady. Deep breaths.[/say]")

		saynn("It does feel good to drift like this. To just for a moment forget your circumstances and relax.")

		sayn("[say=vion]Sink down, into the softness of the cushions.[/say]")
		sayn("[say=vion]Feeling your head grow heavier, your body tired.[/say]")
		saynn("[say=vion]Just focus on the sound of my voice.[/say]")

		saynn("Your eyelids grow heavy. It becomes a struggle to keep them open.")

		sayn("[say=vion]That's alright, you can close your eyes. Just imagine the pendulum in your mind's eye.[/say]")
		sayn("[say=vion]Back and forth. With every swing you feel yourself growing more relaxed. Drowsier. More sleepy.[/say]")
		sayn("[say=vion]Relax and allow your awareness to fade away.[/say]")
		saynn("[say=vion]Your thoughts grow quiet as a calmness washes over you.[/say]")

		saynn("Calm...")
		#saynn("[fade start=4 length=12]This is nice...[/fade]")

		sayn("[say=vion]Fall deeper now...[/say]")
		saynn("[say=vion][b]Sleep.[/b][/say]")
		
		addButton("Sleep", "", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		afterInduction()
		return

	setState(_action)
	
