extends Node
class_name BuffsHolder

var buffs: Array = []
var npc = null
var dealDamageMult = {}
var recieveDamageMult = {}
var armor = {}
var gagged = false

func _ready():
	name = "Buffs"

func setCharacter(newnpc):
	npc = newnpc

func calculateBuffs():
	assert(npc != null)
	buffs.clear()
	dealDamageMult.clear()
	recieveDamageMult.clear()
	armor.clear()
	gagged = false
	for damageType in DamageType.getAll():
		dealDamageMult[damageType] = 0.0
		recieveDamageMult[damageType] = 0.0
		armor[damageType] = 0
	
	var items = npc.getInventory().getAllEquippedItems()
	for slot in items:
		var item = items[slot]
		buffs.append_array(item.getBuffs())

	for buff in buffs:
		buff.apply(self)

func isGagged():
	return gagged

func getDealDamageMult(damageType):
	if(!dealDamageMult.has(damageType)):
		return 0.0
	
	return dealDamageMult[damageType]

func getRecieveDamageMult(damageType):
	if(!recieveDamageMult.has(damageType)):
		return 0.0
	
	return recieveDamageMult[damageType]

func getArmor(damageType):
	if(!armor.has(damageType)):
		return 0
	
	return armor[damageType]

func hasBuff(buffID):
	for buff in buffs:
		if(buff.id == buffID):
			return true
	return false
