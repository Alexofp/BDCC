extends Node

var tooltip = null

func _init():
	tooltip = preload("res://UI/TooltipSystem.tscn").instance()
	add_child(tooltip)

func showTooltip(title: String, text: String, showBelow: bool = false):
	if(tooltip != null):
		tooltip.showTooltip(title, text, showBelow)

func hideTooltip():
	if(tooltip != null):
		tooltip.hideTooltip()

func resetTooltips():
	if(tooltip != null):
		tooltip.resetTooltips()
