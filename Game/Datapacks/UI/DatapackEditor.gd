extends Control

var datapack:Datapack
onready var pack_variables = $VBoxContainer/HBoxContainer/PackVariablesScroll/PackVariables

signal onSaveButtonPressed(menu, datapack)
signal onCancelButtonPressed(menu, datapack)

func setDatapack(theDatapack):
	datapack = theDatapack

	updateList()

func updateList():
	pack_variables.setVariables(datapack.getEditVars())

func _on_PackVariables_onVariableChange(id, value):
	if(datapack.applyEditVar(id, value)):
		updateList()

func _on_SaveButton_pressed():
	pack_variables.checkWidgetsFinished()
	emit_signal("onSaveButtonPressed", self, datapack)

func _on_CancelButton_pressed():
	emit_signal("onCancelButtonPressed", self, datapack)

func onMenuPopped():
	updateList()
