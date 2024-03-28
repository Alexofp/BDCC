extends SceneBase

var rewardLewd = false
var socketCame = false

func _init():
	sceneID = "SocketHelp1Mineshaft"

func _run():
	if(state == ""):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("[say=pc]Well, what do you need help with?[/say]")

		saynn("Socket gasps and quickly grabs her datapad. She seems to be looking at some kind of blueprint of the station. She tilts her head and turns the datapad a few times, trying to find something.")

		saynn("[say=socket]Could you help guide me around the station? I feel a little lost and this map isn't helping.[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Sure.[/say]")

		saynn("Finally she pokes somewhere.")

		saynn("[say=socket]I need to get to mindshafts.. I mean mineshafts. Could you help me with that?[/say]")

		saynn("Mineshafts? Sounds easy. You nod.")

		saynn("[say=pc]it's just outside engineering. You can't miss it.[/say]")

		saynn("Socket blinks many times while watching you. You can only compare that stare to one of a helpless puppy.")

		saynn("[say=pc]Alright.. Let's go then.[/say]")

		saynn("[say=socket]Yay.[/say]")

		addButton("Mineshafts", "Show Socket where the mineshafts are", "show_mineshafts")
	if(state == "show_mineshafts"):
		aimCameraAndSetLocName("mining_nearentrance")
		saynn("You leave the engineering wing and instantly enter some kind of artificial cave. There are lots of catwalks here, one of them leading to the big lift.. but you're not interested in that one today.")

		saynn("Socket steps behind you, curiously watching around.")

		saynn("[say=pc]Careful here.[/say]")

		saynn("You two step on some platform before pressing a button that makes the platform go down from catwalks to the rocky ground level.")

		saynn("From here you can see tents that have mining equipment guarded by some engineers and a few mineshaft 'enterings'.")

		saynn("[say=pc]Here we are.[/say]")

		saynn("[say=socket]The task says that there is a broken lightbulb in the mineshaft number.. 3.[/say]")

		saynn("You point at the big number 3 above one of the caves.")

		saynn("[say=pc]Must be that one.[/say]")

		saynn("Socket nods.")

		saynn("[say=socket]If you help me find it, I will give you.. what do staff give inmates here?[/say]")

		addButton("Credits", "Say that inmates are usually rewarded with credits", "reward_credits")
		addButton("Themselves", "Jokingly say that staff have to offer themselves to the inmates", "reward_themselves")
	if(state == "reward_credits"):
		saynn("[say=pc]Work credits. Each collar has an account attached to it.[/say]")

		saynn("Socket blinks.")

		saynn("[say=socket]I'm not sure if I have any. Would you help me anyway?..[/say]")

		saynn("You shrug. Why not. It's barely a task anyway.")

		if (getFlag("AlexRynardModule.ch2GotRektHappened")):
			saynn("[say=pc]I don't have the best memories attached to this mineshaft.. but sure. Let's go.[/say]")

		else:
			saynn("[say=pc]Let's go.[/say]")

		addButton("Find broken light", "Follow the mineshaft", "follow_mineshaft")
	if(state == "reward_themselves"):
		saynn("You put on a fake surprised voice.")

		saynn("[say=pc]You didn't know? The staff here rewards inmates by offering their body to them to play with as they wish.[/say]")

		saynn("Socket nods.")

		saynn("[say=socket]Alright.[/say]")

		saynn("Huh? You can't tell if she is serious. Her uniform doesn't make it any easier..")

		saynn("[say=pc]Alright what?[/say]")

		saynn("Socket tilts her head.")

		saynn("[say=socket]Um.. I agree? Something is wrong?[/say]")

		saynn("You raise a brow. Huh, she seems pretty casual about this whole thing.. Makes you wonder how far you can take it.")

		saynn("[say=pc]No, all good. Let's go.[/say]")

		saynn("[say=socket]Yay![/say]")

		addButton("Find broken light", "Follow the mineshaft", "follow_mineshaft")
	if(state == "follow_mineshaft"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", further=true, npcAction=["stand", "res://Inventory/UnriggedModels/BigWrench/BigWrench.tscn"]})
		aimCameraAndSetLocName("mining_shafts_entering")
		saynn("You and Socket follow the mineshaft. It has wooden supports every few meters and a whole network of rails for minecarts.. but you're still being careful as to not trip over something.. or someone.. you bump into other inmates constantly, some of them hitting the rocks and the rest are carrying them.")

		saynn("[say=socket]Wow, it's so huge![/say]")

		saynn("You feel like literally the whole mineshaft turned their heads towards Socket.")

		saynn("[say=socket]This cave is.[/say]")

		saynn("Right. You step a little faster to escape the hungry gazes of inmates who are curious about huge caves..")

		saynn("Finally, you find a support that is not illuminated.")

		saynn("[say=socket]That must be it![/say]")

		saynn("Socket opens her backpack and produces a fresh lightbulb. She jumps, trying to reach the light fixture.. but only makes her modest breasts jiggle more.")

		saynn("[say=socket]Aww, I can't quite reach it.[/say]")

		saynn("Huh.. How many inmates does it take to screw in one lightbulb..")

		saynn("Oh. You notice that there is a generator that is only a few meters away. It has a reinforced closed frame which should be sturdy enough for Socket to stand on..")

		saynn("[say=pc]Hold on.[/say]")

		saynn("You walk to it.. and start pushing it. The thing doesn't have any wheels so you have to just brute-force your way through it.")

		saynn("[say=pc]Ngh..[/say]")

		saynn("Socket sees you struggling and helps you, propping the generator up with her giant wrench to lower the friction and then joins you.")

		saynn("Together, you bring the thing to the wooden support.")

		saynn("[say=socket]Thanks![/say]")

		saynn("The generator is a little shaky, it's not standing on the most flat surface.. so you hold it still for Socket as she begins to climb it.")

		addButton("Continue", "See what happens next", "socket_climbs_generator")
	if(state == "socket_climbs_generator"):
		playAnimation(StageScene.GeneratorOral, "tease", {pc="socket", npc="pc"})
		saynn("Socket climbs the generator and turns towards the light fixture. As she does that, you realize that her crotch is now exactly at your eye level, her exposed pussy is directly up in your face.. You can't look away too, you have to hold the generator still so she doesn't fall..")

		saynn("You're not sure if you should look away though. Socket doesn't seem to mind, she is busy removing the old light. The cave is not fully lit.. but it's enough to make out her folds.. they're so close too. All things considered.. maybe she wouldn't mind?")

		addButton("Just stand still", "Avoid doing anything to Socket while she is in this position", "avoid_lewds")
		addButton("Breathe on it", "Breathe on Socket's pussy warmly and see what happens", "breathe_warmly")
	if(state == "breathe_warmly"):
		playAnimation(StageScene.GeneratorOral, "stroke", {pc="socket", npc="pc"})
		saynn("Seeing Socket's pussy from up so close.. makes you wonder how she would react to this..")

		saynn("You lean a little closer to it and just.. breath warmly over the sensitive folds.")

		saynn("Huh. Socket doesn't seem to react much, the engineer is busy unscrewing the lightbulb.. but her body does react, her slit getting a little wet, now producing a nice scent.")

		saynn("You hold the generator with one hand.. but the second one reaches out and gently caresses Socket's exposed part of the thigh.")

		saynn("But then some inmates are walking past and see you like this.. causing you to recoil back and pretend that you're not doing anything.")

		saynn("[say=socket]Hi! Don't mind us.[/say]")

		saynn("Looks like she didn't care about you caressing her thigh.. Maybe you can do more? Otherwise you'd have to stand there and endure that tantalizing scent..")

		saynn("Socket removes the old broken lightbulb and starts to screw in the new one.")

		addButton("Avoid thinking", "Shut down completely but avoid thinking about that pussy", "avoid_lewds_completely")
		addButton("Dig into it!", "Who cares. Stick your face into her crotch!", "do_lick_socket")
	if(state == "avoid_lewds"):
		saynn("You do your best and avoid even staring at that crotch from now on.. But even just knowing that it's there is enough to keep you lusty. Why doesn't she wear panties or something..")

		saynn("Some inmates are walking past and see you like this..")

		saynn("[say=socket]Hi! Don't mind us.[/say]")

		saynn("Socket finishes unscrewing the old lightbulb and starts installing the new one.")

		saynn("You can feel the female scent of her folds.. it's so.. inviting. Even just not looking at it is not enough..")

		addButton("Avoid thinking", "Shut down completely but avoid thinking about that pussy", "avoid_lewds_completely")
		addButton("Dig into it!", "Who cares. Stick your face into her crotch!", "do_lick_socket")
	if(state == "do_lick_socket"):
		playAnimation(StageScene.GeneratorOral, "lick", {pc="socket", npc="pc"})
		saynn("Ah, what the hell, what's the worst that can happen.")

		saynn("You lean closer to Socket's crotch.. and start with a quick lick, brushing the tip of your tongue over that clit. Her pussy twitches a bit.. but other than that.. no reaction.. so you lick and lick again.")

		saynn("[say=socket]Getting there![/say]")

		saynn("Her exposed slit is incredibly wet by now from your teasing.. but Socket acts like she doesn't care, she just keeps screwing in the new lightbulb. Alright, time to screw with her then.")

		saynn("Rather than going easy on her, you dig your face between her legs, your lips pressing against her petals, your tongue spreading and playing with them!")

		saynn("[say=socket]Almost done..[/say]")

		saynn("Her breathing becomes more deep, her voice quieter, her body squirming a little as you start to eat her out, your lips brushing over the sensitive flesh while the tongue keeps rubbing the clit.")

		addButton("Faster", "Lick her faster and see what happens", "socket_cums_on_pc")
	if(state == "socket_cums_on_pc"):
		playAnimation(StageScene.GeneratorOral, "fast", {pc="socket", npc="pc"})
		saynn("She struggles to screw the lightbulb in, one of her palms lands on your head for extra support.. while you just keep going at it, lapping up her juices and licking her out more, your tongue prodding her entrance and sliding inside with ease, covering the inner walls with your saliva too.")

		saynn("[say=socket]Just the last.. twist..[/say]")

		saynn("You can feel her body tensing up, her sex clenching.. And yet, not a single moan, just panting, Socket is fully focussed on the work.")

		saynn("But just when she finally twists the light in fully, making it light up the area, her body suddenly arches its back, her wet pussy is twitching and releasing a stream of transparent girlcum.. onto your face.")

		saynn("[say=socket]That was.. easy..[/say]")

		saynn("Socket looks down at you and sees your wet face.")

		saynn("[say=socket]Oh..[/say]")

		saynn("She quickly climbs down the generator and helps you wipe it with some cloth.")

		saynn("[say=socket]Sorry![/say]")

		saynn("Socket marks the task as done in her datapad.")

		saynn("[say=socket]Yay. My first completed task.[/say]")

		addButton("Continue", "See what happens next", "after_help")
	if(state == "avoid_lewds_completely"):
		playAnimation(StageScene.GeneratorOral, "tease", {pc="socket", npc="pc"})
		saynn("It takes a lot of.. strength.. but you manage to shut your brain off completely and avoid even thinking about that pussy. You only focus on keeping the generator stable"+str(" while your cock stays hard as a rock" if GM.pc.hasReachablePenis() else "")+".")

		saynn("[say=socket]Almost done![/say]")

		saynn("After a few painfully-long minutes, Socket finishes screwing in the new lightbulb.. that instantly lights up, illuminating the cave.")

		saynn("[say=socket]There we go![/say]")

		saynn("She carefully jumps off the generator.. Phew, now you only have to stare at her breasts.")

		saynn("Socket marks the task as done in her datapad.")

		saynn("[say=socket]That wasn't so hard.[/say]")

		saynn("Maybe for her..")

		addButton("Continue", "See what happens next", "after_help")
	if(state == "after_help"):
		aimCameraAndSetLocName("mining_nearentrance")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		GM.pc.setLocation("mining_nearentrance")
		saynn("After completing the task, you and Socket exit the mineshafts. She turns towards you.")

		saynn("[say=socket]Thank you! I might need your help again soon.[/say]")

		if (rewardLewd):
			saynn("She starts walking away.. but then remembers something and stops.")

			saynn("[say=socket]Oh, right, the reward.[/say]")

			saynn("Casually, Socket presents you her whole body, spreading her legs a bit to give you more access.")

			saynn("You look around.. the place is not the most private one. So maybe it's fine to just leave?")

			addButton("Just leave", "It was just a joke anyway", "socket_reward_just_leave")
			addButton("Grope her", "Quietly grope Socket to not attract too much attention", "socket_reward_grope")
		else:
			saynn("She starts walking away.. but then remembers something and stops.")

			saynn("[say=socket]Oh, right, credits.. I don't have any but I have this![/say]")

			saynn("Socket pats you on the head softly.")

			saynn("[say=socket]Good inmate.[/say]")

			saynn("Credits would be better but this is better than nothing..")

			addButton("Continue", "See what happens next", "endthescene")
	if(state == "socket_reward_just_leave"):
		saynn("[say=pc]I wasn't serious, staff doesn't have to submit to inmates.[/say]")

		saynn("[say=socket]Oh, okay! Well, take care then![/say]")

		saynn("That's it? She is not even angry that you lied to her. Huh.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "socket_reward_grope"):
		playAnimation(StageScene.Grope, "grope", {pc="socket", npc="pc"})
		saynn("Nah, might as well take her up on the offer. You do it sneakily though, your hand lands on her belly and slides down along it to her crotch. "+str("Her pussy is still quite wet after her orgasm. As you spread it, you reveal a few strings of juices that are hanging between her folds." if socketCame else "Her pussy is slightly wet. As you spread it, you reveal a lonely string of juices that is hanging between her folds.")+"")

		saynn("Your other hand cups one of the breasts and gently squeezes. All the while Socket just watches you do that, spreading her legs more for you and biting her lip slightly.")

		saynn("After playing with her slit for a bit, your hand slides further between her legs and finds her tight pucker.. That's when Socket's expression suddenly changes, she takes a step back, escaping your grasp.")

		saynn("[say=socket]Not there.[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("[say=socket]Because that's the wrong hole![/say]")

		saynn("The whole floor probably heard that.. best to stop there.")

		saynn("[say=pc]Sure.[/say]")

		saynn("Socket smiles and walks up, the fur on her thighs looking quite messy..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "show_mineshafts"):
		processTime(10*60)

	if(_action == "reward_themselves"):
		rewardLewd = true

	if(_action == "follow_mineshaft"):
		processTime(5*60)

	if(_action == "avoid_lewds"):
		processTime(5*60)
		GM.pc.addLust(30)

	if(_action == "breathe_warmly"):
		processTime(3*60)

	if(_action == "do_lick_socket"):
		processTime(3*60)

	if(_action == "avoid_lewds_completely"):
		processTime(3*60)
		GM.pc.addLust(70)

	if(_action == "socket_cums_on_pc"):
		processTime(3*60)
		GM.pc.cummedOnBy("socket", FluidSource.Vagina, 0.3)
		GM.pc.cummedInMouthBy("socket", FluidSource.Vagina, 0.2)
		socketCame = true

	setState(_action)

func saveData():
	var data = .saveData()

	data["rewardLewd"] = rewardLewd
	data["socketCame"] = socketCame

	return data

func loadData(data):
	.loadData(data)

	rewardLewd = SAVE.loadVar(data, "rewardLewd", false)
	socketCame = SAVE.loadVar(data, "socketCame", false)
