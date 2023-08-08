extends SceneBase

func _init():
	sceneID = "Ch5s3AssemblyFirstScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("Right.. Looking at this room.. this might be the one where they keep all their unfinished prototypes.")

		saynn("As you cautiously step further into the dimly lit assembly lab, a sense of.. unease washes over you. The cluttered workstations scattered throughout this big open space all have some abandoned projects that had been left behind. You see tools, spare parts and a sea of unfinished.. creations. But that's not what you're looking for.")

		saynn("Your gaze shifts to the middle of the lab that has a long assembly line going from one end of the room to another. As you follow it, you notice.. androids.. broken bodies, severed limbs and disembodied heads, all just left on the assembly line catching dust. Huh. Lack of a strong light source makes this area look.. outright creepy. At least none of the equipment seems to be powered.")

		saynn("As you reach the end of the assembly line you notice a special zone that claims to be the 'equipment testing area'. Rows of special glass lockers followed by a small shooting range. Right, this might be your best bet.")

		addButton("Search", "Look for the prototype that you need", "search_prototype")
	if(state == "search_prototype"):
		saynn("It's.. hard to see much. But you look into each glass locker. None of them seem to have actual ranged weapons, it's mostly just barebone versions of specialized equipment like hydraulic clamps, drills, extinguishers, that sort of stuff.. None of it seems to have any way to be used by a person, probably why there are so many exposed wires on each.")

		saynn("Right, you find something that looks.. vaguely like grenades, inside one of these lockers. But trying to open it.. you can't. There seems to be a keypad attached to each one of these.. and none of them work without power.")

		saynn("After some time.. you give up. All these androids.. make you feel like you are being watched constantly.")

		saynn("It seems you will need to find a way to turn on the power first. Maybe you will find codes for these keypads as well.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "search_prototype"):
		processTime(10*60)
		addMessage("Task updated!")
		setFlag("TaviModule.Ch5SearchedLabFirstTime", true)

	setState(_action)
