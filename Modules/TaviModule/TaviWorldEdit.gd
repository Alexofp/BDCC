extends WorldEditBase

func _init():
	id = "TaviWorldEdit"
	
func apply(world: GameWorld):
	if(GM.main.hasCommittedToMainRoute() && !GM.main.hasCommittedToTaviMainRoute()):
		return
	if(getFlag("TaviModule.Tavi_IntroducedTo")):
		world.setRoomSprite("mining_taviroom", RoomStuff.RoomSprite.PERSON)
