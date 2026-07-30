extends WorldEditBase

func _init():
	id = "KaitWorldEdit"
	
func apply(world: GameWorld):
	if(GM.main.hasCommittedToMainRoute()):
		world.setRoomSprite("fight_corner_sw", RoomStuff.RoomSprite.NONE)
		return
	
	world.setRoomSprite("fight_corner_sw", RoomStuff.RoomSprite.PERSON)
