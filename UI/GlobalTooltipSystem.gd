extends Node

var tooltip = null

func _init():
	tooltip = preload("res://UI/TooltipSystem.tscn").instance()
	add_child(tooltip)

func showTooltip(title: String, text: String, showBelow: bool = false, delayShow: bool = false, wideTooltip: bool = false):
	if(tooltip != null):
		tooltip.showTooltip(title, text, showBelow, delayShow, wideTooltip)

func hideTooltip():
	if(tooltip != null):
		tooltip.hideTooltip()

func resetTooltips():
	if(tooltip != null):
		tooltip.resetTooltips()
