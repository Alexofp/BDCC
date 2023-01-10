extends GameExtender

# An example of how to extend the game's core classes with your code

func _init():
	id = "TestExtender"

func register(_GES:GameExtenderSystem):
	## Uncomment these lines to make this extender work
	#_GES.register(self, ExtendGame.pcUpdateNonBattleEffects)
	#_GES.register(self, ExtendGame.npcUpdateNonBattleEffects)
	pass

func pcUpdateNonBattleEffects(_pc:Player):
	# Adds a 'wounded' status effect at every update
	print("TEEEST "+_pc.getName())
	_pc.addEffect(StatusEffect.Wounded)

func npcUpdateNonBattleEffects(_npc:Character):
	print("NPC TEEEST "+_npc.getName())
	_npc.addEffect(StatusEffect.Wounded)

