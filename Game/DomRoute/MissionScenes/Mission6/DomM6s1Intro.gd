extends SceneBase

func _init():
	sceneID = "DomM6s1Intro"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="avy", pc="kait"})
		addCharacter("kait")
		addCharacter("avy")
		saynn("Kait and Avy are both here.")

		saynn("[say=kait]Alright. Is everyone ready? We're going to make a proper introduction to our future friendly engineer today and ask for a few favors.[/say]")

		saynn("[say=avy]Been born ready.[/say]")

		saynn("Kait looks at you. No point in stopping now so you respond with a nod.")

		saynn("[say=kait]Let's stick together. We're gonna grab Rahi and Ferri on the way there. The more of us are near him, the better.[/say]")

		saynn("[say=avy]The higher the risk we all get caught. What are you gonna do about his friends?[/say]")

		saynn("Kait smiles.")

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

		saynn("She flails her arms.. and flops onto the floor with a soft thud. A painful noise escapes her muzzle.")

		saynn("[say=rahi]Ouch.. ow..[/say]")

		saynn("Alex finally pulls his gaze away from his work.")

		saynn("[say=alexrynard]Broke something?[/say]")

		saynn("[say=rahi]..probably.. not..[/say]")

		saynn("She then tries to get up.. and yelps, hitting the floor again, hissing in the process.")

		saynn("[say=rahi]Ow!.. Her hind paw..[/say]")

		saynn("Rahi's big sad eyes look up at the foxy.")

		saynn("Alex looks down at her, his face expression nothing but neutral.")

		saynn("[say=alexrynard]Only one paw? Okay. Still have enough to crawl to the medbay.[/say]")

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

		saynn("[say=rahi]..um.. she wanted to check what games it had..[/say]")

		saynn("Alex sighs.")

		saynn("[say=alexrynard]Right. I almost believe you.[/say]")

		saynn("Avy shows herself holding an invisible stick.. before snapping it in half.")

		saynn("[say=rahi]Meow..[/say]")

		saynn("Rahi blinks a few times, her eyes go wide. Avy clarifies by nodding towards the fox's belt.")

		saynn("[say=alexrynard]Now tell me the actual reason.[/say]")

		saynn("The feline swallows audibly.")

		saynn("[say=rahi]Well.. she wanted to get into trouble.. Getting punished is fun..[/say]")

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

		saynn("Avy instantly frowns and crosses her arms.")

		saynn("[say=avy]What? Why me? Tell the blue cat to do it.[/say]")

		saynn("Ferri pouts.")

		saynn("[say=ferri]Mow..[/say]")

		saynn("[say=kait]Ferri is too.. sensitive to Eliza's presence. So you have to do it, don't go against the plan.[/say]")

		saynn("Avy is unyielding.")

		saynn("[say=avy]Go tell her yourself then! This engi is gonna crumble when I put my hands on him. But he will laugh when he sees you, the doormat.[/say]")

		saynn("[say=kait]He is just a guy, I can seduce him easily. One hip sway and he will do what I want.[/say]")

		saynn("Avy rolls her eyes.")

		saynn("[say=avy]Uh huh. Sure he will.[/say]")

		saynn("[say=kait]He looks lonely. He will cling to any pussy he can![/say]")

		saynn("[say=avy]He will see right through you. Intimidation is the only way.[/say]")

		saynn("They both look at you.")

		saynn("[say=kait]What do you think?[/say]")

		addButton("Seduction", "(Kait's love +) Try to seduce the foxy", "do_seduce")
		addButton("Intimidation", "(Avy's love +) Try to threaten the foxy", "do_threaten")
	if(state == "do_threaten"):
		saynn("[say=pc]The guy is probably immune to seduction, Kait. We have to go with the rough approach.[/say]")

		saynn("[say=avy]Finally, someone with a lick of sense.[/say]")

		saynn("[say=kait]Fine, better I do it anyway.[/say]")

		saynn("Kait runs off, towards the elevator.")

		addButton("Continue", "See what happens next", "sed_kait_leave")
	if(state == "sed_kait_leave"):
		removeCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("A few minutes later.. The engineers begin to pour out of the workshop. You don't want to get in their way so you stay in the shadows.")

		saynn("[say=avy]Yeah, keep moving your legs, sloths..[/say]")

		saynn("You peek inside.. the room is almost mostly. Alex is still repairing his datapad, not paying any attention to his surroundings. Rahi is sitting near him, cuffed to the chair.")

		saynn("[say=avy]No smart shit. We approach the guy and put some pressure on him.[/say]")

		saynn("[say=pc]Ferri, stay near the entrance. Just in case.[/say]")

		saynn("[say=ferri]Got it.[/say]")

		saynn("Avy clenches her fists.")

		saynn("[say=avy]If he reaches for the shock remote, hit first. He can't drop all of us.[/say]")

		saynn("Time to do this.")

		addButton("Continue", "See what happens next", "avy_tries_to_threaten")
	if(state == "avy_tries_to_threaten"):
		addCharacter("alexrynard")
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {pc="avy", npc="alexrynard"})
		aimCameraAndSetLocName("eng_workshop")
		saynn("Either of you don't bother being subtle. You walk into the workshop like you own the place, your eyes locking onto the fox. Ferri stays near the exit, just like she was told.")

		var _didThisAlready:bool = getFlag("AlexRynardModule.ch2GotRektHappened", false)
		saynn("Alex looks up from his datapad. Seeing you two makes him tense up a little. He looks around too.. noticing the empty workshop.")

		saynn("[say=avy]Hey, foxy.[/say]")

		saynn("She stops right in front of his workbench, leaning on it with one paw.")

		saynn("[say=alexrynard]Came to shank me?[/say]")

		saynn("Avy tilts her head to the side a bit and puts on a mean smile.")

		saynn("[say=pc]You're a guy who knows how our collars work.[/say]")

		saynn("Alex glances at you.. then back to Avy.")

		saynn("[say=alexrynard]I see. The old guy is with you too I reckon. And this cat.. Makes sense.[/say]")

		saynn("Avy's grin widens.")

		saynn("[say=avy]There are many of us. Just disable our collars and we won't have any problems. Simple.[/say]")

		saynn("She cracks her knuckles.")

		saynn("[say=alexrynard]Hm. You tried a kind approach with me. But now you're just gonna beat me into submission.[/say]")

		saynn("[say=avy]You're a smart foxy. Except we're not gonna beat you. We're gonna break you. There's a difference.[/say]")

		saynn("She leans in closer, her voice dropping to a growl. Alex hand starts reaching for the remote.")

		saynn("[say=alexrynard]You're making a mistake.[/say]")

		saynn("[say=avy]I've broken bigger guys than you. Wanna see how that goes? Your remote won't save you~.[/say]")

		saynn("Alex stops reaching for the remote. He lowers his chin.. looking down at the broken datapad in front of him. Avy chuckles.")

		saynn("[say=avy]Aw. At least resist a little. Don't be so spineless. Throw a punch, c'mon.[/say]")

		saynn("[say=alexrynard]Can I finish the repair?[/say]")

		saynn("If he repairs that datapad, he will be able to call for help.")

		saynn("[say=pc]No. That can wait.[/say]")

		saynn("Suddenly, Alex grabs a screwdriver and stabs the datapad's battery.")

		saynn("It bursts..")

		addButton("Continue", "See what happens next", "avy_battery_boom")
	if(state == "avy_battery_boom"):
		removeCharacter("alexrynard")
		playAnimation(StageScene.Duo, "hurt", {npc="avy", npcAction="hurt"})
		saynn("The world becomes a pure, blinding white. You throw your arm over your gaze. Avy yelps and does the same, stumbling back. Rahi is the unlucky one, forced to endure the full energy of the flash on her closed eyes.")

		saynn("You hear fast steps rushing away, followed by the noises of electricity and Ferri's sharp cry.")

		saynn("[say=ferri]Ahh![/say]")

		saynn("All this happens in only a few seconds.")

		saynn("[say=avy]Fucker.. ugh..[/say]")

		saynn("By the time your vision clears, Alex is gone. Ferri is on the floor, panting and holding onto her collar. On the workbench is the exploded datapad. Its battery has left a huge dark splotch on the flat surface.")

		saynn("Avy growls, rubbing her eyes.")

		saynn("[say=pc]Everyone okay?[/say]")

		saynn("[say=avy]I'm fine.. Where is he?![/say]")

		saynn("You look at Ferri.")

		saynn("[say=ferri]He.. shocked me.. and ran deep into the engineering bay.[/say]")

		saynn("The brown feline doesn't answer. You see her eyes watering.")

		saynn("[say=pc]Rahi?[/say]")

		saynn("[say=rahi]Her eyes.. they hurt..[/say]")

		saynn("Shit. Your head is throbbing too.. but probably not as bad as hers.")

		saynn("[say=pc]Avy? Get Rahi to the doctor. Now.[/say]")

		saynn("Avy rubs her eyes.")

		saynn("[say=avy]What about..[/say]")

		saynn("[say=pc]I will deal with him.[/say]")

		saynn("[say=avy]Alright. Shit.[/say]")

		saynn("The only problem.. Rahi is still cuffed to the chair.")

		addButton("Help Rahi", "Try to get Rahi uncuffed", "avy_help_rahi")
	if(state == "avy_help_rahi"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("You approach Rahi's chair and look at her cuffs. The chain between her wrists runs around one of the bars that holds the chair's back. It's possible to just hold the chair up and walk.. but not in Rahi's current state.")

		saynn("[say=pc]We need to take those cuffs off.[/say]")

		saynn("[say=ferri]I brought.. thermite.[/say]")

		saynn("Ferri is trying to get up.. but her body is still too sore after the unscheduled cardio session. She is holding a bigger bag with some kind of gray powder.. and a smaller one with brown stuff.")

		saynn("[say=pc]I can do it.[/say]")

		saynn("You run to Ferri and fetch it.")

		saynn("[say=ferri]Pour some of the gray stuff onto the chain.. just the chain! Then add a pinch of the brown stuff to start the reaction.[/say]")

		saynn("Seems easy enough.")

		saynn("You return to Rahi. She is still blinking a lot, the whites of her eyes looking red.")

		saynn("[say=rahi]Ow-w..[/say]")

		saynn("[say=pc]Hold on, kitten.[/say]")

		saynn("You follow the instructions, sprinkling the gray powder directly onto the chain that connects Rahi's wrists. Then you throw a pinch of the brown one.. and watch as the chain lights up!")

		saynn("Whatever it is.. it starts generating a lot of heat.. so much that the chain links start glowing. And soon enough, they start turning liquid, melting!")

		addButton("Continue", "See what happens next", "avy_rahi_free")
	if(state == "avy_rahi_free"):
		playAnimation(StageScene.SexStart, "start", {npc="avy", pc="rahi"})
		saynn("Now that Rahi is free, Avy picks her up into a fireman's carry, pulling the feline onto her shoulder.")

		saynn("[say=avy]Hold tight to me.[/say]")

		saynn("Rahi grabs onto the dark foxy.")

		saynn("[say=rahi]Meow-w..[/say]")

		saynn("Together, they head for the exit. Hopefully they can find help fast enough. Avy stops for a second and looks at you.")

		saynn("[say=avy]Make him regret it.[/say]")

		saynn("You nod.")

		saynn("Ferri seems to be fine by now. She gets up and approaches you.")

		saynn("[say=ferri]What are we gonna do?[/say]")

		saynn("There is only one thing.")

		saynn("[say=pc]We go after him.[/say]")

		saynn("First task.. getting into the staff-only area.")

		addButton("Continue", "See what happens", "door_bolted")
	if(state == "do_seduce"):
		saynn("[say=pc]I like your plan, Kait. Seduction might just work.[/say]")

		saynn("[say=kait]You heard {pc.him}. Now move your butt![/say]")

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

		saynn("Kait unbuttons the top button on her shirt, exposing more of her cleavage. Not very impressive cleavage.. but still.")

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

		saynn("[say=kait]Oh yeah? She is cuffed, so kinky~. Can I be cuffed too~?[/say]")

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

		saynn("Alex takes a short glance at you, his expression barely changing.")

		saynn("[say=alexrynard]Hm. You tried every approach with me. And now you're just gonna beat me into submission.[/say]")

		saynn("[say=pc]You're not exactly leaving us many options.[/say]")

		saynn("[say=alexrynard]I know. Let me just finish this repair. And then I will go with you.[/say]")

		saynn("Repair of the datapad? He'd be able to use it to call for help then.")

		saynn("[say=pc]No, no repair.[/say]")

		saynn("[say=alexrynard]The battery is inflating fast. If I don't fix it now, it might just..[/say]")

		saynn("[say=kait]Cut the bullshit![/say]")

		saynn("Kait snarls, stepping forward and trying to grab him by the hair..")

		saynn("When she does that, Alex suddenly stabs the device with a screwdriver.")

		saynn("The battery bursts..")

		addButton("Continue", "See what happens next", "kait_battery_boom")
	if(state == "kait_battery_boom"):
		removeCharacter("alexrynard")
		playAnimation(StageScene.Duo, "hurt", {npc="kait", npcAction="defeat"})
		saynn("The world becomes a pure, blinding white. You throw your arm over your gaze. Kait yelps and does the same, stumbling back and collapsing in the process. Rahi is the unlucky one, forced to endure the full energy of the flash on her closed eyes.")

		saynn("You hear fast steps rushing away, followed by the noises of electricity and Ferri's sharp cry.")

		saynn("[say=ferri]Ahh![/say]")

		saynn("All this happens in only a few seconds.")

		saynn("[say=kait]Motherf-.. ugh..[/say]")

		saynn("By the time your vision clears, Alex is gone. Ferri is on the floor, panting and holding onto her collar. On the workbench is the exploded datapad. Its battery has left a huge dark splotch on the flat surface.")

		saynn("Kait blinks rapidly, rubbing her eyes.")

		saynn("[say=pc]Everyone okay?[/say]")

		saynn("[say=kait]I'm.. fine. Fuck, my head..[/say]")

		saynn("You look at Ferri.")

		saynn("[say=ferri]He.. shocked me.. and ran deep into the engineering bay.[/say]")

		saynn("The brown feline doesn't answer. You see her eyes watering.")

		saynn("[say=pc]Rahi?[/say]")

		saynn("[say=rahi]Her eyes.. they hurt..[/say]")

		saynn("Shit. Your head is throbbing too.. but probably not as bad as hers.")

		saynn("[say=pc]Kait? Can you stand?[/say]")

		saynn("[say=kait]Yeah.. I'm ready to fuck this guy up..[/say]")

		saynn("You help Kait to get up. She instantly holds onto her head again.")

		saynn("[say=kait]Ow.. I'm fine..[/say]")

		saynn("Doesn't seem so. Better to grab the reins now.")

		saynn("[say=pc]No, you're not. You're gonna grab Rahi and get both of your butts to Eliza so she can help you two. Got it?[/say]")

		saynn("[say=kait]I can still..[/say]")

		saynn("Now is not the time to play heroes.")

		saynn("[say=pc]Kait. There is no time for this. Shut up and do what I say.[/say]")

		saynn("[say=kait]..okay.[/say]")

		saynn("The only problem.. Rahi is still cuffed to the chair.")

		addButton("Help Rahi", "Try to get Rahi uncuffed", "kait_help_rahi")
	if(state == "kait_help_rahi"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("You approach Rahi's chair and look at her cuffs. The chain between her wrists runs around one of the bars that holds the chair's back. It's possible to just hold the chair up and walk.. but not in Rahi's current state.")

		saynn("[say=pc]We need to take those cuffs off.[/say]")

		saynn("[say=ferri]I brought.. thermite.[/say]")

		saynn("Ferri is trying to get up.. but her body is still too sore after the unscheduled cardio session. She is holding a bigger bag with some kind of gray powder.. and a smaller one with brown stuff.")

		saynn("[say=pc]I can do it.[/say]")

		saynn("You run to Ferri and fetch it.")

		saynn("[say=ferri]Pour some of the gray stuff onto the chain.. just the chain! Then add a pinch of the brown stuff to start the reaction.[/say]")

		saynn("Seems easy enough.")

		saynn("You return to Rahi. She is still blinking a lot, the whites of her eyes looking red.")

		saynn("[say=rahi]Ow-w..[/say]")

		saynn("[say=pc]Hold on, kitten.[/say]")

		saynn("You follow the instructions, sprinkling the gray powder directly onto the chain that connects Rahi's wrists. Then you throw a pinch of the brown one.. and watch as the chain lights up!")

		saynn("Whatever it is.. it starts generating a lot of heat.. so much that the chain links start glowing. And soon enough, they start turning liquid, melting!")

		addButton("Continue", "See what happens next", "kait_rahi_free")
	if(state == "kait_rahi_free"):
		playAnimation(StageScene.Duo, "stand", {pc="kait", npc="rahi"})
		saynn("Now that Rahi is free, Kait helps her to get up.")

		saynn("[say=kait]Alright, kitty, let's go to the doctor. Just hold onto me.[/say]")

		saynn("Rahi grabs onto the snow leopard.")

		saynn("[say=rahi]Meow-w..[/say]")

		saynn("Together, they head for the exit. Hopefully they can find help fast enough.")

		saynn("Ferri seems to be fine by now. She gets up and approaches you.")

		saynn("[say=ferri]What are we gonna do?[/say]")

		saynn("There is only one thing.")

		saynn("[say=pc]We go after him.[/say]")

		saynn("First task.. getting into the staff-only area.")

		addButton("Continue", "See what happens", "door_bolted")
	if(state == "door_bolted"):
		removeCharacter("rahi")
		removeCharacter("kait")
		removeCharacter("avy")
		aimCameraAndSetLocName("eng_bay_corridor")
		var _hasAccess:bool = (GM.QS.isCompleted("Ch2AlexQuest") || getFlag("AlexRynardModule.ch2CanEnterEngineering", false))
		saynn("Together with Ferri, you approach the staff-only door. Its lights are shining bright red.")

		if (_hasAccess):
			saynn("You know the password to open it.. but once you enter it, the door just beeps angrily at you.")

		else:
			saynn("When you try to type anything on its access panel, the door just beeps angrily at you.")

		saynn("It seems to be bolted shut..")

		saynn("Alex Rynard has barricaded himself inside his little castle. With no way to get to him. Not without the special tools..")

		saynn("Wait. Ferri is your special tool. You hand her the bag with the thermite.")

		saynn("[say=pc]Can you use it to melt through the door?[/say]")

		saynn("Ferri blinks and looks at you like you're insane.")

		saynn("[say=ferri]Are you serious?[/say]")

		saynn("The guy has caused so much trouble for you already. Your single glance is enough to let Ferri know the answer.")

		saynn("[say=ferri]Mew.. I can probably make a hole with what we have. Won't be enough to fit through.. and you probably don't want to be crawling through molten metal..[/say]")

		saynn("[say=pc]So this is it then?[/say]")

		saynn("She shrugs.")

		saynn("[say=ferri]I did bring the same stuff that I used to blow up the mental ward door.. but this one seems more secure.[/say]")

		saynn("The door is strong.. sure.. but what about the wall?")

		saynn("[say=pc]Can it get us through some concrete?[/say]")

		saynn("[say=ferri]..maybe.[/say]")

		saynn("You grab her by the collar and pull her back into the workshop.")

		addButton("Continue", "See what happens next", "ferri_prepares_boom")
	if(state == "ferri_prepares_boom"):
		aimCameraAndSetLocName("eng_workshop")
		saynn("Inside the workshop, you show Ferri the west wall.")

		saynn("[say=pc]Here. Blow this one up.[/say]")

		saynn("[say=ferri]What if there is open space behind it.. mow..[/say]")

		saynn("[say=pc]I have a good feeling about it, Ferri. Just do it.[/say]")

		saynn("Having nothing to say against your order, Ferri decides to begin the preparations.")

		saynn("She starts by first sprinkling some thermite roughly into the center of the wall. When she ignites it, the thermite lights up, making a small hole. Indeed, there is some room behind this wall.")

		saynn("[say=ferri]Okay.. This is gonna make a boom.. So we will have to hide behind something.[/say]")

		saynn("You get yourself behind the furthest-most workbench. It seems to be sturdy enough to withstand anything.")

		saynn("Ferri places two vials inside the burning-hot hole.. and quickly rushes to you, hiding behind the same workbench.")

		saynn("Seconds later..")

		saynn("BOOM!")

		saynn("Whatever it is, it sure did its thing. The whole room is shaking as all of the concrete chunks are still falling down. The explosion spawns a thick cloud of smoke that obscures the result.")

		saynn("You keep hiding for some time, making sure nothing is gonna kill you.")

		saynn("Then, you carefully peek your head out above the bench.")

		saynn("[say=pc]This probably alerted half of the station.[/say]")

		saynn("When the smoke clears.. you can see an entering. Not big enough to walk through.. but surely big enough to crawl through.")

		saynn("[say=pc]You did well. Let's go![/say]")

		addButton("Continue", "See what happens next", "crawl_through_hole")
	if(state == "crawl_through_hole"):
		aimCameraAndSetLocName("eng_breakroom")
		GM.pc.setLocation("eng_bay_nearbreakroom")
		saynn("You and Ferri crawl through the new opening.. and end up in some kind of staff break room.. or at least it was one. The explosion has turned this space into a mess. Broken sofa, destroyed TV, sparking vending machine.. There are chunks of concrete scattered everywhere.")

		saynn("[say=ferri]They're gonna be very angry at us..[/say]")

		saynn("[say=pc]They can rebuild it. They're engineers, that's what they live for.[/say]")

		saynn("For you, it was time to find Alex Rynard.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "go_to_alex"):
		processTime(10*60)

	if(_action == "rahi_cuffed_to_chair"):
		putOn("rahi", "inmatewristcuffs")

	if(_action == "sed_kait_leave"):
		processTime(5*60)

	if(_action == "avy_help_rahi"):
		processTime(5*60)

	if(_action == "avy_rahi_free"):
		putOff("rahi", "inmatewristcuffs")

	if(_action == "sed_avy_leave"):
		processTime(5*60)

	if(_action == "kait_help_rahi"):
		processTime(5*60)

	if(_action == "kait_rahi_free"):
		putOff("rahi", "inmatewristcuffs")

	if(_action == "crawl_through_hole"):
		addMessage("Task updated!")

	setState(_action)
