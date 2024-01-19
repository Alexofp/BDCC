extends Node

onready var tooltip = $CanvasLayer/TooltipDisplay

var tooltipS = 0

func showTooltip(title: String, text: String, showBelow: bool = false, delayShow: bool = false, wideTooltip: bool = false):
	tooltip.set_is_active(true, delayShow)
	tooltip.setIsWide(wideTooltip)
	tooltip.setShowBelow(showBelow)
	tooltip.set_text(title, text)
	tooltipS += 1

func hideTooltip():
	tooltipS -= 1
	if(tooltipS <= 0):
		tooltipS = 0
		tooltip.set_is_active(false)

func resetTooltips():
	tooltipS = 0
	tooltip.set_is_active(false)
