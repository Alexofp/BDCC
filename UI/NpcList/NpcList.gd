extends Control

onready var npcRow = load("res://UI/NpcList/NPCRow.tscn")
onready var container = $PanelContainer/VBoxC/ScrollC/VboxC2


func addRow(name: String, gender: String, personality: String, ID: String, children: int = 0):
	var newRow = npcRow.instance()
	container.add_child(newRow)
	newRow.init(name, gender, personality, ID, children)
	newRow.connect("onForgetButtonPressed", self, "forgetNPC")


func clearRows():
	if(container != null):
		for child in container.get_children():
			container.remove_child(child)
			child.queue_free()

# add pop-up confirmation window
func forgetNPC(ID):
	GM.main.removeDynamicCharacter(ID)


func _notification(what):
	if(what == NOTIFICATION_PREDELETE && GM.main != null):
		GM.main.playAnimation(StageScene.Solo, "stand", {npc=GM.pc})
