extends SceneBase

func _init():
	sceneID = "MirriS0TeaseScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("The station's corridors are all the same.. but something feels different.. feels off..")

		saynn("Everything is normal.. and yet.. it's not.")

		saynn("A shadow is moving outside of your vision cone. A breathing ghost that you can't see.")

		saynn("Is someone watching you? Looking around yields no result.")

		saynn("And yet, something is reading you..")

		saynn("An invisible hand slides over your shoulder, its clawed digits going around and reaching your chin.")

		saynn("Whatever it is, it's assessing you.. you can guess that much.")

		saynn("You know how it feels because you do it a lot yourself.. Weird.. You can't help but to furrow your brows, clench your fists, and prepare for the worst.")

		addButton("Look around", "Find the intruder of peace", "look_around")
	if(state == "look_around"):
		saynn("You look around.. and catch a glimpse of a feline tail disturbing the cold steam coming from one of the vents. You're not sure about the color.. but it was bright.")

		saynn("[say=pc]Hey, I saw you.[/say]")

		saynn("The dimly lit corridor gives too little light for your eyes.. who knows if that wasn't just your mind playing tricks on you.")

		saynn("Soon the dull hum of machinery fills the air again. Inmates are walking past, giving you slightly strange looks.")

		saynn("You wait a few seconds.. until everything calms down.. and then proceed on your way.")

		saynn("Huh.")

		saynn("You get a strange feeling that this is somehow related to you enslaving that person..")

		addButton("Continue", "See what happens next..", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "look_around"):
		processTime(3*60)

	setState(_action)
