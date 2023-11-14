extends SceneBase

var howManyTimes = 0

func _init():
	sceneID = "AlexS2SittingNearScene"

func _initScene(_args = []):
	howManyTimes = getFlag("AlexRynardModule.ch1HowManyTimesIdled", 0)
	
	if(howManyTimes == 0):
		setState("first_time")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	if(howManyTimes == 1):
		setState("time2")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	if(howManyTimes == 2):
		setState("time3")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	if(howManyTimes == 3):
		setState("time4")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	if(howManyTimes == 4):
		setState("time5")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	if(howManyTimes == 5):
		setState("time5")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	
	setState(RNG.pick([
	"time2",
	"time3",
	]))
	increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")

func _run():
	if(state == ""):
		addCharacter("alexrynard")
	if(state == "first_time"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Alex is still working on fixing a giant pile of datapads, one by one.")

		saynn("The last time didn't go so well.. but still.. Why not keep him some company?")

		saynn("You sit down on one of the chairs and just proceed to watch him work. Reaction doesn't take long, Alex stops doing what he was doing and looks at you.")

		saynn("[say=alexrynard]Came to bug me again?[/say]")

		saynn("[say=pc]I promise I won't.[/say]")

		saynn("He grumbles and furrows his brows.")

		saynn("[say=alexrynard]Fine. Just don't snore. None of this is gonna be interesting.[/say]")

		saynn("[say=pc]Beats working in the mineshaft all day.[/say]")

		saynn("[say=alexrynard]I bet.[/say]")

		saynn("And so you just.. sit nearby.. and watch Alex.")

		saynn("He grabs one of the datapads and does a quick visual check. Seeing that there is no obvious damage, he tries to power it on. But the device doesn't boot. Alex then pries open a battery cover and finds that the battery has started leaking. He grumbles a little and goes ahead and replaces it, making the thing finally turn on.")

		saynn("A fixed datapad gets placed into the bin.. and then another.. and another..")

		addButton("Continue", "Time flies", "after_first_time")
	if(state == "after_first_time"):
		saynn("Literal hours are passing by. And not much is changing. Alex is fixing up broken devices one by one while you just sit nearby. It's not exactly thrilling.. but at least he is not grumpy at you?")

		saynn("[say=alexrynard]I'm going on a little break. So scatter off please, I don't want you touching anything.[/say]")

		saynn("Aw, there it is. Well, might as well obey.")

		addButton("Continue", "That was fun", "endthescene")
	if(state == "time2"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Alex is here.. and he seems to be working on that giant pile of broken datapads again.. so why not sit nearby.")

		saynn("He sighs as you do that. The guy clearly starts to see the trend.")

		saynn("[say=alexrynard]Don't you have something better to do?[/say]")

		saynn("[say=pc]Nope.[/say]")

		saynn("[say=alexrynard]Fair.[/say]")

		saynn("[say=pc]Should I leave?[/say]")

		saynn("[say=alexrynard]I don't care, do whatever. As long as I can work.[/say]")

		saynn("You offer him a little smile and just stay quiet, letting the foxy focus.")

		saynn("He grabs one of the datapads and checks it. The thing has cracks all over it, screen, case, buttons. Seeing it makes Alex grumble.")

		saynn("[say=alexrynard]Risha's job clearly.[/say]")

		saynn("The device looks truly unsalvageable, almost like it was sat on. But Alex still begins to unscrew the front panel to see what can be saved.")

		saynn("[say=alexrynard]Battery is.. okay.. Screen is obviously ruined.. Motherboard.. some of it can be reused.. Crystal seems to be fine too..[/say]")

		saynn("Takes him forever.. but in the end he salvages some of the components, sending the rest to the red bin.")

		saynn("With nothing better to do, you continue watching..")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "toolate"):
		saynn("Time flies.. So fast in fact, that you become quite sleepy.")

		saynn("You put your elbows on the table and support your head. Your drowsy eyes keep watching Alex work.. until they begin to close on their own..")

		saynn("But just before your chin hits the table, you hear a voice that makes you snap out of it.")

		saynn("[say=alexrynard]Up. My shift is over.[/say]")

		saynn("Right.. You yawn and rub your eyes quickly before getting up.")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "aftersomefixing"):
		saynn("Time flies. Alex is fixing the datapads one after another while you just watch. But the pile doesn't seem to get any smaller..")

		saynn("[say=alexrynard]Break time. Don't touch anything.[/say]")

		saynn("You weren't planning to. The guy will return soon anyway.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time3"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You sit on one of the chairs and just watch Alex work.")

		saynn("Not much happens this time. He just fixes some more datapads.")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "time4"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Another day, another set of broken datapads.")

		saynn("You take your usual seat, far away to not disturb the foxy.. and just watch him work.")

		saynn("It looks like he has given up, accepting your constant presence.")

		saynn("[say=alexrynard]This won't make me eager to fuck you, just saying.[/say]")

		saynn("You shrug and smile.")

		saynn("[say=pc]Sure.[/say]")

		saynn("He looks at you.. and sighs.. returning to his monumental task.")

		saynn("[say=pc]Might I help you though?[/say]")

		saynn("[say=alexrynard]No.[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("One stare.. enough to make you go quiet. Oh well, it was worth a try.")

		saynn("Alex grabs his screwdriver and begins fixing the next broken device.. Time to idle.")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "time5"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You decide to watch Alex working some more. You don't even know why anymore. But.. life does give you a good reason this time.")

		saynn("Alex grabs one of the datapads with a cracked screen.. and begins to search for something on his work table. Something that is clearly not there.")

		saynn("[say=alexrynard]Where did I leave the damn thing..[/say]")

		saynn("Huh. You would offer your help to him.. but you know his answer already.. so you just do it anyway.")

		saynn("You look around. All other work tables seem to be empty. But.. then you notice something shiny under the one that Alex is sitting behind.")

		saynn("A screwdriver! You see it. But how should you do it?")

		addButton("Tell him", "Tell Alex where the screwdriver is", "time5_tell")
		addButton("Give him", "Grab the screwdriver and give it to him", "time5_give")
	if(state == "time5_tell"):
		saynn("[say=pc]I see it. Under your table.[/say]")

		saynn("Alex looks down and sees the tool near his feet.")

		saynn("[say=alexrynard]Right.[/say]")

		saynn("He leans down and grabs it.")

		saynn("Awkward silence settles in.")

		saynn("[say=alexrynard]Thanks.[/say]")

		saynn("[say=pc]No problem.[/say]")

		saynn("And.. he just returns to repairing.")

		saynn("At least you helped him this time! And he wasn't even mad.")

		saynn("For some reason, you are now smiling while watching him work.")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "time5_give"):
		playAnimation(StageScene.Duo, "allfours", {npc="alexrynard", npcAction="sit"})
		saynn("This is your chance to help him!")

		saynn("You quickly get off the chair and climb under his table. You grab the tool and sneak out the table.. ending up between the foxy's legs.. on all fours.")

		saynn("[say=alexrynard]What are you..[/say]")

		saynn("You offer him the lost screwdriver.")

		saynn("[say=pc]Here, I found it.[/say]")

		saynn("He.. blinks a few times while seeing you in that pose.. and then frowns.")

		saynn("[say=alexrynard]Get out of there, now.[/say]")

		addButton("Get out", "Do as he says", "time5_give_getout")
	if(state == "time5_give_getout"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You get out from under his table after he grabs his tool.")

		saynn("[say=alexrynard]Don't ever do that again.[/say]")

		saynn("He snarls, showing his sharp fangs.")

		saynn("[say=pc]Why not?[/say]")

		saynn("[say=alexrynard]You're gonna cut your hands on some metal shavings, get an infection and fucking die. That's 'why not'.[/say]")

		saynn("That.. does make sense.. even if he was pretty rude about it.")

		saynn("You sit on your chair and lower your gaze. Alex is still kinda angry. He starts unscrewing the back panel of the broken datapad.. before stopping again.")

		saynn("[say=alexrynard]But yeah. Thanks.[/say]")

		saynn("[say=pc]No problem..[/say]")

		saynn("Looks like he is not entirely against receiving help. You return to watching him work..")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "time6"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "after_first_time"):
		processTime(60*60*5)

	if(_action == "skiphours_check"):
		processTime(RNG.randi_range(6,9) * 60 * 60)
		
		if(GM.main.isVeryLate()):
			setState("toolate")
		else:
			setState("aftersomefixing")
		return

	if(_action == "time5_tell"):
		processTime(5*60)

	if(_action == "time5_give"):
		processTime(5*60)

	if(_action == "time5_give_getout"):
		processTime(60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["howManyTimes"] = howManyTimes

	return data

func loadData(data):
	.loadData(data)

	howManyTimes = SAVE.loadVar(data, "howManyTimes", 0)
