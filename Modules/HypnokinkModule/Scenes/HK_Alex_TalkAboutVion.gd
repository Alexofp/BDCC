extends SceneBase

func _init():
	sceneID = "Alex_TalkAboutVion"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		
		saynn("[say=pc]Hey, I have a favor to ask.[/say]")
		saynn("A dark expression crosses Alex's face.")
		saynn("[say=alexrynard]Here it comes.[/say]")
		saynn("[say=pc]What? It's nothing like that. Its just that an inmate I've met mentioned he needs to get his hands on a piece of kit. Figured you'd be the one to ask if that's possible.[/say]")
		saynn("[say=alexrynard]Fine. What is it?[/say]")
		saynn("[say=pc]What did Vion say again? Sub-molecular... dispenser? No, disruptor?[/say]")
		saynn("The foxy sighs, burying his head in his hands for a moment.")
		saynn("[say=alexrynard]Okay, you got that so wrong that I'd believe you actually just have no idea. So, explain to your [i]friend[/i] that I will not be providing you with a high-precision cutter.[/say]")
		saynn("That's not quite correct. You had a pretty good idea what you were asking for. Best not to share that with Alex, though.")
		saynn("[say=alexrynard]Besides, those things are meant for tiny cuts, the width of a finger at most. You wouldn't be getting through prison bars or airlock doors or whatever other ill-conceived idea is behind this.[/say]")
		saynn("[say=pc]That's... understandable. I don't suppose you'd change your mind if I told you he doesn't want it for a prison break? Just needs to get out of a restraint the guards thought it'd be funny to leave locked on.[/say]")
		saynn("[say=alexrynard]Don't be ridiculous. I know what quality of restraints the guards use, you can get out of them with a few minutes of squirming.[/say]")
		saynn("[say=pc]Apparently he already had it on before Broken Dreams, though. Its, a, uh... a DeLoxe S3-Karat chastity cage, I think?[/say]")
		saynn("Alex considers that for a moment, somewhat intriqued.")
		saynn("[say=alexrynard]I've seen the specs. They [i]are[/i] pretty durable. Software's garbage though, I could crack through it in an hour with just a datapad and a packet sniffer.[/say]")
		saynn("[say=pc]Oh! Could you help then?[/say]")
		saynn("[say=alexrynard]No, I'm busy. Tell you what though, I'll lend you a datapad with the right software suite installed. Don't even think about using it for anything else, I'll be watching the logs.[/say]")
		saynn("Alex grabs a datapad from the repaired pile. He boots it up, inputs a short series of commands, and hands it to you.")
		saynn("[say=alexrynard]And in exchange, bring me the cage. If nothing else it's made to a high enough standard to be worth scrapping it for parts.[/say]")
		saynn("He smirks.")
		saynn("[say=alexrynard]And I can think of a few other uses for it, too.[/say]")
		saynn("A bit concerned about that last statement, you decide to make haste.")
		
		addButton("Leave", "", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		setFlag("HypnokinkModule.Vion_HaveDatapad", true)
		endScene()
		return

	setState(_action)
