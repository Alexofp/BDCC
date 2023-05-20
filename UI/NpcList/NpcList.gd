extends Control

var npcRow = preload("res://UI/NpcList/NPCRow.tscn")
onready var container = get_node("VBoxContainer/ItemList/Stats/ScrollContainer/HBoxContainer")


#func _ready():
#	pass


func addRow(name: String, gender: String, personality: String, ID, children: int = 0):
	var newRow = npcRow.instance()
	container.add_child(newRow)
	newRow.setName(name)
	newRow.setGender(gender)
	newRow.setPersonality(personality)
	newRow.setNpcID(ID)
	newRow.setChildren(children)



func clearRows():
	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()


func forgetNPC(ID):
	GM.main.removeDynamicCharacter(ID)


func updateData():
	pass
