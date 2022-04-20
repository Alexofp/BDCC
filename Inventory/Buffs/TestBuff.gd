extends BuffBase

func _init():
	id = "testBuff"

func initBuff(_args):
	pass

func getVisibleDescription():
	return "I'm doing something alright"

func apply(_buffHolder):
	_buffHolder.receiveDamageMult[DamageType.Physical] += 10
