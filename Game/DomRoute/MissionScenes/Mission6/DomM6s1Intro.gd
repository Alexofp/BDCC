extends SceneBase

func _init():
	sceneID = "DomM6s1Intro"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="avy", pc="kait"})
		addCharacter("kait")
		addCharacter("avy")
		saynn("[say=kait]Alright. Is everyone ready? We're going to make a proper introduction to our future friendly engineer today and ask for a few favors.[/say]")

		saynn("[say=avy]Been born ready.[/say]")

		saynn("Kait looks at you. You respond with a nod.")

		saynn("[say=kait]Let's stick together. We're gonna grab Rahi and Ferri on the way there. The more of us are near him, the better.[/say]")

		saynn("[say=avy]The higher the risk we all get caught. What are you gonna do about other engineers near him?[/say]")

		saynn("[say=kait]I have a plan.[/say]")

		saynn("[say=avy]Ohhh. The bitch is so serious now. Major leagues.[/say]")

		saynn("[say=kait]Shush. Let's go.[/say]")

		addButton("Follow", "Go pay Alex Rynard a visit", "go_to_alex")
	if(state == "go_to_alex"):
		aimCameraAndSetLocName("eng_bay_corridor")
		addCharacter("rahi")
		addCharacter("ferri")
		playAnimation(StageScene.Duo, "stand", {pc="kait", npc="rahi"})
		saynn("You grab Ferri from your makeshift chemistry lab. It looks like she has made more progress on it. She grabs a bunch of strange vials with herself.")

		saynn("Then you get Rahi. She is not exactly a fighter but she could create a distraction if need to.")

		saynn("Together, you ride the elevator down to the mining floor. You enter the engineering bay.. and stop near the entrance to the workshop.")

		saynn("[say=kait]Alright. Rahi, see the orange foxy in the corner?[/say]")

		saynn("[say=rahi]Yes, meow..[/say]")

		saynn("[say=kait]He has a datapad. That needs to be changed.[/say]")

		saynn("[say=rahi]Got it..[/say]")

		saynn("You all stay.. while the brown feline steps inside the workshop.")

		addButton("Continue", "See what happens next", "rahi_approaches_foxy")
	if(state == "rahi_approaches_foxy"):
		setCharacters(["rahi", "alexrynard"])
		playAnimation(StageScene.Duo, "stand", {pc="rahi", npc="alexrynard"})
		aimCameraAndSetLocName("eng_workshop")
		saynn("The workshop isn't fully empty.. but there are enough engineers here all the time.")

		saynn("Rahi starts to randomly wander the place, walking from one workbench to another. She is trying to be in Alex's view.. but the fox pays zero attention to her. He is too busy working on his toys.")

		saynn("Her eyes scan the guy and quickly find the most likely location for that datapad. His belt has a sizable rectangular leather pouch. It'd be perfect for it.")

		saynn("After a bit of deliberation.. Rahi decides to switch tactics.")

		addButton("Continue", "See what happens next", "rahi_flops")
	if(state == "rahi_flops"):
		playAnimation(StageScene.Duo, "defeat", {pc="rahi", npc="alexrynard"})
		saynn("Rahi walks past Alex's workbench.. and then trips on its corner!")

		saynn("She flails her arms.. and flops onto the floor with a soft thud. A painful noise leaves her maw.")

		saynn("[say=rahi]Ouch.. ow..[/say]")

		saynn("Alex finally pulls his gaze away from his work.")

		saynn("[say=alexrynard]Broke something?[/say]")

		saynn("[say=rahi]..probably.. not..[/say]")

		saynn("She then tries to get up.. and yelps, hitting the floor again, hissing in the process.")

		saynn("[say=rahi]Ow!.. Her hind paw..[/say]")

		saynn("Rahi's big sad eyes look up at the foxy.")

		saynn("Alex looks down at her, his face expression nothing but neutral.")

		saynn("[say=alexrynard]Only one paw? Good. Can still crawl to the medbay then.[/say]")

		saynn("Rahi hears that.. and huffs.")

		saynn("[say=rahi]A little help would be nice..[/say]")

		saynn("Alex returns gaze back to his bench, his hands picking up the tools while he speaks to her with a calm tone.")

		saynn("[say=alexrynard]You can do it, I believe in you.[/say]")

		saynn("Rahi is still on the floor.")

		saynn("She is clearly not getting any help from the dude anytime soon.")

		saynn("After some time, she does just get up on all fours.. threes.. and proceeds to crawl away.")

		addButton("Continue", "See what happens next", "rahi_gets_caught")
	if(state == "rahi_gets_caught"):
		playAnimation(StageScene.Duo, "defeat", {pc="rahi", npc="alexrynard", flipNPC=true})
		saynn("Or so it seemed at first. Rahi is quick to turn and crawl around the bench when Alex isn't looking her way anymore.")

		saynn("She approaches the foxy from behind. Out of sight from him and others.")

		saynn("Rahi crawls up to the foxy.. and reaches her paw towards his belt. She finds the pouch.. her digits carefully unlock the buckle.. and sneak inside.. then grab onto the corner of the datapad.")

		saynn("She starts pulling it out.")

		saynn("[say=alexrynard]Leave it where it is, inmate.[/say]")

		saynn("Kait whispers, annoyed.")

		saynn("[say=kait]Shit.[/say]")

		saynn("[say=avy]Wait.[/say]")

		saynn("Rahi gasps, her ears perk high. Her reached out wrist got caught by Alex's fast hand.")

		saynn("[say=alexrynard]I know a thief when I see one. Let go while you can.[/say]")

		saynn("The feline's expression changes to a more upset one.")

		saynn("[say=rahi]What if she doesn't?[/say]")

		saynn("[say=alexrynard]I will fry your neck.[/say]")

		saynn("Rahi watches his other hand.. it's resting on the shock remote.")

		saynn("Slowly, she lets go of the datapad and closes the pouch. Alex doesn't let go of her wrist. He pulls out some cuffs before using them to cuff Rahi's paws to one of the chairs. Other engineers don't seem to mind.. a normal occurrence.")

		addButton("Continue", "See what happens next", "rahi_is_fucked")
	if(state == "rahi_is_fucked"):
		playAnimation(StageScene.Duo, "stand", {npc="avy", pc="kait"})
		saynn("More whispering from your team.")

		saynn("[say=kait]Rahi is fucked.[/say]")

		saynn("[say=avy]No, she isn't. Do you need the pad for something?[/say]")

		saynn("[say=kait]No. We just need Alex to not have it.[/say]")

		saynn("[say=avy]Alright, watch.[/say]")

		saynn("Avy tries to get Rahi's attention with a little wave.")

		addButton("Continue", "See what happens next", "rahi_cuffed_to_chair")
	if(state == "rahi_cuffed_to_chair"):
		playAnimation(StageScene.Duo, "sit", {pc="rahi", npc="alexrynard"})
		saynn("Alex stops working on his stuff and directs his full attention to the cuffed cat.")

		saynn("[say=alexrynard]Now you're gonna explain why you needed it.[/say]")

		saynn("Rahi notices the motion behind Alex.. she finally sees Avy.")

		saynn("[say=rahi]..um.. she wanted to see what games it had..[/say]")

		saynn("Alex sighs.")

		saynn("[say=alexrynard]Looking at you, I almost believe you.[/say]")

		saynn("Avy shows herself holding an invisible stick.. before snapping it in half.")

		saynn("[say=rahi]Meow..[/say]")

		saynn("Rahi blinks a few times, her eyes go wide. Avy clarifies by nodding towards the fox's belt.")

		saynn("[say=alexrynard]Now tell me the actual reason.[/say]")

		saynn("The feline swallows audibly.")

		saynn("[say=rahi]Well.. she wanted to get into trouble..[/say]")

		saynn("[say=alexrynard]Really? You're a silly cat. I know how to punish you then. By not punishing you.[/say]")

		saynn("Rahi visibly pouts.. and suddenly kicks Alex! She aims for the exact spot where the datapad was. And she hits it.")

		saynn("Something cracks inside.")

		saynn("Alex sighs again.")

		saynn("[say=alexrynard]Why do I bother sometimes.[/say]")

		saynn("Rahi braces for the imminent shock, closing her eyes shut.")

		saynn("The shock never comes.")

		saynn("The feline opens her eyes and sees Alex pulling out his datapad and putting it on the bench. The screen is cracked.. and the thing doesn't react to being turned on.")

		saynn("[say=alexrynard]I'm getting this repaired. And then I'm walking you to the solitary cell. Hope you're happy.[/say]")

		saynn("[say=rahi]..meow..[/say]")

		addButton("Continue", "See what happens next", "a_choice")
	if(state == "a_choice"):
		setCharacters(["kait", "avy", "ferri"])
		playAnimation(StageScene.Duo, "stand", {pc="kait", npc="avy"})
		aimCameraAndSetLocName("eng_bay_corridor")
		saynn("[say=avy]She broke the datapad, see?[/say]")

		saynn("What a good kitty.")

		saynn("[say=kait]Alright, perfect. We don't have much time so listen up.[/say]")

		saynn("She turns towards all of you.")

		saynn("[say=kait]Avy. Go to the medical block and tell Eliza to call all available engineers to the medical wing. To repair the damage that you did to the mental ward or whatever.[/say]")

		saynn("[say=avy]What? Why me? Tell the blue cat to do it.[/say]")

		saynn("[say=ferri]Mow..[/say]")

		saynn("[say=kait]Ferri is too.. sensitive to Eliza's presence. So you have to do it, don't go against the plan.[/say]")

		saynn("[say=avy]Go tell her yourself then! This engi is gonna crumble when I put my hands on him. But he will laugh when he sees you, the doormat.[/say]")

		saynn("[say=kait]He is just a guy, I can seduce him easily. One sway of my hips and he will do what I want.[/say]")

		saynn("[say=avy]Uh huh. Sure he will.[/say]")

		saynn("[say=kait]He looks sad. He will cling to any pussy he can![/say]")

		saynn("[say=avy]He will see right through you. Intimidation is the only way.[/say]")

		saynn("They both look at you.")

		saynn("[say=kait]What do you think?[/say]")

		addButton("Seduction", "(Kait's love +) Try to seduce the foxy", "do_seduce")
		addButton("Intimidation", "(Avy's love +) Try to threaten the foxy", "do_threaten")
	if(state == "do_seduce"):
		saynn("[say=pc]I like your plan, Kait. Seduction might just work.[/say]")

		saynn("[say=kait]Ha! See, Avy? Now move your butt.[/say]")

		saynn("[say=avy]Pff, whatever. I will be back.[/say]")

		saynn("Avy runs off, towards the elevator.")

		addButton("Continue", "See what happens next", "sed_avy_leave")
	if(state == "sed_avy_leave"):
		removeCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("A few minutes later.. The engineers begin to pour out of the workshop. You don't want to get in their way so you stay in the shadows.")

		saynn("[say=kait]Good. She actually listened for once.[/say]")

		saynn("You peek inside.. the room is almost mostly. Alex is still repairing his datapad, not paying any attention to his surroundings. Rahi is sitting near him, cuffed to the chair.")

		saynn("[say=kait]Let me do the talking. Ferri, stay near the entrance. Just in case.[/say]")

		saynn("[say=ferri]Got it.[/say]")

		saynn("[say=kait]Worst case, we just beat him up together and drag him off to the hideout.[/say]")

		saynn("[say=pc]Sounds good.[/say]")

		saynn("Time to do this.")

		addButton("Continue", "See what happens next", "kait_tries_to_seduce")
	if(state == "kait_tries_to_seduce"):
		addCharacter("alexrynard")
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {pc="kait", npc="alexrynard"})
		aimCameraAndSetLocName("eng_workshop")
		saynn("Kait steps into the workshop, irradiating confidence. She puts some extra sway into each step as she slowly approaches the only busy workbench. The fox takes note of the new person.")

		saynn("[say=kait]You look lonely.. I can fix that.[/say]")

		saynn("The foxy's ears twitch. Kait puts one paw on her side, her pose emphasizing her curves. She tilts her head ever so slightly, a cute smile shining on her face.")

		saynn("You and Ferri hide in the shadows.")

		saynn("[say=alexrynard]No. You can't. And I'm not lonely, I have this cat.[/say]")

		saynn("She reaches out, a single claw tracing along the edge of his workbench.")

		saynn("[say=kait]Oh yeah? She is cuffed, so kinky~. Can I be cuffed to the chair too~?[/say]")

		saynn("[say=rahi]Meow..[/say]")

		saynn("[say=alexrynard]Sure, I have a spare pair. A tight gag too.[/say]")

		saynn("[say=kait]Aww. You've been working too much, foxy. Don't you just want some.. rest? I can provide~.[/say]")

		saynn("[say=alexrynard]You're tying too hard, lilac. Did you come to save the cat? I don't care, take her and leave.[/say]")

		saynn("Her strategy isn't working at all. The guy is just a wall. So she drops her kindness.")

		saynn("[say=kait]I want the cat. And I want you to help take off our collars.[/say]")

		saynn("[say=alexrynard]So that's what this is all about. The old guy is with you too I reckon. Makes sense.[/say]")

		saynn("Sounds like your time to announce your presence.")

		addButton("Continue", "See what happens next", "kait_you_show_up")
	if(state == "kait_you_show_up"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("You quickly approach the foxy, surrounding him. He's still holding his tools, but they won't help him now.")

		saynn("[say=pc]There are many of us. Maybe you should just submit already.[/say]")

		saynn("[say=alexrynard]Hm. You tried every approach with me. And now you're just gonna beat me into submission.[/say]")

		saynn("[say=pc]You're not exactly leaving us many options.[/say]")

		saynn("[say=alexrynard]I see. Let me just finish this repair. And then I will go with you.[/say]")

		saynn("Repair of the datapad? He'd be able to use it to call for help then.")

		saynn("[say=pc]No, no repair.[/say]")

		saynn("[say=alexrynard]The battery is inflating fast. If I don't fix it now, it might just..[/say]")

		saynn("[say=kait]Cut the bullshit![/say]")

		saynn("Kait snarls, stepping forward and trying to grab him by the hair..")

		saynn("When she does that, Alex suddenly stabs the device with a screwdriver.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "go_to_alex"):
		processTime(10*60)

	if(_action == "rahi_cuffed_to_chair"):
		putOn("rahi", "inmatewristcuffs")

	if(_action == "sed_avy_leave"):
		processTime(5*60)

	setState(_action)
