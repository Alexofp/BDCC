extends SceneBase

func _init():
	sceneID = "AlexS3NextDayScene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="sit"})
		saynn("You find Alex in his usual spot, fixing datapads.")

		saynn("You're not quite sure how you should approach him.")

		addButton("Sit quietly", "Don't say anything", "sit_quietly")
		addButton("Say sorry", "Apologize", "say_sorry")
	if(state == "sit_quietly"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You decide to take a seat.. but on a chair that belongs to another table, quite some distance away from Alex. But enough to see what he is doing.")

		saynn("Alex acknowledges your presence with a quick stare.")

		saynn("After some time, he sighs and leaves the tools on the table.. before approaching you.")

		saynn("[say=alexrynard]Good job.[/say]")

		saynn("[say=pc]Huh?[/say]")

		saynn("Alex points at you. You're not sure if he is being sarcastic.")

		saynn("[say=alexrynard]You. Good job with the datapads.[/say]")

		saynn("You're still not sure.")

		saynn("[say=pc]Really?[/say]")

		saynn("He sighs.")

		saynn("[say=alexrynard]Sit with me.[/say]")

		addButton("Sit", "Might as well", "after_sit")
	if(state == "say_sorry"):
		saynn("You feel like you owe him a little apology.")

		saynn("[say=pc]Sorry.[/say]")

		saynn("Alex acknowledges your presence with a little nod.")

		saynn("Looks like you should leave..")

		saynn("But before you do..")

		saynn("[say=alexrynard]Good job.[/say]")

		saynn("[say=pc]Huh?[/say]")

		saynn("Alex points at you. You're not sure if he is being sarcastic.")

		saynn("[say=alexrynard]You. Good job with the datapads.[/say]")

		saynn("You're still not sure.")

		saynn("[say=pc]Really?[/say]")

		saynn("Alex sighs.")

		saynn("[say=alexrynard]Sit down.[/say]")

		addButton("Sit", "Might as well", "after_sit")
	if(state == "after_sit"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You take a seat on your usual chair.")

		saynn("[say=alexrynard]I don't wanna weigh you down with my shit. Life's been rough.[/say]")

		saynn("[say=pc]Too much work?[/say]")

		saynn("Alex rubs his eyes and looks at the pile of datapads before shaking his head.")

		saynn("[say=alexrynard]Work is work. It's whatever. Long story short.[/say]")

		saynn("He looks at you.")

		saynn("[say=alexrynard]Trust is an extremely fragile thing. Building it takes forever. Breaking it.. one wrong decision.[/say]")

		saynn("You can see his experience speaking through him. Your actions didn't help change that.")

		saynn("[say=alexrynard]I know, I know. You thought you were doing the right thing. But life.. has..[/say]")

		saynn("You can notice his fists clenching. And, for some reason, you hear a mechanical whirl coming from him as he does that.")

		saynn("[say=alexrynard]Life.. will.. screw you. Even if you do everything right.[/say]")

		saynn("He calms down and grabs one of the datapad from the bin with the fixed ones.")

		saynn("[say=alexrynard]So yeah. You did good. Better than any other engineer. But I can't really trust you. I don't even trust my colleagues, why would I trust an inmate.[/say]")

		saynn("His words do make sense.")

		saynn("[say=pc]So I should leave?[/say]")

		saynn("Alex is quiet while staring at the pile of broken datapads. Until he breaks that silence.")

		saynn("[say=alexrynard]I don't know why you stick around.. I'm into very different stuff from anyone else around here.[/say]")

		saynn("That can explain a few things.")

		saynn("[say=alexrynard]You know, you can still help me. But only under my full supervision. Under my full control. Otherwise, let's end it right here.[/say]")

		saynn("Almost feels like you're about to sign a contract..")

		saynn("Do you wanna keep helping the foxy?")

		addButton("Agree", "Agree to help Alex while he controls you", "agree_help")
		addButton("Nah", "(End Alex Content) He can stern in his own problems alone", "stop_content")
		addButton("What stuff?", "Ask what Alex is into", "ask_whatstuff")
	if(state == "ask_whatstuff"):
		saynn("[say=pc]What are you into? Why do you think it's different?[/say]")

		saynn("Alex looks around the workshop.")

		saynn("[say=alexrynard]Because.. it's not. I like the same things. But not for the same reasons.[/say]")

		saynn("That's.. very confusing. He leans back in his chair, his gaze directed high.")

		saynn("[say=alexrynard]Power exchange can be fun, I think. Everyone here does it.[/say]")

		saynn("Hard to say no to that.")

		saynn("[say=alexrynard]But I feel like nobody understands it. It's all about abuse these days. People think they're dominant if they can force someone to do what they don't want to do.[/say]")

		saynn("He shakes his head and then looks you in the eyes.")

		saynn("[say=alexrynard]Feelings don't matter anymore, it's all about being strong. Whatever, I will get over it one day.[/say]")

		saynn("Alex frowns.")

		saynn("[say=alexrynard]Forget what I said. Nothing matters.[/say]")

		saynn("Right now it feels even more like a contract..")

		saynn("Do you wanna keep helping the foxy?")

		addButton("Agree", "Agree to help Alex while he controls you", "agree_help")
		addButton("Nah", "(End Alex Content) He can stern in his own problems alone", "stop_content")
	if(state == "stop_content"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="sit"})
		saynn("[say=pc]I'd rather not be punished for just trying to help. So, yeah, you don't get full control over me.[/say]")

		saynn("[say=alexrynard]I understand.[/say]")

		saynn("He nods.")

		saynn("You get up.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "agree_help"):
		saynn("[say=pc]Sure, I hate that pile of datapads.[/say]")

		saynn("Alex chuckles softly.")

		saynn("[say=alexrynard]You will hate it even more soon. But, first, I will teach you some things about safety. Do as I say, not as I do.[/say]")

		addButton("Sure", "Say this", "agree_sure")
		addButton("Yes Sir", "Say this", "agree_yessir")
	if(state == "agree_sure"):
		saynn("[say=pc]Sure.[/say]")

		saynn("You move your chair closer. And watch him and his hands as he shows you how to properly disassemble and assemble the datapad without the threat of cutting or electrocuting yourself.")

		saynn("He lets you do it too, carefully tracking your actions. Time flies. You fix a few datapads under his supervision. Ones that aren't too broken.")

		saynn("[say=alexrynard]Yeah, something like that.[/say]")

		saynn("[say=pc]So.. Can I do everything now?[/say]")

		saynn("[say=alexrynard]Nope. Only the easy ones.[/say]")

		saynn("Aw. That's something, right?")

		saynn("[say=alexrynard]Go rest. I will be taking a little break.[/say]")

		saynn("Well. That wasn't entirely fun. But you feel like.. you progressed?")

		saynn("Time to go.")

		addButton("Leave", "See what happens next", "endthescene")
	if(state == "agree_yessir"):
		saynn("[say=pc]Yes, sir, I will do everything you say~.[/say]")

		saynn("Alex starts coughing, he clearly got caught off-guard.")

		saynn("[say=alexrynard]Pff. Don't call me that or I will gag you.[/say]")

		saynn("That sounds fun though.")

		addButton("Sure", "Say this", "agree_sure")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "after_sit"):
		processTime(5*60)

	if(_action == "stop_content"):
		setFlag("AlexRynardModule.ch1StopAlexContent", true)

	if(_action == "agree_sure"):
		processTime(60*60*3)

	setState(_action)
