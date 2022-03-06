extends Node

var tooltip = null

func _init():
	tooltip = preload("res://UI/TooltipSystem.tscn").instance()
	add_child(tooltip)

func showTooltip(title: String, text: String):
	if(tooltip != null):
		tooltip.showTooltip(title, text)

func hideTooltip():
	if(tooltip != null):
		tooltip.hideTooltip()
