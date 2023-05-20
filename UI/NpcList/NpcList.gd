extends Control

onready var npcRow = load("res://UI/NpcList/NPCRow.tscn")
onready var container = get_node("VBoxContainer/ItemList/NpcListControld/ScrollContainer/HBoxContainer")


func addRow(name: String, gender: String, personality: String, ID, children: int = 0):
	var newRow = npcRow.instance()
	container.add_child(newRow)
	newRow.setName(name)
	newRow.setGender(gender)
	newRow.setPersonality(personality)
	newRow.setNpcID(ID)
	newRow.setChildren(children)


func showNpcList():
	self.visible = true
	
	
func hideNpcList():
	self.visible = false


func clearRows():
	if(container != null):
		for child in container.get_children():
			container.remove_child(child)
			child.queue_free()

# add pop-up confirmation window
func forgetNPC(ID):
	GM.main.removeDynamicCharacter(ID)

