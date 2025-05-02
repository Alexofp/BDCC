extends DrugDenEventBase

func _init():
	id = "WhoreJunkie"
	eventWeight = 0.4

func getMaxPerFloor() -> int:
	return 1

func getCooldown() -> int:
	return RNG.randi_range(2, 10)

func getStartCooldown() -> int:
	return RNG.randi_range(1, 10)

func getInteractInfo() -> Dictionary:
	return {
		text = "You notice a junkie that doesn't seem agressive.",
		actions = [
			{
				id = "approach",
				name = "Approach",
				desc = "See what's up",
				args = [],
				disabled = false,
			},
		],
	}

func doInteract(_actionID:String, _args:Array = []) -> Dictionary:
	return {sceneID=RNG.pick(["DrugDenEventWhoreScene", "DrugDenEventWhoreSubScene"]), ended=true}

func getMapIcon():
	return RoomStuff.RoomSprite.IMPORTANT
